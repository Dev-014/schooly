import 'package:practice/utils/string_constants.dart';
import 'package:http/http.dart' as http;

import '../utils/grpc_convert.dart';

class GenericMethod{
  http.Client client = http.Client();


  static Uri getUriForPath({required String servicePath,required String path}) {
    return Uri.http(StringConstants.serverUrl, servicePath + path);
  }


  Future postRequest({required String url, required data,required path}) async {
    final response = await client.post(
        GenericMethod.getUriForPath(servicePath: path, path: url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: getJsonStringFromGrpcMap(data));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return response;
  }


  static Future getRequest({required String url,required path}) async {
    final response = await http.get(
        GenericMethod.getUriForPath(servicePath: path, path: url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return response;
  }
}