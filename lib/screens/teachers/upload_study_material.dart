import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/bloc/firebase_storage.dart';
import 'package:practice/common_widgets/drop_down_button.dart';
import 'package:practice/common_widgets/loading_icon_text_button.dart';
import 'package:practice/common_widgets/multimedia_card.dart';
import 'package:practice/common_widgets/new_drop_down.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:provider/provider.dart';

import '../../bloc/generic_bloc.dart';
import '../../common_widgets/class_section_dropdown.dart';
import '../../common_widgets/form_textfield.dart';
import '../../common_widgets/subject_dropdown.dart';

class StudyMaterialForm extends StatefulWidget {
  const StudyMaterialForm({super.key});

  @override
  State<StudyMaterialForm> createState() => _StudyMaterialFormState();
}

class _StudyMaterialFormState extends State<StudyMaterialForm> {

  TextEditingController _textController4 = TextEditingController();
  String? section;
  String? clazz;
  String? subject;
  String? sections;
  String? classs;
  String? subjects;

  bool get allDropdownsSelected => clazz != null && section != null && subject != null;

  Future<List<Map<String, dynamic>>> getStudyMaterialListForClassAndSection(
      ) async {
    print(clazz);
    print(section);
    print(subject);
    List<Map<String, dynamic>> studyMaterialList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material')
    // .where('class', isEqualTo: classNumber)
    // .where('section', isEqualTo: section)
        .where("emp_id",isEqualTo: genericProvider.empID)
    .where("class",isEqualTo: clazz).
    where("section",isEqualTo: section).
    where("subjectId",isEqualTo: subject)
        .get();


    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> studyMaterialItem = {
        'id': doc.id,
        'subject': doc['subjectId'],
        'title': doc['title'],
        'fileUrl': doc['fileUrl'],
        'class': doc['class'],
        'section':doc['section'],
        'emp_id': doc['emp_id']
      };
      studyMaterialList.add(studyMaterialItem);
    });
    print("object");
    print(studyMaterialList);
    return studyMaterialList;
  }
  Future<List<Map<String, dynamic>?>?> fetchStudyMaterials(String? subjectId, String? classId, String? sectionId) async {
    print("ppppppppppp");
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
      'class': classId,
      'section':sectionId,
      'fileUrl': fileUrl,
      'emp_id': teacherUid,
      'subjectId': subjectId,
    };

    // Add the study material data to the study_materials collection
    // await firestore.collection('study_material').doc(materialId).set(materialData);
///NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/subjects/science/class_10/section_A/material_ids/material_id_teacher_id
//     final materialIdsPath = await firestore
//         .collection('NewSchool')
//         .doc("G0ITybqOBfCa9vownMXU")
//         .collection('attendence')
//         .doc("y2Yes9Dv5shcWQl9N9r2")
//         .collection('subjects')
//         .doc(subjectId)
//         .collection('class_$classId')
//         .doc(isForAllSections ? 'section_all' : 'section_$sectionId')
//         .collection('all_ids')
//         .doc("material_ids");
    try {
      final materialIdsPath = await firestore.collection(
          "/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material")
          .doc(materialId)
          .set(materialData);
      print(materialId);
      print("Study Material Add successfully");
    }catch(e){
        print(e);



 //
 // try {
 //   await materialIdsPath.update({
 //     "ids": FieldValue.arrayUnion([materialId]),
 //   });
 // } catch(e){
 //   print(e);
 //   await materialIdsPath.set({
 //     "ids": FieldValue.arrayUnion([materialId]),
 //   });

 }


    // Add the material data to the study_materials collection
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
    // ///NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/subjects/science/class_10/section_A/material_ids/material_id_teacher_id


    // final materialIdsPath = await firestore
    //     .collection('NewSchool')
    //     .doc("G0ITybqOBfCa9vownMXU")
    //     .collection('attendence')
    //     .doc("y2Yes9Dv5shcWQl9N9r2")
    //     .collection('subjects')
    //     .doc(subjectId)
    //     .collection('class_$classId')
    //     .doc(isForAllSections ? 'section_all' : 'section_$sectionId')
    //     .collection('all_ids')
    //     .doc("material_ids");
    //
    //
    // try {
    //   await materialIdsPath.update({
    //     "ids": FieldValue.arrayRemove([id]),
    //   });
    // } catch(e){
    //   print(e);
    //
    // }
    // print('Material IDs updated successfully!');
    // Add the material data to the study_materials collection
    print("<<<<<<<<<<<<<<<<<");
    print(id);
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

  Future<dynamic> uploadStudyMaterial()async {

    print("nnn,n,n,,nn,");
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

    print(file);

  }

  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    // print(genericProvider.isUserLoggedIn);

    super.initState();
  }

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
          SingleChildScrollView(
            child: Container(
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
                           classs = selectedClass;
                           sections = selectedSection;
                          // Use the selectedClass and selectedSection values here
                          print('Selected Class: $classs, Selected Section: $sections');
                        },
                      ),

                    ),

                    Container(
                        width: MediaQuery.of(context).size.width*.9,
                        // color: Colors.white,
                        // height: 200,
                        child: SubjectDropdown(
                          maxWidth: MediaQuery.of(context).size.width*.84, onSelect: (selectedSubject) {
                           subjects = selectedSubject;
                          // Use the selectedClass and selectedSection values here
                          print('Selected subject: $subjects');
                        },)),

                    formTextFields(
                        hintText: "Assignment", maxLine: 4, iconData: Icons.assignment,textEditingController: _textController4),

                    LoadingIconTextButton(
                        text: "Attach Study Material", icon: Icons.attach_file_outlined, onPressed: ()async {

                        await  uploadStudyMaterial();
                      // print("nnn,n,n,,nn,");
                      // var store =   FirebaseStorageService();
                      // String? file = await store.uploadFileToFirebase();
                      // print("Oooooop");
                      // // if (file != null) {
                      // print(file);
                      // studyMaterialData = {
                      //   "fileUrl": file,
                      //   "title": _textController4.text,
                      //   "uploaded_by": "Annma Thomas"
                      // };
                      //
                      // print(file);

                    }),
                    // InkWell(
                    //   onTap: () async{
                    //     var store =   FirebaseStorageService();
                    //     String? file = await store.uploadFileToFirebase();
                    //     print("Oooooop");
                    //     // if (file != null) {
                    //     print(file);
                    //     studyMaterialData = {
                    //       "fileUrl": file,
                    //       "title": _textController4.text,
                    //       "uploaded_by": "Annma Thomas"
                    //     };
                    //
                    //     print(file);
                    //
                    //     // await store..uploadFile(file!);
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
                            onPressed: () async{
                              // addStudyMaterial(_textController3.text, _textController1.text, "study_material_index_1", _textController2.text, "study_material_new_teacher_id", studyMaterialData!);
                              await  addStudyMaterial(subjectId: subjects!, classId: classs!, sectionId: sections!, title: _textController4.text, fileUrl: "fileUrl", teacherUid: genericProvider.loggedInTeacher.empId);
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
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all( 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClassSectionDropdown(
                    horizontalDirection: true,
                    maxWidth: MediaQuery.of(context).size.width*.44,
                    onSelect: (selectedClass, selectedSection) {
                      setState(() {
                        clazz = selectedClass;
                        section = selectedSection;
                      });

                      print('Selected Class: $clazz, Selected Section: $section');
                    },
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SubjectDropdown(
                      maxWidth: MediaQuery.of(context).size.width*.84, onSelect: (selectedSubject) {
                        setState(() {
                          subject = selectedSubject;

                        });
                      // Use the selectedClass and selectedSection values here
                      print('Selected subject: $subject');
                    },),
                  ),


                  if (allDropdownsSelected)

                    FutureBuilder<List<Map<String, dynamic>?>?>(
                      future: getStudyMaterialListForClassAndSection(),
                      builder: (BuildContext context, snapshot) {
                        print("/////////////////////");// Only build FutureBuilder if all dropdowns are selected

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
                                        final study_material_heading = map!["title"];
                                        print("??????????");
                                        print(listOfMap);
                                        // final status = map["status"];
                                        return  Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 10),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              MultiMediaCard(title: study_material_heading, date: "English / Today",),
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


                ],
              ),
            ),
          ),




        ]),
      ),
    );
  }
}
