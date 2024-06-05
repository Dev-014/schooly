import 'package:flutter/material.dart';
import 'package:practice/screens/notice_board/teacher/upload_notice_board.dart';
import 'package:practice/screens/notice_board/teacher/teacher_view_notice_board.dart';
import 'package:practice/widgets/pt_wrapper.dart';

class TeacherNoticeBoard extends StatefulWidget {
  const TeacherNoticeBoard({Key? key}) : super(key: key);

  @override
  State<TeacherNoticeBoard> createState() => _TeacherNoticeBoardState();
}

class _TeacherNoticeBoardState extends State<TeacherNoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return const PTWrapper(
        tabBarView1: TeacherNoticeCreate(),
        tabBarView2: TeacherNoticeView(),
        firstTabTitle: "NOTICE BOARD",
        title: "Notice Board");
  }
}
