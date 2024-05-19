import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants_colors.dart';

class StudentWrapper extends StatefulWidget {
  final Widget widget ;
  final String title;
  final FloatingActionButton? floatingActionButton;
  const StudentWrapper({required this.widget,required this.title,this.floatingActionButton,super.key});

  @override
  State<StudentWrapper> createState() => _StudentWrapperState();
}

class _StudentWrapperState extends State<StudentWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backGroundColor,

      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
          // RouteHandler().getLoggedInGoRouter.pop();
          // Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 30,)),
        title:  Align(alignment:Alignment.centerLeft,child: Text(widget.title,style: const TextStyle(fontSize: 18),)),
        // backgroundColor: Colors.pink,
      ),
      body: widget.widget,
      floatingActionButton: widget.floatingActionButton ?? SizedBox(),
    );
  }
}
