import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:practice/screens/multimedia_page.dart';
import 'package:practice/services/get_service%20/get_service.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

import '../../../modals/academic_service/academicService.pb.dart';

class StudyMaterial extends StatefulWidget {
  final String clazz;
  final String section;
  StudyMaterial({required this.section, required this.clazz, super.key});

  @override
  State<StudyMaterial> createState() => _StudyMaterialState();
}

class _StudyMaterialState extends State<StudyMaterial> {
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material/science/class_10/study_material_index_1/section_A/study_material_teacher_id

  // Future<List<Map<String, dynamic>?>?> fetchStudyMaterials(String subjectId, String classId, String sectionId) async {
  //   final firestore = FirebaseFirestore.instance;
  //
  //   // Fetch material IDs for the section
  //   final sectionRef = firestore.collection('NewSchool')
  //       .doc("G0ITybqOBfCa9vownMXU")
  //       .collection('attendence')
  //       .doc("y2Yes9Dv5shcWQl9N9r2").collection('subjects')
  //       .doc(subjectId)
  //       .collection('class_'+classId)
  //       .doc("section_"+sectionId)
  //       .collection('all_ids').doc("material_ids").get();
  //   print("object........");
  //   final sectionMaterialIdsDoc = await sectionRef ;
  //   print(sectionMaterialIdsDoc.data());
  //   final listOfMaterialIds = sectionMaterialIdsDoc.data()?["ids"] ?? [];
  //   print(listOfMaterialIds);
  //
  //   if (listOfMaterialIds.isNotEmpty) {
  //     final List<dynamic> materialIds = listOfMaterialIds.map((doc) => doc).toList();
  //     print("object+++++++++++");
  //     print(materialIds);
  //     // Fetch material details from   the study_materials collection
  //   if(materialIds.isNotEmpty){
  //     var a = await getStudyMaterialsByIds(materialIds);
  //     print("#############");
  //     print(a);
  //     return a;
  //       } else {
  //
  //       print("&&&&&&&&&&&&&&&&&&&");
  //       return null;
  //       }
  //
  //   }
  // }
  //
  // Future<List<Map<String, dynamic>?>> getStudyMaterialsByIds(
  //     List<dynamic> docIds) async {
  //   final firestore = FirebaseFirestore.instance;
  //   final materials = await Future.wait(docIds.map((materialId) async {
  //     final materialRef = firestore
  //         .collection(
  //             '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material')
  //         .doc(materialId);
  //     final materialDoc = await materialRef.get();
  //     if (materialDoc.exists) {
  //       return materialDoc.data() as Map<String, dynamic>;
  //     } else {
  //       return null;
  //     }
  //   }).toList());
  //
  //   return materials.where((material) => material != null).toList();
  // }

//   Future<List<Map<String, dynamic>>> getStudyMaterialsForSectionA(
//       String schoolId,
//       String attendanceId,
//       String subject,
//       String clazz,
//       ) async {
//     final materialsRef = firestore
//         .collection(schoolId)
//         .doc(attendanceId)
//         .collection('study_material')
//         .doc(subject)
//         .collection(clazz)
//         .where('section_name', isEqualTo: 'section_A');
//
//     final querySnapshot = await materialsRef.get();
//
//     final materials = querySnapshot.docs.map((doc) => doc.data()!).toList();
//     return materials;
//   }
//
  Future<List<String>> getSyllabusSubjectIds() async {

    // Create a reference to the document at the specified path
    List<Subject>? subjectIds = await GetService.getSubjects(token: genericProvider.sessionToken,classId: genericProvider.student.classId);
    for(var subject in subjectIds ?? []){
      subjects.add(subject.name);
      filteredSubjects = subjects;

    }
    print(">>>>>>>>>>>>>>>>>>>");
    print(subjects);
    return subjects;
  }

