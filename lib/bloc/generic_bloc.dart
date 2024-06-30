import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice/modals/principal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modals/new_teacher.dart';
import '../modals/student.dart';
import '../modals/teacher.dart';
import '../modals/user_service/newUserConverter.dart';
import '../modals/user_service/userService.pb.dart';
import '../services/auth/auth.dart';
import '../services/get_service /get_service.dart';

class GenericProvider extends ChangeNotifier {
  String? empID;
  String? scholarId;
  String? phoneNumber;
  String? schoolId;
  Student1? loggedInStudent;
  Teacher1? loggedInTeacher;
  Teacher? teacher;
  Student? student;
  Map<String, bool> markedAttendance = {};
  Map<String, bool> markedAttendanceTeacher={};

  Staff? staff;

  Principal1? loggedInPrincipal;
  UserProfile? userProfile;
  bool isUserLoggedIn = false;
  int groupValues = 1;
  String? sessionToken;
  List<User> listOfUser = [];

  void groupValue() {
    groupValues = 0;
  }
  void setCurrentUser({required int index, required User user}) async{
    if(user.type.value == 1){
      if(user.teacher.details.roles == 12){
      setUserProfile(profile:"Teacher");
      GetUserResponse a = await AuthServices.getCurrentUser(id: user.teacher.details.id,token: sessionToken??"") ;
      final responseData = jsonDecode(a.body);
      sessionToken = a.token;
      Teacher b =  Teacher.create()..mergeFromProto3Json(responseData["data"]["teacher"]);
      teacher = Teacher(details: b.details,classId: b.classId,sectionId: b.sectionId,isClassTeacher: b.isClassTeacher);
      setUserLoginToTrue();
      notifyListeners();
      }
      if(user.teacher.details.roles == 14){
        setUserProfile(profile:"Principal");
        final a = await AuthServices.getCurrentUser(id: user.teacher.details.id,token: sessionToken??"") ;
        final responseData = jsonDecode(a.body);
        sessionToken = a.token;
        Teacher b =  Teacher.create()..mergeFromProto3Json(responseData["data"]["teacher"]);
        teacher = Teacher(details: b.details,classId: b.classId,sectionId: b.sectionId,isClassTeacher: b.isClassTeacher);
        setUserLoginToTrue();
        notifyListeners();
      }
    }
    if(user.type.value == 0){
      setUserProfile(profile:"Student");
      final a = await AuthServices.getCurrentUser(id: user.student.details.id,token: sessionToken??"") ;
      final responseData = jsonDecode(a.body);
      sessionToken = a.token;
      Student b =  Student.create()..mergeFromProto3Json(responseData["data"]["student"]);
      student = Student(details: b.details,classId: b.classId,sectionId: b.sectionId,rollNumber: b.rollNumber);
      setUserLoginToTrue();
      notifyListeners();
    }
    if(user.type.value == 2){
      setUserProfile(profile:"Principal");
      final a = await AuthServices.getCurrentUser(id: user.staff.details.id,token: sessionToken??"") ;
      final responseData = jsonDecode(a.body);
      sessionToken = a.token;

      Staff b =  Staff.create()..mergeFromProto3Json(responseData["data"]["staff"]);
      staff = Staff(details: b.details,);
      setUserLoginToTrue();
      notifyListeners();
    }
  }

  void setSessionToken({required String token}){
    sessionToken = token;
    notifyListeners();
  }

  String getSessionToken(){
    if(sessionToken != null) {
      return sessionToken!;
    }
    else{
      return "";
    }
  }
  void addUserProfile({required List<User> users}){
    for(var user in users) {
      if (user.type.value == 1) {
        listOfUser.add(user);
      }
    }
    for(var user in users){
      if(user.type.value != 1){
      listOfUser.add(user);
      }
    }
    notifyListeners();

  }

  List<User> getListOfUser(){
    return listOfUser;
  }

  void setUserLoginToTrue(){
    isUserLoggedIn = true;
    notifyListeners();
  }

  void setUserProfile({required String profile}) {
    if (profile == "Student") {
      userProfile = UserProfile.student;
    } else if (profile == "Teacher") {
      userProfile = UserProfile.teacher;
    } else if (profile == "Principal"){
      userProfile = UserProfile.principal;
    }
    notifyListeners();

  }


  List<dynamic>? attendance;
  int? attended_class;


