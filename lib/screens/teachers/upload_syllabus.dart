import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/loading_icon_text_button.dart';

import '../../bloc/firebase_storage.dart';
import '../../common_widgets/class_section_dropdown.dart';
import '../../common_widgets/subject_dropdown.dart';

class UploadSyllabusPage extends StatefulWidget {
  UploadSyllabusPage();

  @override
  State<UploadSyllabusPage> createState() => _UploadSyllabusPageState();
}

class _UploadSyllabusPageState extends State<UploadSyllabusPage> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  String? syllabusdUrl;
  var classs;
  bool enabledStatus = false;

  Future<void> uploadSyllabus(
      {required String syllabusUrl, required String clazz,required String subject}) async {
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

  @override
  void dispose() {
     textEditingController1.dispose();
     textEditingController2.dispose();
     textEditingController3.dispose();
    // TODO: implement dispose
    super.dispose();
  }
var subject;
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
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
        title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Upload Syllabus Page",
              style: TextStyle(fontSize: 18),
            )),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height*.9,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width*.9,

                child: ClassSectionDropdown(
                  maxWidth: MediaQuery.of(context).size.width*.84,
                  onSelect: (selectedClass, selectedSection) {
                     classs = selectedClass;
                    var sections = selectedSection;
                  },
                ),

              ),
              Container(
                  width: MediaQuery.of(context).size.width*.9,
                  child: SubjectDropdown(
                    maxWidth: MediaQuery.of(context).size.width*.84, onSelect: (selectedSubject) {
                    var subject = selectedSubject;
                  },)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoadingIconTextButton(text: "Attach Syllabus", icon: Icons.attach_file_outlined, onPressed: ()async{
                  var store = FirebaseStorageService();
                  String? file = await store.uploadFileToFirebase();
                  setState(() {
                    syllabusdUrl =  file ;
                    enabledStatus = true;
                  });
                }),
              ),
              // GestureDetector(
              //   onTap: () async{
              //     var store = FirebaseStorageService();
              //     String? file = await store.uploadFileToFirebase();
              //     setState(() {
              //       syllabusdUrl =  file ;
              //       enabledStatus = true;
              //     });
              //   },
              //   child: const Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Row(
              //
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Icon(Icons.attach_file_outlined),
              //         Padding(
              //           padding: EdgeInsets.only(left: 8.0),
              //           child: Text("Attach Study Material"),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed:(enabledStatus)? (){
                        uploadSyllabus( clazz: classs, syllabusUrl: syllabusdUrl!,subject: subject);
                      }: null,

                      child: Text("Submit"),

                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: Colors.grey.shade200,
                        textStyle: TextStyle(color: enabledStatus? Colors.white: Colors.black),
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
    ); ;
  }
}
