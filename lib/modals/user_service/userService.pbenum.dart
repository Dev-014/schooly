//
//  Generated code. Do not modify.
//  source: userService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Types extends $pb.ProtobufEnum {
  static const Types STUDENT = Types._(0, _omitEnumNames ? '' : 'STUDENT');
  static const Types TEACHER = Types._(1, _omitEnumNames ? '' : 'TEACHER');
  static const Types STAFF = Types._(2, _omitEnumNames ? '' : 'STAFF');

  static const $core.List<Types> values = <Types> [
    STUDENT,
    TEACHER,
    STAFF,
  ];

  static final $core.Map<$core.int, Types> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Types? valueOf($core.int value) => _byValue[value];

  const Types._($core.int v, $core.String n) : super(v, n);
}

class Roles extends $pb.ProtobufEnum {
  static const Roles student = Roles._(0, _omitEnumNames ? '' : 'student');
  static const Roles principal = Roles._(1, _omitEnumNames ? '' : 'principal');
  static const Roles teacher = Roles._(2, _omitEnumNames ? '' : 'teacher');
  static const Roles classTeacher = Roles._(3, _omitEnumNames ? '' : 'classTeacher');
  static const Roles staff = Roles._(4, _omitEnumNames ? '' : 'staff');

  static const $core.List<Roles> values = <Roles> [
    student,
    principal,
    teacher,
    classTeacher,
    staff,
  ];

  static final $core.Map<$core.int, Roles> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Roles? valueOf($core.int value) => _byValue[value];

  const Roles._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
