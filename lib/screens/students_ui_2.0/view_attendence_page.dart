import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class ViewAttendancePage extends StatefulWidget {
  final String studentId;

  ViewAttendancePage({required this.studentId});

  @override
  _ViewAttendancePageState createState() => _ViewAttendancePageState();
}

class _ViewAttendancePageState extends State<ViewAttendancePage> {
  List<MonthAttendance> monthAttendances = [];

  @override
  void initState() {
    super.initState();
    fetchAttendanceData(widget.studentId);
  }
  Future<void> fetchAttendanceData(String sid) async {
    final CollectionReference finalSchoolCollection =
    FirebaseFirestore.instance.collection('FinalSchool');

    try {
      // Fetch attendance data for the given sid
      DocumentSnapshot attendanceSnapshot = await finalSchoolCollection
          .doc("cpMNxcL2pAhohcN1JIMR") // Assuming this is the correct document ID
          .collection('attendence')
          .doc('8viIBZs5rGOiDZhtyyMy') // Replace 'document_id' with the correct document ID containing the attendance data
          .get();

      // Check if the attendance snapshot exists and contains data
      if (attendanceSnapshot.exists && attendanceSnapshot.data() != null) {
        // Extract attendance data
        Map<String, dynamic> attendanceData =
        attendanceSnapshot.data() as Map<String, dynamic>;

        List<MonthAttendance> attendances = [];

        // Loop through the dates in the attendance data
        attendanceData.forEach((date, statusList) {
          // Parse date string to DateTime object
          DateTime dateParsed = DateFormat('dd-MM-yy').parse(date);

          // Initialize variables to store attendance data
          int totalDays = statusList.length;
          int presentDays = statusList
              .where((statusData) =>
          statusData['sid'] == sid && statusData['status'] == 'Present')
              .length;
          List<int> absentDays = statusList
              .where((statusData) =>
          statusData['sid'] == sid && statusData['status'] == 'Absent')
              .map<int>((statusData) {
            return dateParsed.day;
          }).toList();

          // Construct MonthAttendance object
          MonthAttendance monthAttendance = MonthAttendance(
            month: DateFormat.MMMM().format(dateParsed),
            totalDays: totalDays,
            presentDays: presentDays,
            absentDays: absentDays,
          );

          // Add monthAttendance to the list
          attendances.add(monthAttendance);
        });

        setState(() {
          monthAttendances = attendances;
        });

      }
    } catch (e) {
      // Handle errors
      print('Error fetching attendance data: $e');
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
            bottomRight: Radius.circular(20),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Attendance"),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: monthAttendances.length,
          itemBuilder: (context, index) {
            return AttendanceCard(monthAttendance: monthAttendances[index]);
          },
        ),
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final MonthAttendance monthAttendance;

  AttendanceCard({required this.monthAttendance});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AttendanceCalendarPage(monthAttendance: monthAttendance),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Center(
            child: Text(
              monthAttendance.month,
              style: TextStyle(fontSize: 20),
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${monthAttendance.totalDays} days\nPresent: ${monthAttendance.presentDays} days',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '${monthAttendance.calculateAttendancePercent()}%',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceCalendarPage extends StatelessWidget {
  final MonthAttendance monthAttendance;

  AttendanceCalendarPage({required this.monthAttendance});

  @override
  Widget build(BuildContext context) {
    // Implementation of the calendar showing attendance details
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Attendance"),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: AttendanceCalendar(monthAttendance: monthAttendance),
      ),
    );
  }
}

class AttendanceCalendar extends StatelessWidget {
  final MonthAttendance monthAttendance;

  AttendanceCalendar({required this.monthAttendance});

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel(
      weekendTextStyle: TextStyle(color: Colors.red),
      daysTextStyle: TextStyle(color: Colors.black),
      headerTextStyle: TextStyle(color: Colors.blue),
      todayButtonColor: Colors.transparent,
      selectedDayButtonColor: Colors.transparent,
      weekdayTextStyle: TextStyle(color: Colors.black),
      selectedDateTime: null,
      onDayPressed: (DateTime date, List events) {},
      customDayBuilder: (
          /// you can provide your own build function to make custom day containers
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
          ) {
        if (!isThisMonthDay) {
          return SizedBox();
        }

        Color dayColor = monthAttendance.absentDays.contains(day.day)
            ? Colors.red
            : Colors.green;

        return Container(
          decoration: BoxDecoration(
            // color: isSelectedDay ? Theme.of(context).accentColor : null,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.all(3),
          alignment: Alignment.center,
          child: Text(
            day.day.toString(),
            style: TextStyle(color: dayColor),
          ),
        );
      },
    );
  }
}

class MonthAttendance {
  final String month;
  late final int totalDays;
  late final int presentDays;
  final List<int> absentDays;

  MonthAttendance({
    required this.month,
    required this.totalDays,
    required this.presentDays,
    required this.absentDays,
  });

  double calculateAttendancePercent() {
    if (totalDays == 0) return 0.0;
    return (presentDays / totalDays) * 100;
  }
}
