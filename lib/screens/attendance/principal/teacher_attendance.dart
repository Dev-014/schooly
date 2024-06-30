

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../modals/student.dart';
import '../../../modals/teacher.dart';
import '../../../modals/user_service/userService.pb.dart';
import '../../../services/get_service /get_service.dart';
import '../../../widgets/take_attendance_card.dart';

class TeachersAttendance extends StatefulWidget {
  const TeachersAttendance({super.key});

  @override
  State<TeachersAttendance> createState() => _TeachersAttendanceState();
}

class _TeachersAttendanceState extends State<TeachersAttendance> {
  List<Teacher> teachers = [];
  int? totalClasses;

  // Future<List<QueryDocumentSnapshot<Object?>>>? documentSnap;

  // List<Teacher1> getListOfTeachers(List<dynamic> listOfTeachers) {
  //   List<Teacher1> list = [];
  //   listOfTeachers.forEach((teacher) {
  //
  //     Teacher1 teacher1 = Teacher1(
  //         teacherName: teacher["teacher_name"] ?? '',
  //         classs: teacher["classs"] ?? '',
  //         section: teacher["Section"],
  //         empId: teacher["emp_id"],
  //         email: teacher["email_id"]);
  //     list.add(teacher1);
  //   });
  //   return list;
  // }
  //
  //
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


  void markPresentAttendance(String teacherId) async{
    try{
      print("Entered mark present attendance method");
      genericProvider.markedAttendance.addAll({teacherId: true});
      print(">>>>>");
      print(genericProvider.markedAttendance);
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("teacherAttendanceMap", jsonEncode(genericProvider.markedAttendance).toString());

    }catch(e) {

    }


  }
  void markAbsentAttendance(String teacherId) async{
    try{
      print("Entered mark absent attendance method");
      genericProvider.markedAttendance.addAll({teacherId: false});
      print(">>>>>");
      print(genericProvider.markedAttendance);
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("teacherAttendanceMap", jsonEncode(genericProvider.markedAttendance).toString());
    }catch(e) {

    }

  }

//   void markPresentAttendance(String empID) async{
//     DateTime currentDate = DateTime.now();
//     DateFormat formatter = DateFormat('dd_MM_yyyy');
//     String formattedDate = formatter.format(currentDate);
//     DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.doc('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance /$empID').get();
//
// if(docSnapshot.exists){
//   FirebaseFirestore.instance
//       .collection("NewSchool")
//       .doc("G0ITybqOBfCa9vownMXU")
//       .collection("attendence")
//       .doc("y2Yes9Dv5shcWQl9N9r2")
//       .collection("attendance ")
//       .doc(empID)
//       .update({
//     "attendance.${formattedDate}": "present"
//   }).then((value){
//
//     print("success");
//   }).catchError((error) {
//     print('Error updating student: $error');
//   });
//   }else{
//   await FirebaseFirestore.instance.doc('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance /$empID').set({"attendance.${formattedDate}": "present"}).then((value){
//     print("success teacher attendance");
//   }).catchError((error){
//     print('Error updating Teacher: $error');
//   });
//
//   }
// }
//
//   void markAbsentAttendance(String empID) async{
//     DateTime currentDate = DateTime.now();
//     DateFormat formatter = DateFormat('dd_MM_yyyy');
//     String formattedDate = formatter.format(currentDate);
//     DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.doc('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance /$empID').get();
//
//     if(docSnapshot.exists){
//       FirebaseFirestore.instance
//           .collection("NewSchool")
//           .doc("G0ITybqOBfCa9vownMXU")
//           .collection("attendence")
//           .doc("y2Yes9Dv5shcWQl9N9r2")
//           .collection("attendance ")
//           .doc(empID)
//           .update({
//         "attendance.${formattedDate}": "absent"
//       }).then((value){
//
//         print("success");
//       }).catchError((error) {
//         print('Error updating student: $error');
//       });
//     }else{
//       await FirebaseFirestore.instance.doc('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance /$empID').set({"attendance.${formattedDate}": "absent"}).then((value){
//         print("success teacher attendance");
//       }).catchError((error){
//         print('Error updating Teacher: $error');
//       });
//
//     }
//   }

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
    print("vvvvvvvvv");
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    genericProvider.checkAndUpdateDateForTeacher(token:genericProvider.sessionToken, context: context );

    // genericProvider.fetchData();

    // TODO: implement initState
    super.initState();
  }

  // Future<int> countPresentEntries(String documentId) async {
  //   try {
  //     // Get the Firestore instance
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //     // Reference the document and get its snapshot
  //     DocumentSnapshot docSnapshot = await firestore
  //         .collection(
  //         '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance ')
  //         .doc(documentId)
  //         .get();
  //
  //     // Check if the document exists and has the attendance field
  //     if (docSnapshot.exists && docSnapshot.data() != null) {
  //       // Get the attendance map from the document data
  //       Map<String, dynamic>? attendanceMap =
  //       docSnapshot.data() as Map<String, dynamic>;
  //       Map<String, dynamic>? attendanceMap2 = attendanceMap["attendance"];
  //
  //       if (attendanceMap2 != null) {
  //         int count = 0;
  //         attendanceMap2.values.forEach((value) {
  //           if (value == 'present') {
  //             count++;
  //           }
  //         });
  //         return count;
  //       }
  //     }
  //   } catch (e) {
  //     print('Error counting present entries: $e');
  //   }
  //   return 0; // Return 0 if there was an error or if the attendance map is not found
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColors.backGroundColor,

        body: FutureBuilder<List<Teacher>>(
            future: GetService.getTeachers(token: genericProvider.sessionToken,context: context),

            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                print(">>>>>>>");
                List<Teacher> documents = snapshot.data!;
                // print(snapshot.data!.docs.first.data());
                 teachers.addAll(documents);;
                print(teachers);
              }


              return ListView.builder(
                  itemCount: teachers.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("employeeId");
                    print(teachers[index].details.id);

                    return
                             TakeAttendanceCard(
                               id:  teachers[index].details.id,
                                email:  teachers[index].details.id,
                               studentName:  teachers[index].details.firstName,
                               attendedClass:  teachers[index].details.roles,
                               totalClass:  totalClasses ?? 200,
                                editSubject:    () {},attendedClassFun:  () {
                              markPresentAttendance(teachers[index].details.id);
                            },notAttendedClassFun:  () {
                              markAbsentAttendance(teachers[index].details.id);
                            },deleteSubject:  () {});

                          }
                        );

            }));
  }
}

///TODO: We can set total number of classes before.
///
