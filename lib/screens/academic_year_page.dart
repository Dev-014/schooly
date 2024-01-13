
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/homework_card.dart';
import 'package:practice/screens/calender_page.dart';

class AcademicYearPage extends StatefulWidget {
  const AcademicYearPage({super.key});

  @override
  State<AcademicYearPage> createState() => _AcademicYearPageState();
}

class _AcademicYearPageState extends State<AcademicYearPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 30,)),
        title: const Align(alignment:Alignment.centerLeft,child: Text("Academic Year",style: TextStyle(fontSize: 18),)),
        backgroundColor: Colors.pink,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("unschool").doc('class').collection('10').doc('sectionC').collection("students").doc("studentID").snapshots(),
          builder: (BuildContext context, snapshot) {
            return (!snapshot.hasData)?const Center(child: CircularProgressIndicator()):Column(

                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                    child: Align(alignment: Alignment.centerLeft,
                        child: Text("Today",
                          style: TextStyle(fontSize: 20, color: Colors.pink),)),
                  ),
                  Container(
                    height: 550,
                    width: 400,
                    child: ListView.builder(
                        shrinkWrap: true,

                        itemCount: snapshot.data!.data()!.length,
                        itemBuilder: (context, index) {
                          final mapOfMap = snapshot!.data?["Homework"];
                          Map<String, dynamic> map = mapOfMap[index];
                          final homework_heading = map["homework"];
                          final status = map["status"];
                          return  Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 10),
                            child: HomeWorkCard(title: homework_heading,status:status, date: "English / Today",),
                          );
                        }),
                  ),
                ]
            );
          }),
    );
  }
}
