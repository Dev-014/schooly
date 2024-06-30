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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'userService.pbenum.dart';

export 'userService.pbenum.dart';

class Details extends $pb.GeneratedMessage {
  factory Details({
    $core.String? id,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? phoneNumber,
    $core.String? email,
    $core.String? bloodGroup,
    $core.int? roles,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (email != null) {
      $result.email = email;
    }
    if (bloodGroup != null) {
      $result.bloodGroup = bloodGroup;
    }
    if (roles != null) {
      $result.roles = roles;
    }
    return $result;
  }
  Details._() : super();
  factory Details.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Details.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Details', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'firstName')
    ..aOS(3, _omitFieldNames ? '' : 'lastName')
    ..aOS(4, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'bloodGroup')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Details clone() => Details()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Details copyWith(void Function(Details) updates) => super.copyWith((message) => updates(message as Details)) as Details;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Details create() => Details._();
  Details createEmptyInstance() => create();
  static $pb.PbList<Details> createRepeated() => $pb.PbList<Details>();
  @$core.pragma('dart2js:noInline')
  static Details getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Details>(create);
  static Details? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get phoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set phoneNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get bloodGroup => $_getSZ(5);
  @$pb.TagNumber(6)
  set bloodGroup($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBloodGroup() => $_has(5);
  @$pb.TagNumber(6)
  void clearBloodGroup() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get roles => $_getIZ(6);
  @$pb.TagNumber(7)
  set roles($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoles() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoles() => clearField(7);
}

class User extends $pb.GeneratedMessage {
  factory User({
    Student? student,
    Teacher? teacher,
    Staff? staff,
    Types? type,
  }) {
    final $result = create();
    if (student != null) {
      $result.student = student;
    }
    if (teacher != null) {
      $result.teacher = teacher;
    }
    if (staff != null) {
      $result.staff = staff;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'User', createEmptyInstance: create)
    ..aOM<Student>(1, _omitFieldNames ? '' : 'student', subBuilder: Student.create)
    ..aOM<Teacher>(2, _omitFieldNames ? '' : 'teacher', subBuilder: Teacher.create)
    ..aOM<Staff>(3, _omitFieldNames ? '' : 'staff', subBuilder: Staff.create)
    ..e<Types>(4, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Types.STUDENT, valueOf: Types.valueOf, enumValues: Types.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  Student get student => $_getN(0);
  @$pb.TagNumber(1)
  set student(Student v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStudent() => $_has(0);
  @$pb.TagNumber(1)
  void clearStudent() => clearField(1);
  @$pb.TagNumber(1)
  Student ensureStudent() => $_ensure(0);

  @$pb.TagNumber(2)
  Teacher get teacher => $_getN(1);
  @$pb.TagNumber(2)
  set teacher(Teacher v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeacher() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeacher() => clearField(2);
  @$pb.TagNumber(2)
  Teacher ensureTeacher() => $_ensure(1);

  @$pb.TagNumber(3)
  Staff get staff => $_getN(2);
  @$pb.TagNumber(3)
  set staff(Staff v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStaff() => $_has(2);
  @$pb.TagNumber(3)
  void clearStaff() => clearField(3);
  @$pb.TagNumber(3)
  Staff ensureStaff() => $_ensure(2);

  @$pb.TagNumber(4)
  Types get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(Types v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class Student extends $pb.GeneratedMessage {
  factory Student({
    Details? details,
    $fixnum.Int64? rollNumber,
    $core.String? classId,
    $core.String? sectionId,
    $core.String? uploadedBy,
  }) {
    final $result = create();
    if (details != null) {
      $result.details = details;
    }
    if (rollNumber != null) {
      $result.rollNumber = rollNumber;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    return $result;
  }
  Student._() : super();
  factory Student.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Student.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Student', createEmptyInstance: create)
    ..aOM<Details>(1, _omitFieldNames ? '' : 'details', subBuilder: Details.create)
    ..aInt64(2, _omitFieldNames ? '' : 'rollNumber')
    ..aOS(3, _omitFieldNames ? '' : 'classId')
    ..aOS(4, _omitFieldNames ? '' : 'sectionId')
    ..aOS(5, _omitFieldNames ? '' : 'uploadedBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Student clone() => Student()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Student copyWith(void Function(Student) updates) => super.copyWith((message) => updates(message as Student)) as Student;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Student create() => Student._();
  Student createEmptyInstance() => create();
  static $pb.PbList<Student> createRepeated() => $pb.PbList<Student>();
  @$core.pragma('dart2js:noInline')
  static Student getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Student>(create);
  static Student? _defaultInstance;

  @$pb.TagNumber(1)
  Details get details => $_getN(0);
  @$pb.TagNumber(1)
  set details(Details v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDetails() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetails() => clearField(1);
  @$pb.TagNumber(1)
  Details ensureDetails() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get rollNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set rollNumber($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRollNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearRollNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get classId => $_getSZ(2);
  @$pb.TagNumber(3)
  set classId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClassId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClassId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sectionId => $_getSZ(3);
  @$pb.TagNumber(4)
  set sectionId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSectionId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSectionId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uploadedBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set uploadedBy($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUploadedBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearUploadedBy() => clearField(5);
}

class Teacher extends $pb.GeneratedMessage {
  factory Teacher({
    Details? details,
    $core.bool? isClassTeacher,
    $core.String? classId,
    $core.String? sectionId,
    $core.String? uploadedBy,
  }) {
    final $result = create();
    if (details != null) {
      $result.details = details;
    }
    if (isClassTeacher != null) {
      $result.isClassTeacher = isClassTeacher;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    return $result;
  }
  Teacher._() : super();
  factory Teacher.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Teacher.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Teacher', createEmptyInstance: create)
    ..aOM<Details>(1, _omitFieldNames ? '' : 'details', subBuilder: Details.create)
    ..aOB(2, _omitFieldNames ? '' : 'isClassTeacher')
    ..aOS(3, _omitFieldNames ? '' : 'classId')
    ..aOS(4, _omitFieldNames ? '' : 'sectionId')
    ..aOS(5, _omitFieldNames ? '' : 'uploadedBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Teacher clone() => Teacher()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Teacher copyWith(void Function(Teacher) updates) => super.copyWith((message) => updates(message as Teacher)) as Teacher;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Teacher create() => Teacher._();
  Teacher createEmptyInstance() => create();
  static $pb.PbList<Teacher> createRepeated() => $pb.PbList<Teacher>();
  @$core.pragma('dart2js:noInline')
  static Teacher getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Teacher>(create);
  static Teacher? _defaultInstance;

  @$pb.TagNumber(1)
  Details get details => $_getN(0);
  @$pb.TagNumber(1)
  set details(Details v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDetails() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetails() => clearField(1);
  @$pb.TagNumber(1)
  Details ensureDetails() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get isClassTeacher => $_getBF(1);
  @$pb.TagNumber(2)
  set isClassTeacher($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsClassTeacher() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsClassTeacher() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get classId => $_getSZ(2);
  @$pb.TagNumber(3)
  set classId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClassId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClassId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sectionId => $_getSZ(3);
  @$pb.TagNumber(4)
  set sectionId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSectionId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSectionId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uploadedBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set uploadedBy($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUploadedBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearUploadedBy() => clearField(5);
}

class Staff extends $pb.GeneratedMessage {
  factory Staff({
    Details? details,
    $core.String? uploadedBy,
  }) {
    final $result = create();
    if (details != null) {
      $result.details = details;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    return $result;
  }
  Staff._() : super();
  factory Staff.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Staff.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Staff', createEmptyInstance: create)
    ..aOM<Details>(1, _omitFieldNames ? '' : 'details', subBuilder: Details.create)
    ..aOS(5, _omitFieldNames ? '' : 'uploadedBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Staff clone() => Staff()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Staff copyWith(void Function(Staff) updates) => super.copyWith((message) => updates(message as Staff)) as Staff;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staff create() => Staff._();
  Staff createEmptyInstance() => create();
  static $pb.PbList<Staff> createRepeated() => $pb.PbList<Staff>();
  @$core.pragma('dart2js:noInline')
  static Staff getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Staff>(create);
  static Staff? _defaultInstance;

  @$pb.TagNumber(1)
  Details get details => $_getN(0);
  @$pb.TagNumber(1)
  set details(Details v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDetails() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetails() => clearField(1);
  @$pb.TagNumber(1)
  Details ensureDetails() => $_ensure(0);

  @$pb.TagNumber(5)
  $core.String get uploadedBy => $_getSZ(1);
  @$pb.TagNumber(5)
  set uploadedBy($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(5)
  $core.bool hasUploadedBy() => $_has(1);
  @$pb.TagNumber(5)
  void clearUploadedBy() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
