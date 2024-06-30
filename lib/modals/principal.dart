
import 'package:cloud_firestore/cloud_firestore.dart';

class Principal1 {
  String principalName;
  String? classs;
  String? section;
  String? empId;
  String? email;
  Principal1({required this.principalName,  this.classs,  this.section, required this.empId,this.email});

  factory Principal1.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    Map<String, dynamic> data = snapshot.data()!;
    return Principal1(
      principalName: data['principal_name'],
      // classs: data['classs'],
      // section: data['Section'],
      empId: data['emp_id'],
      email: data['email_id'],
    );
  }
}
