import 'dart:convert';

import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:practice/modals/user_service/userService.pb.dart';
import 'package:practice/routes/url_constants.dart';
import 'package:practice/utils/grpc_convert.dart';
import 'package:practice/widgets/showSnackBar.dart';
import 'package:protobuf/protobuf.dart';

import '../../utils/string_constants.dart';
import '../api_methods.dart';

class AddService {

  static http.Client client = http.Client();

  static Future<dynamic> addClasses({required BuildContext context, required String token}) async {
    Class? className;

    try {
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'xlsx',
        ],
        withData: true, // Ensure you get the file read stream
      );
      // Read the Excel file
      var bytes = result!.files.first.bytes!.toList();
      var excel = Excel.decodeBytes(bytes);
      var tables = excel.tables['Sheet1']; // Assuming data is in Sheet1
      List<Subject> subjects = [];

      for (var row = 1; row < tables!.maxRows; row++) {
        className = Class(
            grade: int.parse(tables
                .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row))
                .value
                .toString()),
            session: "2024-25");

        for (var column = 1; column < tables.maxColumns; column++) {

          Subject subject = Subject(
              name: tables
                  .cell(CellIndex.indexByColumnRow(
                      columnIndex: column, rowIndex: row))
                  .value
                  .toString());
          subjects.add(subject);


        }
        AddClassRequest(class_1: className,subjects: subjects);
        uploadClassSubject(addClassRequest:  AddClassRequest(class_1: className,subjects: subjects),token: token,context: context);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addUser({required String token,required BuildContext context,required User user})async{
     try {
      final response = await GenericMethod.postRequest1(
          url: UrlConstants.add_user,
          servicePath: StringConstants.commonServicePath +
              UrlConstants.profile,
          body: user,token:token,
          context: context);
      if (response.statusCode == 200) {
        showSnackBar(text: "User added", context: context);
      }
    } catch (e) {
      print("Error1: ${e}");
    }
    // final response = await client.post( GenericMethod.getUriForPath(servicePath: StringConstants.commonServicePath +
    //     UrlConstants.profile , path: UrlConstants.add_user),
    //     body: jsonEncode(user.toProto3Json()),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //       "authorization": 'Bearer $token'
    //     });
    // if (response.statusCode != 200) {
    //   print(false);
    //   // return false;
    //   // throw Exception(response.body);
    // } else {
    //   print(true);
    //
    //   // return response.statusCode == 200;
    // }
    // GenericMethod.postRequest(url: UrlConstants.add_user, body: user, servicePath:StringConstants.commonServicePath +UrlConstants.profile, token: token, context: context);
  }

  static Future<bool> addSections({required Section section, required String token}) async {
    // String jsonString = jsonEncode(section.toProto3Json());
    // print('addClassRequest to JSON: $jsonString');
    // var request = Section.create()..mergeFromProto3Json(jsonDecode(jsonString));
    try {
      final response = await client.post( GenericMethod.getUriForPath(servicePath: StringConstants.commonServicePath +
          StringConstants.academicsPath , path: UrlConstants.add_sections),
          body: jsonEncode(section.toProto3Json()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "authorization": 'Bearer $token'
          });

      if (response.statusCode != 200) {
        return false;
        throw Exception(response.body);
      } else {
        return response.statusCode == 200;
      }
    } catch (e) {
      print("Error: ${e}");
    }
    return false;
  }

  static void uploadClassSubject({required AddClassRequest addClassRequest, required String token,required BuildContext context}) async {
    try {
      final response = await GenericMethod.postRequest(
         url: UrlConstants.add_classes,
          servicePath: StringConstants.commonServicePath +
                  StringConstants.academicsPath,
          body: addClassRequest,token:token,
      context: context);
      if (response.statusCode == 200) {
        showSnackBar(text: "Class and its corresponding subjects added", context: context);
      }
    } catch (e) {
      print("Error: ${e}");
    }
  }

  static Future<void> addHomework({required Homework homework,required String token,Uint8List? list,BuildContext? context}) async {
       postMultipartRequest(
          path: UrlConstants.add_homework,
          servicePath: StringConstants.academicsPath,
          message: homework,
          token: token,
          filename: 'Homework',
          fieldName: 'data',
          context: context,
          list: list);
  }

  static void addReportCard({required ReportCard reportCard, required String filename,required String token, Uint8List? list,BuildContext? context}) async {
      postMultipartRequest(servicePath: StringConstants.academicsPath, path: UrlConstants.upload_reportCard, message: reportCard,list: list, filename: filename,fieldName: 'data',token: token,context: context);
  }

  static void addAcademicCalender({required String filename,required String token,required Uint8List list,BuildContext? context}) async {
    try{
      final request = http.MultipartRequest(
        'POST',
        GenericMethod.getUriForPath(servicePath: StringConstants.commonServicePath + StringConstants.academicsPath ,path:  "/upload/calender"),
      )..headers["authorization"]=token ;

        request.files.add(
          http.MultipartFile.fromBytes("file", list!,
              filename: filename),
        );


      request.send().then((response) async{
        final urlObject = await response.stream.bytesToString();

        if (response.statusCode != 200) {

          showSnackBar(text: jsonDecode(urlObject)["error"].toString(), context: context!,showError: true,);
        }
        if(response.statusCode == 200){
          showSnackBar(text: "Submitted", context: context!);
        }
      });

      // return response;
    }catch(e){
      showSnackBar(text: e.toString(), context: context!);
    }}

  static void addTimeTable({required String filename,required String token,required Uint8List list,BuildContext? context,required String classId, required String sectionId}) async {
    try{
      Map<String, String> data = {
        "classId" : classId,
        "sectionId":sectionId
      };
      final request = http.MultipartRequest(
        'POST',
        GenericMethod.getUriForPath(servicePath: StringConstants.commonServicePath + StringConstants.academicsPath ,path:  "/upload/timetable"),
      )..fields["data"]=(jsonEncode(data))..headers["authorization"]=token ;

      request.files.add(
        http.MultipartFile.fromBytes("file", list!,
            filename: filename),
      );


      request.send().then((response) async{
        final urlObject = await response.stream.bytesToString();

        if (response.statusCode != 200) {

          showSnackBar(text: jsonDecode(urlObject)["error"].toString(), context: context!,showError: true,);
        }
        if(response.statusCode == 200){
          showSnackBar(text: "Submitted", context: context!);
        }
      });

      // return response;
    }catch(e){
      showSnackBar(text: e.toString(), context: context!);
    }}

  static void addFeeDetails({required String filename,required String token,required Uint8List list,BuildContext? context,required String classId, required String sectionId}) async {
    try{
      Map<String, String> data = {
        "classId" : classId,
        "sectionId":sectionId
      };
      final request = http.MultipartRequest(
        'POST',
        GenericMethod.getUriForPath(servicePath: StringConstants.commonServicePath + StringConstants.academicsPath ,path:  "/upload/fee_details"),
      )..fields["data"]=(jsonEncode(data))..headers["authorization"]=token ;

      request.files.add(
        http.MultipartFile.fromBytes("file", list!,
            filename: filename),
      );


      request.send().then((response) async{
        final urlObject = await response.stream.bytesToString();

        if (response.statusCode != 200) {

          showSnackBar(text: jsonDecode(urlObject)["error"].toString(), context: context!,showError: true,);
        }
        if(response.statusCode == 200){
          showSnackBar(text: "Submitted", context: context!);
        }
      });

      // return response;
    }catch(e){
      showSnackBar(text: e.toString(), context: context!);
    }}


  static Future<bool> addAnnouncement({required Announcement announcement,required String token,required BuildContext context}) async {
    try {
      final response = await GenericMethod.postRequest(servicePath: StringConstants.commonServicePath +
          StringConstants.academicsPath,url: UrlConstants.add_announcement,token: token, body: announcement,context: context);

      if (response.statusCode == 200) {
        showSnackBar(text: "Announcement added", context: context);
      }
    } catch (e) {
      print("Error: ${e}");
    }
    return false;
  }

  static Future<void> addNotice({required Notice notice, required BuildContext context, required String token, Uint8List? list}) async {
    await postMultipartRequest(
         servicePath:
                  StringConstants.academicsPath,
              path: UrlConstants.add_notice,
          message: notice, token: token, context: context, filename: 'Notice',list: list);

  }

  static Future<bool> requestLeave({required Leave leave,required String token,required BuildContext context}) async {
    try {
      final response = await GenericMethod.postRequest(

              servicePath: StringConstants.commonServicePath +
                  StringConstants.academicsPath,
              url: UrlConstants.leave_request,
          body: leave,context: context,token: token);

      if (response.statusCode == 200) {
        showSnackBar(text: "Leave request submitted", context: context);
      }
    } catch (e) {
      print("Error: ${e}");
    }
    return false;
  }

  static Future<bool> addStudyMaterial({required StudyMaterial studyMaterial,required BuildContext context,required String token, Uint8List? list}) async {
    try {

      postMultipartRequest(servicePath: StringConstants.academicsPath, path: UrlConstants.add_study_material, message: studyMaterial, filename: "Study Material",fieldName: 'data',token: token,context: context,list: list);

    } catch (e) {
      print("Error: ${e}");
    }
    return false;
  }

  //add syllabus is left
  static void addSyllabus({required Syllabus syllabus, required String filename,required String token,required BuildContext context,Uint8List? list}) async {

      postMultipartRequest(servicePath: StringConstants.academicsPath, path: UrlConstants.add_syllabus, message: syllabus, filename: filename,fieldName: 'data',token: token,context: context,list: list);

  }

  static Future<void> uploadTimeTable() async {
    // Pick the file using file_picker
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      String  fileName = result.files.single.name;

      // Create the MultipartRequest
      var request = http.MultipartRequest('POST', GenericMethod.getUriForPath(servicePath: StringConstants.commonServicePath +StringConstants.academicsPath,path: UrlConstants.upload_time_table));
      request.files.add(await http.MultipartFile.fromPath('file', filePath, filename: fileName));

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        // Request was successful
        print('Time table uploaded successfully');
      } else {
        // Request failed
        var responseBody = await response.stream.bytesToString();
        print('Error uploading time table: ${response.statusCode} - $responseBody');
      }
    } else {
      // User canceled the file picking or no file was selected
      print('No file selected');
    }
  }

  static  Future<void> postMultipartRequest(
  {required String servicePath, required String path, required GeneratedMessage message, Uint8List? list,required String? filename,  String? fieldName,required String token,BuildContext? context}
    ) async {

    try{
    final request = http.MultipartRequest(
      'POST',
      GenericMethod.getUriForPath(servicePath: StringConstants.commonServicePath +servicePath,path: path),
    )..fields[fieldName??"data"] = getJsonStringFromGrpcMap(message)..headers["authorization"]=token ;
    if (list != null) {
      request.files.add(
        http.MultipartFile.fromBytes("file", list,
            filename: filename),
      );
    }

    request.send().then((response) async{
      final urlObject = await response.stream.bytesToString();

      if (response.statusCode != 200) {

        showSnackBar(text: jsonDecode(urlObject)["error"].toString(), context: context!,showError: true,);
      }
      if(response.statusCode == 200){
        showSnackBar(text: "Submitted", context: context!);
      }
    });

    // return response;
  }catch(e){
      showSnackBar(text: e.toString(), context: context!);
    }}
}
