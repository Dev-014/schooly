

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FeeDetailService{

  static Future<Map<String, Map<String, dynamic>>?> getFeeDetails({required String scholarID}) async {
    var response = await FirebaseFirestore.instance
        .collection(
        '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/fee_details')
        .doc(scholarID)
        .get();

    Map<String, Map<String, dynamic>> convertedMap = {};

    response.data()!.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        convertedMap[key] = value;
      }
    });

    return convertedMap as Map<String, Map<String, dynamic>>?;
  }

  static Future<void> uploadFeeDataFromExcel({required BuildContext context}) async {
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


      var excel = Excel.decodeBytes(bytes);

      // Access the sheet containing fee
      var sheet = excel['Sheet1']; // Update with your sheet name
      print(sheet.sheetName);
      // Iterate through rows to extract and upload data to Firestore


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
        content: Text(e.toString(),style: const TextStyle(color: Colors.white),),
      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    print('Fee data uploaded successfully!');
  }


}