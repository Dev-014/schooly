import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice/modals/principal.dart';
import 'package:provider/provider.dart';

import '../modals/student.dart';
import '../modals/teacher.dart';

class GenericProvider extends ChangeNotifier {
  String? empID;
  String? scholarId;
  Student? loggedInStudent;
  Teacher? loggedInTeacher;
  Principal? loggedInPrincipal;
  UserProfile? userProfile;
  bool isUserLoggedIn = false;
  int groupValues = 1;
  void groupValue() {
    groupValues = 0;
  }

  void setUserLoginToTrue(){
    isUserLoggedIn = true;
    notifyListeners();
  }
  void setUserProfile({required String profile}) {
    if (profile == "Student") {
      userProfile = UserProfile.student;
    } else if (profile == "Teacher") {
      userProfile = UserProfile.teacher;
    } else if (profile == "Principal"){
      userProfile = UserProfile.principal;
    }
    notifyListeners();

  }


  List<dynamic>? attendance;
  int? attended_class;

   Future<int> countPresentEntries(String documentId) async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference the document and get its snapshot
      DocumentSnapshot docSnapshot =
      await firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance ').doc(documentId).get();

      // Check if the document exists and has the attendance field
      if (docSnapshot.exists && docSnapshot.data() != null) {
        // Get the attendance map from the document data
        Map<String, dynamic>? attendanceMap = docSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic>? attendanceMap2 = attendanceMap["attendance"] ;

        if (attendanceMap2 != null) {
          int count = 0;
          attendanceMap2.values.forEach((value) {
            if (value == 'present') {
              count++;
            }
          });
          attended_class = count;
          return count;
        }

      }
    } catch (e) {
      print('Error counting present entries: $e');
    }
    return 0; // Return 0 if there was an error or if the attendance map is not found
  }

}



enum UserProfile { student, teacher, principal }
