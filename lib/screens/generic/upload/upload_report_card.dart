import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/widgets/loader_button.dart';
import 'package:practice/widgets/newTextField.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../services/firebase_storage.dart';
import '../../../widgets/class_section_dropdown.dart';
import '../../../widgets/form_textfield.dart';
import '../../../widgets/loader_icon_text_button.dart';


class UploadReportCard extends StatefulWidget {
  const UploadReportCard({super.key});

  @override
  State<UploadReportCard> createState() => _UploadReportCardState();
}

class _UploadReportCardState extends State<UploadReportCard> {
  // String docId = FirebaseFirestore.instance.collection('announcement').doc().id;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  Uint8List? reportCardUrl;
  bool enabledStatus = false;
  var classs;
  var sections;
  var subjects;

  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    super.initState();
  }
  // Future<void> uploadReportCard(
  //     {required String reportCardUrl, required String scholarId,required String clazz}) async {
  //   // String docId = FirebaseFirestore.instance.collection('announcement').doc().id;
  //   DateTime now = DateTime.now();
  //   int currentYear = now.year;
  //   String reportCardId = "class_"+clazz+"_"+currentYear.toString();
  //   Map<String, dynamic> reportCardData = {
  //     'class': clazz,
  //     'report_card_id': reportCardId,
  //     'report_card_url': reportCardUrl,
  //     'scholar_id': "12094",
  //
  //   };
  //
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/students/$scholarId/report_cards').doc(reportCardId)
  //         .set(reportCardData);
  //     print('Report Card uploaded successfully!');
  //   } catch (e) {
  //     print('Error uploading report card: $e');
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                // color: Colors.white,
                // height: 200,
                child: ClassSectionDropdown(
                  disableSubject: true,
                  disableSection: true,
                  maxWidth: MediaQuery.of(context).size.width*.87,
                  onSelect: (selectedClass, selectedSection,classID,subjectName) {
                     classs = selectedClass;
                      sections = selectedSection;
                      subjects = subjectName;

                    // Use the selectedClass and selectedSection values here
                    print('Selected Class: $classs, Selected Section: $sections');
                  },
                ),

              ),


              NewTempFormField
                (labelText: "Scholar Id", hintText: "Scholar Id", iconData: Icons.hotel_class_outlined,textEditingController: textEditingController2),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoaderIconTextButton(text: "Attach Report Card", icon: Icons.attach_file_outlined, onPressed: () async{
                  Uint8List? file = await FirebaseStorageService.uploadFiles();
                  setState(() {
                    // print(" setState obj");
                    // ReportCard reportCard = ReportCard(grade: int.parse(classs), userId: textEditingController2.text);

                    // print("""token: ${genericProvider.sessionToken},filename: "", reportCard: ${reportCard},list: ${reportCardUrl}""");

                    // print(file);
                    reportCardUrl =  file ;
                    enabledStatus = true;
                  });

                  // print("object.....");
                  // print(file);

                }),
              ),


              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: LoaderElevatedButton(
                      onPressed:(enabledStatus)? ()async {
                        ReportCard reportCard = ReportCard(grade: int.parse(classs), userId: textEditingController2.text);
                          AddService.addReportCard(token: genericProvider
                              .sessionToken,
                              filename: "file",
                              reportCard: reportCard,
                              list: reportCardUrl!,
                              context: context);
                        }: null,

                      buttonText: "Submit",

                    )),
              )
            ],
          ),
        ),
      ),
    ); ;
  }
}
