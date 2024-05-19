import 'package:flutter/material.dart';
import 'package:practice/screens/generic/upload/upload_time_table.dart';
import 'package:practice/widgets/pt_wrapper.dart';

class TeacherTimeTablePage extends StatefulWidget {
  const TeacherTimeTablePage({super.key});

  @override
  State<TeacherTimeTablePage> createState() => _TeacherTimeTablePageState();
}

class _TeacherTimeTablePageState extends State<TeacherTimeTablePage> {
  @override
  Widget build(BuildContext context) {
    return PTWrapper(tabBarView1: UploadTimetable(), tabBarView2: SizedBox(), firstTabTitle: "TIMETABLE", title: "Time Table");
  }
}
