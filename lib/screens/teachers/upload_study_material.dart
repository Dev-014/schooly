import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:practice/bloc/firebase_storage.dart';
import 'package:practice/common_widgets/drop_down_button.dart';
import 'package:practice/common_widgets/multimedia_card.dart';
import 'package:practice/common_widgets/new_drop_down.dart';
import 'package:practice/utils/constants_colors.dart';

import '../../common_widgets/class_section_dropdown.dart';
import '../../common_widgets/form_textfield.dart';
import '../../common_widgets/subject_dropdown.dart';

class StudyMaterialForm extends StatefulWidget {
  const StudyMaterialForm({super.key});

  @override
  State<StudyMaterialForm> createState() => _StudyMaterialFormState();
}

class _StudyMaterialFormState extends State<StudyMaterialForm> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  TextEditingController _textController4 = TextEditingController();
  TextEditingController _textController5 = TextEditingController();
  String? section;
  String? clazz;
  String? subject;
  bool get allDropdownsSelected => clazz != null && section != null && subject != null;


  Future<List<Map<String, dynamic>?>?> fetchStudyMaterials(String? subjectId, String? classId, String? sectionId) async {
    final firestore = FirebaseFirestore.instance;

 if(subjectId != null || sectionId!=null||classId!=null){
   // Fetch material IDs for the section
   final sectionRef = firestore.collection('NewSchool')
       .doc("G0ITybqOBfCa9vownMXU")
       .collection('attendence')
       .doc("y2Yes9Dv5shcWQl9N9r2").collection('subjects')
       .doc(subjectId)
       .collection('class_'+classId!)
       .doc("section_"+sectionId!)
       .collection('all_ids').doc("material_ids").get();
   print("object........");
   final sectionMaterialIdsDoc = await sectionRef ;
   print(sectionMaterialIdsDoc.data());
   final listOfMaterialIds = sectionMaterialIdsDoc.data()?["ids"] ?? [];
   print(listOfMaterialIds);

   if (listOfMaterialIds.isNotEmpty) {
     final List<dynamic> materialIds = listOfMaterialIds.map((doc) => doc).toList();
     print("object+++++++++++");
     print(materialIds);
     // Fetch material details from   the study_materials collection
     if(materialIds.isNotEmpty){
       var a = await getStudyMaterialsByIds(materialIds);
       print("#############");
       print(a);
       return a;
     } else {

       print("&&&&&&&&&&&&&&&&&&&");
       return null;
     }

   }
 }
  }

  Future<List<Map<String, dynamic>?>> getStudyMaterialsByIds(List<dynamic> docIds) async {
    final firestore = FirebaseFirestore.instance;
    final materials = await Future.wait(docIds.map((materialId) async {
      final materialRef = firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material').doc(materialId);
      final materialDoc = await materialRef.get();
      if (materialDoc.exists) {
        return materialDoc.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    }).toList());

    return materials.where((material) => material != null).toList();
  }



  Future<void> addStudyMaterial({
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
      'fileUrl': fileUrl,
      'uploadedBy': teacherUid,
      'subjectId': subjectId,
    };

    // Add the study material data to the study_materials collection
    await firestore.collection('study_material').doc(materialId).set(materialData);
///NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/subjects/science/class_10/section_A/material_ids/material_id_teacher_id
    final materialIdsPath = await firestore
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc("y2Yes9Dv5shcWQl9N9r2")
        .collection('subjects')
        .doc(subjectId)
        .collection('class_$classId')
        .doc(isForAllSections ? 'section_all' : 'section_$sectionId')
        .collection('all_ids')
        .doc("material_ids");



 try {
   await materialIdsPath.update({
     "ids": FieldValue.arrayUnion([materialId]),
   });
 } catch(e){
   print(e);
   await materialIdsPath.set({
     "ids": FieldValue.arrayUnion([materialId]),
   });

 }


    print('Material IDs updated successfully!');
    // Add the material data to the study_materials collection
    await firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material').doc(materialId).set(materialData);
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

  Future<void> deleteStudyMaterial({
    required String subjectId,
    required String classId,
    required String sectionId,
    required String id,
    bool isForAllSections = false,
  }) async {
    final firestore = FirebaseFirestore.instance;

    // Generate a unique material ID
    // String materialId = firestore.collection('study_material').doc().id;

    // Create the study material data

    // Add the study material data to the study_materials collection
    ///NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/subjects/science/class_10/section_A/material_ids/material_id_teacher_id
    final materialIdsPath = await firestore
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc("y2Yes9Dv5shcWQl9N9r2")
        .collection('subjects')
        .doc(subjectId)
        .collection('class_$classId')
        .doc(isForAllSections ? 'section_all' : 'section_$sectionId')
        .collection('all_ids')
        .doc("material_ids");


    try {
      await materialIdsPath.update({
        "ids": FieldValue.arrayRemove([id]),
      });
    } catch(e){
      print(e);

    }
    print('Material IDs updated successfully!');
    // Add the material data to the study_materials collection
    await firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material').doc(id).delete();
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


  // Future<void> addStudyMaterial(String subject, String classLevel, String index, String section, String teacherId, Map<String, dynamic> studyMaterialData) async {
  //   try {
  //     // Get a reference to the Firestore collection
  //     CollectionReference studyMaterialsRef = FirebaseFirestore.instance
  //         .collection('NewSchool')
  //         .doc("G0ITybqOBfCa9vownMXU")
  //         .collection('attendence')
  //         .doc("y2Yes9Dv5shcWQl9N9r2")
  //         .collection('study_material')
  //         .doc(subject)
  //         .collection("class_"+ classLevel)
  //         .doc(index)
  //         .collection(section);
  //
  //     // Add the study material to Firestore
  //     await studyMaterialsRef.doc(teacherId).set(studyMaterialData);
  //
  //     print('Study material added successfully!');
  //   } catch (e) {
  //     print('Error adding study material: $e');
  //     // Optionally, throw the error for further handling
  //     throw e;
  //   }
  // }

  final List<String> items = [
    'Science',
    'Maths',
    'Social Science',
    'English',
    "Hindi"
    // 'Item5',
    // 'Item6',
    // 'Item7',
    // 'Item8',
  ];
  // List<String> myItems = ["Option 1", "Option 2", "Option 3"];
  Map<String, dynamic>? studyMaterialData;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xffe5e8ff).withOpacity(1),
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
                "Study Material",
                style: TextStyle(fontSize: 18),
              )),
          bottom: TabBar(tabs: [
            Tab(text: "UPLOAD STUDY MATERIAL",),
            Tab(text: "VIEW UPLOADED")
          ]),
          // backgroundColor: Colors.pink,
        ),
        body: TabBarView(children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                        var classs = selectedClass;
                        var sections = selectedSection;
                        // Use the selectedClass and selectedSection values here
                        print('Selected Class: $classs, Selected Section: $sections');
                      },
                    ),

                  ),
                  // formTextFields(hintText: "Class", iconData: Icons.group,textEditingController: _textController1 ),
                  // // CustDropDown(
                  // //   hintText: "Subject",
                  // //     items: [
                  // //       CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Science"))),
                  // //       CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Social Science"))),
                  // //       CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Maths"))),
                  // //       CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("English"))),
                  // //     ],
                  // //     onChanged: (){}),
                  // formTextFields(
                  //     hintText: "Section", iconData: Icons.hotel_class_outlined,textEditingController: _textController2),
                  //
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

                  // formTextFields(hintText: "Subject", iconData: Icons.book, textEditingController: _textController3),
                  formTextFields(
                      hintText: "Assignment", maxLine: 4, iconData: Icons.assignment,textEditingController: _textController4),
                  InkWell(
                    onTap: () async{
                      var store =   FirebaseStorageService();
                      String? file = await store.uploadFileToFirebase();
                      print("Oooooop");
                      // if (file != null) {
                      print(file);
                      studyMaterialData = {
                        "fileUrl": file,
                        "title": _textController4.text,
                        "uploaded_by": "Annma Thomas"
                      };
                      // }else{
                      //   print("File is null");
                      // }
                      print(file);

                      // await store..uploadFile(file!);
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
                          onPressed: () async{
                            // addStudyMaterial(_textController3.text, _textController1.text, "study_material_index_1", _textController2.text, "study_material_new_teacher_id", studyMaterialData!);
                            await  addStudyMaterial(subjectId: _textController3.text, classId: _textController1.text, sectionId: _textController2.text, title: _textController4.text, fileUrl: "fileUrl", teacherUid: "teacherUid");
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
          Padding(
            padding: const EdgeInsets.all( 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClassSectionDropdown(
                  horizontalDirection: true,
                  maxWidth: MediaQuery.of(context).size.width*.445,
                  onSelect: (selectedClass, selectedSection) {
                    var classs = selectedClass;
                    var sections = selectedSection;
                    // Use the selectedClass and selectedSection values here
                    print('Selected Class: $classs, Selected Section: $sections');
                  },
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 4.0),
                //         child: CustDropDown(
                //             maxWidth: MediaQuery.of(context).size.width*.45,
                //             hintText: "Class",
                //             items: [
                //               CustDropdownMenuItem(value: "10", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Class 10"))),
                //               CustDropdownMenuItem(value: "9", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Class 9"))),
                //               CustDropdownMenuItem(value: "8", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Class 8"))),
                //               CustDropdownMenuItem(value: "6", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Class 6"))),
                //
                //               CustDropdownMenuItem(value: "5", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Class 5"))),
                //             ],
                //             onChanged: (value){
                //               clazz = value;
                //
                //             }),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 4.0),
                //         child: CustDropDown(
                //             maxWidth: MediaQuery.of(context).size.width*.45,
                //             hintText: "Section",
                //             items: [
                //               CustDropdownMenuItem(value: "A", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Section A"))),
                //               CustDropdownMenuItem(value: "B", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Section B"))),
                //               CustDropdownMenuItem(value: "C", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Section C"))),
                //               CustDropdownMenuItem(value: "D", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Section D"))),
                //             ],
                //             onChanged: (value){
                //               section = value;
                //             }),
                //       ),
                //     ],
                //   ),
                // ),
                SubjectDropdown(
                  maxWidth: MediaQuery.of(context).size.width*.84, onSelect: (selectedSubject) {
                  var subject = selectedSubject;
                  // Use the selectedClass and selectedSection values here
                  print('Selected subject: $subject');
                },),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
                //   child: CustDropDown(
                //     maxWidth: MediaQuery.of(context).size.width*.92,
                //     hintText: "Subject",
                //       items: [
                //         CustDropdownMenuItem(value: "science", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Science"))),
                //         CustDropdownMenuItem(value: "social_science", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Social Science"))),
                //         CustDropdownMenuItem(value: "maths", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Maths"))),
                //         CustDropdownMenuItem(value: "english", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("English"))),
                //         CustDropdownMenuItem(value: "hindi", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Hindi"))),
                //
                //       ],
                //       onChanged: (value){
                //       setState(() {
                //         subject = value;
                //
                //       });
                //       }),
                // ),

                if (allDropdownsSelected) // Only build FutureBuilder if all dropdowns are selected
                  FutureBuilder<List<Map<String, dynamic>?>?>(
                    future: fetchStudyMaterials(subject, clazz, section),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: const Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: Text('Error: ${snapshot.error}')),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: const Center(child: Text('No data available')),
                        );
                      } else {
                        return Column(

                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                                child: Align(alignment: Alignment.centerLeft,
                                    child: Text("Today",
                                      style: TextStyle(fontSize: 20,
                                        // color: Colors.pink,
                                      ),)),
                              ),
                              Container(
                                height: 550,
                                width: 400,
                                child: ListView.builder(
                                    shrinkWrap: true,

                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (context, index) {
                                      final listOfMap = snapshot.data;
                                      print(listOfMap);
                                      Map<String, dynamic>? map = listOfMap![index];
                                      final homework_heading = map!["title"];
                                      // final status = map["status"];
                                      return  Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            MultiMediaCard(title: homework_heading, date: "English / Today",),
                                            IconButton(onPressed: (){

                                              deleteStudyMaterial(subjectId: subject!, classId: clazz!, sectionId: section!,id: map!["id"]);
                                              setState(() {

                                              });
                                            }, icon: Icon(Icons.delete))
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ]
                        );
                      }
                    },
                  ),
                // FutureBuilder<List<Map<String, dynamic>?>?>(
                //     future: fetchStudyMaterials(subject, clazz, section),
                //     builder: (BuildContext context, snapshot) {
                //       return (!snapshot.hasData)?const Center(child: CircularProgressIndicator()):Column(
                //
                //           children: [
                //             const Padding(
                //               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                //               child: Align(alignment: Alignment.centerLeft,
                //                   child: Text("Today",
                //                     style: TextStyle(fontSize: 20,
                //                       // color: Colors.pink,
                //                     ),)),
                //             ),
                //             Container(
                //               height: 550,
                //               width: 400,
                //               child: ListView.builder(
                //                   shrinkWrap: true,
                //
                //                   itemCount: snapshot.data?.length,
                //                   itemBuilder: (context, index) {
                //                     final listOfMap = snapshot.data;
                //                     print(listOfMap);
                //                     Map<String, dynamic>? map = listOfMap![index];
                //                     final homework_heading = map!["title"];
                //                     // final status = map["status"];
                //                     return  Padding(
                //                       padding: const EdgeInsets.symmetric(
                //                           vertical: 4.0, horizontal: 10),
                //                       child: Row(
                //                         mainAxisSize: MainAxisSize.min,
                //                         children: [
                //                           MultiMediaCard(title: homework_heading, date: "English / Today",),
                //                           IconButton(onPressed: (){
                //
                //                             deleteStudyMaterial(subjectId: subject!, classId: clazz!, sectionId: section!,id: map!["id"]);
                //                           setState(() {
                //
                //                           });
                //                             }, icon: Icon(Icons.delete))
                //                         ],
                //                       ),
                //                     );
                //                   }),
                //             ),
                //           ]
                //       );
                //     })

              ],
            ),
          ),




        ]),
      ),
    );
  }
}
