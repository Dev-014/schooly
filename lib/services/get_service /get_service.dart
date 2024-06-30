import 'dart:convert';

import 'package:excel/excel.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:practice/modals/user_service/userService.pb.dart';
import 'package:protobuf/protobuf.dart';

import '../../utils/string_constants.dart';
import '../../widgets/showSnackBar.dart';
import '../api_methods.dart';
import 'package:http/http.dart' as http;

class GetService {

  static Future<List<Class>> getClasses({required String token}) async {
    Response response = await GenericMethod.getRequest(
        url: StringConstants.getClasses,
        path: StringConstants.commonServicePath + StringConstants.fetchPath,
        token: token);

    var res = jsonDecode(response.body);
    List classes = res["data"]["classes"];
    List<Class> clazzes = [];

    for (var i = 0; i < classes.length; i++) {
      Class classs = Class(
          grade: classes[i]["grade"],
          session: classes[i]["session"]);
      clazzes.add(classs);
    }

    return clazzes;
  }
  static Future<List<Student>> getStudents({required String token, required BuildContext context})async {
    try {
      final Map<String, String> queryParameters = {'type': "all"};

      Response response = await getRequest(
          context: context,
          path: StringConstants.getStudents,
          queryParameters: queryParameters,
          token: token);

      var res = jsonDecode(response.body);
      print("mmmmmm");
      print(res);
      List studentss = res["data"]["students"];

      List<Student> students = [];

      for (var i = 0; i < studentss.length; i++) {
        Student student = Student(
            details: Details.create()..mergeFromProto3Json(studentss[i]["details"]),
            classId: studentss[i]["classId"],
            rollNumber: studentss[i]["rollNumber"],
            sectionId: studentss[i]["sectionId"]);
        students.add(student);
      }
      print("PPPPPPPPPP");
      print(students);
    return students;
  }catch(e){
      print("[];][][][]][[]");
      print(e);
    return [];
}
  }
  static Future<List<Teacher>> getTeachers({required String token, required BuildContext context})async {
    try {
      final Map<String, String> queryParameters = {'type': "all"};

      Response response = await getRequest(
          context: context,
          path: StringConstants.getTeachers,
          queryParameters: queryParameters,
          token: token);

      var res = jsonDecode(response.body);
      print("mmmmmm");
      print(res);
      List teacherss = res["data"]["teachers"];

      List<Teacher> teachers = [];

      for (var i = 0; i < teacherss.length; i++) {
        Teacher student = Teacher(
            details: Details.create()..mergeFromProto3Json(teacherss[i]["details"]),
            classId: teacherss[i]["classId"],
            isClassTeacher: teacherss[i]["isClassTeacher"],
            sectionId: teacherss[i]["sectionId"]);
        teachers.add(student);
      }
      print("PPPPPPPPPP");
      print(teachers);
      return teachers;
    }catch(e){
      print("[];][][][]][[]");
      print(e);
      return [];
    }
  }

