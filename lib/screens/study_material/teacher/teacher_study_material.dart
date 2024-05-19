import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/screens/generic/upload/upload_study_material.dart';
import 'package:practice/widgets/pt_wrapper.dart';

import '../../generic/view/view_study_material.dart';

class TeacherStudyMaterial extends StatefulWidget {
  const TeacherStudyMaterial({super.key});

  @override
  State<TeacherStudyMaterial> createState() => _TeacherStudyMaterialState();
}

class _TeacherStudyMaterialState extends State<TeacherStudyMaterial> {
  @override
  Widget build(BuildContext context) {
    return const PTWrapper(
      firstTabTitle: "STUDY MATERIAL",
        tabBarView1: UploadStudyMaterial(),
        tabBarView2: ViewStudyMaterial(),
        title: "Study Material");
  }
}
