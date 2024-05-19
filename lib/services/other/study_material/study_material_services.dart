import 'package:cloud_firestore/cloud_firestore.dart';

import '../../firebase_storage.dart';

class StudyMaterialServices {
  static Future<void> deleteStudyMaterial({
    required String subjectId,
    required String classId,
    required String sectionId,
    required String id,
    bool isForAllSections = false,
  }) async {
    final firestore = FirebaseFirestore.instance;

    await firestore
        .collection(
            '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material')
        .doc(id)
        .delete();
  }

  static Future<void> addStudyMaterial({
    required String subjectId,
    required String classId,
    required String sectionId,
    required String title,
    required String fileUrl,
    required String teacherUid,
    bool isForAllSections = false,
  }) async {
    final firestore = FirebaseFirestore.instance;

    // Generate a unique material ID
    String materialId = firestore.collection('study_material').doc().id;

    // Create the study material data
    Map<String, dynamic> materialData = {
      "id": materialId,
      'title': title,
      'class': classId,
      'section': sectionId,
      'fileUrl': fileUrl,
      'emp_id': teacherUid,
      'subjectId': subjectId,
    };

    // Add the study material data to the study_materials collection
    // await firestore.collection('study_material').doc(materialId).set(materialData);
    ///NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/subjects/science/class_10/section_A/material_ids/material_id_teacher_id
//     final materialIdsPath = await firestore
//         .collection('NewSchool')
//         .doc("G0ITybqOBfCa9vownMXU")
//         .collection('attendence')
//         .doc("y2Yes9Dv5shcWQl9N9r2")
//         .collection('subjects')
//         .doc(subjectId)
//         .collection('class_$classId')
//         .doc(isForAllSections ? 'section_all' : 'section_$sectionId')
//         .collection('all_ids')
//         .doc("material_ids");
    try {
      final materialIdsPath = await firestore
          .collection(
              "/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material")
          .doc(materialId)
          .set(materialData);
      print(materialId);
      print("Study Material Add successfully");
    } catch (e) {
      print(e);

      //
      // try {
      //   await materialIdsPath.update({
      //     "ids": FieldValue.arrayUnion([materialId]),
      //   });
      // } catch(e){
      //   print(e);
      //   await materialIdsPath.set({
      //     "ids": FieldValue.arrayUnion([materialId]),
      //   });
    }

    // Add the material data to the study_materials collection
    // final materialIdsDoc = await firestore.doc(materialIdsPath).get();
    //
    // if (!materialIdsDoc.exists) {
    //   // If the document doesn't exist, create a new one
    //   await firestore.doc(materialIdsPath).set(materialData);
    // } else {
    //   // If the document already exists, update the existing data
    //   await firestore.doc(materialIdsPath).update(materialData);
    // }
  }

  static Future<List<Map<String, dynamic>>>
      getStudyMaterialListForClassAndSection(
          {required String clazz,
          required String section,
          required String subject,
          required String empID}) async {
    print(clazz);
    print(section);
    print(subject);
    List<Map<String, dynamic>> studyMaterialList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(
            '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material')
        .where("emp_id", isEqualTo: empID)
        .where("class", isEqualTo: clazz)
        .where("section", isEqualTo: section)
        .where("subjectId", isEqualTo: subject)
        .get();

    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> studyMaterialItem = {
        'id': doc.id,
        'subject': doc['subjectId'],
        'title': doc['title'],
        'fileUrl': doc['fileUrl'],
        'class': doc['class'],
        'section': doc['section'],
        'emp_id': doc['emp_id']
      };
      studyMaterialList.add(studyMaterialItem);
    });
    print("object");
    print(studyMaterialList);
    return studyMaterialList;
  }


  static Future<dynamic> uploadStudyMaterialFile()async {
    var store =   FirebaseStorageService();
    String? file = await store.uploadFileToFirebase();
    return file;
  }

}
