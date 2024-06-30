


import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeBoardService{


  static void addNotice({required String title, required String content, required String classs, required String imgSrc}) async {
    // if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      Timestamp appliedDate = Timestamp.now();

      // Construct the notice data
      final Map<String, dynamic> noticeData = {
        'title': title,
        'content': content,
        'date': appliedDate,
        'class': classs,
        'imageSrc': imgSrc,
      };

      try {
        // Get a reference to the Firestore document
        final DocumentReference documentReference = await FirebaseFirestore.instance
            .collection('NewSchool')
            .doc('G0ITybqOBfCa9vownMXU')
            .collection('attendence')
            .doc('y2Yes9Dv5shcWQl9N9r2')
            .collection('noticeBoard')
            .doc('allNotice');

        // Update the Firestore document with the notice data
        await documentReference.update({
          'notice': FieldValue.arrayUnion([noticeData])
        });

        // Print a success message
        print('Notice added successfully');
      } catch (error) {
        // Handle Firestore errors
        print('Failed to add notice: $error');
      }



  }


}