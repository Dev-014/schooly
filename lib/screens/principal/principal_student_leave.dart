import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PrincipalStudentApproval extends StatefulWidget {
  const PrincipalStudentApproval({Key? key}) : super(key: key);

  @override
  State<PrincipalStudentApproval> createState() => _PrincipalStudentApprovalState();
}

class _PrincipalStudentApprovalState extends State<PrincipalStudentApproval> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
          .collection('leave_application')
          .doc(
          "student") // Assuming widget.studentId is the student's document ID
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot> studentSnapshot) {
        if (studentSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!studentSnapshot.hasData ||
            studentSnapshot.data!.data() == null) {
          return Center(
            child: Text('No student leave data found.'),
          );
        }

        Map<String, dynamic>? leaveData =
        studentSnapshot.data!.data() as Map<String, dynamic>?;

        if (leaveData == null || !leaveData.containsKey('studentLeave')) {
          return Center(
            child: Text('No leave requests found for students.'),
          );
        }

        List<dynamic> leaveRequests = leaveData['studentLeave'];

        return ListView.builder(
          itemCount: leaveRequests.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> leaveRequest =
            leaveRequests[index] as Map<String, dynamic>;

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
                    Text(
                        'Teacher Approval: ${leaveRequest['teacherApproval']}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Principal Approval: ${leaveRequest['principalApproval']}'),
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

                  ],
                ),
              ),
            );
          },
        );
      },
    );
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
      leaveRequest['teacherApproval'] = 'Approved';
      leaveRequest['principalApproval'] =
      'Approved';
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
