import 'package:flutter/material.dart';
import 'package:practice/screens/students_ui_2.0/apply_leave_tab.dart';
import 'package:practice/utils/constants_colors.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
// backgroundColor: ConstantColors.backGroundColor,
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
backgroundColor: Colors.blue,
          title: Row(
          children: [
            CircleAvatar(backgroundColor: Colors.grey,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text("Leaves",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),),
                  Text("Deepanshu", style: TextStyle(fontSize: 12,color: Colors.white),)
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_outlined,color: Colors.white,))
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
        body: const TabBarView(
            children: [
              ApplyLeavePage(),
          // Icon(Icons.shopping_bag_outlined),
          Icon(Icons.access_time_sharp)
        ]),

        
      ),
    );
  }
}
