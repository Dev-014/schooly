import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/screens/students_ui_2.0/feeDetil.dart';
import 'package:practice/screens/students_ui_2.0/time_table.dart';
import 'package:practice/screens/students_ui_2.0/time_table_form.dart';
import 'package:practice/screens/teachers/homework.dart';
import 'package:practice/screens/teachers/upload_announcement.dart';
import 'package:practice/screens/teachers/upload_fee_details.dart';
import 'package:practice/screens/teachers/upload_report_card.dart';
import 'package:practice/screens/teachers/upload_study_material.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/ui_2.0/constant_text_widget.dart';
import '../teachers/teacher_menu_page.dart';

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

import '../tempp.dart';
class DashBoard2 extends StatefulWidget {
  const DashBoard2({super.key});

  @override
  State<DashBoard2> createState() => _DashBoard2State();
}

class _DashBoard2State extends State<DashBoard2> {
  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var docu;
    return StreamBuilder(
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
            docu = document.docs[0].data();
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?HomeWorkPage():HomeWorkForm()));

                              },
                              child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.homework, icon: Icons.book,),
                            ),GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AttendancePage()));

                              },
                              child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.attendance, icon: Icons.attach_email_rounded),
                            ),GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const FeeD()));

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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)? Scaffold(body: ReportCardPage(),):UploadReportCard()));

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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?FeeDetailsPage():UploadFeeDetail()));

                              },
                              child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.multiMedia, icon: Icons.screenshot_monitor),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>  (genericProvider.userProfile == UserProfile.student)?TimeTable(): TimetableForm()));

                              },
                              child: dashBoardCard(context: context, text: "Time Table", icon: Icons.hot_tub),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)? Announcement(): UploadAnnouncement()));
                              },
                              child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.announcement, icon: Icons.announcement_outlined),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?StudyMaterial(clazz: docu["class"],section: "A",): StudyMaterialForm()));
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
