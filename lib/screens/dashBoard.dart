import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:go_router/go_router.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/routes/url_constants.dart';

import 'package:provider/provider.dart';

import '../widgets/constant_text_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
          if (snapshot.hasData) {
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
                builder: (context) {
                  return Column(
                    children: [
                      Container(
                        color: const Color(0xffffae00),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0),
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                backgroundColor: Color(0xffe4ecff),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ConstantTextWidget.normalText(
                                      text: (genericProvider.userProfile ==
                                              UserProfile.student)
                                          ? genericProvider
                                              .loggedInStudent.studentName
                                          : (genericProvider.userProfile ==
                                                  UserProfile.teacher)
                                              ? genericProvider
                                                  .loggedInTeacher.teacherName
                                              : "Principal",
                                      bold: true,
                                      color: Colors.white),
                                  ConstantTextWidget.smallText(
                                      text: (genericProvider.userProfile ==
                                              UserProfile.student)
                                          ? "Student"
                                          : (genericProvider.userProfile ==
                                                  UserProfile.teacher)
                                              ? "Teacher"
                                              : "Principal",
                                      color: Colors.white),
                                  ConstantTextWidget.smallText(
                                      text: (genericProvider.userProfile ==
                                              UserProfile.student)
                                          ? "Class ${genericProvider.loggedInStudent.classs} "
                                          : (genericProvider.userProfile ==
                                                  UserProfile.teacher)
                                              ? "Class ${genericProvider.loggedInTeacher.classs}"
                                              : "All Classes",
                                      color: Colors.white),
                                  ConstantTextWidget.smallText(
                                      text: "Session: 2022-2023",
                                      color: Colors.white)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xff1079d8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 32),
                          child: ConstantTextWidget.normalText(
                              text:
                                  "Welcome to St Joseph eCamp - St Joseph school. Stay Safe Stay Connected",
                              color: Colors.white),
                        ),
                      ),

                      //Principal DashBoard
                      if (genericProvider.userProfile == UserProfile.principal)
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
                                      onTap: () {
                                        navigateToRoute(
                                            context: context,
                                            routePath:
                                                UrlConstants.add_student);

                                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                                        //   return AddStudents();
                                        // }));
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Add Student",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(Icons.add),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        navigateToRoute(
                                            context: context,
                                            routePath:
                                                UrlConstants.add_teacher);

                                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                                        //   return AddTeacher();
                                        // }));
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Add Teacher",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.center,
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants.add_homework);
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?HomeWorkPage():HomeWorkForm()));
                                    },
                                    child: dashBoardCard(
                                      context: context,
                                      text: AppLocalizations.of(context)!
                                          .homework,
                                      icon: Icons.book,
                                    ),
                                  ),
                                  // GestureDetector(
                                  //         onTap: (){
                                  //           Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExaminationPage()));
                                  //
                                  //         },
                                  //         child: dashBoardCard(context: context, text: AppLocalizations.of(context)!.examination, icon: Icons.padding_outlined),
                                  //       ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants
                                              .upload_academic_calender);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const UploadAcademicCalender()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .calendar,
                                        icon: Icons.calendar_month),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants.teacher_notice_board);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>(genericProvider.userProfile == UserProfile.student)?StudentNoticeBoard():TeacherNoticeBoard()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .noticeBoard,
                                        icon: Icons.departure_board_sharp),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.time_table_form);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>  TimetableForm()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: "Time Table",
                                        icon: Icons.hot_tub),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.upload_announcement);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadAnnouncement()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .announcement,
                                        icon: Icons.announcement_outlined),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.study_material_form);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> StudyMaterialForm()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .studyMaterial,
                                        icon: Icons.announcement_outlined),
                                  ),

                                  ///ToDo : Need to update it according to Principal Profile
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants
                                              .principal_leave_page);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> PrincipalLeavePage()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text:
                                            AppLocalizations.of(context)!.leave,
                                        icon: Icons.announcement_outlined),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants.profile);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .profile,
                                        icon: Icons.person),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      //Teacher DashBoard
                      if (genericProvider.userProfile == UserProfile.teacher)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    navigateToRoute(
                                        context: context,
                                        routePath: UrlConstants.add_student);

                                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                                    //   return AddStudents();
                                    // }));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Add Student",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.add),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                direction: Axis.horizontal,
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
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants.add_homework);
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?HomeWorkPage():HomeWorkForm()));
                                    },
                                    child: dashBoardCard(
                                      context: context,
                                      text: AppLocalizations.of(context)!
                                          .homework,
                                      icon: Icons.book,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants
                                              .attendance_calculator);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> AttendanceCalculator()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .attendance,
                                        icon: Icons.attach_email_rounded),
                                  ),

                                  /// TODO: We can add Salary Details according to Teacher Profile like monthly Salary slip
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.upload_feeDetail);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> (genericProvider.userProfile == UserProfile.student)?FeeDetailsPage():UploadFeeDetail()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .feeDetails,
                                        icon: Icons.money),
                                  ),

                                  ///ToDo: Need to finalize how examination section should look like.
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.examination_page);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExaminationPage()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .examination,
                                        icon: Icons.padding_outlined),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.upload_reportCard);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadReportCard()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .reportsCard,
                                        icon: Icons.card_giftcard),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants
                                              .upload_syllabus_page);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadSyllabusPage()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: "Syllabus",
                                        icon: Icons.book),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.calender_page);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CalenderPage()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .calendar,
                                        icon: Icons.calendar_month),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants.teacher_notice_board);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherNoticeBoard()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .noticeBoard,
                                        icon: Icons.departure_board_sharp),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.time_table_form);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> TimetableForm()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: "Time Table",
                                        icon: Icons.hot_tub),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.upload_announcement);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadAnnouncement()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .announcement,
                                        icon: Icons.announcement_outlined),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.study_material_form);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterialForm()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .studyMaterial,
                                        icon: Icons.announcement_outlined),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath:
                                              UrlConstants.teacher_leave_page);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherLeavePage()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text:
                                            AppLocalizations.of(context)!.leave,
                                        icon: Icons.announcement_outlined),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateToRoute(
                                          context: context,
                                          routePath: UrlConstants.profile);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
                                    },
                                    child: dashBoardCard(
                                        context: context,
                                        text: AppLocalizations.of(context)!
                                            .profile,
                                        icon: Icons.person),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      //Student DashBoard
                      if (genericProvider.userProfile == UserProfile.student)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            direction: Axis.horizontal,
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
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.home_work);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeWorkPage()));
                                },
                                child: dashBoardCard(
                                  context: context,
                                  text: AppLocalizations.of(context)!.homework,
                                  icon: Icons.book,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath:
                                          UrlConstants.attendance_calculator);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> AttendanceCalculator()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!
                                        .attendance,
                                    icon: Icons.attach_email_rounded),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.fee_details);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> FeeDetailsPage()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!
                                        .feeDetails,
                                    icon: Icons.money),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.examination_page);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExaminationPage()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!
                                        .examination,
                                    icon: Icons.padding_outlined),
                              ),

                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.report_card);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Scaffold(body: ReportCardPage(),)));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!
                                        .reportsCard,
                                    icon: Icons.card_giftcard),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.syllabus_page);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Scaffold(body: SyllabusPage(),)));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: "Syllabus",
                                    icon: Icons.book),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.calender_page);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CalenderPage()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text:
                                        AppLocalizations.of(context)!.calendar,
                                    icon: Icons.calendar_month),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.student_notice_board);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentNoticeBoard()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!
                                        .noticeBoard,
                                    icon: Icons.departure_board_sharp),
                              ),

                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.time_table);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> TimeTable()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: "Time Table",
                                    icon: Icons.hot_tub),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.announcement);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Announcement()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!
                                        .announcement,
                                    icon: Icons.announcement_outlined),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.study_material);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterial()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!
                                        .studyMaterial,
                                    icon: Icons.announcement_outlined),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.leave_page);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> LeavePage()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!.leave,
                                    icon: Icons.announcement_outlined),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateToRoute(
                                      context: context,
                                      routePath: UrlConstants.profile);

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
                                },
                                child: dashBoardCard(
                                    context: context,
                                    text: AppLocalizations.of(context)!.profile,
                                    icon: Icons.person),
                              ),
                            ],
                          ),
                        ),

                      //Logout Button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: TextButton(
                            onPressed: () {
                              //
                              // Navigator.push(context, MaterialPageRoute(builder: (context){
                              //   return TeacherMenuPage();
                              // }
                              // )
                              // );
                            },
                            child: const Text(
                              "LogOut",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        });
  }

  void navigateToRoute(
      {required BuildContext context, required String routePath}) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    GoRouter.of(context).push(routePath);
  }

  Container dashBoardCard(
      {required BuildContext context,
      required String text,
      required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Icon(
                icon,
                size: MediaQuery.of(context).size.width / 15.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
