import 'package:flutter/material.dart';
import 'package:practice/screens/generic/upload/upload_homework.dart';
import 'package:practice/screens/generic/view/view_homework.dart';
import 'package:practice/widgets/pt_wrapper.dart';

class HomeWorkForm extends StatefulWidget {
  const HomeWorkForm({super.key});

  @override
  State<HomeWorkForm> createState() => _HomeWorkFormState();
}

class _HomeWorkFormState extends State<HomeWorkForm> {
  @override
  Widget build(BuildContext context) {
    return const PTWrapper(
        tabBarView1: UploadHomework(),
        tabBarView2: ViewHomework(),
        firstTabTitle: "HOMEWORK",
        title: "Homework");
  }
}
