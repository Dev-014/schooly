import 'package:flutter/material.dart';
import 'package:practice/screens/generic/upload/upload_syllabus.dart';
import 'package:practice/widgets/pt_wrapper.dart';

class TeacherSyllabusPage extends StatefulWidget {
  const TeacherSyllabusPage({super.key});

  @override
  State<TeacherSyllabusPage> createState() => _TeacherSyllabusPageState();
}

class _TeacherSyllabusPageState extends State<TeacherSyllabusPage> {
  @override
  Widget build(BuildContext context) {
    return PTWrapper(tabBarView1: UploadSyllabus(), tabBarView2: SizedBox(), firstTabTitle: "SYLLABUS", title: "Syllabus");
  }
}
