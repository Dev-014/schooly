import 'package:flutter/material.dart';
import '../../../widgets/view_notice_widget.dart';

class StudentNoticeView extends StatelessWidget {
  const StudentNoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ViewNoticeBoard(
      title: "student",
    );
  }
}
