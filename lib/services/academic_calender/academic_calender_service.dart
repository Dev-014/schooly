import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../screens/academic_calender/academic_calender_page.dart';
import '../get_service /get_service.dart';

class AcademicCalenderService{


  static Future<List<dynamic>?> getAcademicCalender({required String sessionToken, required BuildContext context}) async {
    List<Eventt>? holidaa = [];

    EventList<Event> holidays = EventList<Event>(events: {});
   var response = await GetService.getAcademicCalender(token: sessionToken,context: context);


    // if (response.) {
      Map<String, dynamic> data =
      response as Map<String, dynamic>;
      Map<String, dynamic> academicCalenderData = data;
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
      print(holidaa.first);
      return [holidays, holidaa];
    // }
    // return null;
  }

}