import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/ui_2.0/constant_text_widget.dart';
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
import 'package:practice/screens/students_ui_2.0/announcements.dart';
import 'package:practice/screens/students_ui_2.0/leave_page.dart';
import 'package:practice/screens/students_ui_2.0/study_material.dart';
import 'package:practice/screens/teachers/teacher_menu_page.dart';
import 'package:practice/screens/tempp.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";


// void fun()async{
//   try {
//     final snapshot = await FirebaseFirestore.instance.collection('unschool').get();
//     print(snapshot.docs[1].id);
//     Map<String, dynamic> document = snapshot.docs[1].data();
//     // document["school-noticeboard"];
//     // print(document);
//     // Handle the data retrieval here.
//   } catch (e) {
//     print('Error: $e');
//     // Handle the error, e.g., show an error message to the user.
//   }
// }


// void printFirestoreData() async {
//   try {
//     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//         .collection('unschool')
//         .doc('class')
//         .collection('10')
//         .doc('sectionC')
//         .collection('students')
//         .doc('studentID')
//         .get();
//
//     if (documentSnapshot.exists) {
//       Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
//       // print('Document ID: ${documentSnapshot.id}');
//       // print(documentSnapshot.data());
//       // print('Field 1: ${data['field1']}');
//       // print('Field 2: ${data['field2']}');
//       // Add more fields as needed
//     } else {
//       print('Document does not exist.');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }



class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}
var a;
class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    // printFirestoreData();
    // a = FirebaseFirestore.instance.collection('unschool').snapshots();
    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [

    MenuPage(),
    Temp(),
    // Your second page widget
    Container(), // Your third page widget
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xffe5e8ff),
        appBar: AppBar(
          elevation: 0,
          // toolbarHeight: 70,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          // ),
          leading:IconButton(onPressed: ()async{
          },icon:  const Icon(Icons.view_column,)),
          title: const Align(alignment:Alignment.center,
              child: Text("St Joseph school "),
          ),
          actions: const [
            Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.cancel_rounded),
          )],
          // backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
          BottomNavigationBarItem(icon: Column(
            children: [
              Icon(Icons.dashboard,color: Colors.black,),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(AppLocalizations.of(context)!.dashboard),
              )
            ],
          ),label: "",),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_month,color: Colors.black,),label: AppLocalizations.of(context)!.attendance),
    BottomNavigationBarItem(icon: Icon(Icons.headphones,color: Colors.black,),label: "Support"),
    BottomNavigationBarItem(icon: Icon(Icons.logout,color: Colors.black,),label: "Logout")]),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('unschool')
                .doc('class')
                .collection('10')
                .doc('sectionC')
                .collection('students')
                .snapshots(),

            builder: (BuildContext context, snapshot) {

              if (snapshot.hasData){
                var document = snapshot.data!;
                print(document.docs[0].data());

                var fieldValue = document.size;
                print(fieldValue);

              }
              return SingleChildScrollView(
                child: Localizations.override(
                  context: context,
                  locale: const Locale('en'),
                  child: Builder(

                    builder: (context){
                      return  Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Color(0xffffae00),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 0),
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.blue,

                                    ),
                                    backgroundColor: Color(0xffe4ecff),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ConstantTextWidget.normalText(text: "Demo", bold: true,color: Colors.white),
                                      ConstantTextWidget.smallText(text: "MA (English)",color: Colors.white),
                                      ConstantTextWidget.smallText(text: "(1st Semester)",color: Colors.white),
                                      ConstantTextWidget.smallText(text: "Session: 2022-2023",color: Colors.white)

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff1079d8),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
                              child: ConstantTextWidget.normalText(text: "Welcome to St Joseph eCamp - St Joseph school. Stay Safe Stay Connected",color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal ,
                              runAlignment: WrapAlignment.center,
                              runSpacing: 15,
                              spacing: 15,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoard()));
                                  },
                                  child: dashBoardCard(context: context,text: AppLocalizations.of(context)!.dashboard,icon: Icons.home),
                                ),GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeWorkPage()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.homework, icon: Icons.book,),
                                ),GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AttendancePage()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.attendance, icon: Icons.attach_email_rounded),
                                ),GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FeeDetailsPage()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.academicYear, icon: Icons.money),
                                ),GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExaminationPage()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.examination, icon: Icons.padding_outlined),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Scaffold(body: ReportCardPage(),)));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.reportsCard, icon: Icons.card_giftcard),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CalenderPage()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.calendar, icon: Icons.calendar_month),
                                ), GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const NoticeBoardPage()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.noticeBoard, icon: Icons.departure_board_sharp),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const MultiMediaPage()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.multiMedia, icon: Icons.screenshot_monitor),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Temp()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.academicYear, icon: Icons.hot_tub),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Announcement()));
                                  },
                                  child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.announcement, icon: Icons.announcement_outlined),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const StudyMaterial()));
                                  },
                                  child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.studyMaterial, icon: Icons.announcement_outlined),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LeavePage()));
                                  },
                                  child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.leave, icon: Icons.announcement_outlined),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
                                  },
                                  child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.profile, icon: Icons.person),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return TeacherMenuPage();
                              }));
                            }, child: Text("LogOut",style: TextStyle(color: Colors.white),)),
                          )
                        ],
                      );
                    },
                  ),
                ),
              );}
        )
    );
  }

  Container dashBoardCard({required BuildContext context, required String text,required IconData icon}) {
    return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
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
                                  child: Icon(icon,size: MediaQuery.of(context).size.width / 15.5,),
                                ),
                              ),
                               Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.0),
                                child: Text(text,style: TextStyle(color: Colors.black),),
                              ),

                            ],
                          ),
                        );
  }
}
