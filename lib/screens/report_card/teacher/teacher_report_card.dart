import 'package:flutter/material.dart';
import 'package:practice/screens/generic/upload/upload_report_card.dart';
import 'package:practice/screens/generic/view/view_report_card.dart';
import 'package:practice/widgets/pt_wrapper.dart';

class TeacherReportCardPage extends StatefulWidget {
  const TeacherReportCardPage({super.key});

  @override
  State<TeacherReportCardPage> createState() => _TeacherReportCardPageState();
}

class _TeacherReportCardPageState extends State<TeacherReportCardPage> {
  @override
  Widget build(BuildContext context) {
    return PTWrapper(tabBarView1: UploadReportCard(), tabBarView2: ViewReportCard(), firstTabTitle: "REPORT CARD", title: "Report Card");
  }
}
