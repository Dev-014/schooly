
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:practice/modals/teacher.dart';
import 'package:practice/services/other/leave_page/leave_page_service.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';

class TeacherStudentApproval extends StatefulWidget {
  const TeacherStudentApproval({Key? key}) : super(key: key);

  @override
  State<TeacherStudentApproval> createState() => _TeacherStudentApprovalState();
}

class _TeacherStudentApprovalState extends State<TeacherStudentApproval> {
  String teacherClass = "";
  String teacherSection = "";
  var genericProvider;
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Teacher1 teacherData = genericProvider.loggedInTeacher;
    // teacherSnapshot.data!.data() as Map<String, dynamic>?;

    teacherClass = teacherData.classs!;
    teacherSection = teacherData.section!;


        return FutureBuilder<List<dynamic>?>(
          future: LeavePageService.getStudentLeaves(),
          builder: (BuildContext context,
               studentSnapshot) {

            if (studentSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // else if (!studentSnapshot.hasData ||
            //     studentSnapshot.data!.data() == null) {
            //
            //   return Center(
            //     child: Text('No student leave data found.'),
            //   );
            // }

            // Retrieve student leave requests
            // Map<String, dynamic>? leaveData =
            // studentSnapshot.data as Map<String, dynamic>?;

            // if (leaveData == null || !leaveData.containsKey('studentLeave')) {
            //   return Center(
            //     child: Text('No leave requests found for this student.'),
            //   );
            // }

            List<dynamic> leaveRequests = studentSnapshot.data!;

            List<String> stuIds = leaveRequests
                .map<String>((leave) => leave['stuId'] as String)
                .toList();

            return FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchStudentData(stuIds, leaveRequests),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No student data found.'),
                  );
                }

                List<Map<String, dynamic>> studentDataList = snapshot.data!;

                if (studentDataList.isEmpty) {
                  return Center(
                    child: Text(
                        'No leave requests found for this teacher and student.'),
                  );
                }

                return ListView.builder(
                  itemCount: studentDataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> leaveRequest = studentDataList[index];

                    // Convert timestamp to DateTime format
                    DateTime appliedDate =
                    (leaveRequest['appliedDate'] as Timestamp).toDate();

                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                            'Applied Date: ${DateFormat('dd MMM yyyy').format(appliedDate)}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Reason: ${leaveRequest['reason']}'),
                            Text('From Date: ${leaveRequest['fromDate']}'),
                            Text('To Date: ${leaveRequest['toDate']}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Teacher Approval: ${leaveRequest['teacherApproval']}'),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.check),
                                      onPressed: () {
                                        // Approve leave
                                        approveLeave(leaveRequest);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        // Reject leave
                                        rejectLeave(leaveRequest);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                'Principal Approval: ${leaveRequest['principalApproval']}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );

  }

  Future<List<Map<String, dynamic>>> fetchStudentData(
      List<String> stuIds, List leaveRequests) async {
    List<Map<String, dynamic>> studentDataList = [];

    for (int i = 0; i < stuIds.length; i++) {
      DocumentSnapshot studentSnapshot = await FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU")
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2')
          .collection('students')
          .doc(stuIds[i])
          .get(); // Changed .snapshots() to .get()

      Map<String, dynamic>? studentData =
      studentSnapshot.data() as Map<String, dynamic>?;

      // Check if studentData is not null and contains necessary data
      if (studentData != null &&
          teacherClass == studentData['classs'] &&
          teacherSection == studentData['Section']) {
        studentDataList.add(leaveRequests[i]);
      }
    }

    return studentDataList;
  }

  void approveLeave(Map<String, dynamic> leaveRequest) {
    // Update leave request in Firestore with approval status
    FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('leave_application')
        .doc('student')
        .update({
      'studentLeave': FieldValue.arrayRemove([leaveRequest]),
    }).then((value) {
      // Update the leave request with approval status
      leaveRequest['teacherApproval'] = 'Approved';
      leaveRequest['principalApproval'] =
      'Pending'; // Assuming principal approval is pending after teacher's approval
      FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU")
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2')
          .collection('leave_application')
          .doc('student')
          .update({
        'studentLeave': FieldValue.arrayUnion([leaveRequest]),
      });
    });
  }

  void rejectLeave(Map<String, dynamic> leaveRequest) {
    // Update leave request in Firestore with rejection status
    FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('leave_application')
        .doc('student')
        .update({
      'studentLeave': FieldValue.arrayRemove([leaveRequest]),
    }).then((value) {
      // Update the leave request with rejection status
      leaveRequest['teacherApproval'] = 'Rejected';
      leaveRequest['principalApproval'] =
      'Rejected'; // Assuming principal approval is also rejected after teacher's rejection
      FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU")
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2')
          .collection('leave_application')
          .doc('student')
          .update({
        'studentLeave': FieldValue.arrayUnion([leaveRequest]),
      });
    });
  }
}
// TODO Implement this library.