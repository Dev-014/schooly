import 'package:fixnum/fixnum.dart' show Int64; // should not depend_on_referenced_packages
import 'package:protobuf/protobuf.dart' as $pb;
import 'dart:convert';

const int grpcInt64Type = 4096;

Map<String, dynamic> _getJsonMapFromGrpcJsonMap($pb.GeneratedMessage object) {
  //understand grp and message
  // recursion
  final jsonMap = <String, dynamic>{};
  final grpcMap = object.info_.byName;
  grpcMap.forEach((key, field) {
    if (field.isGroupOrMessage) {
      if (field.isRepeated) {
        final List<Map<String, dynamic>> jsonMapList = [];
        $pb.PbList pbList = object.getField(field.tagNumber);
        for (var element in pbList) {
          jsonMapList.add(_getJsonMapFromGrpcJsonMap(element));
        }
        jsonMap.putIfAbsent(key, () => jsonMapList);
      } else {
        jsonMap.putIfAbsent(key,
                () => _getJsonMapFromGrpcJsonMap(object.getField(field.tagNumber)));
      }
    } else if (field.isEnum) {
      final enums = field.enumValues!;
      final enumName = object.getField(field.tagNumber).toString();
      for (var element in enums) {
        if (element.name == enumName) {
          jsonMap.putIfAbsent(key, () => element.value);
        }
      }
    } else if (field.type == grpcInt64Type) {
      final Int64 grpcInt = object.getField(field.tagNumber);
      jsonMap.putIfAbsent(key, () => grpcInt.toInt());
    } else {
      jsonMap.putIfAbsent(key, () => object.getField(field.tagNumber));
    }
    //else if that field is a list, then their will be multiple cases if it's primitive(int, string etc) or user defined like User, Product and then inside it group and message
  });
  return jsonMap;
}

String getJsonStringFromGrpcMap($pb.GeneratedMessage object) {
  return jsonEncode(_getJsonMapFromGrpcJsonMap(object));
}
