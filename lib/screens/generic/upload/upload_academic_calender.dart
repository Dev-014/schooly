
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/services/firebase_storage.dart';
import 'package:practice/widgets/loader_button.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../utils/constants_colors.dart';



import 'package:excel/excel.dart' as excel;

Future<Map<String, String>> createAcademicCalendarFromExcel() async {
  Map<String, String> academicCalendar = {};
  try {
    // Read bytes from the Excel file
    // Load Excel file
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'xlsx',
      ],
      withData: true, // Ensure you get the file read stream
    );
    var file = result!.files.first;
    var bytes = file.bytes as List<int>;
    print(bytes);

    // Decode the Excel data
    var excelData = excel.Excel.decodeBytes(bytes);
    print(excelData);
    // Assuming there's only one sheet named "Holidays" (adjust sheet name if needed)
    final sheet = excelData.tables["I want you to change  date form"];

    if (sheet != null) {
print(      sheet.rows.length);
// print(sheet.rows[0].first?.value);
for (var row in sheet.rows.skip(1)) {

        // Assuming the date is in 'DD_MM_YYYY' format in the first column (index 0)
        // and the title is in the second column (index 1)
        if (row.length > 1) {
  print("???????");
          Data? dateString = row[0];
          print(dateString?.value.toString());
          final title = row[1];
          try {

            final dateRegExp = RegExp(r'^\d{2}_\d{2}_\d{4}$');
            if (dateRegExp.hasMatch(dateString!.value.toString())) {
              academicCalendar[dateString!.value.toString()] = title!.value.toString();;
            } else {
              print("Warning: Invalid date format for '$dateString'. Skipping.");
            }
          } on FormatException catch (e) {
            print("Error parsing date: $dateString. Reason: $e");
          }
        }
      }
    } else {
      print("Sheet 'Holidays' not found in the Excel file.");
    }
  } catch (e) {
    print("Error reading Excel file: $e");
  }
  print(academicCalendar);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Check if document with scholarId already exists (optional)
  final docRef = firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/academic_calender').doc("random_doc_id");
  final docSnapshot = await docRef.get();

  if (docSnapshot.exists) {
    Map<String, dynamic> academic_calender_doc = {
      "doc_id": "random_doc_id",
      "academic_calender": academicCalendar
    };
    // Document exists, update data (optional)
    await docRef.update(academic_calender_doc);
    // ... (Implement logic to update specific fields or entire document)
    print('Academic calender Updated');
  } else {
    // Document doesn't exist, create it with entire feeDetails structure
    Map<String, dynamic> academic_calender_doc = {
      "doc_id": "random_doc_id",
      "academic_calender": academicCalendar
    };
    await docRef.set(academic_calender_doc);

    print('Academic Calender Uploaded');
  }
  return academicCalendar;
}



class UploadAcademicCalender extends StatefulWidget {
  const UploadAcademicCalender({super.key});

  @override
  State<UploadAcademicCalender> createState() => _UploadAcademicCalenderState();
}

class _UploadAcademicCalenderState extends State<UploadAcademicCalender> {
  TextEditingController _textController2 = TextEditingController();
  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ConstantColors.backGroundColor,
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CalenderPage()));
        }, icon: const Icon(Icons.arrow_back,size: 30,)),
        title: const Align(alignment:Alignment.centerLeft,child: Text("Academic Calender",style: TextStyle(fontSize: 18),)),
        // backgroundColor: Colors.pink,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24),
              child: Text("Upload academic calender excel sheet in given format", style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20
              ),),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: LoaderElevatedButton(
                    onPressed: () async{
                      Uint8List? list = await FirebaseStorageService.uploadFiles();
                      // addStudyMaterial(_textController3.text, _textController1.text, "study_material_index_1", _textController2.text, "study_material_new_teacher_id", studyMaterialData!);
                      // createAcademicCalendarFromExcel();
                      AddService.addAcademicCalender(filename: "filename", token: genericProvider.sessionToken, list: list!,context: context);
                    },
                    buttonText: ("Upload Files"),
                  )),
            )

          ],
        ),
      ),
    );
  }
}
