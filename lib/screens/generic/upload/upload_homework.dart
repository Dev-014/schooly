import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../services/other/homework/homework_service.dart';
import '../../../widgets/class_section_dropdown.dart';
import '../../../widgets/loader_button.dart';
import '../../../widgets/subject_dropdown.dart';

class UploadHomework extends StatefulWidget {
  const UploadHomework({super.key});

  @override
  State<UploadHomework> createState() => _UploadHomeworkState();
}

class _UploadHomeworkState extends State<UploadHomework> {

  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  TextEditingController _textController4 = TextEditingController();
  TextEditingController _textController5 = TextEditingController();

  String? selectedValue;
  var genericProvider;
  var subject;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
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
                  onSelect: (selectedClass, selectedSection) {
                    var classs = selectedClass;
                    var sections = selectedSection;
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
                    subject = selectedSubject;
                    // Use the selectedClass and selectedSection values here
                    print('Selected subject: $subject');
                  },)),


              homeWorkTextFields(controller: _textController4,
                  hintText: "Assignment", maxLine: 4, iconData: Icons.assignment),

              Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                  child: LoaderElevatedButton(
                    textColor: Colors.black,
                    buttonText: "Submit",
                    onPressed: ()async
                    {await   HomeWorkService.addHomeWork(subjectId: subject, classId: _textController1.text, sectionId: _textController2.text, title: _textController4.text, fileUrl: "fileUrl",empID: genericProvider.empID,context: context);
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


        Material(
          elevation: 6, // You can adjust the elevation as needed
          color: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: TextField(
            controller: controller,
            maxLines: maxLine ?? 1,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: hintText,
              fillColor: Colors.grey.withOpacity(.15),
              focusColor: Colors.grey.withOpacity(.15),
              filled: true,
              enabled: enabled ?? true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 2),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 2),
                  borderRadius: BorderRadius.circular(20)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 1),
                  borderRadius: BorderRadius.circular(20)),
              icon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(iconData ?? Icons.person),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}