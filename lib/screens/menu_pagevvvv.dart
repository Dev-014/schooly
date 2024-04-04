import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/screens/attendance_page.dart';
import 'package:practice/screens/calender_page.dart';
import 'package:practice/screens/dashboard.dart';
import 'package:practice/screens/examination_page.dart';
import 'package:practice/screens/fee_details_page.dart';
import 'package:practice/screens/homework_page.dart';
import 'package:practice/screens/multimedia_page.dart';
import 'package:practice/screens/notice_board_page.dart';
import 'package:practice/screens/profile_page.dart';
import 'package:practice/screens/report_card_page.dart';


void fun()async{
  try {
    final snapshot = await FirebaseFirestore.instance.collection('unschool').get();
    print(snapshot.docs[1].id);
    Map<String, dynamic> document = snapshot.docs[1].data();
    // document["school-noticeboard"];
    // print(document);
    // Handle the data retrieval here.
  } catch (e) {
    print('Error: $e');
    // Handle the error, e.g., show an error message to the user.
  }
}


void printFirestoreData() async {
  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('unschool')
        .doc('class')
    .collection('10')
    .doc('sectionC')
    .collection('students')
    .doc('studentID')
        .get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      // print('Document ID: ${documentSnapshot.id}');
      print(documentSnapshot.data());
      // print('Field 1: ${data['field1']}');
      // print('Field 2: ${data['field2']}');

      // Add more fields as needed
    } else {
      print('Document does not exist.');
    }
  } catch (e) {
    print("Error in documentSnapshot");
    print('Error: $e');
  }
}



class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}
var a;
class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    printFirestoreData();
     a = FirebaseFirestore.instance.collection('unschool').snapshots();
     print("THis is a :${a}");
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        // ),
        leading:IconButton(onPressed: ()async{
        },icon:  const Icon(Icons.access_time_sharp,size: 30,)),
        title: const Align(alignment:Alignment.centerLeft,child: Column(
          children: [
            Text("Yogita"),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text("Class VII A",style: TextStyle(fontSize: 12, fontWeight:FontWeight.w200,color: Color.fromRGBO(1, 1, 1, .5)),),
            )
          ],

        )),
        actions: const [Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.cancel_rounded),
        )],
        backgroundColor: Colors.pink,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('unschool')
            .doc('class')
            .collection('10')
            .doc('sectionC')
            .collection('students')
            .snapshots(),

        builder: (BuildContext context, snapshot) {

          // print("object");
          // print(snapshot.data);
          if (snapshot.hasData){
            var document = snapshot.data!;
            // document.first;
            print(document.docs[0].data());
            // var document = snapshot.data!;
            // var data = document.data ;

            var fieldValue = document.size;
            print(fieldValue);

          }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal ,
                runAlignment: WrapAlignment.center,
                runSpacing: 25,
                // spacing: 40,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoard()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.home,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("DashBoard",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeWorkPage()));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.book,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Homework",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AttendancePage()));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.attach_email_rounded,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Attendance",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const FeeDetailsPage()));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.money,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Fee Details",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExaminationPage()));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.padding_outlined,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Examination",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Scaffold(body: ReportCardPage(),)));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.card_giftcard,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Report Cards",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CalenderPage()));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.calendar_month,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Calender",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ), GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const NoticeBoardPage()));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.departure_board_sharp,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Notice Board",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const MultiMediaPage()));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.screenshot_monitor,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Multimedia",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.hot_tub,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Academic Year",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.person,size: MediaQuery.of(context).size.width / 10.5,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Text("Profile",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: TextButton(onPressed: (){}, child: Text("LogOut",style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        );}
      )
    );
  }
}
