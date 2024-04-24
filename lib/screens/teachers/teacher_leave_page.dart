import 'package:flutter/material.dart';
import 'package:practice/screens/teachers/teacher_apply_leave.dart';
import 'package:practice/screens/teachers/teacher_leave.dart';
import 'package:practice/screens/teachers/teacher_student_leave.dart';

class TeacherLeavePage extends StatefulWidget {
  const TeacherLeavePage({Key? key});

  @override
  State<TeacherLeavePage> createState() => _TeacherLeavePageState();
}

class _TeacherLeavePageState extends State<TeacherLeavePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 50,

          leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person,color: Colors.white,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Text(
                      "Leaves",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Deepanshu",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.black,
                ),
              )
            ],
          ),
          titleSpacing: 0,
          bottom: const PreferredSize(
            preferredSize: Size(0, 60),
            child: Material(
              color: Colors.white,
              // color: ConstantColors.backGroundColor,
              child: TabBar(
                labelColor: Colors.black,
                dividerColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    text: "APPLY LEAVE",
                  ),
                  Tab(text: "REQUESTS"),
                  Tab(text: "LEAVE APPLIED",)
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TeacherApplyLeave(),
            TeacherStudentApproval(),
            TeacherLeaveRequest(),
          ],
        ),
      ),
    );
  }
}