import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/loading_icon_text_button.dart';

import '../../bloc/firebase_storage.dart';
import '../../common_widgets/class_section_dropdown.dart';
import '../../common_widgets/form_textfield.dart';

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
  String? reportCardUrl;
  bool enabledStatus = false;

  Future<void> uploadReportCard(
      {required String reportCardUrl, required String scholarId,required String clazz}) async {
    // String docId = FirebaseFirestore.instance.collection('announcement').doc().id;
    DateTime now = DateTime.now();
    int currentYear = now.year;
    String reportCardId = "class_"+clazz+"_"+currentYear.toString();
    Map<String, dynamic> reportCardData = {
      'class': clazz,
      'report_card_id': reportCardId,
      'report_card_url': reportCardUrl,
      'scholar_id': "12094",
    };

    try {
      await FirebaseFirestore.instance
          .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/students/$scholarId/report_cards').doc(reportCardId)
          .set(reportCardData);
      print('Report Card uploaded successfully!');
    } catch (e) {
      print('Error uploading report card: $e');
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
              "Upload Report Card",
              style: TextStyle(fontSize: 18),
            )),
        // backgroundColor: Colors.pink,
      ),

      body: SingleChildScrollView(
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
                    maxWidth: MediaQuery.of(context).size.width*.87,
                    onSelect: (selectedClass, selectedSection) {
                      var classs = selectedClass;
                      var sections = selectedSection;
                      // Use the selectedClass and selectedSection values here
                      print('Selected Class: $classs, Selected Section: $sections');
                    },
                  ),
        
                ),
        
                // formTextFields(hintText: "Class", iconData: Icons.group,textEditingController: textEditingController1),
        
        
                formTextFields
                  (
                    hintText: "Scholar Id", iconData: Icons.hotel_class_outlined,textEditingController: textEditingController2),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoadingIconTextButton(text: "Attach Report Card", icon: Icons.attach_file_outlined, onPressed: () async{
                    var store = FirebaseStorageService();
                    String? file = await store.uploadFileToFirebase();
                    setState(() {
                      print(" setState obj");
                      print(file);
                      reportCardUrl =  file ;
                      enabledStatus = true;
                    });

                    print("object.....");
                    print(file);

                  }),
                ),
                // GestureDetector(
                //   onTap: () async{
                //     var store = FirebaseStorageService();
                //     String? file = await store.uploadFileToFirebase();
                //     setState(() {
                //       print(" setState obj");
                //       print(file);
                //       reportCardUrl =  file ;
                //       enabledStatus = true;
                //     });
                //
                //     print("object.....");
                //     print(file);
                //
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Row(
                //
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Icon(Icons.attach_file_outlined),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 8.0),
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
                            uploadReportCard( scholarId:textEditingController2.text, reportCardUrl: reportCardUrl!, clazz: textEditingController1.text);
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
      ),
    ); ;
  }
}