  // Future<List> getSubjectNames() async {
  //   final firestore = FirebaseFirestore.instance;
  //
  //   // Get the documents from the subcollection at the specified path
  //   final syllabusQuery = await firestore
  //       .collection(
  //           "/NewSchool/G0ITybqOBfCa9vownMXU/attendance/y2Yes9Dv5shcWQl9N9r2/syllabus/10/syllabus/")
  //       .get();
  //
  //   // Check if there are any documents
  //   if (syllabusQuery.docs.isEmpty) {
  //     return []; // Return empty list if no documents
  //   }
  //
  //   // Extract subject names using a loop (alternative to map)
  //   final subjectNames = [];
  //   for (var doc in syllabusQuery.docs) {
  //     final subjectData = doc.data();
  //     if (subjectData != null && subjectData['subject_name'] != null) {
  //       subjectNames.add(subjectData['subject_name'] as String);
  //     }
  //   }
  //
  //   print(subjectNames);
  //   return subjectNames;
  // }
  //
//   Future<List<String>> getSubjects() async {
//     List<String> listOfSubjects = [];
// //genericProvider.loggedInStudent.classs
//     QuerySnapshot syllabusSnapshot = await FirebaseFirestore.instance
//         .collection(
//             '/NewSchool/G0ITybqOBfCa9vownMXU/attendance/y2Yes9Dv5shcWQl9N9r2/syllabus')
//         .doc("10") // Assuming className is the ID of the class document
//         .collection('syllabus')
//         .get();
//     print(syllabusSnapshot.docs);
//     subjects = syllabusSnapshot.docs.map((doc) => doc.id).toList();
//     print("<<<<<<<<<<<>>>>>>>>>>>>>>");
//     print(subjects);
//     return subjects;
//   }

  List<String> subjects = [
    // "Math", "Science", "English", "History", "english","hindi"
  ];

  List<String> filteredSubjects = [];
  String query = "";
  var genericProvider;
  late Future<List<String>>? _docIdsFuture;

  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    _docIdsFuture = getSyllabusSubjectIds();
    //
    super.initState();

    // Set filteredSubjects to all subjects initially
  }

  // Future<List<Map<String, dynamic>>> fetchStudyMaterial(
  //     {required String subjectName,
  //     required String clazz,
  //     required String section}) async {
  //   final firestore = FirebaseFirestore.instance;
  //
  //   // Create a query based on the path and criteria
  //   final query = firestore
  //       .collection(
  //           "/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material")
  //       .where('subjectId', isEqualTo: subjectName)
  //       .where('class', isEqualTo: clazz)
  //       .where('section', isEqualTo: section);
  //
  //   // Get the query snapshot
  //   final querySnapshot = await query.get();
  //   // Extract study materials as a list of maps
  //   final studyMaterials = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   print(">>>>>>>>>>><<<<<<<<<<<<<<<<<");
  //   print(studyMaterials);
  //   return studyMaterials;
  // }

  @override
  Widget build(BuildContext context) {
    filterSubjects() {
      if (query.isEmpty) {
        // If query is empty, return all subjects
        setState(() {
          filteredSubjects = subjects;
        });
      } else {
        print("VvVVVVVVV");
        // Filter subjects based on query
        List<String> results = subjects
            .where((subject) =>
                subject.toLowerCase().contains(query.toLowerCase()))
            .toList();

        setState(() {
          filteredSubjects = results;
        });
      }
    }

    return StudentWrapper(
      widget: FutureBuilder(
          future: _docIdsFuture,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              // final docIds = snapshot.data!;
              // List<String> filteredSubjects = docIds;

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 18),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        // fillColor: Color(0xFFF2F2F2),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: query.length > 0
                            ? IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    query = '';
                                    filterSubjects();
                                  });
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          query = value;
                          filterSubjects();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: filteredSubjects.map((subject) {
                        return InkWell(
                          onTap: () async {
                            FetchStudyMaterialResponse list =  await GetService.getStudyMaterial(token: genericProvider.sessionToken, context: context,subject_id: subject,forStudent: true);

                            print(list);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MultiMediaPage(
                                listOfStudyMaterial: list.studyMaterials,
                              );
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.white,
                              clipBehavior: Clip.hardEdge,
                              // padding: EdgeInsets.all(20.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.book_outlined,
                                          size: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4),
                                          child: Text(subject,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
              ;
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      title: "Study Material",
    );
  }
}
