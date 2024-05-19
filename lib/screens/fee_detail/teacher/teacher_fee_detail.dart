import 'package:flutter/material.dart';
import 'package:practice/screens/generic/upload/upload_fee_details.dart';
import 'package:practice/widgets/pt_wrapper.dart';

class TeacherFeeDetail extends StatefulWidget {
  const TeacherFeeDetail({super.key});

  @override
  State<TeacherFeeDetail> createState() => _TeacherFeeDetailState();
}

class _TeacherFeeDetailState extends State<TeacherFeeDetail> {
  @override
  Widget build(BuildContext context) {
    return PTWrapper(
        tabBarView1: UploadFeeDetail(),
        tabBarView2: Container(),
        firstTabTitle: "FeeDetails",
        title: "Fee Details");
  }
}
