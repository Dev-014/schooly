import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class ViewAttendancePage extends StatefulWidget {
  final String studentId;

  const ViewAttendancePage({required this.studentId});

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
    final CollectionReference attendanceCollection = FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2') // Assuming this is the correct document ID
        .collection('attendance ');

    try {
      DocumentSnapshot attendanceSnapshot = await attendanceCollection.doc(sid).get();

      if (attendanceSnapshot.exists) {
        // Get the data for the current document
        Map<String, dynamic> data = attendanceSnapshot.data() as Map<String, dynamic>;

        // Access the 'attendance' field from the data map
        Map<String, dynamic> attendanceData = data['attendance'];

        // Initialize variables to store attendance data
        List<int> presentDates = [];
        List<int> absentDates = [];

        attendanceData.forEach((dateEpochString, status) {
          try {
            print('Date Epoch String: $dateEpochString');
            int epochMilliseconds = int.parse(dateEpochString);
            int epochSeconds = epochMilliseconds ~/ 1000; // Convert milliseconds to seconds
            DateTime date = DateTime.fromMillisecondsSinceEpoch(epochSeconds * 1000);

            if (status == 'absent') {
              // Add day number to absent list
              absentDates.add(date.day);
            } else if (status == 'present') {
              // Add day number to present list
              presentDates.add(date.day);
            }
          } catch (e) {
            print('Error parsing date: $e');
          }
        });

        List<MonthAttendance> attendances = [];
        Set<String> processedMonths = Set<String>();

        presentDates.forEach((date) {
          String monthName = DateFormat.MMMM().format(DateTime(DateTime.now().year, date));
          if (!processedMonths.contains(monthName)) {
            // Count the number of present and absent days for the month
            int presentMonthDays = presentDates.where((d) => DateFormat.MMMM().format(DateTime(DateTime.now().year, d)) == monthName).length;
            int absentMonthDays = absentDates.where((d) => DateFormat.MMMM().format(DateTime(DateTime.now().year, d)) == monthName).length;
            int totalMonthDays = presentMonthDays + absentMonthDays;

            // Create a MonthAttendance object and add it to the list
            attendances.add(MonthAttendance(
              month: monthName,
              totalDays: totalMonthDays,
              presentDays: presentMonthDays,
              absentDays: absentMonthDays,
              presentDates: presentDates,
              absentDates: absentDates,
            ));
            processedMonths.add(monthName);
          }
        });

        setState(() {
          monthAttendances = attendances;
        });
      } else {
        setState(() {
          monthAttendances = [];
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
                'Total: ${monthAttendance.totalDays} days\nPresent: ${monthAttendance.presentDays} days\nAbsent: ${monthAttendance.absentDays} days',
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

        // Check if the day is present or absent
        bool isPresent = monthAttendance.presentDates.contains(day.day);
        bool isAbsent = monthAttendance.absentDates.contains(day.day);

        // Determine the color based on attendance status
        Color dayColor = isPresent ? Colors.green : isAbsent ? Colors.red : Colors.lightBlue;

        return Container(
          decoration: BoxDecoration(
            color: dayColor,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.all(3),
          alignment: Alignment.center,
          child: Text(
            day.day.toString(),
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

class MonthAttendance {
  final String month;
  final int totalDays;
  final int presentDays;
  final int absentDays;
  final List<int> presentDates; // List of day numbers for present days
  final List<int> absentDates; // List of day numbers for absent days

  MonthAttendance({
    required this.month,
    required this.totalDays,
    required this.presentDays,
    required this.absentDays,
    required this.presentDates,
    required this.absentDates,
  });

  double calculateAttendancePercent() {
    if (totalDays == 0) return 0.0;
    return (presentDays / totalDays) * 100;
  }
}



