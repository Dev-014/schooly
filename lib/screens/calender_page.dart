import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice/common_widgets/calender_card.dart';
import 'package:http/http.dart' as http;
import 'package:practice/common_widgets/holiday_card.dart';
import 'package:practice/common_widgets/homework_card.dart';
import 'package:practice/screens/fee_details_page.dart';

class Eventt {
  final DateTime date;
  final String title;

  Eventt({required this.date, required this.title});
}

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {



  Future<List<Eventt>> _getHolidaysFromGoogleCalendar() async {

    final response = await http.get(Uri.parse('https://www.googleapis.com/calendar/v3/calendars/en.indian%23holiday%40group.v.calendar.google.com/events?key=AIzaSyAMERbv2uQuGJ9Y5gMvkYKSPPATU7i4ji0'));

    if (response.statusCode == 200) {
      final holidays = jsonDecode(response.body)['items'] as List<dynamic>;
      holidays.map((holiday) => Eventt(date: DateTime.parse(holiday['start']['date']), title: holiday['summary'])).toList();
      return holidays.map((holiday) => Eventt(date: DateTime.parse(holiday['start']['date']), title: holiday['summary'])).toList();
    } else {
      throw Exception('Failed to get holidays from Google Calendar API.');
    }
  }
  List<Eventt>? holidays;
  @override
  void initState() {
    // TODO: implement initState
    print("object");
getHolidays();

    super.initState();
  }

  Future getHolidays()async{
    holidays =  await _getHolidaysFromGoogleCalendar();
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: ()async{
          Navigator.pop(context);

       }, icon: Icon(Icons.arrow_back,size: 30,)),
        title: const Align(alignment:Alignment.centerLeft,child: Text("Calender",style: TextStyle(fontSize: 18),)),
        backgroundColor: Colors.pink,

      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
mainAxisAlignment: MainAxisAlignment.start,
        children: [

            const Expanded(flex: 2,child: CalenderCard()),
          (holidays==null)?const SizedBox():Expanded(
            flex: 2,
            child: SizedBox(
              width: 400,
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    const Align(
                      alignment:Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Text("Holidays",style: TextStyle(fontSize: 18,color: Colors.pink,),),
                      ),
                    ),
                    for(int i =0; i<holidays!.length;i++)
                     HolidayCard(event: holidays?[i],)
                  ],
                ),
              )
            ),
          )
          ],
        ),
      ),
    );
  }
}
