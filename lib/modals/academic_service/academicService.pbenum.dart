//
//  Generated code. Do not modify.
//  source: academicService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SectionType extends $pb.ProtobufEnum {
  static const SectionType ALL = SectionType._(0, _omitEnumNames ? '' : 'ALL');
  static const SectionType GRADE = SectionType._(1, _omitEnumNames ? '' : 'GRADE');

  static const $core.List<SectionType> values = <SectionType> [
    ALL,
    GRADE,
  ];

  static final $core.Map<$core.int, SectionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SectionType? valueOf($core.int value) => _byValue[value];

  const SectionType._($core.int v, $core.String n) : super(v, n);
}

class Category extends $pb.ProtobufEnum {
  static const Category Examination = Category._(0, _omitEnumNames ? '' : 'Examination');

  static const $core.List<Category> values = <Category> [
    Examination,
  ];

  static final $core.Map<$core.int, Category> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Category? valueOf($core.int value) => _byValue[value];

  const Category._($core.int v, $core.String n) : super(v, n);
}

class NoticeType extends $pb.ProtobufEnum {
  static const NoticeType SCHOOL = NoticeType._(0, _omitEnumNames ? '' : 'SCHOOL');
  static const NoticeType CLASS = NoticeType._(1, _omitEnumNames ? '' : 'CLASS');
  static const NoticeType SECTION = NoticeType._(2, _omitEnumNames ? '' : 'SECTION');

  static const $core.List<NoticeType> values = <NoticeType> [
    SCHOOL,
    CLASS,
    SECTION,
  ];

  static final $core.Map<$core.int, NoticeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NoticeType? valueOf($core.int value) => _byValue[value];

  const NoticeType._($core.int v, $core.String n) : super(v, n);
}

class Status extends $pb.ProtobufEnum {
  static const Status PENDING = Status._(0, _omitEnumNames ? '' : 'PENDING');
  static const Status APPROVED = Status._(1, _omitEnumNames ? '' : 'APPROVED');
  static const Status REJECTED = Status._(2, _omitEnumNames ? '' : 'REJECTED');

  static const $core.List<Status> values = <Status> [
    PENDING,
    APPROVED,
    REJECTED,
  ];

  static final $core.Map<$core.int, Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status? valueOf($core.int value) => _byValue[value];

  const Status._($core.int v, $core.String n) : super(v, n);
}

class AttendanceType extends $pb.ProtobufEnum {
  static const AttendanceType STUDENT_ATTENDANCE = AttendanceType._(0, _omitEnumNames ? '' : 'STUDENT_ATTENDANCE');
  static const AttendanceType TEACHER_ATTENDANCE = AttendanceType._(1, _omitEnumNames ? '' : 'TEACHER_ATTENDANCE');

  static const $core.List<AttendanceType> values = <AttendanceType> [
    STUDENT_ATTENDANCE,
    TEACHER_ATTENDANCE,
  ];

  static final $core.Map<$core.int, AttendanceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AttendanceType? valueOf($core.int value) => _byValue[value];

  const AttendanceType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
