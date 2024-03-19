import 'package:flutter/material.dart';
import 'package:practice/screens/students_ui_2.0/view_attendence_page.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({super.key});

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 6,bottom: 6,left: 8,right: 8),
      child: Wrap(

         alignment: WrapAlignment.spaceEvenly,
        direction: Axis.horizontal,
        runSpacing: 8,
          runAlignment: WrapAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment:  CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8),
            child: CircleAvatar(

              backgroundColor: Color(0xfffd3667),

              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Center(
                  child: Text(
                    "MAR",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 4),
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 90
              ),
              decoration: const BoxDecoration(
                  color: Color(0xffd4ffea),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                child: InkWell(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "23",
                        style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "Present",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 4),
            child: Container(
              constraints: const BoxConstraints(
                  minWidth: 90
              ),
              decoration: const BoxDecoration(
                  color: Color(0xffffd4d4),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                child: InkWell(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "3",
                        style: TextStyle(fontWeight: FontWeight.w600,color: Colors.pink),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "Absent",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, color: Colors.pink),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 4),
            child: Container(
              constraints: const BoxConstraints(
                  minWidth: 90
              ),
              decoration: const BoxDecoration(
                  color: Color(0xffd5f5ff),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                child: InkWell(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "Leave",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, color: Colors.blue),
                        ),
                      )
                    ],
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
