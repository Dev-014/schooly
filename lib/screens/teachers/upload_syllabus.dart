import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../bloc/firebase_storage.dart';
import '../../common_widgets/class_section_dropdown.dart';
import '../../common_widgets/form_textfield.dart';
import '../../common_widgets/new_drop_down.dart';
import '../../common_widgets/subject_dropdown.dart';

class UploadSyllabusPage extends StatefulWidget {
  UploadSyllabusPage();

  @override
  State<UploadSyllabusPage> createState() => _UploadSyllabusPageState();
}

class _UploadSyllabusPageState extends State<UploadSyllabusPage> {
  // String docId = FirebaseFirestore.instance.collection('announcement').doc().id;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  String? syllabusdUrl;
  var classs;
  bool enabledStatus = false;

  Future<void> uploadSyllabus(
      {required String syllabusUrl, required String clazz,required String subject}) async {
    // String docId = FirebaseFirestore.instance.collection('announcement').doc().id;
    DateTime now = DateTime.now();
    int currentYear = now.year;
    String reportCardId = "class_"+clazz+"_"+currentYear.toString();
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
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            )),
        title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Upload Syllabus Page",
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
              Container(
                width: MediaQuery.of(context).size.width*.9,
                color: Colors.white,
                // height: 200,
                child: ClassSectionDropdown(
                  maxWidth: MediaQuery.of(context).size.width*.84,
                  onSelect: (selectedClass, selectedSection) {
                     classs = selectedClass;
                    var sections = selectedSection;
                    // Use the selectedClass and selectedSection values here
                    print('Selected Class: $classs, Selected Section: $sections');
                  },
                ),

              ),

              // formTextFields(hintText: "Class", iconData: Icons.group,textEditingController: textEditingController1),


            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
            //   child: CustDropDown(
            //       maxWidth: MediaQuery.of(context).size.width*.84,
            //       hintText: "Subject",
            //       items: [
            //         CustDropdownMenuItem(value: "science", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Science"))),
            //         CustDropdownMenuItem(value: "social_science", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Social Science"))),
            //         CustDropdownMenuItem(value: "maths", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Maths"))),
            //         CustDropdownMenuItem(value: "english", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("English"))),
            //         CustDropdownMenuItem(value: "hindi", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Hindi"))),
            //
            //       ],
            //       onChanged: (value){
            //         setState(() {
            //           subject = value;
            //
            //         });
            //       }),
            // ),
              Container(
                  width: MediaQuery.of(context).size.width*.9,
                  color: Colors.white,
                  // height: 200,
                  child: SubjectDropdown(
                    maxWidth: MediaQuery.of(context).size.width*.84, onSelect: (selectedSubject) {
                    var subject = selectedSubject;
                    // Use the selectedClass and selectedSection values here
                    print('Selected subject: $subject');
                  },)),

              GestureDetector(
                onTap: () async{
                  var store = FirebaseStorageService();
                  String? file = await store.uploadFileToFirebase();
                  setState(() {
                    print(" setState obj");
                    print(file);
                    syllabusdUrl =  file ;
                    enabledStatus = true;
                  });

                  print("object.....");
                  print(file);

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.attach_file_outlined),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Attach Study Material"),
                      ),
                    ],
                  ),
                ),
              ),

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
