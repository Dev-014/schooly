
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'package:practice/services/academic_calender/academic_calender_service.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

import '../../bloc/generic_bloc.dart';
import '../../services/get_service /get_service.dart';
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

  List<Eventt>? holidaa = [];

  EventList<Event>? holidays = EventList<Event>(events: {});
  List<dynamic>? list;



  var genericProvider ;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    getHolidays(sessionToken: genericProvider.sessionToken, context: context);

    // fetchTimetableForDay("5", "B");
    super.initState();
  }
  Future getHolidays({required String sessionToken, required BuildContext context}) async {
    list = await AcademicCalenderService.getAcademicCalender(sessionToken: sessionToken,context: context);
    holidays = list![0] as EventList<Event>?;
    holidaa = list![1] as List<Eventt>?;
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
