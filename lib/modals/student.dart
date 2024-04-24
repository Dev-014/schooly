
 import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String studentName;
  String classs;
  String? section;
  String? rollNumber;
  String? scholarId;
  String? email;
   Student({required this.studentName, required this.classs, required this.section, required this.rollNumber, required this.scholarId,this.email});


  factory Student.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
   Map<String, dynamic> data = snapshot.data()!;
   return Student(
    studentName: data['student_name'],
    classs: data['classs'],
    section: data['Section'],
    rollNumber: data['roll_number'],
    scholarId: data['scholar_id'],
    email: data['email_id'],
   );
  }
}
