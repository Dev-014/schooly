import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/modals/academic_service/academicService.pbjson.dart';
import 'package:practice/services/attendance/mark_attendance.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../modals/student.dart';
import '../../../modals/user_service/userService.pb.dart';
import '../../../services/get_service /get_service.dart';
import '../../../widgets/take_attendance_card.dart';

class TakeStudentAttendance extends StatefulWidget {
  const TakeStudentAttendance({super.key});

  @override
  State<TakeStudentAttendance> createState() => _TakeStudentAttendanceState();
}

class _TakeStudentAttendanceState extends State<TakeStudentAttendance> {
  List<Student> students = [];
  int? totalClasses;

  Future<List<QueryDocumentSnapshot<Object?>>>? documentSnap;

  List<Student1> getListOfStudents(List<dynamic> listOfStudents) {
    List<Student1> list = [];
    listOfStudents.forEach((student) {
      Student1 student1 = Student1(
          studentName: student["student_name"] ?? '',
          classs: student["classs"] ?? '',
          section: student["Section"],
          rollNumber: student["roll_number"],
          scholarId: student["scholar_id"],
          email: student["email_id"]);
      list.add(student1);
    });
    return list;
  }


  void editAttendance({required String studentID,String? status, String? date}) {
    FirebaseFirestore.instance
        .collection("NewSchool")
        .doc("G0ITybqOBfCa9vownMXU")
        .collection("attendence")
        .doc("y2Yes9Dv5shcWQl9N9r2")
        .collection("attendance ")
        .doc(studentID)
        .update({
      "attendance.${date}": "${status!.toLowerCase()}"
    }).then((value){

      print("success");
    }).catchError((error) {
      print('Error updating student: $error');
    });
  }
  void markPresentAttendance(String studentID) async{
    try{
      print("Entered mark present attendance method");
      genericProvider.markedAttendance.addAll({studentID: true});
      print(">>>>>");
      print(genericProvider.markedAttendance);
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("attendanceMap", jsonEncode(genericProvider.markedAttendance).toString());

    }catch(e) {

    }


  }
  void markAbsentAttendance(String studentID) async{
    try{
      print("Entered mark absent attendance method");
      genericProvider.markedAttendance.addAll({studentID: false});
      print(">>>>>");
      print(genericProvider.markedAttendance);
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("attendanceMap", jsonEncode(genericProvider.markedAttendance).toString());
    }catch(e) {

    }

  }

  // void markPresentAttendance(String studentID) async{
  //   DateTime currentDate = DateTime.now();
  //   DateFormat formatter = DateFormat('dd_MM_yyyy');
  //   String formattedDate = formatter.format(currentDate);
  //   final attendanceRef = await FirebaseFirestore.instance
  //       .collection("NewSchool")
  //       .doc("G0ITybqOBfCa9vownMXU")
  //       .collection("attendence")
  //       .doc("y2Yes9Dv5shcWQl9N9r2")
  //       .collection("attendance ");
  //
  //
  //   try {
  //     // Check if the document exists
  //     final DocumentSnapshot docSnap = await attendanceRef.doc(studentID).get();
  //
  //     if (docSnap.exists) {
  //       // Document exists, update it
  //       await attendanceRef.doc(studentID).update({
  //         "attendance.${formattedDate}": "present"
  //       });
  //       print('Document updated: $studentID');
  //     } else {
  //       // Document does not exist, create it
  //       await  attendanceRef.doc(studentID).set({
  //         "attendance":{"${formattedDate}": "present"}
  //
  //       });
  //       print('Document created: $studentID');
  //
  //     }
  //   } catch (e) {
  //     print('Error updating attendance: $e');
  //   }
  //
  //
  // }


  // void markAbsentAttendance(String studentID) {
  //   DateTime currentDate = DateTime.now();
  //   DateFormat formatter = DateFormat('dd_MM_yyyy');
  //   String formattedDate = formatter.format(currentDate);
  //   FirebaseFirestore.instance
  //       .collection("NewSchool")
  //       .doc("G0ITybqOBfCa9vownMXU")
  //       .collection("attendence")
  //       .doc("y2Yes9Dv5shcWQl9N9r2")
  //       .collection("attendance ")
  //       .doc(studentID)
  //       .update({
  //     "attendance.${formattedDate}": "absent"
  //   }).then((value){
  //
  //     print("success");
  //   }).catchError((error) {
  //     print('Error updating student: $error');
  //   });
  // }




//DateTime.now().toUtc().millisecondsSinceEpoch
//   Future<int?> getTotalClasses() async {
//     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//         .collection("NewSchool")
//         .doc("G0ITybqOBfCa9vownMXU")
//         .collection("attendence")
//         .doc("y2Yes9Dv5shcWQl9N9r2")
//         .collection("classes")
//         .doc("class_id_10thC")
//         .get();
//     if (documentSnapshot.exists) {
//       // Document exists, get the value of total_classes
//       totalClasses = documentSnapshot.get('total_classes');
//       print('Total Classes: $totalClasses');
//
//       // Do something with the total_classes value
//     } else {
//       print('Document does not exist');
//     }
//     return totalClasses;
//   }
  var genericProvider;
  @override
  void initState() {
    // getTotalClasses();
    // documentSnap = _fetchData();

    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    // genericProvider.checkAndUpdateDateForTeacher(token:genericProvider.sessionToken, context: context );
    genericProvider.setAttendanceMap(context: context);
    // GetService.getTodayAttendance(token: genericProvider.sessionToken, context: context);

    
    // genericProvider.fetchData();

    // MarkAttendances.markAttendance(markAttendance: MarkAttendance(
    //   sectionId: genericProvider.teacher.sectionId,
    //   classId: genericProvider.teacher.classId,
    //   attendance: {
    //
    //   }
    // ), token: genericProvider.sessionToken, context: context);
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: ConstantColors.backGroundColor,
        // appBar: AppBar(
        //   title: Text("Take Attendance"),
        // ),
        body: FutureBuilder<List<Student>>(
            future: GetService.getStudents(token: genericProvider.sessionToken,context: context),
            builder: (context, snapshot) {
              // if (snapshot.hasError) {
              //   return Text('Error: ${snapshot.error}');
              // }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                print(">>>>>>>????");
                students = snapshot.data!;
                print(students);



              }

              return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  TakeAttendanceCard(
                      markedAttendance: genericProvider.markedAttendance,
                                id:students[index].details.id,
                                email :students[index].details.id,
                               studentName:  students[index].details.firstName + students[index].details.lastName,
                              attendedClass:   students[index].details.roles!,
                               totalClass:  totalClasses ?? 200,
                               editSubject:  () {},attendedClassFun:  () {
                              markPresentAttendance(students[index].details.id);

                            },notAttendedClassFun:  () {
                                    markAbsentAttendance(students[index].details.id);

                            },deleteSubject: () {});

                          }
                        );

            }));
  }
}

///TODO: We can set total number of classes before.
///
