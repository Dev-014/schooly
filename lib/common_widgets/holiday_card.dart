import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/utils/constants_colors.dart';
import '../screens/calender_page.dart';

class HolidayCard extends StatelessWidget {
  final Eventt? event;
  final bool teacher;
   const HolidayCard({super.key, this.event,this.teacher=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
           Expanded(
             flex: 1,
             child: Padding(
              padding: const EdgeInsets.only(right: 6.0,left: 20),
              child: CircleAvatar(
                minRadius: 30,
                backgroundColor:  (teacher)?ConstantColors.secondary_color:Color(0xfffd3667),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        event?.date.day.toString()??"3",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        getMonthName(event?.date.month ?? 1),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
                       ),
           ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
               width: MediaQuery.of(context).size.width*.8,
                decoration:  BoxDecoration(
                    color: (teacher)?Color(0xff767686):Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                  child: InkWell(
                    onTap: () {},
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event?.title.toString()??"National Day",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "Holiday",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, color: (teacher)?Colors.grey.shade800:Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
String getMonthName(int monthNumber) {
  final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  if (monthNumber < 1 || monthNumber > 12) {
    throw Exception('Invalid month number: $monthNumber');
  }
  return months[monthNumber - 1];
}