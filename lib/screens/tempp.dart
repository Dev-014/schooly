import 'package:flutter/material.dart';
import 'package:practice/common_widgets/take_attendance_card.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Take Attendance"),
      ),
      body: Container(
        child: Column(
          children: [
            TakeAttendanceCard("1", "dev@gmail.com", "Arun Raju", 0, 90, 0, (){}, (){}, (){}, (){}),
            TakeAttendanceCard("1", "dev@gmail.com", "Priya Lalwani", 0, 90, 0, (){}, (){}, (){}, (){})
            
          ],
        ),
      ),
    );
  }
}
