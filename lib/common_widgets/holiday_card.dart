import 'package:flutter/material.dart';
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
        children: [
           Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: CircleAvatar(
              backgroundColor:  (teacher)?ConstantColors.secondary_color:Color(0xfffd3667),

              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Text(
                      event?.date.day.toString()??"3",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      event?.date.month.toString()?? "MAR",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
           width: MediaQuery.of(context).size.width*.8,
            decoration:  BoxDecoration(
                color: (teacher)?Color(0xff767686):Color(0xfffff1ec),
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
        ],
      ),
    );
  }
}
