import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeavePageService{

  static Future<List<dynamic>?> getStudentLeaves()async{

  var studentSnapshot =   await FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
        .collection('leave_application')
        .doc(
        "student")// Assuming widget.studentId is the student's document ID
        .get();

    Map<String, dynamic>? leaveData =
    studentSnapshot.data() as Map<String, dynamic>?;

    // if (leaveData == null || !leaveData.containsKey('studentLeave')) {
    //   return Center(
    //     child: Text('No leave requests found for students.'),
    //   );
    // }

    List<dynamic>? leaveRequests = leaveData?['studentLeave'];

    return leaveRequests;

  }

  static Future<List<dynamic>?> getTeacherLeaves() async{

   var teacherSnapShot = await FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
        .collection('leave_application')
        .doc(
        "teacher") // Assuming widget.studentId is the student's document ID
        .get();

   Map<String, dynamic>? leaveData =
   teacherSnapShot.data() as Map<String, dynamic>?;

   // if (leaveData == null || !leaveData.containsKey('studentLeave')) {
   //   return Center(
   //     child: Text('No leave requests found for students.'),
   //   );
   // }

   List<dynamic>? leaveRequests = leaveData?['teacherLeave'];

   return leaveRequests;

  }

  static void approveStudentLeave(Map<String, dynamic> leaveRequest) {
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


  static void rejectStudentLeave(Map<String, dynamic> leaveRequest) {
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


  static void approveTeacherLeave(Map<String, dynamic> leaveRequest) {
    // Update leave request in Firestore with approval status
    FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('leave_application')
        .doc('teacher')
        .update({
      'teacherLeave': FieldValue.arrayRemove([leaveRequest]),
    }).then((value) {
      // Update the leave request with approval status
      leaveRequest['principalApproval'] = 'Approved';
      FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU")
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2')
          .collection('leave_application')
          .doc('teacher')
          .update({
        'teacherLeave': FieldValue.arrayUnion([leaveRequest]),
      });
    });
  }

  static void rejectTeacherLeave(Map<String, dynamic> leaveRequest) {
    // Update leave request in Firestore with rejection status
    FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('leave_application')
        .doc('teacher')
        .update({
      'teacherLeave': FieldValue.arrayRemove([leaveRequest]),
    }).then((value) {
      // Update the leave request with rejection status
      leaveRequest['principalApproval'] =
      'Rejected'; // Assuming principal approval is also rejected after teacher's rejection
      FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU")
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2')
          .collection('leave_application')
          .doc('teacher')
          .update({
        'teacherLeave': FieldValue.arrayUnion([leaveRequest]),
      });
    });
  }

  static Future<String> _generateLeaveId() async {
    // Query Firestore to get the studentLeave document
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('leave_application')
        .doc('teacher')
        .get();

    // Get the studentLeave data
    Map<String, dynamic> leaveData = documentSnapshot.data() ?? {};

    // Extract the list of leave applications
    List<dynamic> leaveApplications = leaveData['teacherLeave'] ?? [];

    // If there are no existing leave applications, return 1 as the initial leave ID
    if (leaveApplications.isEmpty) {
      return '1';
    }

    // Find the maximum leave ID among the existing leave applications
    int maxLeaveId = 0;
    for (var leave in leaveApplications) {
      int? leaveId = int.tryParse(leave['id'] ?? '');
      if (leaveId != null && leaveId > maxLeaveId) {
        maxLeaveId = leaveId;
      }
    }

    // Calculate the next leave ID by adding 1 to the maximum leave ID
    int nextLeaveId = maxLeaveId + 1;

    // Return the next leave ID as a string
    return nextLeaveId.toString();
  }

    static Future<void> applyStudentLeave({
    required BuildContext context,
    required String reason,
    required String fromDate,
    required String toDate,
    required String scholarId
  }) async {
    // // Extract values entered by the user
    // String reason = _reasonController.text.trim();
    // String fromDate = _fromDateController.text.trim();
    // String toDate = _toDateController.text.trim();

    // Check if any of the fields are empty
    if (reason.isEmpty || fromDate.isEmpty || toDate.isEmpty) {
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please fill in all fields'),
      ));
      return; // Exit the method early if any field is empty
    }

    // Get the current timestamp for the appliedDate field
    Timestamp appliedDate = Timestamp.now();

    try {
      // Generate the leave ID
      String leaveId = await _generateLeaveId();

      // Construct the data to be saved to Firestore
      Map<String, dynamic> leaveData = {
        'id': leaveId,
        'fromDate': fromDate.trim(),
        'toDate': toDate.trim(),
        'appliedDate': appliedDate,
        'teacherApproval': 'Pending',
        'principalApproval': 'Pending',
        'stuId': scholarId.trim(), // Assuming '1' is the student ID
        'reason': reason.trim(),
      };

      // Add the leave application data to Firestore
      await FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
          .collection('leave_application')
          .doc(
          "student") // Assuming widget.studentId is the student's document ID
          .update({
        'studentLeave': FieldValue.arrayUnion([leaveData])
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Leave application submitted successfully'),
      ));
    } catch (error) {
      print('Error submitting leave application: $error');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
        Text('Failed to submit leave application. Please try again later.'),
      ));
    }
  }


  static Future<void> applyTeacherLeave({
    required BuildContext context,
    required String reason,
    required String fromDate,
    required String toDate,
    required String empId
  }) async {
    // Extract values entered by the user
    // String reason = _reasonController.text.trim();
    // String fromDate = _fromDateController.text.trim();
    // String toDate = _toDateController.text.trim();

    // Check if any of the fields are empty
    if (reason.isEmpty || fromDate.isEmpty || toDate.isEmpty) {
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please fill in all fields'),
      ));
      return; // Exit the method early if any field is empty
    }

    // Get the current timestamp for the appliedDate field
    Timestamp appliedDate = Timestamp.now();

    try {
      // Generate the leave ID
      String leaveId = await _generateLeaveId();

      // Construct the data to be saved to Firestore
      Map<String, dynamic> leaveData = {
        'id': leaveId,
        'fromDate': fromDate.trim(),
        'toDate': toDate.trim(),
        'appliedDate': appliedDate,
        'principalApproval': 'Pending',
        'tId': empId.trim(), // Assuming '1' is the student ID
        'reason': reason,
      };

      // Add the leave application data to Firestore
      await FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
          .collection('leave_application')
          .doc(
          "teacher") // Assuming widget.studentId is the student's document ID
          .update({
        'teacherLeave': FieldValue.arrayUnion([leaveData])
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Leave application submitted successfully'),
      ));
    } catch (error) {
      print('Error submitting leave application: $error');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
        Text('Failed to submit leave application. Please try again later.'),
      ));
    }
  }


static void deleteStudentLeaveRequest(Map<String, dynamic> leaveRequest)async{

  await FirebaseFirestore.instance
      .collection('NewSchool')
      .doc(
      "G0ITybqOBfCa9vownMXU") // Update with your document ID
      .collection('attendence')
      .doc(
      'y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
      .collection('leave_application')
      .doc(
      "student") // Assuming widget.studentId is the student's document ID
      .update({
    'studentLeave':
    FieldValue.arrayRemove([leaveRequest])
  });
}

static void deleteTeacherLeaveRequest(Map<String, dynamic> leaveRequest)async{

    await           FirebaseFirestore.instance
        .collection('NewSchool')
        .doc(
        "G0ITybqOBfCa9vownMXU") // Update with your document ID
        .collection('attendence')
        .doc(
        'y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
        .collection('leave_application')
        .doc(
        "teacher") // Assuming widget.studentId is the student's document ID
        .update({
      'teacherLeave':
      FieldValue.arrayRemove([leaveRequest])
    });
}


}