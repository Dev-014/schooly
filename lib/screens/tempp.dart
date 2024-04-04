import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/common_widgets/take_attendance_card.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:provider/provider.dart';

import '../modals/student.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  List<Student> students = [];
  int? totalClasses;

  Future<List<QueryDocumentSnapshot<Object?>>>? documentSnap;

  List<Student> getListOfStudents(List<dynamic> listOfStudents) {
    List<Student> list = [];
    listOfStudents.forEach((student) {
      Student student1 = Student(
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


  void markPresentAttendance(String studentID) {
    DateTime currentDate = DateTime.now();
    DateFormat formatter = DateFormat('dd_MM_yyyy');
    String formattedDate = formatter.format(currentDate);
    FirebaseFirestore.instance
        .collection("NewSchool")
        .doc("G0ITybqOBfCa9vownMXU")
        .collection("attendence")
        .doc("y2Yes9Dv5shcWQl9N9r2")
        .collection("attendance ")
        .doc(studentID)
        .update({
      "attendance.${formattedDate}": "present"
    }).then((value){

      print("success");
    }).catchError((error) {
      print('Error updating student: $error');
    });
  }
  void markAbsentAttendance(String studentID) {
    DateTime currentDate = DateTime.now();
    DateFormat formatter = DateFormat('dd_MM_yyyy');
    String formattedDate = formatter.format(currentDate);
    FirebaseFirestore.instance
        .collection("NewSchool")
        .doc("G0ITybqOBfCa9vownMXU")
        .collection("attendence")
        .doc("y2Yes9Dv5shcWQl9N9r2")
        .collection("attendance ")
        .doc(studentID)
        .update({
      "attendance.${formattedDate}": "absent"
    }).then((value){

      print("success");
    }).catchError((error) {
      print('Error updating student: $error');
    });
  }

//DateTime.now().toUtc().millisecondsSinceEpoch
  Future<int?> getTotalClasses() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("NewSchool")
        .doc("G0ITybqOBfCa9vownMXU")
        .collection("attendence")
        .doc("y2Yes9Dv5shcWQl9N9r2")
        .collection("classes")
        .doc("class_id_10thC")
        .get();
    if (documentSnapshot.exists) {
      // Document exists, get the value of total_classes
      totalClasses = documentSnapshot.get('total_classes');
      print('Total Classes: $totalClasses');

      // Do something with the total_classes value
    } else {
      print('Document does not exist');
    }
    return totalClasses;
  }
  var genericProvider;
  @override
  void initState() {
    getTotalClasses();
    // documentSnap = _fetchData();
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    // genericProvider.fetchData();

    // TODO: implement initState
    super.initState();
  }

  Future<int> countPresentEntries(String documentId) async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference the document and get its snapshot
      DocumentSnapshot docSnapshot = await firestore
          .collection(
              '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance ')
          .doc(documentId)
          .get();

      // Check if the document exists and has the attendance field
      if (docSnapshot.exists && docSnapshot.data() != null) {
        // Get the attendance map from the document data
        Map<String, dynamic>? attendanceMap =
            docSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic>? attendanceMap2 = attendanceMap["attendance"];

        if (attendanceMap2 != null) {
          int count = 0;
          attendanceMap2.values.forEach((value) {
            if (value == 'present') {
              count++;
            }
          });
          return count;
        }
      }
    } catch (e) {
      print('Error counting present entries: $e');
    }
    return 0; // Return 0 if there was an error or if the attendance map is not found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColors.backGroundColor,
        // appBar: AppBar(
        //   title: Text("Take Attendance"),
        // ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("NewSchool")
                .doc("G0ITybqOBfCa9vownMXU")
                .collection("attendence")
                .doc("y2Yes9Dv5shcWQl9N9r2")
                .collection('students')
                .where('class',
                    isEqualTo: FirebaseFirestore.instance
                        .collection("NewSchool")
                        .doc("G0ITybqOBfCa9vownMXU")
                        .collection("attendence")
                        .doc("y2Yes9Dv5shcWQl9N9r2")
                        .collection('classes')
                        .doc("class_id_10thC"))
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                print(">>>>>>>");
                List<DocumentSnapshot> documents = snapshot.data!.docs;
                students = getListOfStudents(documents);
              }

              return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FutureBuilder<int>(
                        future: countPresentEntries(students[index]
                            .scholarId!), // Call async function for each item
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: SizedBox(height: 40,width: 40,
                                  child: CircularProgressIndicator()),
                            ); // Show loading indicator while waiting for data
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return TakeAttendanceCard(
                                students[index].scholarId!,
                                students[index].email!,
                                students[index].studentName,
                                snapshot.data!,
                                totalClasses ?? 200,
                                snapshot.data!,
                                () {}, () {
                              markPresentAttendance(students[index].scholarId!);

                            }, () {
                                    markAbsentAttendance(students[index].scholarId!);

                            }, () {});

                          }
                        });
                  });
            }));
  }
}

///TODO: We can set total number of classes before.
///
