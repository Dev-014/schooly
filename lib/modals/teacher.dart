
import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher {
  String teacherName;
  String? classs;
  String? section;
  String? empId;
  String? email;
  Teacher({required this.teacherName,  this.classs,  this.section, required this.empId,this.email});

  factory Teacher.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    Map<String, dynamic> data = snapshot.data()!;
    return Teacher(
      teacherName: data['teacher_name'],
      classs: data['classs']?? "Not Allotted",
      section: data['Section'],
      empId: data['emp_id'],
      email: data['email_id'],
    );
  }
}
