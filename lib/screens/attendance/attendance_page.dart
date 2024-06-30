import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:practice/services/get_service%20/get_service.dart';
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
    GetService.getAttendance(token: genericProvider.sessionToken, context: context);
    // scholarId = genericProvider.scholarId;
    super.initState();
    calculateAttendance();
  }
  // Future<void> deleteValuesFromMap() async {
  //   final firestore = FirebaseFirestore.instance;
  //   final docRef = firestore.doc("/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance /scholar_id");
  //
  //   // Get the document
  //   final docSnapshot = await docRef.get();
  //
  //   if (!docSnapshot.exists) {
  //     return; // Handle document not found (optional)
  //   }
  //
  //   // Get the existing map (assuming there's a field with a map)
  //   final existingMap = docSnapshot.data()!['attendance'] as Map<String, dynamic>; // Replace 'mapField' with the actual field name
  //
  //   // Filter the map, keeping only entries where key doesn't start with the prefix
  //   final filteredMap = existingMap.entries.fold({}, (acc, entry) =>
  //   !entry.key.toString().startsWith("1710") ? { ...acc, entry.key: entry.value } : acc);
  //
  //   // Update the document with the modified data
  //   await docRef.update({'attendance': filteredMap}); // Replace 'mapField' with the actual field name
  //
  //   print("Values starting with '1710' deleted from map in document.");
  // }


  void calculateAttendance() async {
    FetchAttendanceResponse  attendanceSnapshot = await GetService.getAttendance(token: genericProvider.sessionToken, context: context);



      Map<String, dynamic> attendanceData = attendanceSnapshot.attendance;

      attendanceData.forEach((key, value) {
        DateTime attendanceDate = DateFormat('dd-MM-yyyy').parse(key);
        if ((fromDate == null || toDate == null) ||
            (attendanceDate.isAfter(fromDate!) &&
                attendanceDate.isBefore(toDate!))) {
          if (value == true) {
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
          } else if (value == false) {
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
      mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    CalendarCarousel<Event>(
      headerMargin: EdgeInsets.symmetric(vertical: 4.0),
      thisMonthDayBorderColor: Colors.grey,
      daysTextStyle: const TextStyle(color: Colors.black),
      markedDatesMap: _markedDates,
      height: MediaQuery.of(context).size.height*.5,
      selectedDateTime: DateTime.now(),
      todayButtonColor: Colors.yellow,
      selectedDayButtonColor: Colors.yellow,
      onDayPressed: (DateTime date, List<Event> events) {
        // Handle day press if needed
      },
    ),
    const SizedBox(height: 20),
    Expanded(
      flex: 2,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 400
        ),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 15,
            spacing: 15,

            children: [
              smallAttendanceCard(context: context,text: 'Present Days: $totalPresentDays'),
              smallAttendanceCard(context: context,text: 'Absent Days: $totalAbsentDays', colors: Colors.red),
              smallAttendanceCard(context: context,text: 'Total Days: $totalDays',colors: Colors.blue),
              smallAttendanceCard(context: context,text: 'Total Present Percentage: ${totalPresentPercentage.toStringAsFixed(2)}%',colors: Colors.blue),
            ],
          ),
        ),
      ),
    )
    ],
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () => _selectDateRange(context),
    child: const Icon(Icons.calendar_today),
    ),
        title: "Attendance");
  }

  Container smallAttendanceCard({
    required BuildContext context,
    required String text,
     Color? colors

  }) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 40.0, // Calculate width for 3 columns
      height: MediaQuery.of(context).size.width / 2 - 40.0,
      padding: EdgeInsets.all(24),decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    color: (colors==null)?Colors.green: colors,
  ),child: Center(child: Text(text,style: TextStyle(color: Colors.white),)));
  }
}

