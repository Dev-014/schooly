import 'package:flutter/material.dart';
import 'package:practice/services/other/study_material/study_material_services.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../widgets/class_section_dropdown.dart';
import '../../../widgets/multimedia_card.dart';
import '../../../widgets/subject_dropdown.dart';

class ViewStudyMaterial extends StatefulWidget {
  const ViewStudyMaterial({super.key});

  @override
  State<ViewStudyMaterial> createState() => _ViewStudyMaterialState();
}

class _ViewStudyMaterialState extends State<ViewStudyMaterial> {
  String? clazz;
  String? subject;
  String? section;
  bool get allDropdownsSelected => clazz != null && section != null && subject != null;
  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                future: StudyMaterialServices.getStudyMaterialListForClassAndSection(empID: genericProvider.empID,clazz: clazz!,subject: subject!,section: section!),
                builder: (BuildContext context, snapshot) {

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(child: Text('Error: ${snapshot.error}')),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: Text('No data available')),
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
                          SizedBox(
                            height: 550,
                            width: 400,
                            child: ListView.builder(
                                shrinkWrap: true,

                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  final listOfMap = snapshot.data;
                                  print(listOfMap);
                                  Map<String, dynamic>? map = listOfMap![index];
                                  final studyMaterialHeading = map!["title"];
                                  print("??????????");
                                  print(listOfMap);
                                  // final status = map["status"];
                                  return  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        MultiMediaCard(title: studyMaterialHeading, date: "English / Today",),
                                        IconButton(onPressed: (){

                                          StudyMaterialServices.deleteStudyMaterial(subjectId: subject!, classId: clazz!, sectionId: section!,id: map["id"]);
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
    );
  }
}
