


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../widgets/showSnackBar.dart';

class HomeWorkService{

  static Future<void> addHomeWork({
    required String subjectId,
    required String classId,
    required String sectionId,
    required String title,
    required String fileUrl,
    required String empID,
    required BuildContext context,
    bool isForAllSections = false,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;
      Map<String, dynamic> materialData = {
        'title': title,
        'fileUrl': fileUrl,
        'emp_id': empID,
        'subject': subjectId,
        'class': classId,
        'section': sectionId,
        'status': false
      };

      // Add the material data to the study_materials collection
      await firestore.collection(
          '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/home_works')
          .doc()
          .set(materialData);
    }catch(e){
      showSnackBar(text: e.toString(), context: context);
    }
    print('Material IDs updated successfully!');
  }


 static Future<List<Map<String, dynamic>>> getHomeworkListForClassAndSection(
  {required String empID}
      ) async {
    List<Map<String, dynamic>> homeworkList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/home_works')
    // .where('class', isEqualTo: classNumber)
    // .where('section', isEqualTo: section)
        .where("emp_id",isEqualTo: empID)
        .get();

    querySnapshot.docs.forEach((doc) {
      print("MMMMMMMMM");
      print(doc);
      Map<String, dynamic> homeworkItem = {
        'HomeworkID': doc.id,
        'subject': doc['subject'],
        'title': doc['title'],
        'status': doc['status']
      };
      homeworkList.add(homeworkItem);
    });
    print("object");
    print(homeworkList);
    return homeworkList;
  }
}