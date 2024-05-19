import 'package:cloud_firestore/cloud_firestore.dart';

class SyllabusService{
  static Future<void> uploadSyllabus(
      {required String syllabusUrl, required String clazz,required String subject}) async {
    print(">>>>>>>>>>>>>>>>>>>>>>>..");
    print(syllabusUrl);
    DateTime now = DateTime.now();
    int currentYear = now.year;
    // String reportCardId = "class_"+clazz+"_"+currentYear.toString();
    Map<String, dynamic> syllabusData = {
      'subject_name': subject,
      'syllabus_url': syllabusUrl,
    };

    try {
      await FirebaseFirestore.instance
          .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/syllabus/$clazz/Syllab').doc(subject)
          .set(syllabusData);
      print('Syllabus uploaded successfully!');
    } catch (e) {
      print('Error uploading Syllabus: $e');
    }
  }
}