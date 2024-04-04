
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/grpc_convert.dart';

class HttpRequest{

  http.Client client = http.Client();
  String serverUrl = "192.168.1.5:8084";
  String authenticationPath = "/authentication";

  Uri getUriForPath(String servicePath, String path) {
    return Uri.http(serverUrl, servicePath + path);
  }

  Future<bool?> sendOtpRequest({required String mobileNumber,required String school_id})async{
  try{
    print(jsonEncode({
      "phone_number" : mobileNumber,
      "school_id" : "XrMZE54KzuJlz6ayc7Gh"
    }));
    final response  = await client.post(getUriForPath("/api/mobile/v/1.0"+authenticationPath,"/sendOtpForLogin"),
        body: jsonEncode({
          "phone_number" : mobileNumber,
          "school_id" : "XrMZE54KzuJlz6ayc7Gh"
        }));
    print("object");
    // print(response);


    if (response.statusCode != 200) {

      throw Exception(response.body);

    }else {
      return response.statusCode == 200;
    }



  }catch (e){

    print("Error: ${e}");
  }
  return null;
  }

  Future<bool?> verifyOtpForLogIn({required String mobile_number, required String school_id, required String otp})async{
try{
    final response  = await client.post(getUriForPath("/api/mobile/v/1.0"+authenticationPath,"/verifyOtpForLogin"),
        body:  jsonEncode({
          "phone_number" : mobile_number,
          "school_id": school_id,
          "otp":otp
        })
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }else{
      return response.statusCode==200;
    }}catch(e){
  print(e);
}
return null;

  }


  Future<void> getCurrentUser()async{
    final response  = await http.get(getUriForPath(authenticationPath,"/getCurrentUser"));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return ;
  }





  Future postRequest(String url, data, path) async {
    final response = await client.post(getUriForPath(path, url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: getJsonStringFromGrpcMap(data));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return response;
  }

}

