import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

import '../../utils/constants_colors.dart';



Future<void> uploadFeeDataFromExcel({required BuildContext context}) async {
  // ... (Code for reading data from Excel using excel.dart)
  // Access Firestore
  try{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  var excel = Excel.decodeBytes(bytes);

  // Access the sheet containing fee details
  var sheet = excel['Sheet1']; // Update with your sheet name
  print(sheet.sheetName);
  // Iterate through rows to extract and upload data to Firestore
  print("vvvvvv");
  print(sheet.rows);

  List<Map<String,dynamic>> feeData = [];
  Map<String, dynamic> feeDetails = {};

  for (var row in sheet.rows.skip(1)) {
    String? scholarId = row[1]?.value.toString();
    String? quarterYear = row[2]?.value.toString();
    final quarterData = {
      "payment amount" : row[3]?.value.toString(),
      'payment date': row[4]?.value.toString(),
      'status': row[5]?.value.toString(),
      'due date': row[6]?.value.toString()
      // Add other relevant fields from 'data' if needed
    };

    if (feeDetails.containsKey(quarterYear)) {
      feeDetails[quarterYear?? "random"]= quarterData;
    } else {
      feeDetails[quarterYear??"random"] = quarterData;
    }

    // Check if document with scholarId already exists (optional)
    final docRef = firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/fee_details').doc(scholarId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // Document exists, update data (optional)
     await docRef.update(feeDetails);
      // ... (Implement logic to update specific fields or entire document)
      print('Updated fee data for scholar ID: $scholarId (Optional)');
    } else {
      // Document doesn't exist, create it with entire feeDetails structure
      await docRef.set(feeDetails);
      print('Uploaded fee data for scholar ID: $scholarId');
    }
  }}catch(e){
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(e.toString() ?? "",style: TextStyle(color: Colors.white),),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  print('Fee data uploaded successfully!');
}

class UploadFeeDetail extends StatefulWidget {
  const UploadFeeDetail({super.key});

  @override
  State<UploadFeeDetail> createState() => _UploadFeeDetailState();
}

class _UploadFeeDetailState extends State<UploadFeeDetail> {
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
        title: const Align(alignment:Alignment.centerLeft,child: Text("Fee Details",style: TextStyle(fontSize: 18),)),
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
              child: Text("Upload fee details excel sheet in given format", style: TextStyle(
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
                  child: ElevatedButton(
                    onPressed: () async{
                      // addStudyMaterial(_textController3.text, _textController1.text, "study_material_index_1", _textController2.text, "study_material_new_teacher_id", studyMaterialData!);
                          uploadFeeDataFromExcel(context: context);
                    },
                    child: Text("Upload Files"),
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
    );
  }
}
