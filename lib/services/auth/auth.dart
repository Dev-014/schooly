import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:practice/modals/auth_service/authenticationService.pb.dart';
import 'package:practice/modals/new_teacher.dart';
import 'package:practice/modals/user_service/newUserConverter.dart';
import 'package:practice/modals/user_service/userService.pb.dart';
import 'package:practice/routes/url_constants.dart';
import 'package:practice/utils/string_constants.dart';
import 'package:practice/widgets/showSnackBar.dart';

import '../api_methods.dart';

///TODO : I have not used generic postRequest method here for now, Because It is gonna updated after we integrate with proper go backend code, which is gonna include protobuf.
//This methods do not required token / any header
class AuthServices {

  static http.Client client = http.Client();

// Send otp for login
  static Future<bool?> sendOtpForLoginRequest(
      {required SendOtpForLogin sendOtpForLogin,required BuildContext context}) async {
    try {
      final response = await client.post(
          GenericMethod.getUriForPath(
              servicePath: StringConstants.commonServicePath +
                  StringConstants.authenticationPath,
              path: StringConstants.sendOtpForLogin),
          body: jsonEncode({
            "phone_number": sendOtpForLogin.phoneNumber,
            "school_id": sendOtpForLogin.schoolId
          }));

      if (response.statusCode != 200) {

        return false;
        throw Exception(response.body);
      } else {
        showSnackBar(text: "Otp Sent", context: context);
        return response.statusCode == 200;
      }
    } catch (e) {
      print("Error: ${e}");
    }
    return false;
  }

//verify Otp for Login
  static Future<Tuple<List<dynamic>, bool, String>>  verifyOtpForLogIn(
      {required String mobile_number,
      required String school_id,
      required String otp}) async {
    try {
      final response = await client.post(
          GenericMethod.getUriForPath(
              servicePath: StringConstants.commonServicePath +
                  StringConstants.authenticationPath,
              path: UrlConstants.verify_otp),
          body: jsonEncode({
            "phone_number": mobile_number,
            "school_id": school_id,
            "otp": otp
          }));
      if (response.statusCode != 200) {
        throw Exception(response.body);
      } else {
        final token = response.headers["token"];
        final responseData = jsonDecode(response.body);
        if (responseData['success'] == true) {
          var a = UserJsonConverter.getUserListFromJson(json: responseData,);

          // print("List of User111111");
          // print(a);
          return Tuple(a, true,token?? "bbbb");
        }

        return Tuple([], false,"");

      }
    } catch (e) {
      print(e);
      return Tuple([], false,"");
    }
  }



//Get Current User_profile details
  static Future<GetUserResponse<String, bool, String>> getCurrentUser({required String id, required String token}) async {

    Response response = await GenericMethod.getRequest(
        url:"/getCurrentUser/"+id, path:  StringConstants.commonServicePath+StringConstants.authenticationPath,token: token );
    return GetUserResponse(response.body, true, response.headers["token"]??"");
  }
}
class GetUserResponse<T1, T2, T3>{
  final T1 body;
  final T2 success;
  final T3 token;
  GetUserResponse(this.body, this.success,this.token);

}

class Tuple<T1, T2, T3> {
  final T1 list;
  final T2 isOtpVerified;
  final T3 token;

  Tuple(this.list, this.isOtpVerified,this.token);
}
//
// protoc --proto_path="/Users/deepanshu/Desktop/practice/lib/modals/user_service/" --dart_out=grpc: /Users/deepanshu/Desktop/practice/lib/m
// odals/user_service "/Users/deepanshu/Desktop/practice/lib/modals/user_service/userService.proto"


///protoc --proto_path="/Users/deepanshu/Desktop/practice/lib/modals/academic_service/" --dart_out=grpc:/Users/deepanshu/Desktop/practice/lib/modals/academic_service "/Users/deepanshu/Desktop/practice/lib/modals/academic_service/academicService.proto"