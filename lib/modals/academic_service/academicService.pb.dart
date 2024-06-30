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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'academicService.pbenum.dart';

export 'academicService.pbenum.dart';

class AddClassRequest extends $pb.GeneratedMessage {
  factory AddClassRequest({
    Class? class_1,
    $core.Iterable<Subject>? subjects,
  }) {
    final $result = create();
    if (class_1 != null) {
      $result.class_1 = class_1;
    }
    if (subjects != null) {
      $result.subjects.addAll(subjects);
    }
    return $result;
  }
  AddClassRequest._() : super();
  factory AddClassRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddClassRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddClassRequest', createEmptyInstance: create)
    ..aOM<Class>(1, _omitFieldNames ? '' : 'class', subBuilder: Class.create)
    ..pc<Subject>(2, _omitFieldNames ? '' : 'subjects', $pb.PbFieldType.PM, subBuilder: Subject.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddClassRequest clone() => AddClassRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddClassRequest copyWith(void Function(AddClassRequest) updates) => super.copyWith((message) => updates(message as AddClassRequest)) as AddClassRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddClassRequest create() => AddClassRequest._();
  AddClassRequest createEmptyInstance() => create();
  static $pb.PbList<AddClassRequest> createRepeated() => $pb.PbList<AddClassRequest>();
  @$core.pragma('dart2js:noInline')
  static AddClassRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddClassRequest>(create);
  static AddClassRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Class get class_1 => $_getN(0);
  @$pb.TagNumber(1)
  set class_1(Class v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClass_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearClass_1() => clearField(1);
  @$pb.TagNumber(1)
  Class ensureClass_1() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Subject> get subjects => $_getList(1);
}

class Class extends $pb.GeneratedMessage {
  factory Class({
    $core.int? grade,
    $core.String? teacherId,
    $core.String? session,
  }) {
    final $result = create();
    if (grade != null) {
      $result.grade = grade;
    }
    if (teacherId != null) {
      $result.teacherId = teacherId;
    }
    if (session != null) {
      $result.session = session;
    }
    return $result;
  }
  Class._() : super();
  factory Class.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Class.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Class', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'grade', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'teacherId')
    ..aOS(3, _omitFieldNames ? '' : 'session')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Class clone() => Class()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Class copyWith(void Function(Class) updates) => super.copyWith((message) => updates(message as Class)) as Class;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Class create() => Class._();
  Class createEmptyInstance() => create();
  static $pb.PbList<Class> createRepeated() => $pb.PbList<Class>();
  @$core.pragma('dart2js:noInline')
  static Class getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Class>(create);
  static Class? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get grade => $_getIZ(0);
  @$pb.TagNumber(1)
  set grade($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGrade() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrade() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get teacherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set teacherId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeacherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeacherId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get session => $_getSZ(2);
  @$pb.TagNumber(3)
  set session($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(2);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);
}

class Subject extends $pb.GeneratedMessage {
  factory Subject({
    $core.String? id,
    $core.String? name,
    $core.String? classId,
    $core.String? filePath,
    $core.String? schoolId,
    $core.String? uploadedBy,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (schoolId != null) {
      $result.schoolId = schoolId;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    return $result;
  }
  Subject._() : super();
  factory Subject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Subject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Subject', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'classId')
    ..aOS(4, _omitFieldNames ? '' : 'filePath')
    ..aOS(5, _omitFieldNames ? '' : 'schoolId')
    ..aOS(6, _omitFieldNames ? '' : 'uploadedBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Subject clone() => Subject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Subject copyWith(void Function(Subject) updates) => super.copyWith((message) => updates(message as Subject)) as Subject;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Subject create() => Subject._();
  Subject createEmptyInstance() => create();
  static $pb.PbList<Subject> createRepeated() => $pb.PbList<Subject>();
  @$core.pragma('dart2js:noInline')
  static Subject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Subject>(create);
  static Subject? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get classId => $_getSZ(2);
  @$pb.TagNumber(3)
  set classId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClassId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClassId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get filePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set filePath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilePath() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get schoolId => $_getSZ(4);
  @$pb.TagNumber(5)
  set schoolId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSchoolId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSchoolId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get uploadedBy => $_getSZ(5);
  @$pb.TagNumber(6)
  set uploadedBy($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUploadedBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearUploadedBy() => clearField(6);
}

class StudyMaterial extends $pb.GeneratedMessage {
  factory StudyMaterial({
    $core.String? id,
    $core.String? subjectId,
    $core.String? classId,
    $core.String? sectionId,
    $core.String? title,
    $core.String? filePath,
    $core.String? uploadedBy,
    $fixnum.Int64? uploadedAt,
    $core.String? schoolId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (subjectId != null) {
      $result.subjectId = subjectId;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    if (title != null) {
      $result.title = title;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    if (uploadedAt != null) {
      $result.uploadedAt = uploadedAt;
    }
    if (schoolId != null) {
      $result.schoolId = schoolId;
    }
    return $result;
  }
  StudyMaterial._() : super();
  factory StudyMaterial.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StudyMaterial.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StudyMaterial', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'subjectId')
    ..aOS(3, _omitFieldNames ? '' : 'classId')
    ..aOS(4, _omitFieldNames ? '' : 'sectionId')
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..aOS(6, _omitFieldNames ? '' : 'filePath')
    ..aOS(7, _omitFieldNames ? '' : 'uploadedBy')
    ..aInt64(8, _omitFieldNames ? '' : 'uploadedAt')
    ..aOS(9, _omitFieldNames ? '' : 'schoolId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StudyMaterial clone() => StudyMaterial()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StudyMaterial copyWith(void Function(StudyMaterial) updates) => super.copyWith((message) => updates(message as StudyMaterial)) as StudyMaterial;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StudyMaterial create() => StudyMaterial._();
  StudyMaterial createEmptyInstance() => create();
  static $pb.PbList<StudyMaterial> createRepeated() => $pb.PbList<StudyMaterial>();
  @$core.pragma('dart2js:noInline')
  static StudyMaterial getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StudyMaterial>(create);
  static StudyMaterial? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subjectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set subjectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubjectId() => clearField(2);

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
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get filePath => $_getSZ(5);
  @$pb.TagNumber(6)
  set filePath($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFilePath() => $_has(5);
  @$pb.TagNumber(6)
  void clearFilePath() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get uploadedBy => $_getSZ(6);
  @$pb.TagNumber(7)
  set uploadedBy($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUploadedBy() => $_has(6);
  @$pb.TagNumber(7)
  void clearUploadedBy() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get uploadedAt => $_getI64(7);
  @$pb.TagNumber(8)
  set uploadedAt($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUploadedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUploadedAt() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get schoolId => $_getSZ(8);
  @$pb.TagNumber(9)
  set schoolId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSchoolId() => $_has(8);
  @$pb.TagNumber(9)
  void clearSchoolId() => clearField(9);
}

class Section extends $pb.GeneratedMessage {
  factory Section({
    $core.String? name,
    SectionType? type,
    $core.Map<$core.String, $core.bool>? grades,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    if (grades != null) {
      $result.grades.addAll(grades);
    }
    return $result;
  }
  Section._() : super();
  factory Section.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Section.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Section', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..e<SectionType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: SectionType.ALL, valueOf: SectionType.valueOf, enumValues: SectionType.values)
    ..m<$core.String, $core.bool>(3, _omitFieldNames ? '' : 'grades', entryClassName: 'Section.GradesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OB)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Section clone() => Section()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Section copyWith(void Function(Section) updates) => super.copyWith((message) => updates(message as Section)) as Section;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Section create() => Section._();
  Section createEmptyInstance() => create();
  static $pb.PbList<Section> createRepeated() => $pb.PbList<Section>();
  @$core.pragma('dart2js:noInline')
  static Section getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Section>(create);
  static Section? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  SectionType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(SectionType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.bool> get grades => $_getMap(2);
}

class Announcement extends $pb.GeneratedMessage {
  factory Announcement({
    $core.String? id,
    $core.String? title,
    $core.String? description,
    Category? category,
    $fixnum.Int64? timestamp,
    $core.String? uploadedBy,
    $core.bool? visibility,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (category != null) {
      $result.category = category;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    if (visibility != null) {
      $result.visibility = visibility;
    }
    return $result;
  }
  Announcement._() : super();
  factory Announcement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Announcement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Announcement', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..e<Category>(4, _omitFieldNames ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: Category.Examination, valueOf: Category.valueOf, enumValues: Category.values)
    ..aInt64(5, _omitFieldNames ? '' : 'timestamp')
    ..aOS(6, _omitFieldNames ? '' : 'uploadedBy')
    ..aOB(7, _omitFieldNames ? '' : 'visibility')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Announcement clone() => Announcement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Announcement copyWith(void Function(Announcement) updates) => super.copyWith((message) => updates(message as Announcement)) as Announcement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Announcement create() => Announcement._();
  Announcement createEmptyInstance() => create();
  static $pb.PbList<Announcement> createRepeated() => $pb.PbList<Announcement>();
  @$core.pragma('dart2js:noInline')
  static Announcement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Announcement>(create);
  static Announcement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  Category get category => $_getN(3);
  @$pb.TagNumber(4)
  set category(Category v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set timestamp($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get uploadedBy => $_getSZ(5);
  @$pb.TagNumber(6)
  set uploadedBy($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUploadedBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearUploadedBy() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get visibility => $_getBF(6);
  @$pb.TagNumber(7)
  set visibility($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasVisibility() => $_has(6);
  @$pb.TagNumber(7)
  void clearVisibility() => clearField(7);
}

class Homework extends $pb.GeneratedMessage {
  factory Homework({
    $core.String? id,
    $core.String? subjectId,
    $core.String? classId,
    $core.String? sectionId,
    $core.String? title,
    $core.String? description,
    $core.String? uploadedBy,
    $fixnum.Int64? timestamp,
    $core.String? filePath,
    $core.String? schoolId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (subjectId != null) {
      $result.subjectId = subjectId;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (schoolId != null) {
      $result.schoolId = schoolId;
    }
    return $result;
  }
  Homework._() : super();
  factory Homework.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Homework.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Homework', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'subjectId')
    ..aOS(3, _omitFieldNames ? '' : 'classId')
    ..aOS(4, _omitFieldNames ? '' : 'sectionId')
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOS(7, _omitFieldNames ? '' : 'uploadedBy')
    ..aInt64(8, _omitFieldNames ? '' : 'timestamp')
    ..aOS(9, _omitFieldNames ? '' : 'filePath')
    ..aOS(10, _omitFieldNames ? '' : 'schoolId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Homework clone() => Homework()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Homework copyWith(void Function(Homework) updates) => super.copyWith((message) => updates(message as Homework)) as Homework;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Homework create() => Homework._();
  Homework createEmptyInstance() => create();
  static $pb.PbList<Homework> createRepeated() => $pb.PbList<Homework>();
  @$core.pragma('dart2js:noInline')
  static Homework getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Homework>(create);
  static Homework? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subjectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set subjectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubjectId() => clearField(2);

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
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get uploadedBy => $_getSZ(6);
  @$pb.TagNumber(7)
  set uploadedBy($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUploadedBy() => $_has(6);
  @$pb.TagNumber(7)
  void clearUploadedBy() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get timestamp => $_getI64(7);
  @$pb.TagNumber(8)
  set timestamp($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimestamp() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get filePath => $_getSZ(8);
  @$pb.TagNumber(9)
  set filePath($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFilePath() => $_has(8);
  @$pb.TagNumber(9)
  void clearFilePath() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get schoolId => $_getSZ(9);
  @$pb.TagNumber(10)
  set schoolId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSchoolId() => $_has(9);
  @$pb.TagNumber(10)
  void clearSchoolId() => clearField(10);
}

class Notice extends $pb.GeneratedMessage {
  factory Notice({
    $core.String? id,
    $core.String? title,
    $core.String? content,
    $core.String? filePath,
    $fixnum.Int64? createdAt,
    $core.String? uploadedBy,
    NoticeType? type,
    $core.String? classId,
    $core.String? sectionId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (content != null) {
      $result.content = content;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    if (type != null) {
      $result.type = type;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    return $result;
  }
  Notice._() : super();
  factory Notice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notice', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aOS(4, _omitFieldNames ? '' : 'filePath')
    ..aInt64(5, _omitFieldNames ? '' : 'createdAt')
    ..aOS(6, _omitFieldNames ? '' : 'uploadedBy')
    ..e<NoticeType>(7, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: NoticeType.SCHOOL, valueOf: NoticeType.valueOf, enumValues: NoticeType.values)
    ..aOS(8, _omitFieldNames ? '' : 'classId')
    ..aOS(9, _omitFieldNames ? '' : 'sectionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notice clone() => Notice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notice copyWith(void Function(Notice) updates) => super.copyWith((message) => updates(message as Notice)) as Notice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notice create() => Notice._();
  Notice createEmptyInstance() => create();
  static $pb.PbList<Notice> createRepeated() => $pb.PbList<Notice>();
  @$core.pragma('dart2js:noInline')
  static Notice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notice>(create);
  static Notice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get filePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set filePath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilePath() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createdAt => $_getI64(4);
  @$pb.TagNumber(5)
  set createdAt($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get uploadedBy => $_getSZ(5);
  @$pb.TagNumber(6)
  set uploadedBy($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUploadedBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearUploadedBy() => clearField(6);

  @$pb.TagNumber(7)
  NoticeType get type => $_getN(6);
  @$pb.TagNumber(7)
  set type(NoticeType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get classId => $_getSZ(7);
  @$pb.TagNumber(8)
  set classId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasClassId() => $_has(7);
  @$pb.TagNumber(8)
  void clearClassId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get sectionId => $_getSZ(8);
  @$pb.TagNumber(9)
  set sectionId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSectionId() => $_has(8);
  @$pb.TagNumber(9)
  void clearSectionId() => clearField(9);
}

class Leave extends $pb.GeneratedMessage {
  factory Leave({
    $core.String? id,
    $core.String? name,
    $core.String? reviewerId,
    $fixnum.Int64? from,
    $fixnum.Int64? to,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
    $core.String? reason,
    Status? status,
    $core.String? schoolId,
    $core.String? userId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (reviewerId != null) {
      $result.reviewerId = reviewerId;
    }
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (status != null) {
      $result.status = status;
    }
    if (schoolId != null) {
      $result.schoolId = schoolId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  Leave._() : super();
  factory Leave.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Leave.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Leave', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'reviewerId')
    ..aInt64(4, _omitFieldNames ? '' : 'from')
    ..aInt64(5, _omitFieldNames ? '' : 'to')
    ..aInt64(6, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(7, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(8, _omitFieldNames ? '' : 'reason')
    ..e<Status>(9, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.PENDING, valueOf: Status.valueOf, enumValues: Status.values)
    ..aOS(10, _omitFieldNames ? '' : 'schoolId')
    ..aOS(11, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Leave clone() => Leave()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Leave copyWith(void Function(Leave) updates) => super.copyWith((message) => updates(message as Leave)) as Leave;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Leave create() => Leave._();
  Leave createEmptyInstance() => create();
  static $pb.PbList<Leave> createRepeated() => $pb.PbList<Leave>();
  @$core.pragma('dart2js:noInline')
  static Leave getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Leave>(create);
  static Leave? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get reviewerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set reviewerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReviewerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearReviewerId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get from => $_getI64(3);
  @$pb.TagNumber(4)
  set from($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get to => $_getI64(4);
  @$pb.TagNumber(5)
  set to($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get createdAt => $_getI64(5);
  @$pb.TagNumber(6)
  set createdAt($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get updatedAt => $_getI64(6);
  @$pb.TagNumber(7)
  set updatedAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get reason => $_getSZ(7);
  @$pb.TagNumber(8)
  set reason($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasReason() => $_has(7);
  @$pb.TagNumber(8)
  void clearReason() => clearField(8);

  @$pb.TagNumber(9)
  Status get status => $_getN(8);
  @$pb.TagNumber(9)
  set status(Status v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get schoolId => $_getSZ(9);
  @$pb.TagNumber(10)
  set schoolId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSchoolId() => $_has(9);
  @$pb.TagNumber(10)
  void clearSchoolId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get userId => $_getSZ(10);
  @$pb.TagNumber(11)
  set userId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasUserId() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserId() => clearField(11);
}

class ReportCard extends $pb.GeneratedMessage {
  factory ReportCard({
    $core.String? id,
    $core.int? grade,
    $core.String? userId,
    $core.String? uploadedBy,
    $core.String? filePath,
    $core.String? schoolId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (grade != null) {
      $result.grade = grade;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (uploadedBy != null) {
      $result.uploadedBy = uploadedBy;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (schoolId != null) {
      $result.schoolId = schoolId;
    }
    return $result;
  }
  ReportCard._() : super();
  factory ReportCard.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportCard.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReportCard', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'grade', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'uploadedBy')
    ..aOS(5, _omitFieldNames ? '' : 'filePath')
    ..aOS(6, _omitFieldNames ? '' : 'schoolId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportCard clone() => ReportCard()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportCard copyWith(void Function(ReportCard) updates) => super.copyWith((message) => updates(message as ReportCard)) as ReportCard;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportCard create() => ReportCard._();
  ReportCard createEmptyInstance() => create();
  static $pb.PbList<ReportCard> createRepeated() => $pb.PbList<ReportCard>();
  @$core.pragma('dart2js:noInline')
  static ReportCard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportCard>(create);
  static ReportCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get grade => $_getIZ(1);
  @$pb.TagNumber(2)
  set grade($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGrade() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrade() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uploadedBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set uploadedBy($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUploadedBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearUploadedBy() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get filePath => $_getSZ(4);
  @$pb.TagNumber(5)
  set filePath($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFilePath() => $_has(4);
  @$pb.TagNumber(5)
  void clearFilePath() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get schoolId => $_getSZ(5);
  @$pb.TagNumber(6)
  set schoolId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSchoolId() => $_has(5);
  @$pb.TagNumber(6)
  void clearSchoolId() => clearField(6);
}

class Slot extends $pb.GeneratedMessage {
  factory Slot({
    $core.String? slot,
    $core.String? subject,
  }) {
    final $result = create();
    if (slot != null) {
      $result.slot = slot;
    }
    if (subject != null) {
      $result.subject = subject;
    }
    return $result;
  }
  Slot._() : super();
  factory Slot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Slot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Slot', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'slot')
    ..aOS(2, _omitFieldNames ? '' : 'subject')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Slot clone() => Slot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Slot copyWith(void Function(Slot) updates) => super.copyWith((message) => updates(message as Slot)) as Slot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Slot create() => Slot._();
  Slot createEmptyInstance() => create();
  static $pb.PbList<Slot> createRepeated() => $pb.PbList<Slot>();
  @$core.pragma('dart2js:noInline')
  static Slot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Slot>(create);
  static Slot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slot => $_getSZ(0);
  @$pb.TagNumber(1)
  set slot($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlot() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subject => $_getSZ(1);
  @$pb.TagNumber(2)
  set subject($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubject() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubject() => clearField(2);
}

class DaySchedule extends $pb.GeneratedMessage {
  factory DaySchedule({
    $core.Iterable<Slot>? schedule,
  }) {
    final $result = create();
    if (schedule != null) {
      $result.schedule.addAll(schedule);
    }
    return $result;
  }
  DaySchedule._() : super();
  factory DaySchedule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DaySchedule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DaySchedule', createEmptyInstance: create)
    ..pc<Slot>(1, _omitFieldNames ? '' : 'schedule', $pb.PbFieldType.PM, subBuilder: Slot.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DaySchedule clone() => DaySchedule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DaySchedule copyWith(void Function(DaySchedule) updates) => super.copyWith((message) => updates(message as DaySchedule)) as DaySchedule;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DaySchedule create() => DaySchedule._();
  DaySchedule createEmptyInstance() => create();
  static $pb.PbList<DaySchedule> createRepeated() => $pb.PbList<DaySchedule>();
  @$core.pragma('dart2js:noInline')
  static DaySchedule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DaySchedule>(create);
  static DaySchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Slot> get schedule => $_getList(0);
}

class TimeTable extends $pb.GeneratedMessage {
  factory TimeTable({
    $core.String? id,
    $core.String? classId,
    $core.String? sectionId,
    $core.Map<$core.String, DaySchedule>? data,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    if (data != null) {
      $result.data.addAll(data);
    }
    return $result;
  }
  TimeTable._() : super();
  factory TimeTable.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeTable.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimeTable', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'classId')
    ..aOS(3, _omitFieldNames ? '' : 'sectionId')
    ..m<$core.String, DaySchedule>(4, _omitFieldNames ? '' : 'data', entryClassName: 'TimeTable.DataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: DaySchedule.create, valueDefaultOrMaker: DaySchedule.getDefault)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimeTable clone() => TimeTable()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimeTable copyWith(void Function(TimeTable) updates) => super.copyWith((message) => updates(message as TimeTable)) as TimeTable;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeTable create() => TimeTable._();
  TimeTable createEmptyInstance() => create();
  static $pb.PbList<TimeTable> createRepeated() => $pb.PbList<TimeTable>();
  @$core.pragma('dart2js:noInline')
  static TimeTable getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeTable>(create);
  static TimeTable? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get classId => $_getSZ(1);
  @$pb.TagNumber(2)
  set classId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClassId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sectionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sectionId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSectionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSectionId() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.String, DaySchedule> get data => $_getMap(3);
}

class AssignClass extends $pb.GeneratedMessage {
  factory AssignClass({
    $core.String? teacherId,
    $core.String? classId,
    $core.String? sectionId,
  }) {
    final $result = create();
    if (teacherId != null) {
      $result.teacherId = teacherId;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    return $result;
  }
  AssignClass._() : super();
  factory AssignClass.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignClass.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssignClass', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'teacherId')
    ..aOS(2, _omitFieldNames ? '' : 'classId')
    ..aOS(3, _omitFieldNames ? '' : 'sectionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignClass clone() => AssignClass()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignClass copyWith(void Function(AssignClass) updates) => super.copyWith((message) => updates(message as AssignClass)) as AssignClass;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignClass create() => AssignClass._();
  AssignClass createEmptyInstance() => create();
  static $pb.PbList<AssignClass> createRepeated() => $pb.PbList<AssignClass>();
  @$core.pragma('dart2js:noInline')
  static AssignClass getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignClass>(create);
  static AssignClass? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get teacherId => $_getSZ(0);
  @$pb.TagNumber(1)
  set teacherId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTeacherId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeacherId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get classId => $_getSZ(1);
  @$pb.TagNumber(2)
  set classId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClassId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sectionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sectionId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSectionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSectionId() => clearField(3);
}

class MarkAttendance extends $pb.GeneratedMessage {
  factory MarkAttendance({
    $core.Map<$core.String, $core.bool>? attendance,
    $core.String? classId,
    $core.String? sectionId,
    AttendanceType? type,
  }) {
    final $result = create();
    if (attendance != null) {
      $result.attendance.addAll(attendance);
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  MarkAttendance._() : super();
  factory MarkAttendance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkAttendance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkAttendance', createEmptyInstance: create)
    ..m<$core.String, $core.bool>(1, _omitFieldNames ? '' : 'attendance', entryClassName: 'MarkAttendance.AttendanceEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OB)
    ..aOS(2, _omitFieldNames ? '' : 'classId')
    ..aOS(3, _omitFieldNames ? '' : 'sectionId')
    ..e<AttendanceType>(4, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: AttendanceType.STUDENT_ATTENDANCE, valueOf: AttendanceType.valueOf, enumValues: AttendanceType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkAttendance clone() => MarkAttendance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkAttendance copyWith(void Function(MarkAttendance) updates) => super.copyWith((message) => updates(message as MarkAttendance)) as MarkAttendance;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkAttendance create() => MarkAttendance._();
  MarkAttendance createEmptyInstance() => create();
  static $pb.PbList<MarkAttendance> createRepeated() => $pb.PbList<MarkAttendance>();
  @$core.pragma('dart2js:noInline')
  static MarkAttendance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkAttendance>(create);
  static MarkAttendance? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.bool> get attendance => $_getMap(0);

  @$pb.TagNumber(2)
  $core.String get classId => $_getSZ(1);
  @$pb.TagNumber(2)
  set classId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClassId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sectionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sectionId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSectionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSectionId() => clearField(3);

  @$pb.TagNumber(4)
  AttendanceType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(AttendanceType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class UpdateLeaveStatus extends $pb.GeneratedMessage {
  factory UpdateLeaveStatus({
    $core.String? leaveId,
    Status? status,
  }) {
    final $result = create();
    if (leaveId != null) {
      $result.leaveId = leaveId;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  UpdateLeaveStatus._() : super();
  factory UpdateLeaveStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLeaveStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLeaveStatus', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leaveId')
    ..e<Status>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.PENDING, valueOf: Status.valueOf, enumValues: Status.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLeaveStatus clone() => UpdateLeaveStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLeaveStatus copyWith(void Function(UpdateLeaveStatus) updates) => super.copyWith((message) => updates(message as UpdateLeaveStatus)) as UpdateLeaveStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLeaveStatus create() => UpdateLeaveStatus._();
  UpdateLeaveStatus createEmptyInstance() => create();
  static $pb.PbList<UpdateLeaveStatus> createRepeated() => $pb.PbList<UpdateLeaveStatus>();
  @$core.pragma('dart2js:noInline')
  static UpdateLeaveStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLeaveStatus>(create);
  static UpdateLeaveStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leaveId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leaveId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLeaveId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaveId() => clearField(1);

  @$pb.TagNumber(2)
  Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(Status v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class FeeDetail extends $pb.GeneratedMessage {
  factory FeeDetail({
    $core.String? quarter,
    $core.String? amount,
    $core.String? paymentDate,
    $core.String? paymentStatus,
    $core.String? dueDate,
  }) {
    final $result = create();
    if (quarter != null) {
      $result.quarter = quarter;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (paymentDate != null) {
      $result.paymentDate = paymentDate;
    }
    if (paymentStatus != null) {
      $result.paymentStatus = paymentStatus;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    return $result;
  }
  FeeDetail._() : super();
  factory FeeDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeeDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FeeDetail', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'quarter')
    ..aOS(2, _omitFieldNames ? '' : 'amount')
    ..aOS(3, _omitFieldNames ? '' : 'paymentDate')
    ..aOS(4, _omitFieldNames ? '' : 'paymentStatus')
    ..aOS(5, _omitFieldNames ? '' : 'dueDate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeeDetail clone() => FeeDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeeDetail copyWith(void Function(FeeDetail) updates) => super.copyWith((message) => updates(message as FeeDetail)) as FeeDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeeDetail create() => FeeDetail._();
  FeeDetail createEmptyInstance() => create();
  static $pb.PbList<FeeDetail> createRepeated() => $pb.PbList<FeeDetail>();
  @$core.pragma('dart2js:noInline')
  static FeeDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeeDetail>(create);
  static FeeDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get quarter => $_getSZ(0);
  @$pb.TagNumber(1)
  set quarter($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuarter() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuarter() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get amount => $_getSZ(1);
  @$pb.TagNumber(2)
  set amount($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get paymentDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set paymentDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPaymentDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaymentDate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get paymentStatus => $_getSZ(3);
  @$pb.TagNumber(4)
  set paymentStatus($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPaymentStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearPaymentStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dueDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set dueDate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDueDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDueDate() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
