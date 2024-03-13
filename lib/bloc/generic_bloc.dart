import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GenericProvider extends ChangeNotifier {

  UserProfile? userProfile;

  void setUserProfile({required String profile}) {
    if (profile == "Student") {
      userProfile = UserProfile.student;
    } else if (profile == "Teacher") {
      userProfile = UserProfile.teacher;
    } else {
      userProfile = UserProfile.principal;
    }

  }
   notifyListeners();
}

enum UserProfile { student, teacher, principal }
