import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:practice/utils/string_constants.dart';
import 'package:http/http.dart' as http;
import 'package:practice/widgets/showSnackBar.dart';
import 'package:protobuf/protobuf.dart';

import '../utils/grpc_convert.dart';

class GenericMethod{
  static http.Client client = http.Client();


  static Uri getUriForPath({required String servicePath,required String path}) {
    return Uri.https(StringConstants.serverUrl, servicePath + path);
  }

 static Future postRequest({required String url, required GeneratedMessage body,required servicePath, required String token,required BuildContext context}) async {
    print("Token :$token");

    final response = await client.post(
        GenericMethod.getUriForPath(servicePath: servicePath, path: url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "authorization": 'Bearer $token'
        },
        body: (getJsonStringFromGrpcMap(body)));
    if (response.statusCode != 200) {
      showSnackBar(text: jsonDecode(response.body.toString())["error"].toString(), context: context,showError: true);
    }
    return response;

  }
  static Future postRequest1({required String url, required GeneratedMessage body,required servicePath, required String token,required BuildContext context}) async {
    print("Token :$token");

    final response = await client.post(
        GenericMethod.getUriForPath(servicePath: servicePath, path: url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "authorization": 'Bearer $token'
        },
        body: jsonEncode(body.toProto3Json()));
    if (response.statusCode != 200) {
      showSnackBar(text: jsonDecode(response.body.toString())["error"].toString(), context: context,showError: true);
    }
    return response;

  }


  static Future getRequest({required String url,required path, required String token}) async {

    final response = await http.get(
        GenericMethod.getUriForPath(servicePath: path, path: url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "authorization": 'Bearer '+ token
        });

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return response;
  }
}