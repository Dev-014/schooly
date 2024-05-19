import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementService{

  static Future<dynamic> uploadAnnouncement( String description, String title,   String category) async {
    DateTime now = DateTime.now();
    String currentTime = "${now.hour}:${now.minute}:${now.second}";
    String docId = FirebaseFirestore.instance.collection('announcement').doc().id;

    Map<String, dynamic> announcementData = {
      'id': docId,
      'description': description,
      'title': title,
      'time': currentTime,
      'category': category
    };

    try {
      await FirebaseFirestore.instance
          .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/announcements/announcement_index1/all').doc(docId)
          .set(announcementData);
      print('Announcement uploaded successfully!');
    } catch (e) {
      print('Error uploading announcement: $e');
    }
  }

}