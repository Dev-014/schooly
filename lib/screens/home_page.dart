import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/screens/announcement/student/student_announcement_page.dart';

import 'package:provider/provider.dart';
import 'package:practice/bloc/generic_bloc.dart';

import "package:flutter_gen/gen_l10n/app_localizations.dart";

import '../modals/academic_service/academicService.pb.dart';
import '../services/attendance/mark_attendance.dart';
import 'attendance/principal/teacher_attendance.dart';
import 'attendance/teacher/take_student_attendance.dart';
import 'dashBoard.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

var a;

class _MenuPageState extends State<MenuPage> {
  var genericProvider;

  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context, listen: false);

    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _teacherPages = [
    DashBoard(),
    TakeStudentAttendance(),
    ViewAnnouncement(isTeacher: true,),
    Container(),
  ];
  final List<Widget> _pages = [
    DashBoard(),
    Container(),
  ];
  final List<Widget> _principalPages = [
    DashBoard(),
    TeachersAttendance(),
    ViewAnnouncement(isTeacher: true,),
    // Your second page widget
    Container(), // Your third page widget
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe5e8ff),
        appBar: AppBar(
          elevation: 0,
          // toolbarHeight: 70,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          // ),
          leading: IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.view_column,
              )),
          title: Text("St Joseph school "),

        ),
        bottomNavigationBar: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))
          ),
          height: 70,
          child: BottomNavigationBar(
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.grey.withOpacity(.8),
            selectedFontSize: 0,
              unselectedFontSize: 0,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },

              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.dashboard,
                          // color: Colors.black,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 4.0),
                        //   child: Text(AppLocalizations.of(context)!.dashboard),
                        // )
                      ],
                    ),
                  ),
                  label: "",
                ),
                if (genericProvider.userProfile == UserProfile.teacher ||
                    genericProvider.userProfile == UserProfile.principal)
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Icon(
                          Icons.calendar_month,
                          // color: Colors.black,
                        ),
                      ),
                      label: AppLocalizations.of(context)!.attendance),
                if (genericProvider.userProfile == UserProfile.teacher ||
                    genericProvider.userProfile == UserProfile.principal)
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(
                        Icons.headphones,
                        // color: Colors.black,
                      ),
                    ),
                    label: "Support"),

                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(
                        Icons.logout,
                        // color: Colors.black,
                      ),
                    ),
                    label: "Logout")
              ]),
        ),
        body: (genericProvider.userProfile == UserProfile.principal)?_principalPages.elementAt(_currentIndex):(genericProvider.userProfile == UserProfile.teacher)?_teacherPages.elementAt(_currentIndex):_pages.elementAt(_currentIndex),

      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
        onPressed:( genericProvider.userProfile == UserProfile.principal)?() {

          // Handle FAB action
          MarkAttendances.markAttendance(markAttendance: MarkAttendance(
            sectionId: genericProvider.teacher.sectionId,
            classId: genericProvider.teacher.classId,
            attendance: genericProvider.markedAttendance,
            type: AttendanceType.TEACHER_ATTENDANCE,
          ), token: genericProvider.sessionToken, context: context);
        }: () {

          // Handle FAB action
          MarkAttendances.markAttendance(markAttendance: MarkAttendance(
            sectionId: genericProvider.teacher.sectionId,
            classId: genericProvider.teacher.classId,
            attendance: genericProvider.markedAttendance,
            type: AttendanceType.STUDENT_ATTENDANCE,
          ), token: genericProvider.sessionToken, context: context);
        },
        child: Text("Submit",),
      )
          : null,);
  }
}
