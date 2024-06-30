
import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher1 {
  String teacherName;
  String? classs;
  String? section;
  String? empId;
  String? email;
  Teacher1({required this.teacherName,  this.classs,  this.section, required this.empId,this.email});

  factory Teacher1.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    Map<String, dynamic> data = snapshot.data()!;
    return Teacher1(
      teacherName: data['teacher_name'],
      classs: data['classs']?? "Not Allotted",
      section: data['Section'],
      empId: data['emp_id'],
      email: data['email_id'],
    );
  }
}
