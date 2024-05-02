import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:go_router/go_router.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/routes/url_constants.dart';
import 'package:practice/screens/principal/principal_leave_page.dart';
import 'package:practice/screens/principal/upload_academic_calender.dart';
import 'package:practice/screens/students_ui_2.0/feeDetil.dart';
import 'package:practice/screens/students_ui_2.0/notice_board1.dart';
import 'package:practice/screens/students_ui_2.0/student_notice_board.dart';
import 'package:practice/screens/students_ui_2.0/syllabus.dart';
import 'package:practice/screens/students_ui_2.0/time_table.dart';
import 'package:practice/screens/students_ui_2.0/time_table_form.dart';
import 'package:practice/screens/students_ui_2.0/total_leave_page.dart';
import 'package:practice/screens/students_ui_2.0/view_attendance_page.dart';
import 'package:practice/screens/teachers/add_student.dart';
import 'package:practice/screens/teachers/add_teacher.dart';
import 'package:practice/screens/teachers/homework.dart';
import 'package:practice/screens/teachers/teacher_leave.dart';
import 'package:practice/screens/teachers/teacher_leave_page.dart';
import 'package:practice/screens/teachers/teacher_notice_board.dart';
import 'package:practice/screens/teachers/upload_announcement.dart';
import 'package:practice/screens/teachers/upload_fee_details.dart';
import 'package:practice/screens/teachers/upload_report_card.dart';
import 'package:practice/screens/teachers/upload_study_material.dart';
import 'package:practice/screens/teachers/upload_syllabus.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/ui_2.0/constant_text_widget.dart';
import '../teachers/teacher_menu_page.dart';
import 'package:practice/screens/calender_page.dart';
import 'package:practice/screens/examination_page.dart';
import 'package:practice/screens/fee_details_page.dart';
import 'package:practice/screens/students_ui_2.0/homework_page.dart';
import 'package:practice/screens/profile_page.dart';
import 'package:practice/screens/students_ui_2.0/report_card_page.dart';
import 'package:practice/screens/students_ui_2.0/announcements.dart';
import 'package:practice/screens/students_ui_2.0/leave_page.dart';
import 'package:practice/screens/students_ui_2.0/study_material.dart';

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
                                  ConstantTextWidget.normalText(text: (genericProvider.userProfile == UserProfile.student)?genericProvider.loggedInStudent.studentName:(genericProvider.userProfile==UserProfile.teacher)?genericProvider.loggedInTeacher.teacherName:"Principal", bold: true,color: Colors.white),
                                  ConstantTextWidget.smallText(text: (genericProvider.userProfile == UserProfile.student)?"Student":(genericProvider.userProfile==UserProfile.teacher)?"Teacher":"Principal",color: Colors.white),
                                  ConstantTextWidget.smallText(text: (genericProvider.userProfile == UserProfile.student)?"Class ${
                                              genericProvider
                                                  .loggedInStudent.classs
                                            } "
                                          :(genericProvider.userProfile==UserProfile.teacher)?"Class ${
                                              genericProvider
                                                  .loggedInTeacher.classs
                                            }":"All Classes",color: Colors.white),
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

                      //Principal DashBoard
                      if(genericProvider.userProfile == UserProfile.principal)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return AddStudents();
                                        }));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Add Student",style: TextStyle(fontWeight: FontWeight.bold),),
                                            Icon(Icons.add),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return AddTeacher();
                                        }));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Add Teacher",style: TextStyle(fontWeight: FontWeight.bold),),
                                            Icon(Icons.add),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
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
                                      GoRouter.optionURLReflectsImperativeAPIs =true;
                                      GoRouter.of(context).push(UrlConstants.add_homework);
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?HomeWorkPage():HomeWorkForm()));
                                    },
                                    child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.homework, icon: Icons.book,),
                                  ),
                            // GestureDetector(
                            //         onTap: (){
                            //           Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExaminationPage()));
                            //
                            //         },
                            //         child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.examination, icon: Icons.padding_outlined),
                            //       ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const UploadAcademicCalender()));

                                    },
                                    child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.calendar, icon: Icons.calendar_month),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>(genericProvider.userProfile == UserProfile.student)?StudentNoticeBoard():TeacherNoticeBoard()));

                                    },
                                    child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.noticeBoard, icon: Icons.departure_board_sharp),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  TimetableForm()));

                                    },
                                    child: dashBoardCard(context: context, text: "Time Table", icon: Icons.hot_tub),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadAnnouncement()));
                                    },
                                    child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.announcement, icon: Icons.announcement_outlined),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> StudyMaterialForm()));
                                    },
                                    child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.studyMaterial, icon: Icons.announcement_outlined),
                                  ),
                                  ///ToDo : Need to update it according to Principal Profile
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PrincipalLeavePage()));
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
                          ],
                        ),
                      //Teacher DashBoard
                      if(genericProvider.userProfile == UserProfile.teacher)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return AddStudents();
                                    }));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Add Student",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Icon(Icons.add),
                                      ],
                                    ),
                                  ),
                                ),
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
                                // GestureDetector(
                                //   onTap: (){
                                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoard()));
                                //   },
                                //   child: dashBoardCard(context: context,text: AppLocalizations.of(context)!.dashboard,icon: Icons.home),
                                // ),
                                GestureDetector(
                                  onTap: (){
                                    GoRouter.optionURLReflectsImperativeAPIs =true;
                                    GoRouter.of(context).push(UrlConstants.add_homework);
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?HomeWorkPage():HomeWorkForm()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.homework, icon: Icons.book,),
                                ),GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AttendanceCalculator()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.attendance, icon: Icons.attach_email_rounded),
                                ),
                               /// TODO: We can add Salary Details according to Teacher Profile like monthly Salary slip
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?FeeDetailsPage():UploadFeeDetail()));
                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.feeDetails, icon: Icons.money),
                                ),
                                ///ToDo: Need to finalize how examination section should look like.
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExaminationPage()));
                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.examination, icon: Icons.padding_outlined),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadReportCard()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.reportsCard, icon: Icons.card_giftcard),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadSyllabusPage()));

                                  },
                                  child: dashBoardCard(context: context, text: "Syllabus", icon: Icons.book),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CalenderPage()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.calendar, icon: Icons.calendar_month),
                                ), GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherNoticeBoard()));

                                  },
                                  child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.noticeBoard, icon: Icons.departure_board_sharp),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> TimetableForm()));

                                  },
                                  child: dashBoardCard(context: context, text: "Time Table", icon: Icons.hot_tub),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadAnnouncement()));
                                  },
                                  child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.announcement, icon: Icons.announcement_outlined),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterialForm()));
                                  },
                                  child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.studyMaterial, icon: Icons.announcement_outlined),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherLeavePage()));
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
                          ],
                        ),
                      //Student DashBoard
                      if(genericProvider.userProfile == UserProfile.student)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            direction: Axis.horizontal ,
                            runAlignment: WrapAlignment.center,
                            runSpacing: 15,
                            spacing: 15,
                            children: [
                              // GestureDetector(
                              //   onTap: (){
                              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoard()));
                              //   },
                              //   child: dashBoardCard(context: context,text: AppLocalizations.of(context)!.dashboard,icon: Icons.home),
                              // ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeWorkPage()));

                                },
                                child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.homework, icon: Icons.book,),
                              ),GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AttendanceCalculator()));

                                },
                                child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.attendance, icon: Icons.attach_email_rounded),
                              ),GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FeeDetailsPage()));

                                },
                                child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.feeDetails, icon: Icons.money),
                              ),GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExaminationPage()));

                                },
                                child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.examination, icon: Icons.padding_outlined),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Scaffold(body: ReportCardPage(),)));

                                },
                                child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.reportsCard, icon: Icons.card_giftcard),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Scaffold(body: SyllabusPage(),)));

                                },
                                child: dashBoardCard(context: context, text: "Syllabus", icon: Icons.book),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CalenderPage()));

                                },
                                child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.calendar, icon: Icons.calendar_month),
                              ), GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentNoticeBoard()));

                                },
                                child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.noticeBoard, icon: Icons.departure_board_sharp),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TimeTable()));

                                },
                                child: dashBoardCard(context: context, text: "Time Table", icon: Icons.hot_tub),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Announcement()));
                                },
                                child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.announcement, icon: Icons.announcement_outlined),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterial(clazz: docu["class"],section: "A",)));
                                },
                                child:dashBoardCard(context: context, text: AppLocalizations.of(context)!.studyMaterial, icon: Icons.announcement_outlined),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LeavePage()));
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


                     //Logout Button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: TextButton(onPressed: (){
                          //
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return TeacherMenuPage();
                          // }
                          // )
                          // );
                        }, child: Text("LogOut",style: TextStyle(color: Colors.white),)),
                      ),

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
