import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class ViewAttendancePage extends StatelessWidget {
  final List<MonthAttendance> monthAttendances = [
    MonthAttendance(
        month: 'January',
        totalDays: 20,
        presentDays: 15,
        absentDays: [3, 4, 5, 6, 7]),
  ];

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
            alignment: Alignment.centerLeft, child: Text("Attendence")),
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
            builder: (context) => AttendanceCalendarPage(
              monthAttendance: MonthAttendance(
                month: 'January',
                totalDays: 31,
                presentDays: 26,
                absentDays: [3, 4, 5, 6, 7], // Example absent days
              ),
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Center(
              child: Text(
            monthAttendance.month,
            style: TextStyle(fontSize: 20),
          )),
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
              bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
        title: const Align(
            alignment: Alignment.centerLeft, child: Text("Attendence")),
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
          DateTime day) {
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
  final int totalDays;
  final int presentDays;
  final List<int> absentDays;

  MonthAttendance(
      {required this.month,
      required this.totalDays,
      required this.presentDays,
      required this.absentDays});

  double calculateAttendancePercent() {
    return (presentDays / totalDays) * 100;
  }
}
