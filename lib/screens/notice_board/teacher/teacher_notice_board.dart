import 'package:flutter/material.dart';
import 'package:practice/screens/notice_board/teacher/upload_notice_board.dart';
import 'package:practice/screens/notice_board/teacher/view_notice_board.dart';
import 'package:practice/utils/constants_colors.dart';

class TeacherNoticeBoard extends StatefulWidget {
  const TeacherNoticeBoard({Key? key}) : super(key: key);

  @override
  State<TeacherNoticeBoard> createState() => _TeacherNoticeBoardState();
}

class _TeacherNoticeBoardState extends State<TeacherNoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ConstantColors.backGroundColor,
        appBar: AppBar(

          title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Notice Board",
                style: TextStyle(color: Colors.black),
              )),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
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
                  Tab(
                    text: "ALL NOTICE",
                  ),
                  Tab(text: "CREATE NOTICE")
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TeacherNoticeView(),
            TeacherNoticeCreate(),
          ],
        ),
      ),
    );
  }
}