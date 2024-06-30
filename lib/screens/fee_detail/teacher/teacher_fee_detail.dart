import 'package:flutter/material.dart';
import 'package:practice/screens/generic/upload/upload_fee_details.dart';
import 'package:practice/widgets/pt_wrapper.dart';
import 'package:practice/widgets/student_wrapper.dart';

class TeacherFeeDetail extends StatefulWidget {
  const TeacherFeeDetail({super.key});

  @override
  State<TeacherFeeDetail> createState() => _TeacherFeeDetailState();
}

class _TeacherFeeDetailState extends State<TeacherFeeDetail> {
  @override
  Widget build(BuildContext context) {
    return StudentWrapper(
        title: "Fee Details", widget: UploadFeeDetails(),);
  }
}
