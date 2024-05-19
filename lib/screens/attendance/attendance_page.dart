import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

class ViewAttendancePage extends StatefulWidget {


  @override
  _ViewAttendancePageState createState() => _ViewAttendancePageState();
}

class _ViewAttendancePageState extends State<ViewAttendancePage> {
  int totalPresentDays = 0;
  int totalAbsentDays = 0;
  int totalDays = 0;
  double totalPresentPercentage = 0.0;
  List<String> presentDates = [];
  List<String> absentDates = [];
  DateTime? fromDate;
  DateTime? toDate;
  EventList<Event> _markedDates = EventList<Event>(events: {});
  var genericProvider;
  // var scholarId;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    // deleteValuesFromMap();
    // scholarId = genericProvider.scholarId;
    super.initState();
    calculateAttendance();
  }
  Future<void> deleteValuesFromMap() async {
    final firestore = FirebaseFirestore.instance;
    final docRef = firestore.doc("/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance /scholar_id");

    // Get the document
    final docSnapshot = await docRef.get();

    if (!docSnapshot.exists) {
      return; // Handle document not found (optional)
    }

    // Get the existing map (assuming there's a field with a map)
    final existingMap = docSnapshot.data()!['attendance'] as Map<String, dynamic>; // Replace 'mapField' with the actual field name

    // Filter the map, keeping only entries where key doesn't start with the prefix
    final filteredMap = existingMap.entries.fold({}, (acc, entry) =>
    !entry.key.toString().startsWith("1710") ? { ...acc, entry.key: entry.value } : acc);

    // Update the document with the modified data
    await docRef.update({'attendance': filteredMap}); // Replace 'mapField' with the actual field name

    print("Values starting with '1710' deleted from map in document.");
  }

  void calculateAttendance() async {
    var id = (genericProvider.userProfile == UserProfile.teacher)?genericProvider.empID:genericProvider.scholarId;
    final DocumentSnapshot attendanceSnapshot = await FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('attendance ')
        .doc(id)
        .get();

    if (attendanceSnapshot.exists) {
      Map<String, dynamic> data =
      attendanceSnapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> attendanceData = data['attendance'];

      attendanceData.forEach((key, value) {
        DateTime attendanceDate = DateFormat('dd_MM_yyyy').parse(key);
        if ((fromDate == null || toDate == null) ||
            (attendanceDate.isAfter(fromDate!) &&
                attendanceDate.isBefore(toDate!))) {
          if (value == 'present') {
            totalPresentDays++;
            presentDates.add(key);
            _markedDates.add(
                attendanceDate,
                Event(
                  date: attendanceDate,
                  title: 'Present',
                  icon: const Icon(Icons.circle, color: Colors.green),
                  dot: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    color: Colors.green,
                    height: 10,
                    width: 10,
                  ),
                ));
          } else if (value == 'absent') {
            totalAbsentDays++;
            absentDates.add(key);
            _markedDates.add(
                attendanceDate,
                Event(
                  date: attendanceDate,
                  title: 'Absent',
                  icon: const Icon(Icons.circle, color: Colors.red),
                  dot: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    color: Colors.red,
                    height: 10,
                    width: 10,
                  ),
                ));
          }
          totalDays++;
        }
      });

      setState(() {
        totalPresentPercentage = (totalPresentDays / totalDays) * 100;
      });
    } else {
      print('Attendance data not found for student ${genericProvider.scholarId}');
    }
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
      initialDateRange:
      DateTimeRange(start: DateTime.now(), end: DateTime.now()),
    );
    if (picked != null) {
      setState(() {
        fromDate = picked.start;
        toDate = picked.end;
        totalPresentDays = 0;
        totalAbsentDays = 0;
        totalDays = 0;
        totalPresentPercentage = 0.0;
        presentDates.clear();
        absentDates.clear();
        _markedDates = EventList<Event>(events: {});
        calculateAttendance();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StudentWrapper(widget:  Column(
    children: <Widget>[
    CalendarCarousel<Event>(
      thisMonthDayBorderColor: Colors.grey,
      daysTextStyle: const TextStyle(color: Colors.black),
      markedDatesMap: _markedDates,
      height: 420.0,
      selectedDateTime: DateTime.now(),
      todayButtonColor: Colors.yellow,
      selectedDayButtonColor: Colors.yellow,
      onDayPressed: (DateTime date, List<Event> events) {
        // Handle day press if needed
      },
    ),
    const SizedBox(height: 20),
    Text('Total Present Days: $totalPresentDays'),
    Text('Total Absent Days: $totalAbsentDays'),
    Text('Total Days: $totalDays'),
    Text(
    'Total Present Percentage: ${totalPresentPercentage.toStringAsFixed(2)}%'),
    ],
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () => _selectDateRange(context),
    child: const Icon(Icons.calendar_today),
    ),
        title: "Attendance");
  }
}