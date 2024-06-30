import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/services/api_methods.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../services/firebase_storage.dart';
import '../../../services/other/homework/homework_service.dart';
import '../../../widgets/class_section_dropdown.dart';
import '../../../widgets/loader_button.dart';
import '../../../widgets/loader_icon_text_button.dart';
import '../../../widgets/newTextField.dart';

class UploadHomework extends StatefulWidget {
  const UploadHomework({super.key});

  @override
  State<UploadHomework> createState() => _UploadHomeworkState();
}

class _UploadHomeworkState extends State<UploadHomework> {

  TextEditingController _textController4 = TextEditingController();

  String? selectedValue;
  var genericProvider;
  var subject;
  Uint8List? file;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);

    // TODO: implement initState
    super.initState();
  }
  var classs ;
  var sections ;
  var classId;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: MediaQuery.of(context).size.height*.95,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                color: Colors.white,
                // height: 200,
                child: ClassSectionDropdown(
                  maxWidth: MediaQuery.of(context).size.width*.84,
                  onSelect: (selectedClass, selectedSection,classID,subjectName) {
                    print("???????????");
                    print("""selectedClass: $selectedClass,selectedSection: $selectedSection, classID : $classID, subjectId : $subjectName""");
                     classs = selectedClass;
                     sections = selectedSection;
                     classId = classID;
                     subject =subjectName;


                    // Use the selectedClass and selectedSection values here
                    // print('Selected Class: $classs, Selected Section: $sections');
                  },
                ),

              ),



              NewTempFormField(textEditingController: _textController4,labelText: "Assignment",
                  hintText: "Assignment", maxLine: 4, iconData: Icons.assignment),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoaderIconTextButton(text: "Attach Homework Material", icon: Icons.attach_file_outlined, onPressed: () async{
                   file = await FirebaseStorageService.uploadFiles();
                  setState(() {
                    // print(" setState obj");
                    // ReportCard reportCard = ReportCard(grade: int.parse(classs), userId: textEditingController2.text);

                    // print("""token: ${genericProvider.sessionToken},filename: "", reportCard: ${reportCard},list: ${reportCardUrl}""");

                    // print(file);

                    // enabledStatus = true;
                  });

                  // print("object.....");
                  // print(file);

                }),
              ),

              Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                  child: LoaderElevatedButton(
                    textColor: Colors.black,
                    buttonText: "Submit",
                    onPressed: ()async {
                      // print("""subjectId: $subject, classId: $classs, sectionId: $sections, title: ${_textController4.text}, fileUrl: "fileUrl",empID: ${genericProvider.teacher.employeeId}""");
                      Homework homework = Homework(subjectId: subject,classId: classs,sectionId: sections,title:_textController4.text, description: _textController4.text,filePath: "fileUrl" );
                      // print("KKKKKKHOMEOWRK");
                      // print(homework);
                      AddService.addHomework(homework: homework, token: genericProvider.sessionToken,context: context,list: file);
                      // await   HomeWorkService.addHomeWork(subjectId: subject, classId: classs, sectionId: sections, title: _textController4.text, fileUrl: "fileUrl",empID: genericProvider.teacher.employeeId,context: context);
                    },
                  )


              )
            ],
          ),
        ),
      ),
    )
    ;
  }
}
Padding homeWorkTextFields(
    {required String hintText,
      int? maxLine,
      IconData? iconData,
      TextEditingController? controller,
      bool? enabled}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Container(
          decoration:BoxDecoration(
              color: Colors.white,

          borderRadius: BorderRadius.circular(20)),
          child: TextFormField(

            controller: controller,
            maxLines: maxLine ?? 1,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(iconData ?? Icons.person),
              ),
              // hintStyle: TextStyle(color: Colors.grey),
              hintText: hintText,
              fillColor: Colors.white,
              focusColor: Colors.white,
              filled: true,
              enabled: enabled ?? true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 1),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 1),
                  borderRadius: BorderRadius.circular(20)),
              // icon: Padding(
              //   padding: const EdgeInsets.only(left: 8.0),
              //   child: Icon(iconData ?? Icons.person),
              // ),
            ),
          ),
        ),
      ],
    ),
  );
}