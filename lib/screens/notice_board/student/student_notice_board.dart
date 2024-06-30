import 'package:flutter/material.dart';
import 'package:practice/screens/notice_board/student/upload_notice_board.dart';
import 'package:practice/screens/notice_board/student/view_notice_board.dart';
import 'package:practice/screens/notice_board/teacher/view_notice_board.dart';
import 'package:practice/widgets/student_wrapper.dart';


import '../../../utils/constants_colors.dart';

class StudentNoticeBoard extends StatefulWidget {
  const StudentNoticeBoard({Key? key}) : super(key: key);

  @override
  State<StudentNoticeBoard> createState() => _StudentNoticeBoardState();
}

class _StudentNoticeBoardState extends State<StudentNoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return StudentWrapper(widget: TeacherNoticeView(), title: "NoticeBoard");
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     backgroundColor: ConstantColors.backGroundColor,
    //     appBar: AppBar(
    //       title: const Align(
    //           alignment: Alignment.centerLeft,
    //           child: Text(
    //             "Notice Board",
    //             style: TextStyle(color: Colors.black),
    //           )),
    //       leading: IconButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //         icon: Icon(
    //           Icons.arrow_back_ios,
    //           color: Colors.black,
    //         ),
    //       ),
    //       backgroundColor: Colors.white,
    //       bottom: const PreferredSize(
    //         preferredSize: Size(0, 55),
    //         child: Material(
    //           color: Colors.white,
    //           // color: ConstantColors.backGroundColor,
    //           child: TabBar(
    //             labelColor: Colors.black,
    //             dividerColor: Colors.black,
    //             indicatorColor: Colors.black,
    //             tabs: [
    //               Tab(
    //                 text: "ALL NOTICE",
    //               ),
    //               Tab(text: "CREATE NOTICE")
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         StudentNoticeView(),
    //         StudentNoticeCreate(),
    //       ],
    //     ),
    //   ),
    // );
  }
}