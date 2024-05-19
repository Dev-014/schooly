import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';

import '../../widgets/holiday_card.dart';

class Eventt {
  final DateTime date;
  final String title;

  Eventt({required this.date, required this.title});
}

class AcademicCalenderPage extends StatefulWidget {
  const AcademicCalenderPage({super.key});

  @override
  State<AcademicCalenderPage> createState() => _AcademicCalenderPageState();
}

class _AcademicCalenderPageState extends State<AcademicCalenderPage> {
  Future<List<Eventt>> _getHolidaysFromGoogleCalendar() async {
    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/calendar/v3/calendars/en.indian%23holiday%40group.v.calendar.google.com/events?key=AIzaSyAMERbv2uQuGJ9Y5gMvkYKSPPATU7i4ji0'));

    if (response.statusCode == 200) {
      final holidays = jsonDecode(response.body)['items'] as List<dynamic>;
      holidays
          .map((holiday) => Eventt(
              date: DateTime.parse(holiday['start']['date']),
              title: holiday['summary']))
          .toList();
      return holidays
          .map((holiday) => Eventt(
              date: DateTime.parse(holiday['start']['date']),
              title: holiday['summary']))
          .toList();
    } else {
      throw Exception('Failed to get holidays from Google Calendar API.');
    }
  }

  List<Eventt>? holidaa = [];

  EventList<Event>? holidays = EventList<Event>(events: {});

  Future<EventList<Event>?> getAcademicCalender() async {
    EventList<Event> holidays = EventList<Event>(events: {});
    final DocumentSnapshot academicCalenderSnapshot = await FirebaseFirestore
        .instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('academic_calender')
        .doc("random_doc_id")
        .get();

    if (academicCalenderSnapshot.exists) {
      Map<String, dynamic> data =
          academicCalenderSnapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> academicCalenderData = data['academic_calender'];
      academicCalenderData.forEach((key, value) {
        DateTime attendanceDate = DateFormat('dd_MM_yyyy').parse(key);

        holidays.add(
            attendanceDate,
            Event(
              date: attendanceDate,
              title: 'Holiday',
              icon: const Icon(Icons.circle, color: Colors.red),
              dot: Container(
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                color: Colors.red,
                height: 10,
                width: 10,
              ),
            ));

        holidaa!.add(Eventt(
          date: attendanceDate,
          title: value.toString(),
        ));
      });
      print(holidaa?.first);
      return holidays;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print("object");
    var a = getHolidays();
    print(a);

    super.initState();
  }

  Future getHolidays() async {
    holidays = await getAcademicCalender();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StudentWrapper(
        widget: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: CalendarCarousel<Event>(
                  thisMonthDayBorderColor: Colors.grey,
                  daysTextStyle: const TextStyle(color: Colors.black),
                  markedDatesMap: holidays,
                  height: 400.0,
                  selectedDateTime: DateTime.now(),
                  todayButtonColor: Colors.yellow,
                  selectedDayButtonColor: Colors.yellow,
                  onDayPressed: (DateTime date, List<Event> events) {
                    // Handle day press if needed
                  },
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Text(
                    "Holidays",
                    style: TextStyle(
                      fontSize: 18,
                      // ,color: Colors.pink,
                    ),
                  ),
                ),
              ),
              (holidays == null)
                  ? const SizedBox()
                  : Expanded(
                      flex: 2,
                      child: SizedBox(
                          width: 400,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                for (var holiday in holidaa ?? [])
                                  HolidayCard(
                                    event: holiday,
                                  )
                              ],
                            ),
                          )),
                    )
            ],
          ),
        ),
        title: "Academic Calender");
  }
}
