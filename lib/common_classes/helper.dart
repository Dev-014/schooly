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
        Map<String, List<int>> attendanceByMonth = {};
        int totalDays = 0;
        int presentDays = 0;

        attendanceData.forEach((dateEpochString, status) {
          // Convert epoch string to DateTime
          DateTime date = DateTime.fromMillisecondsSinceEpoch(0 * 1000);

          print('Date Epoch String: $dateEpochString'); // Debugging statement
          try {
            int epochMilliseconds = int.parse(dateEpochString);
            int epochSeconds = epochMilliseconds ~/ 1000; // Convert milliseconds to seconds
            date = DateTime.fromMillisecondsSinceEpoch(epochSeconds * 1000);

            totalDays++; // Increment total days for each attendance record

            if (status == 'Present') {
              presentDays++; // Increment present days for each 'Present' status
            }

            // Get month name
            String monthName = DateFormat.MMMM().format(date);

            // Initialize lists if not exists
            attendanceByMonth[monthName] ??= [];
            attendanceByMonth['present_$monthName'] ??= [];

            // Increment counts based on status
            if (status == 'absent') {
              // Add day to absent list
              attendanceByMonth[monthName]!.add(date.day);
            } else if (status == 'present') {
              // Add day to present list
              attendanceByMonth['present_$monthName']!.add(date.day);
            }
          } catch (e) {
            print('Error parsing date: $e'); // Debugging statement
          }
        });

        // Construct MonthAttendance objects for each month
        List<MonthAttendance> attendances = attendanceByMonth.entries.map((entry) {
          String monthName = entry.key.replaceFirst('present_', ''); // Remove 'present_' prefix
          int totalMonthDays = attendanceByMonth[monthName]?.length ?? 0;
          int presentMonthDays = attendanceByMonth[entry.key]?.length ?? 0;
          return MonthAttendance(
            month: monthName,
            totalDays: totalMonthDays,
            presentDays: presentMonthDays,
            absentDays: entry.value,
          );
        }).toList();

        setState(() {
          monthAttendances = attendances;
        });

      } else {
        // Scholar ID document does not exist
        setState(() {
          monthAttendances = []; // Clear existing data
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