  static Future<FetchFeeDetailsResponse> getFeeDetails({required String token,required BuildContext context}) async {
     Response response = await getRequest(
        path: StringConstants.getFeeDetails,
        token: token,
        context: context);
     print("nmummumuuuuu");

    FetchFeeDetailsResponse feeDetailsResponse = FetchFeeDetailsResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);
    print(">>>>>>>>>");
    print(feeDetailsResponse);
    return feeDetailsResponse;
  }

  static Future<Map<String, bool>> getTodayAttendance({required String token,required BuildContext context}) async {
    Response response = await getRequest(
        path: StringConstants.getTodayAttendance,
        token: token,
        context: context);
    Map<dynamic, dynamic> map = {};
    map.addAll(jsonDecode(response.body)["data"]);
    Map<String, bool> data = {};
    map.forEach((key, value) {
     data = (map )
          .map((key, value) => MapEntry<String, bool>(key.toString(), value));
    });

    // FetchAttendanceResponse fetchAttendanceResponse = await FetchAttendanceResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);
    // print(">>>>>>>>>");
    // print(fetchAttendanceResponse.attendance);
    return data;
  }

  static List<Subject> getSubjectsFromRow({required List<Data?> rowData}) {
    return rowData
        .where((element) => element != null && element.toString().isNotEmpty)
        .map((element) {
      return Subject(name: element!.value.toString());
    }).toList();
  }

  static Future<FetchHomeworksResponse?> getHomework(
      {required String token,
      bool? forStudent = false,
        String? subject_id,
      required BuildContext context}) async {
    final Map<String, String> queryParameters;
    if(forStudent!){
     queryParameters = {
       'type': "all",
       'subject_id': subject_id!
     };
   }else{

      queryParameters = {'type': "all"};

    }

    Response response = await getRequest(
        path: StringConstants.getHomework,
        token: token,
        context: context,
        queryParameters: queryParameters);

    print(">>>>>>>>>>>>>");
    print(jsonDecode(response.body));
    FetchHomeworksResponse homeworksResponse;

   try {
      homeworksResponse = FetchHomeworksResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);
      return  homeworksResponse;
   } catch(e) {
      print(e);
   }

    return FetchHomeworksResponse();

  }

  static Future<FetchAnnouncementResponse> getAnnouncement(
      {required String token, required BuildContext context}) async {
    final Map<String, String> queryParameters = {'type': "all"};
    Response response = await getRequest(
        path: StringConstants.getAnnouncements,
        token: token,
        context: context,
        queryParameters: queryParameters);
    FetchAnnouncementResponse announcementResponse = FetchAnnouncementResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);

    print(response.body);
    print(announcementResponse);
    return announcementResponse;
  }
  static Future<FetchAttendanceResponse> getAttendance(
      {required String token, required BuildContext context}) async {
    Response response = await getRequest(
        path: StringConstants.getAttendance,
        token: token,
        context: context,
        );
    FetchAttendanceResponse attendanceResponse = FetchAttendanceResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);

    print(response.body);
    print(attendanceResponse);
    return attendanceResponse;
  }

  static Future<FetchNoticesResponse> getNoticeBoard(
      {required String token, required BuildContext context}) async {
    final Map<String, String> queryParameters = {'type': "all"};
    Response response = await getRequest(
        path: StringConstants.getNotices,
        token: token,
        context: context,
        queryParameters: queryParameters);
    FetchNoticesResponse announcementResponse = FetchNoticesResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);

    print(response.body);
    print(announcementResponse);
    return announcementResponse;
  }

  static Future<FetchSyllabusResponse> getSyllabus(
      {required String token, required BuildContext context}) async {
    Response response = await getRequest(
        path: StringConstants.getSyllabus, token: token, context: context);
    FetchSyllabusResponse fetchSyllabusResponse = FetchSyllabusResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);

    print(response.body);
    print(fetchSyllabusResponse);
    print(response.body);
    return fetchSyllabusResponse;
  }

  static Future getTimeTable(
      {required String token, required BuildContext context}) async {
    Response response = await getRequest(
        path: StringConstants.getTimetable, token: token, context: context);

    print(response.body);
    print("?????????");
    print(jsonDecode(response.body));
    print("?????????./");

    print(jsonDecode(response.body)["data"]["data"]);
    return jsonDecode(response.body)["data"]["data"];
  }

  static Future<FetchLeaveResponse> getLeaves(
      {required String token, required BuildContext context}) async {
    Response response = await getRequest(
        path: StringConstants.getMyLeaves, token: token, context: context);
FetchLeaveResponse fetchLeaveResponse = FetchLeaveResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);
    print(response.body);
    return  fetchLeaveResponse;
  }

  static Future getAcademicCalender(
      {required String token, required BuildContext context}) async {
    Response response = await getRequest(
        path: StringConstants.academicCalender, token: token, context: context);

    print(response.body);
    return jsonDecode(response.body)["data"];
  }

  static Future<FetchReportCardResponse> getReportCard(
      {required String token, required BuildContext context}) async {
    Response response = await getRequest(
        path: StringConstants.getReportCard, token: token, context: context);
    FetchReportCardResponse reportCardResponse = FetchReportCardResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);

    print(response.body);
    return reportCardResponse;
  }

  static Future<FetchStudyMaterialResponse> getStudyMaterial(
      {required String token, required BuildContext context,bool? forStudent = false,
        String? subject_id,}) async {
    final Map<String, String> queryParameters;

    if(forStudent!){
      queryParameters = {
        'type': "all",
        'subject_id': subject_id!
      };
    }else{

      queryParameters = {'type': "all"};

    }
    Response response = await getRequest(
        path: StringConstants.getStudyMaterial, token: token, context: context ,queryParameters: queryParameters);
    FetchStudyMaterialResponse studyMaterialResponse = FetchStudyMaterialResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);
    print(response.body);
    return studyMaterialResponse;
  }

  static Future getRequest(
      {required String token,
      required String path,
      required BuildContext context,
      Map<String, String>? queryParameters}) async {
    final Uri baseUri = Uri.https(StringConstants.serverUrl,
        StringConstants.commonServicePath + StringConstants.fetchPath + path);
    Uri requestUri;
    if (queryParameters != null) {
      requestUri = Uri.parse(
          '${baseUri.toString()}?${Uri(queryParameters: queryParameters).query}');
    } else {
      requestUri = baseUri;
    }

    final response = await http.get(requestUri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "authorization": 'Bearer ' + token
    });

    if (response.statusCode != 200) {
      showSnackBar(
          text: jsonDecode(response.body.toString())["error"].toString(),
          context: context,
          showError: true);
    }

    return response;
  }

  static Future<List<Section>?> getSections(
      {required String token, required String classId}) async {
    try {
      final Uri baseUri = Uri.https(
          StringConstants.serverUrl,
          StringConstants.commonServicePath +
              StringConstants.fetchPath +
              "/sections");
      final Map<String, String> queryParameters = {'class_id': classId};
      final Uri requestUri = Uri.parse(
          '${baseUri.toString()}?${Uri(queryParameters: queryParameters).query}');

      final response = await http.get(requestUri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "authorization": 'Bearer ' + token
      });
      var res = jsonDecode(response.body);

      List sections = res["data"]["sections"];
      List<Section> sectionz = [];

      for (var i = 0; i < sections.length; i++) {
        Section section = Section(
          name: sections[i]["name"],
          grades: sections[i]["grades"],
          type: sections[i]["type"]

        );
        sectionz.add(section);
      }
      return sectionz;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<Subject>?> getSubjects(
      {required String token, required String classId}) async {
    try {
      final Uri baseUri = Uri.https(
          StringConstants.serverUrl,
          StringConstants.commonServicePath +
              StringConstants.fetchPath +
              "/subjects");
      final Map<String, String> queryParameters = {'class_id': classId};
      final Uri requestUri = Uri.parse(
          '${baseUri.toString()}?${Uri(queryParameters: queryParameters).query}');

      final response = await http.get(requestUri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "authorization": 'Bearer ' + token
      });

    print(response.body);
    FetchSubjectsResponse subjectsResponse = FetchSubjectsResponse.create()..mergeFromProto3Json(jsonDecode(response.body)["data"],ignoreUnknownFields: true);
     print("<<<<<<<object>>>>>>>");
    print(subjectsResponse.subjects);
      return subjectsResponse.subjects;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
