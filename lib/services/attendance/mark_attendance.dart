import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/routes/url_constants.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/services/api_methods.dart';
import 'package:practice/utils/grpc_convert.dart';
import 'package:practice/utils/string_constants.dart';
import 'package:protobuf/protobuf.dart';

class MarkAttendances {

 static void markAttendance({required MarkAttendance markAttendance, required String token, required BuildContext context}){
   print("????????");
   print(markAttendance);
   final response = GenericMethod.postRequest1(url: UrlConstants.mark_attendance, body: markAttendance as GeneratedMessage, servicePath: StringConstants.commonServicePath + StringConstants.academicsPath, token: token, context: context);
print(response);
 }
}