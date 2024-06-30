
// import 'dart:io' as io;
// import 'dart:typed_data';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
class FirebaseStorageService {




  Future<String> uploadFile(PlatformFile file) async {
    try {
      firebase_storage.UploadTask uploadTask;

      // Create a Reference to the file
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('uploads/${path.basename(file.name)}');

      final metadata = firebase_storage.SettableMetadata(
        contentType: 'files/pdf', // Replace with your file type
      );




      Uint8List fileBytes = file.bytes!;

       uploadTask = ref.putData(fileBytes, metadata);

      await uploadTask;

      String urlDownload = await ref.getDownloadURL();
      print('Download-Link: $urlDownload');
      return urlDownload;
    } on firebase_storage.FirebaseException catch (e) {
      print('Error uploading file: ${e.code}');
      return '';
    }
  }
  Future<String?> uploadFileToFirebase() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf'
      ],
      withData: true, // Ensure you get the file read stream
    );
    String? downloadUrl;
      final file = result!.files.first;

        downloadUrl = await uploadFile(file);

        print("object");
        print(downloadUrl);
        // Do something with the downloadUrl

    return downloadUrl;
  }
  static Future<Uint8List?> uploadFiles() async {
    try{
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf'
      ],
      withData: true, // Ensure you get the file read stream
    );
    final file = result!.files.first.bytes;


    // Do something with the downloadUrl

    return file;
    }catch(e){
      print(e);
    }

  }


  // Future<String> uploadFile(File file) async {
  //   try {
  //     firebase_storage.UploadTask uploadTask;
  //
  //     // Create a Reference to the file
  //     firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
  //         .ref()
  //         .child('uploads/${path.basename(file.path)}');
  //
  //     uploadTask = ref.putFile(file);
  //
  //     final snapshot = await uploadTask.whenComplete(() {});
  //     final urlDownload = await snapshot.ref.getDownloadURL();
  //     print('Download-Link: $urlDownload');
  //     return urlDownload;
  //   } on firebase_storage.FirebaseException catch (e) {
  //     print('Error uploading file: ${e.code}');
  //     return '';
  //   }
  // }














//   late FirebaseStorage _storage;
//
//   FirebaseStorageService() {
//     _initializeFirebase();
//   }
//
//   Future<void> _initializeFirebase() async {
//     await Firebase.initializeApp();
//     _storage = FirebaseStorage.instance;
//   }
//
//   Future<String?> uploadFile(Uint8List file) async {
//     try {
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       Reference reference = _storage.ref().child('uploads/$fileName');
//       UploadTask uploadTask = reference.putFile(File(file, "fileName"));
//       TaskSnapshot taskSnapshot = await uploadTask;
//       String downloadUrl = await taskSnapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   Future<Uint8List?> pickFile() async {
//     if (kIsWeb) {
//       Uint8List? fileBytes ;
//       html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//       uploadInput.click();
//
//       uploadInput.onChange.listen((event) {
//         final file = uploadInput.files?.first;
//         final reader = html.FileReader();
//         reader.readAsArrayBuffer(file!);
//         reader.onLoadEnd.listen((event) {
//            fileBytes = reader.result as Uint8List;
//           // return fileBytes;
//         });
//       });
//       return fileBytes ;
//     } else {
//       FilePickerResult? result = await FilePicker.platform.pickFiles();
//       if (result != null) {
//         io.File file = io.File(result.files.first.path!);
//         Uint8List fileBytes = await file.readAsBytes();
//         return fileBytes;
//       }
//     }
//     return null;
//   }
// }
}

// Usage example:
// FirebaseStorageService storageService = FirebaseStorageService();
// File file = await storageService.pickFile();
// if (file != null) {
//   String downloadUrl = await storageService.uploadFile(file);
//   if (downloadUrl != null) {
//     print('File uploaded successfully. Download URL: $downloadUrl');
//   } else {
//     print('Failed to upload file.');
//   }
// } else {
//   print('No file selected.');
// }