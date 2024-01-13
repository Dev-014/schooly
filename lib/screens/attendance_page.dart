import 'package:flutter/material.dart';
import 'package:practice/common_widgets/attendance_card.dart';
import 'package:practice/screens/examination_page.dart';

import '../common_widgets/multimedia_card.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {

  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CalenderPage()));
        }, icon: const Icon(Icons.arrow_back,size: 30,)),
        actions: const [Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [Text("2020"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
              Icon(Icons.arrow_drop_up),
                Icon(Icons.arrow_drop_down)
            ],)],
          ),
        )],
        title: const Align(alignment:Alignment.centerLeft,child: Text("Attendance",style: TextStyle(fontSize: 18),)),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(

        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Text("Year 2020",style: TextStyle(fontSize: 17,color: Colors.pink,),),
              ),
             for(int i =0;i<10;i++)
               const AttendanceCard()


            ],
          ),
        ),
      ),
    );
  }
}
