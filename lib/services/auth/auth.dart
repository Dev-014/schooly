import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:practice/utils/string_constants.dart';

import '../api_methods.dart';

///TODO : I have not used generic postRequest method here for now, Because It is gonna updated after we integrate with proper go backend code, which is gonna include protobuf.

class AuthServices {

  http.Client client = http.Client();

// Send otp for login
  Future<bool?> sendOtpForLoginRequest(
      {required String mobileNumber, required String school_id}) async {
    try {
      final response = await client.post(
          GenericMethod.getUriForPath(
              servicePath: StringConstants.commonSevicePath +
                  StringConstants.authenticationPath,
              path: StringConstants.sendOtpForLogin),
          body: jsonEncode({
            "phone_number": mobileNumber,
            "school_id": "XrMZE54KzuJlz6ayc7Gh"
          }));

      if (response.statusCode != 200) {
        throw Exception(response.body);
      } else {
        return response.statusCode == 200;
      }
    } catch (e) {
      print("Error: ${e}");
    }
    return null;
  }

//verify Otp for Login
  Future<bool?> verifyOtpForLogIn(
      {required String mobile_number,
      required String school_id,
      required String otp}) async {
    try {
      final response = await client.post(
          GenericMethod.getUriForPath(
              servicePath: StringConstants.commonSevicePath +
                  StringConstants.authenticationPath,
              path: StringConstants.verifyOtpForLogin),
          body: jsonEncode({
            "phone_number": mobile_number,
            "school_id": school_id,
            "otp": otp
          }));
      if (response.statusCode != 200) {
        throw Exception(response.body);
      } else {
        return response.statusCode == 200;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

//Get Current User_profile details
  Future<Response> getCurrentUser() async {
    final response = await GenericMethod.getRequest(
        url: StringConstants.authenticationPath, path: "/getCurrentUser");
    return response;
  }
}
