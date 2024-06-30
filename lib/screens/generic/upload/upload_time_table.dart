import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/services/firebase_storage.dart';
import 'package:practice/services/other/time_table/time_table_service.dart';
import 'package:practice/widgets/loader_button.dart';
import 'package:practice/widgets/loader_icon_text_button.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../widgets/class_section_dropdown.dart';

class UploadTimetable extends StatefulWidget {
  UploadTimetable();

  @override
  _UploadTimetableState createState() => _UploadTimetableState();
}

class _UploadTimetableState extends State<UploadTimetable> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  String? section;
  String? clazz;
  String? classId;
  String? subject;
  Uint8List? result;
  var classs ;
  var sections;
  var genericProvider;

  @override
  void initState() {
    super.initState();
    genericProvider = Provider.of<GenericProvider>(context,listen: false);

  }
  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
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
                child: ClassSectionDropdown(
                  disableSubject: true,
                  maxWidth: MediaQuery.of(context).size.width * .81,
                  onSelect: (selectedClass, selectedSection,classID,subjectName) {
                     classs = selectedClass;
                     sections = selectedSection;
                    classId = classID;

                    // Use the selectedClass and selectedSection values here
                    print(
                        'Selected Class: $classs, Selected Section: $sections');
                  },
                ),
              ),
              LoaderIconTextButton(text: "Attach Time Table ", icon: Icons.attach_file_outlined, onPressed: ()async{
                result =await FirebaseStorageService.uploadFiles();

              }),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: LoaderElevatedButton(
                      onPressed: () async {
                        print("""filename: "filename", token: ${genericProvider.sessionToken}, list: result, classId: ${classId}, sectionId: ${sections}""");
                        AddService.addTimeTable(filename: "filename", token: genericProvider.sessionToken, list: result!, classId: classId!, sectionId: sections!,context: context);
                        // TimeTableService.uploadTimetableDataToFirestore(
                        //     result: result!,
                        //     section: sections,
                        //     clazz: classs);
                      },
                      buttonText: "Submit",

                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
