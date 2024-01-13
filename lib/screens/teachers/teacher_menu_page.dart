import 'package:flutter/material.dart';
import 'package:practice/screens/teachers/teachers_attendance_page.dart';
import 'package:practice/utils/constants_colors.dart';

import 'classes.dart';

class TeacherMenuPage extends StatefulWidget {
  const TeacherMenuPage({super.key});

  @override
  State<TeacherMenuPage> createState() => _TeacherMenuPageState();
}

class _TeacherMenuPageState extends State<TeacherMenuPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  backgroundColor: ConstantColors.primary_color,
  title: Text("DashBoard"),
),
      backgroundColor: Color(0xff15162b),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //1st Item
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,

crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(radius: 16,backgroundColor: Color(0xff5842d3),),
                  ),

                  Column(
crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("AdminSchool",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                      Text("School Admission DashBoard",style: TextStyle(fontSize: 12,color: Colors.grey.shade600),),

                    ],
                  )

                ],
              ),
            ),
            //2nd Item
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 4),
              child: Container(

                decoration: BoxDecoration(
                  color: Color(0xff767686).withOpacity(.3),
borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 14),
                            child: Container(

                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Zack Foster",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Super Admin",style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                              ),

                            ],
                          ),
                        ],
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down),color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ),
            //3rd Item
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                child: Text("Main Menu",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 15),),
              ),
            ),
            //4th Item
            menuCard("DashBoard",Icons.dashboard_sharp),
            //5th Item
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return TeacherAttendancePage();}));
            },child: menuCard("Attendance",Icons.person_add_rounded)),
            menuCard("My Class",Icons.class_),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return Classes();}));
            },child: menuCard("Classes", Icons.class_outlined)),
            menuCard("Events", Icons.eleven_mp_outlined),
            Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
            child: Text("Other",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 15),),
          ),
        ),


            menuCard("Tasks", Icons.calendar_month),

            menuCard("Calender", Icons.calendar_month),

            menuCard("Settings", Icons.calendar_month),











          ],
        ),
      ),
    );
  }

  Padding menuCard(String heading,IconData icon ) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 12),
          child: Container(

            decoration: BoxDecoration(
                color: Color(0xff767686).withOpacity(.3),
                borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(icon,color: Color(0xff767686),size: 30,)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),

                    child: Text(heading,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xff767686)),),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
