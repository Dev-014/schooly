import 'package:flutter/material.dart';
import 'package:practice/screens/principal/principal_student_leave.dart';
import 'package:practice/screens/principal/principal_teacher_leave.dart';

class PrincipalLeavePage extends StatefulWidget {
  const PrincipalLeavePage({Key? key});

  @override
  State<PrincipalLeavePage> createState() => _PrincipalLeavePageState();
}

class _PrincipalLeavePageState extends State<PrincipalLeavePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
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
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Deepanshu",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
          bottom: const PreferredSize(
            preferredSize: Size(0, 55),
            child: Material(
              color: Colors.white,
              // color: ConstantColors.backGroundColor,
              child: TabBar(
                labelColor: Colors.black,
                dividerColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: "TEACHERS REQUESTS"),
                  Tab(
                    text: "STUDENTS REQUESTS",
                  )
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [PrincipalTeacherApproval(), PrincipalStudentApproval()],
        ),
      ),
    );
  }
}
