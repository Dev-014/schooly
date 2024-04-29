import 'package:excel/excel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';


Future<void> uploadTimetableDataToFirestore({required FilePickerResult result,required String clazz, required String section}) async {
  // Read data from Excel sheet
  // Create an input element to trigger file selection



  // Wait for the user to select a file
  // File? excelFile = await uploadInput.onChange.first.then((event) => event.target!.files!.first);

  // Read the Excel file
  var bytes = result!.files.first.bytes!.toList();
  var excel = Excel.decodeBytes(bytes);
  var table = excel.tables['Sheet1']; // Assuming data is in Sheet1

  // Organize data into a map with days as keys and values as lists of lectures
  Map<String, List<Map<String, dynamic>>> timetableData = {};

  for (var i = 1; i < table!.maxColumns; i++) {
    String day = table.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0)).value.toString();

    List<Map<String, String>> lectures = [];

    for (var j = 1; j < table.maxRows; j++) {
      String timeSlot = table.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: j)).value.toString();
      String subject = table.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: j)).value.toString();

      lectures.add({
        'timeSlot': timeSlot,
        'subject': subject,
      });
    }

    timetableData[day] = lectures;
  }



  // Update Firestore with the extracted timetable data
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference timetableCollection = firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/time_table');
  String docId = generateRandomDocId();
  DocumentReference timetableDoc = timetableCollection.doc(docId);
  print("object___________");
  print(timetableData);
  await timetableDoc.set({
    "id": docId,
    "class": clazz,
    "section": section,
    'time_table_entries': timetableData,
  });

  print('Timetable data uploaded to Firestore successfully!');
}

String generateRandomDocId() {
  final firestore = FirebaseFirestore.instance;
  return firestore.collection('anyCollection').doc().id;
}
