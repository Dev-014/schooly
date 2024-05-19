import 'package:flutter/material.dart';
import 'package:practice/services/other/syllabus/syllabus_service.dart';
import 'package:practice/widgets/loader_button.dart';

import '../../../services/firebase_storage.dart';
import '../../../widgets/class_section_dropdown.dart';
import '../../../widgets/loader_icon_text_button.dart';
import '../../../widgets/subject_dropdown.dart';

class UploadSyllabus extends StatefulWidget {

  @override
  State<UploadSyllabus> createState() => _UploadSyllabusState();
}

class _UploadSyllabusState extends State<UploadSyllabus> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  String? syllabusdUrl;
  var classs;
  bool enabledStatus = false;


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
    return Container(
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
                disableSection: true,
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
                  subject = selectedSubject;
                },)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoaderIconTextButton(text: "Attach Syllabus", icon: Icons.attach_file_outlined, onPressed: ()async{
                var store = FirebaseStorageService();
                String? file = await store.uploadFileToFirebase();
                print(file);
                // setState(() {
                syllabusdUrl =  file ;
                print(syllabusdUrl);
                enabledStatus = true;
                print(enabledStatus);
                // });
              }),
            ),


            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: LoaderElevatedButton(
                    onPressed: ()async{
                      (enabledStatus)?
                      await   SyllabusService.uploadSyllabus( clazz: classs, syllabusUrl: syllabusdUrl!,subject: subject):null;
                      setState(() {
                      });
                    },

                    buttonText: "Submit",

                  )),
            )
          ],
        ),
      ),
    ) ;
  }
}
