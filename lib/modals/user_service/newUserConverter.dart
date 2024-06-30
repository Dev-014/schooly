import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:practice/modals/user_service/userService.pb.dart';
import 'package:practice/services/auth/auth.dart';
import 'package:protobuf/protobuf.dart' as pb;

class UserJsonConverter {

static List<User> getUserListFromJson({required Map<String, dynamic> json}){
  List<User> users = [];
  List<dynamic> list = json["data"];

  for(var item in list){

  // if(item["type"] == 1){

    var user = User.create()..mergeFromProto3Json(jsonDecode(jsonEncode(item)),ignoreUnknownFields: true);

    users.add(user);

  // }
  // if(item["type"] == 0){
  //
  //   var user = User.create()..mergeFromProto3Json(jsonDecode(jsonEncode(item)));
  //
  //   users.add(user);
  //
  // }

  }
  print(users);
  return users;
}

  @override
 static  User convertJsonToMessage(Map<String, dynamic> json) {
    final user = User();
    Map<String, dynamic> json1= json["Data"];
    // Check for each field within the oneof

   if(json.containsKey('Data')){

     if (json1.containsKey('Student')) {
       user.student = Student.fromJson(json1['Student']);
     } else if (json1.containsKey('Teacher')) {

       user.teacher = Teacher.fromJson(json1['Teacher']['details']);
     } else if (json1.containsKey('Staff')) {
       user.staff = Staff.fromJson(json1['Staff']);
     } else {
       // Handle error: no valid oneof field found
       throw ArgumentError('Invalid JSON data: missing oneof field in User');
     }
   }

    // Handle "type" field if it exists
    if (json.containsKey('type')) {
    user.type = Types.valueOf(json['type'])!;
    }

    return user;
  }

  // @override
  // Map<String, dynamic> convertMessageToJson(User message) {
  //   final map = <String, dynamic>{};
  //
  //   // Identify the set field within the oneof
  //   if (message.hasStudent()) {
  //     map['student'] = message.student.toJson();
  //   } else if (message.hasTeacher()) {
  //     map['teacher'] = message.teacher.toJson();
  //   } else if (message.hasStaff()) {
  //     map['staff'] = message.staff.toJson();
  //   } else {
  //     // Handle error: no field set in the oneof
  //     throw ArgumentError('Invalid User message: no field set in oneof');
  //   }
  //
  //   // Add "type" field if set
  //   if (message.hasType()) {
  //     map['type'] = message.type.name;
  //   }
  //
  //   return map;
  // }
}