  //  Future<int> countPresentEntries(String documentId) async {
  //   try {
  //     // Get the Firestore instance
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //     // Reference the document and get its snapshot
  //     DocumentSnapshot docSnapshot =
  //     await firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance ').doc(documentId).get();
  //
  //     // Check if the document exists and has the attendance field
  //     if (docSnapshot.exists && docSnapshot.data() != null) {
  //       // Get the attendance map from the document data
  //       Map<String, dynamic>? attendanceMap = docSnapshot.data() as Map<String, dynamic>;
  //       Map<String, dynamic>? attendanceMap2 = attendanceMap["attendance"] ;
  //
  //       if (attendanceMap2 != null) {
  //         int count = 0;
  //         attendanceMap2.values.forEach((value) {
  //           if (value == 'present') {
  //             count++;
  //           }
  //         });
  //         attended_class = count;
  //         return count;
  //       }
  //
  //     }
  //   } catch (e) {
  //     print('Error counting present entries: $e');
  //   }
  //   return 0; // Return 0 if there was an error or if the attendance map is not found
  // }

   Future<Map<String, bool>> getAttendanceMapFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString('attendanceMap') ?? '{}';
    print("object<><><><><>");
    print(jsonString);
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value as bool));
  }

    String _dateKey = 'date';


  // Method to check and update the date in shared preferences
   Future<void> checkAndUpdateDate({required String token,required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if 'date' exists in shared preferences
    if (!prefs.containsKey(_dateKey)) {
      // If 'date' doesn't exist, create it with today's date
      await prefs.setString(_dateKey, _getCurrentDate());
      List<Student> students =  await GetService.getStudents(token: token,context: context);
      Map<String, bool> attendance ={};
      for(int index = 0; index<students.length;index++){
        attendance.addAll({students[index].details.id : false});
      }
        ;
      await prefs.setString("attendanceMap", jsonEncode(attendance).toString());

    } else {
      // If 'date' exists, check if it matches today's date
      String savedDate = prefs.getString(_dateKey)!;
      String currentDate = _getCurrentDate();

      if (savedDate != currentDate) {
        // If 'date' doesn't match today's date, update it
        await prefs.setString(_dateKey, currentDate);
        // await prefs.setString(_dateKey, _getCurrentDate());
        List<Student> students =  await GetService.getStudents(token: token,context: context);
        Map<String, bool> attendance = {};
        for(int index = 0; index<students.length;index++){
          attendance.addAll({students[index].details.id : false});
        }

        await prefs.setString("attendanceMap", jsonEncode(attendance).toString());
      }
      if(savedDate == currentDate){
       markedAttendance = await getAttendanceMapFromSharedPreferences();
       print("Marked Attendance");
       print(markedAttendance);
      }


      // If 'date' matches today's date, do nothing
    }
  }
  Future<void> checkAndUpdateDateForTeacher({required String token,required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if 'date' exists in shared preferences
    if (!prefs.containsKey(_dateKey)) {
      // If 'date' doesn't exist, create it with today's date
      await prefs.setString(_dateKey, _getCurrentDate());
      List<Teacher> teachers =  await GetService.getTeachers(token: token,context: context);
      Map<String, bool> attendance ={};
      for(int index = 0; index<teachers.length;index++){
        attendance.addAll({teachers[index].details.id : false});
      }
      ;
      await prefs.setString("teacherAttendanceMap", jsonEncode(attendance).toString());

    } else {
      // If 'date' exists, check if it matches today's date
      String savedDate = prefs.getString(_dateKey)!;
      String currentDate = _getCurrentDate();

      if (savedDate != currentDate) {
        // If 'date' doesn't match today's date, update it
        await prefs.setString(_dateKey, currentDate);
        // await prefs.setString(_dateKey, _getCurrentDate());
        List<Teacher> teachers =  await GetService.getTeachers(token: token,context: context);
        Map<String, bool> attendance = {};
        for(int index = 0; index<teachers.length;index++){
          attendance.addAll({teachers[index].details.id : false});
        }

        await prefs.setString("teacherAttendanceMap", jsonEncode(attendance).toString());
      }
      if(savedDate == currentDate){
        markedAttendance = await getAttendanceMapFromSharedPreferences();
        print("Marked Attendance");
        print(markedAttendance);
      }


      // If 'date' matches today's date, do nothing
    }
  }

  void setAttendanceMap({required BuildContext context})async{

    Map<String, bool>? mapofAtt = await GetService.getTodayAttendance(token: sessionToken??"", context: context);
    print("mapofAtt");
    print(mapofAtt);
    if(mapofAtt != null){
    markedAttendance.addAll(mapofAtt) ;
    }

    // print( markedAttendance[id]);
  }

  // Helper method to get current date in 'yyyy-MM-dd' format
   String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    return formattedDate;
  }
}



enum UserProfile { student, teacher, principal }
