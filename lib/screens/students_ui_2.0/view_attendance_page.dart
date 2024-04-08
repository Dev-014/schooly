import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList;
import 'package:flutter_calendar_carousel/classes/event.dart';

class AttendanceCalculator extends StatefulWidget {
  final String studentId;

  AttendanceCalculator({required this.studentId});

  @override
  _AttendanceCalculatorState createState() => _AttendanceCalculatorState();
}

class _AttendanceCalculatorState extends State<AttendanceCalculator> {
  int totalPresentDays = 0;
  int totalAbsentDays = 0;
  int totalDays = 0;
  double totalPresentPercentage = 0.0;
  List<String> presentDates = [];
  List<String> absentDates = [];
  DateTime? fromDate;
  DateTime? toDate;
  EventList<Event> _markedDates = EventList<Event>(events: {});

  @override
  void initState() {
    super.initState();
    calculateAttendance();
  }

  void calculateAttendance() async {
    final DocumentSnapshot attendanceSnapshot = await FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('attendance ')
        .doc(widget.studentId)
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
      print('Attendance data not found for student ${widget.studentId}');
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
        title: const Align(
            alignment: Alignment.centerLeft, child: Text("Attendance")),
        backgroundColor: Colors.pink,
      ),
      body: Column(
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
    );
  }
}