import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/screens/multimedia_page.dart';
import 'package:practice/utils/constants_colors.dart';

class StudyMaterial extends StatefulWidget {
  final String clazz;
  final String section;
   StudyMaterial({required this.section,required this.clazz,super.key});

  @override
  State<StudyMaterial> createState() => _StudyMaterialState();
}

class _StudyMaterialState extends State<StudyMaterial> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
///NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/study_material/science/class_10/study_material_index_1/section_A/study_material_teacher_id


  Future<List<Map<String, dynamic>?>?> fetchStudyMaterials(String subjectId, String classId, String sectionId) async {
    final firestore = FirebaseFirestore.instance;

    // Fetch material IDs for the section
    final sectionRef = firestore.collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc("y2Yes9Dv5shcWQl9N9r2").collection('subjects')
        .doc(subjectId)
        .collection('class_'+classId)
        .doc("section_"+sectionId)
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

  List<String> subjects = [
    "Math", "Science", "English", "History", "english","hindi"
  ];

  List<String> filteredSubjects = [];
  String query = "";
  @override
  void initState() {
    super.initState();

    // Set filteredSubjects to all subjects initially
    filteredSubjects = subjects;
  }

  @override
  Widget build(BuildContext context) {

    filterSubjects() {

      if(query.isEmpty) {
        // If query is empty, return all subjects
        setState(() {
          filteredSubjects = subjects;
        });

      } else {

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
    return  Scaffold(
      backgroundColor: ConstantColors.backGroundColor,
      // backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Study Material"),
      // backgroundColor: ConstantColors.primary_color,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 18),
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
                  onTap: ()async{
                    var list  = await fetchStudyMaterials(subject, "4", "C");
                      print(list);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MultiMediaPage(listOfStudyMaterial: list,);
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Card(
shape: RoundedRectangleBorder(
  borderRadius:  BorderRadius.circular(30)
),
                      color: Colors.white,
                      clipBehavior: Clip.hardEdge,
                      // padding: EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.book_outlined,size: 30,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                  child: Text(
                                      subject,
                                      style: TextStyle(fontSize: 18.0,color: Colors.black)),
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
      ),


    );
  }
}
