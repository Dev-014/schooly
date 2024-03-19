import 'package:cloud_firestore/cloud_firestore.dart';
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
    notifyListeners();

  }

  List<dynamic>? attendance;

  void fetchData() async {
    // Construct the collection path
    String collectionPath = 'NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance ';

    // Get the collection reference
    CollectionReference collectionReference = FirebaseFirestore.instance.collection(collectionPath);

    // Fetch the documents in the collection
    QuerySnapshot<Object?> querySnapshot = await collectionReference.get();
    print("???????????");
    print(querySnapshot.docs[1]["attended_classes"]);

    // Return the list of documents
    attendance = querySnapshot.docs;
  }



}



enum UserProfile { student, teacher, principal }
