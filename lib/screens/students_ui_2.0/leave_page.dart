import 'package:flutter/material.dart';
import 'package:practice/screens/students_ui_2.0/apply_leave_tab.dart';
import 'package:practice/screens/students_ui_2.0/total_leave_page.dart';
import 'package:provider/provider.dart';

import '../../bloc/generic_bloc.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  var genericProvider;

  @override
  void initState() {
    super.initState();
    genericProvider = Provider.of<GenericProvider>(context,listen: false);

  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
// backgroundColor: ConstantColors.backGroundColor,
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios, color: Colors.black,)),
backgroundColor: Colors.white,
          title: Row(
          children: [
            CircleAvatar(backgroundColor: Colors.grey,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text("Leaves",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black),),
                  Text(genericProvider.loggedInStudent.studentName, style: TextStyle(fontSize: 12,color: Colors.black,overflow: TextOverflow.ellipsis),)
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_outlined,color: Colors.black,))
          ],
        ),
          bottom: PreferredSize(
            
            preferredSize: Size(0,55),
            child: Material(
              color: Colors.white,
              // color: ConstantColors.backGroundColor,
              child: const TabBar(
                  labelColor: Colors.black,
                  dividerColor: Colors.black,
                  indicatorColor: Colors.black,
              tabs: [
                Tab(text: "APPLY LEAVE",),
                Tab(text: "REQUESTS")
              ]),
            ),
          ),
        ),
        body:  TabBarView(
            children: [
              ApplyLeavePage(),
              LeaveRequestsPage(),
        ]),

        
      ),
    );
  }
}
