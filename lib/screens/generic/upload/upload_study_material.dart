import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../services/other/study_material/study_material_services.dart';
import '../../../widgets/class_section_dropdown.dart';
import '../../../widgets/form_textfield.dart';
import '../../../widgets/loader_icon_text_button.dart';
import '../../../widgets/subject_dropdown.dart';

class UploadStudyMaterial extends StatefulWidget {
  const UploadStudyMaterial({super.key});

  @override
  State<UploadStudyMaterial> createState() => _UploadStudyMaterialState();
}

class _UploadStudyMaterialState extends State<UploadStudyMaterial> {
  String? sections;
  String? classs;
  String? subjects;
  String? uploadedFileUrl;
  TextEditingController _textController4 = TextEditingController();


  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textController4.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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

              LoaderIconTextButton(
                  text: "Attach Study Material", icon: Icons.attach_file_outlined, onPressed: ()async {

                 uploadedFileUrl =  await  StudyMaterialServices.uploadStudyMaterialFile();

              }),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async{
                        await  StudyMaterialServices.addStudyMaterial(subjectId: subjects!, classId: classs!, sectionId: sections!, title: _textController4.text, fileUrl: uploadedFileUrl??"", teacherUid: genericProvider.loggedInTeacher.empId);
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
    );

  }
}
