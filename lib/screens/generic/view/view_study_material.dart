import 'package:flutter/material.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/services/get_service%20/get_service.dart';
import 'package:practice/services/other/study_material/study_material_services.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../modals/fetch_service/fetchService.pb.dart';
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
  String? classId;
  String? section;
  bool get allDropdownsSelected => clazz != null && section != null && subject != null;
  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    print("vvvvvv");
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
            // ClassSectionDropdown(
            //   horizontalDirection: true,
            //   maxWidth: MediaQuery.of(context).size.width*.44,
            //   onSelect: (selectedClass, selectedSection,classID,subjectName) {
            //     setState(() {
            //       clazz = selectedClass;
            //       section = selectedSection;
            //       classId = classID;
            //       subject = subjectName;
            //     });
            //
            //   },
            // ),


            // Padding(
            //   padding: const EdgeInsets.only(top: 12.0),
            //   child: SubjectDropdown(
            //     classId: classId!,
            //     maxWidth: MediaQuery.of(context).size.width*.84, onSelect: (selectedSubject) {
            //     setState(() {
            //       subject = selectedSubject;
            //
            //     });
            //     // Use the selectedClass and selectedSection values here
            //     print('Selected subject: $subject');
            //   },),
            // ),

            //
            // if (allDropdownsSelected)

              FutureBuilder<FetchStudyMaterialResponse>(
                future: GetService.getStudyMaterial(token: genericProvider.sessionToken, context: context),
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
                  } else if (!snapshot.hasData || snapshot.data!.studyMaterials.isEmpty) {
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

                                itemCount: snapshot.data?.studyMaterials.length,
                                itemBuilder: (context, index) {

                                  StudyMaterial? studyMaterial = snapshot.data?.studyMaterials[index];
                                  final studyMaterialHeading = studyMaterial!.title;


                                  // final status = map["status"];
                                  return  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        MultiMediaCard(title: studyMaterialHeading, date: "${studyMaterial.subjectId} / Today",),
                                        IconButton(onPressed: (){

                                          // StudyMaterialServices.deleteStudyMaterial(subjectId: subject!, classId: clazz!, sectionId: section!,id: map["id"]);
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
