import 'package:flutter/material.dart';
import 'package:practice/screens/notice_board/student/student_view_notice_board.dart';
import 'package:practice/widgets/student_wrapper.dart';

class StudentNoticeBoard extends StatefulWidget {
  const StudentNoticeBoard({Key? key}) : super(key: key);

  @override
  State<StudentNoticeBoard> createState() => _StudentNoticeBoardState();
}

class _StudentNoticeBoardState extends State<StudentNoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return const StudentWrapper(
      widget: StudentNoticeView(),
      title: "Notice Board",
    );
  }
}
