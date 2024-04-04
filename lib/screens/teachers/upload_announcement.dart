import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/form_textfield.dart';

class UploadAnnouncement extends StatefulWidget {
  const UploadAnnouncement({super.key});

  @override
  State<UploadAnnouncement> createState() => _UploadAnnouncementState();
}

class _UploadAnnouncementState extends State<UploadAnnouncement> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();


  Future<void> uploadAnnouncement( String description, String title,   String category) async {
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
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       toolbarHeight: 60,
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(20),
             bottomRight: Radius.circular(20)),
       ),
       leading: IconButton(
           onPressed: () {
             Navigator.pop(context);
           },
           icon: Icon(
             Icons.arrow_back,
             size: 30,
           )),
       title: const Align(
           alignment: Alignment.centerLeft,
           child: Text(
             "Upload Announcement",
             style: TextStyle(fontSize: 18),
           )),
       // backgroundColor: Colors.pink,
     ),

     body: Container(
        height: MediaQuery.of(context).size.height*.9,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),


              formTextFields(hintText: "Title", iconData: Icons.group,textEditingController: textEditingController1),


              formTextFields
              (
                  hintText: "Category", iconData: Icons.hotel_class_outlined,textEditingController: textEditingController2),
              formTextFields(hintText: "Description", iconData: Icons.book,textEditingController: textEditingController3),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        uploadAnnouncement(textEditingController3.text, textEditingController1.text, textEditingController2.text);
                        // addHomeWork(subjectId: "hindi", classId: '10', sectionId: "A", title: "chapter : 10", fileUrl: "fileUrl", teacherUid: "teacherUid");
                      },
                      child: Text("Submit"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value as needed
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
   );

  }
}
