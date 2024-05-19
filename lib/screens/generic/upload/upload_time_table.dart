import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:practice/services/other/time_table/time_table_service.dart';

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
  String? subject;
  FilePickerResult? result;

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
                  maxWidth: MediaQuery.of(context).size.width * .81,
                  onSelect: (selectedClass, selectedSection) {
                    var classs = selectedClass;
                    var sections = selectedSection;
                    // Use the selectedClass and selectedSection values here
                    print(
                        'Selected Class: $classs, Selected Section: $sections');
                  },
                ),
              ),
              InkWell(
                onTap: () async {
                  result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: [
                      'xlsx',
                    ],
                    withData: true, // Ensure you get the file read stream
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.attach_file_outlined),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Attach Study Material"),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        TimeTableService.uploadTimetableDataToFirestore(
                            result: result!,
                            section: _textController2.text,
                            clazz: _textController1.text);
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
