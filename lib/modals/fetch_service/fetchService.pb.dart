//
//  Generated code. Do not modify.
//  source: fetch_service/fetchService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../academic_service/academicService.pb.dart' as $0;
import '../user_service/userService.pb.dart' as $1;

class FetchClassesResponse extends $pb.GeneratedMessage {
  factory FetchClassesResponse({
    $core.Iterable<$0.Class>? classes,
  }) {
    final $result = create();
    if (classes != null) {
      $result.classes.addAll(classes);
    }
    return $result;
  }
  FetchClassesResponse._() : super();
  factory FetchClassesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchClassesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchClassesResponse', createEmptyInstance: create)
    ..pc<$0.Class>(1, _omitFieldNames ? '' : 'classes', $pb.PbFieldType.PM, subBuilder: $0.Class.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchClassesResponse clone() => FetchClassesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchClassesResponse copyWith(void Function(FetchClassesResponse) updates) => super.copyWith((message) => updates(message as FetchClassesResponse)) as FetchClassesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchClassesResponse create() => FetchClassesResponse._();
  FetchClassesResponse createEmptyInstance() => create();
  static $pb.PbList<FetchClassesResponse> createRepeated() => $pb.PbList<FetchClassesResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchClassesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchClassesResponse>(create);
  static FetchClassesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Class> get classes => $_getList(0);
}

class FetchSectionsResponse extends $pb.GeneratedMessage {
  factory FetchSectionsResponse({
    $core.Iterable<$0.Section>? sections,
  }) {
    final $result = create();
    if (sections != null) {
      $result.sections.addAll(sections);
    }
    return $result;
  }
  FetchSectionsResponse._() : super();
  factory FetchSectionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchSectionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchSectionsResponse', createEmptyInstance: create)
    ..pc<$0.Section>(1, _omitFieldNames ? '' : 'sections', $pb.PbFieldType.PM, subBuilder: $0.Section.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchSectionsResponse clone() => FetchSectionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchSectionsResponse copyWith(void Function(FetchSectionsResponse) updates) => super.copyWith((message) => updates(message as FetchSectionsResponse)) as FetchSectionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchSectionsResponse create() => FetchSectionsResponse._();
  FetchSectionsResponse createEmptyInstance() => create();
  static $pb.PbList<FetchSectionsResponse> createRepeated() => $pb.PbList<FetchSectionsResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchSectionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchSectionsResponse>(create);
  static FetchSectionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Section> get sections => $_getList(0);
}

class FetchSubjectsResponse extends $pb.GeneratedMessage {
  factory FetchSubjectsResponse({
    $core.Iterable<$0.Subject>? subjects,
  }) {
    final $result = create();
    if (subjects != null) {
      $result.subjects.addAll(subjects);
    }
    return $result;
  }
  FetchSubjectsResponse._() : super();
  factory FetchSubjectsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchSubjectsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchSubjectsResponse', createEmptyInstance: create)
    ..pc<$0.Subject>(1, _omitFieldNames ? '' : 'subjects', $pb.PbFieldType.PM, subBuilder: $0.Subject.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchSubjectsResponse clone() => FetchSubjectsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchSubjectsResponse copyWith(void Function(FetchSubjectsResponse) updates) => super.copyWith((message) => updates(message as FetchSubjectsResponse)) as FetchSubjectsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchSubjectsResponse create() => FetchSubjectsResponse._();
  FetchSubjectsResponse createEmptyInstance() => create();
  static $pb.PbList<FetchSubjectsResponse> createRepeated() => $pb.PbList<FetchSubjectsResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchSubjectsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchSubjectsResponse>(create);
  static FetchSubjectsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Subject> get subjects => $_getList(0);
}

class FetchAnnouncementResponse extends $pb.GeneratedMessage {
  factory FetchAnnouncementResponse({
    $core.Iterable<$0.Announcement>? announcements,
    $core.bool? isLast,
  }) {
    final $result = create();
    if (announcements != null) {
      $result.announcements.addAll(announcements);
    }
    if (isLast != null) {
      $result.isLast = isLast;
    }
    return $result;
  }
  FetchAnnouncementResponse._() : super();
  factory FetchAnnouncementResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchAnnouncementResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchAnnouncementResponse', createEmptyInstance: create)
    ..pc<$0.Announcement>(1, _omitFieldNames ? '' : 'announcements', $pb.PbFieldType.PM, subBuilder: $0.Announcement.create)
    ..aOB(2, _omitFieldNames ? '' : 'isLast', protoName: 'isLast')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchAnnouncementResponse clone() => FetchAnnouncementResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchAnnouncementResponse copyWith(void Function(FetchAnnouncementResponse) updates) => super.copyWith((message) => updates(message as FetchAnnouncementResponse)) as FetchAnnouncementResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchAnnouncementResponse create() => FetchAnnouncementResponse._();
  FetchAnnouncementResponse createEmptyInstance() => create();
  static $pb.PbList<FetchAnnouncementResponse> createRepeated() => $pb.PbList<FetchAnnouncementResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchAnnouncementResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchAnnouncementResponse>(create);
  static FetchAnnouncementResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Announcement> get announcements => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get isLast => $_getBF(1);
  @$pb.TagNumber(2)
  set isLast($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsLast() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsLast() => clearField(2);
}

class FetchNoticesResponse extends $pb.GeneratedMessage {
  factory FetchNoticesResponse({
    $core.Iterable<$0.Notice>? notices,
    $core.bool? isLast,
  }) {
    final $result = create();
    if (notices != null) {
      $result.notices.addAll(notices);
    }
    if (isLast != null) {
      $result.isLast = isLast;
    }
    return $result;
  }
  FetchNoticesResponse._() : super();
  factory FetchNoticesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchNoticesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchNoticesResponse', createEmptyInstance: create)
    ..pc<$0.Notice>(1, _omitFieldNames ? '' : 'notices', $pb.PbFieldType.PM, subBuilder: $0.Notice.create)
    ..aOB(2, _omitFieldNames ? '' : 'isLast', protoName: 'isLast')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchNoticesResponse clone() => FetchNoticesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchNoticesResponse copyWith(void Function(FetchNoticesResponse) updates) => super.copyWith((message) => updates(message as FetchNoticesResponse)) as FetchNoticesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchNoticesResponse create() => FetchNoticesResponse._();
  FetchNoticesResponse createEmptyInstance() => create();
  static $pb.PbList<FetchNoticesResponse> createRepeated() => $pb.PbList<FetchNoticesResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchNoticesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchNoticesResponse>(create);
  static FetchNoticesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Notice> get notices => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get isLast => $_getBF(1);
  @$pb.TagNumber(2)
  set isLast($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsLast() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsLast() => clearField(2);
}

class FetchHomeworksResponse extends $pb.GeneratedMessage {
  factory FetchHomeworksResponse({
    $core.Iterable<$0.Homework>? homeworks,
    $core.bool? isLast,
  }) {
    final $result = create();
    if (homeworks != null) {
      $result.homeworks.addAll(homeworks);
    }
    if (isLast != null) {
      $result.isLast = isLast;
    }
    return $result;
  }
  FetchHomeworksResponse._() : super();
  factory FetchHomeworksResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchHomeworksResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchHomeworksResponse', createEmptyInstance: create)
    ..pc<$0.Homework>(1, _omitFieldNames ? '' : 'homeworks', $pb.PbFieldType.PM, subBuilder: $0.Homework.create)
    ..aOB(2, _omitFieldNames ? '' : 'isLast', protoName: 'isLast')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchHomeworksResponse clone() => FetchHomeworksResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchHomeworksResponse copyWith(void Function(FetchHomeworksResponse) updates) => super.copyWith((message) => updates(message as FetchHomeworksResponse)) as FetchHomeworksResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchHomeworksResponse create() => FetchHomeworksResponse._();
  FetchHomeworksResponse createEmptyInstance() => create();
  static $pb.PbList<FetchHomeworksResponse> createRepeated() => $pb.PbList<FetchHomeworksResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchHomeworksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchHomeworksResponse>(create);
  static FetchHomeworksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Homework> get homeworks => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get isLast => $_getBF(1);
  @$pb.TagNumber(2)
  set isLast($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsLast() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsLast() => clearField(2);
}

class Syllabus extends $pb.GeneratedMessage {
  factory Syllabus({
    $core.String? subjectId,
    $core.String? name,
    $core.String? classId,
    $core.String? fileUrl,
  }) {
    final $result = create();
    if (subjectId != null) {
      $result.subjectId = subjectId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (classId != null) {
      $result.classId = classId;
    }
    if (fileUrl != null) {
      $result.fileUrl = fileUrl;
    }
    return $result;
  }
  Syllabus._() : super();
  factory Syllabus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Syllabus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Syllabus', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subjectId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'classId')
    ..aOS(4, _omitFieldNames ? '' : 'fileUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Syllabus clone() => Syllabus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Syllabus copyWith(void Function(Syllabus) updates) => super.copyWith((message) => updates(message as Syllabus)) as Syllabus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Syllabus create() => Syllabus._();
  Syllabus createEmptyInstance() => create();
  static $pb.PbList<Syllabus> createRepeated() => $pb.PbList<Syllabus>();
  @$core.pragma('dart2js:noInline')
  static Syllabus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Syllabus>(create);
  static Syllabus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subjectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subjectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubjectId() => clearField(1);

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
  $core.String get fileUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set fileUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFileUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileUrl() => clearField(4);
}

class FetchSyllabusResponse extends $pb.GeneratedMessage {
  factory FetchSyllabusResponse({
    $core.Iterable<Syllabus>? syllabus,
  }) {
    final $result = create();
    if (syllabus != null) {
      $result.syllabus.addAll(syllabus);
    }
    return $result;
  }
  FetchSyllabusResponse._() : super();
  factory FetchSyllabusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchSyllabusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchSyllabusResponse', createEmptyInstance: create)
    ..pc<Syllabus>(1, _omitFieldNames ? '' : 'syllabus', $pb.PbFieldType.PM, subBuilder: Syllabus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchSyllabusResponse clone() => FetchSyllabusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchSyllabusResponse copyWith(void Function(FetchSyllabusResponse) updates) => super.copyWith((message) => updates(message as FetchSyllabusResponse)) as FetchSyllabusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchSyllabusResponse create() => FetchSyllabusResponse._();
  FetchSyllabusResponse createEmptyInstance() => create();
  static $pb.PbList<FetchSyllabusResponse> createRepeated() => $pb.PbList<FetchSyllabusResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchSyllabusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchSyllabusResponse>(create);
  static FetchSyllabusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Syllabus> get syllabus => $_getList(0);
}

class FetchStudyMaterialResponse extends $pb.GeneratedMessage {
  factory FetchStudyMaterialResponse({
    $core.Iterable<$0.StudyMaterial>? studyMaterials,
  }) {
    final $result = create();
    if (studyMaterials != null) {
      $result.studyMaterials.addAll(studyMaterials);
    }
    return $result;
  }
  FetchStudyMaterialResponse._() : super();
  factory FetchStudyMaterialResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchStudyMaterialResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchStudyMaterialResponse', createEmptyInstance: create)
    ..pc<$0.StudyMaterial>(1, _omitFieldNames ? '' : 'studyMaterials', $pb.PbFieldType.PM, subBuilder: $0.StudyMaterial.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchStudyMaterialResponse clone() => FetchStudyMaterialResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchStudyMaterialResponse copyWith(void Function(FetchStudyMaterialResponse) updates) => super.copyWith((message) => updates(message as FetchStudyMaterialResponse)) as FetchStudyMaterialResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchStudyMaterialResponse create() => FetchStudyMaterialResponse._();
  FetchStudyMaterialResponse createEmptyInstance() => create();
  static $pb.PbList<FetchStudyMaterialResponse> createRepeated() => $pb.PbList<FetchStudyMaterialResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchStudyMaterialResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchStudyMaterialResponse>(create);
  static FetchStudyMaterialResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.StudyMaterial> get studyMaterials => $_getList(0);
}

class FetchReportCardResponse extends $pb.GeneratedMessage {
  factory FetchReportCardResponse({
    $core.Iterable<$0.ReportCard>? reportCards,
  }) {
    final $result = create();
    if (reportCards != null) {
      $result.reportCards.addAll(reportCards);
    }
    return $result;
  }
  FetchReportCardResponse._() : super();
  factory FetchReportCardResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchReportCardResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchReportCardResponse', createEmptyInstance: create)
    ..pc<$0.ReportCard>(1, _omitFieldNames ? '' : 'reportCards', $pb.PbFieldType.PM, subBuilder: $0.ReportCard.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchReportCardResponse clone() => FetchReportCardResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchReportCardResponse copyWith(void Function(FetchReportCardResponse) updates) => super.copyWith((message) => updates(message as FetchReportCardResponse)) as FetchReportCardResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchReportCardResponse create() => FetchReportCardResponse._();
  FetchReportCardResponse createEmptyInstance() => create();
  static $pb.PbList<FetchReportCardResponse> createRepeated() => $pb.PbList<FetchReportCardResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchReportCardResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchReportCardResponse>(create);
  static FetchReportCardResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.ReportCard> get reportCards => $_getList(0);
}

class FetchStudentResponse extends $pb.GeneratedMessage {
  factory FetchStudentResponse({
    $core.Iterable<$1.Student>? students,
  }) {
    final $result = create();
    if (students != null) {
      $result.students.addAll(students);
    }
    return $result;
  }
  FetchStudentResponse._() : super();
  factory FetchStudentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchStudentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchStudentResponse', createEmptyInstance: create)
    ..pc<$1.Student>(1, _omitFieldNames ? '' : 'students', $pb.PbFieldType.PM, subBuilder: $1.Student.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchStudentResponse clone() => FetchStudentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchStudentResponse copyWith(void Function(FetchStudentResponse) updates) => super.copyWith((message) => updates(message as FetchStudentResponse)) as FetchStudentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchStudentResponse create() => FetchStudentResponse._();
  FetchStudentResponse createEmptyInstance() => create();
  static $pb.PbList<FetchStudentResponse> createRepeated() => $pb.PbList<FetchStudentResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchStudentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchStudentResponse>(create);
  static FetchStudentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Student> get students => $_getList(0);
}

class FetchTeacherResponse extends $pb.GeneratedMessage {
  factory FetchTeacherResponse({
    $core.Iterable<$1.Teacher>? teachers,
  }) {
    final $result = create();
    if (teachers != null) {
      $result.teachers.addAll(teachers);
    }
    return $result;
  }
  FetchTeacherResponse._() : super();
  factory FetchTeacherResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchTeacherResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchTeacherResponse', createEmptyInstance: create)
    ..pc<$1.Teacher>(1, _omitFieldNames ? '' : 'teachers', $pb.PbFieldType.PM, subBuilder: $1.Teacher.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchTeacherResponse clone() => FetchTeacherResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchTeacherResponse copyWith(void Function(FetchTeacherResponse) updates) => super.copyWith((message) => updates(message as FetchTeacherResponse)) as FetchTeacherResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchTeacherResponse create() => FetchTeacherResponse._();
  FetchTeacherResponse createEmptyInstance() => create();
  static $pb.PbList<FetchTeacherResponse> createRepeated() => $pb.PbList<FetchTeacherResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchTeacherResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchTeacherResponse>(create);
  static FetchTeacherResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Teacher> get teachers => $_getList(0);
}

class FetchLeaveResponse extends $pb.GeneratedMessage {
  factory FetchLeaveResponse({
    $core.Iterable<$0.Leave>? leaves,
  }) {
    final $result = create();
    if (leaves != null) {
      $result.leaves.addAll(leaves);
    }
    return $result;
  }
  FetchLeaveResponse._() : super();
  factory FetchLeaveResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchLeaveResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchLeaveResponse', createEmptyInstance: create)
    ..pc<$0.Leave>(1, _omitFieldNames ? '' : 'leaves', $pb.PbFieldType.PM, subBuilder: $0.Leave.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchLeaveResponse clone() => FetchLeaveResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchLeaveResponse copyWith(void Function(FetchLeaveResponse) updates) => super.copyWith((message) => updates(message as FetchLeaveResponse)) as FetchLeaveResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchLeaveResponse create() => FetchLeaveResponse._();
  FetchLeaveResponse createEmptyInstance() => create();
  static $pb.PbList<FetchLeaveResponse> createRepeated() => $pb.PbList<FetchLeaveResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchLeaveResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchLeaveResponse>(create);
  static FetchLeaveResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Leave> get leaves => $_getList(0);
}

class FetchAttendanceResponse extends $pb.GeneratedMessage {
  factory FetchAttendanceResponse({
    $fixnum.Int64? workingDays,
    $fixnum.Int64? totalPresents,
    $core.Map<$core.String, $core.bool>? attendance,
  }) {
    final $result = create();
    if (workingDays != null) {
      $result.workingDays = workingDays;
    }
    if (totalPresents != null) {
      $result.totalPresents = totalPresents;
    }
    if (attendance != null) {
      $result.attendance.addAll(attendance);
    }
    return $result;
  }
  FetchAttendanceResponse._() : super();
  factory FetchAttendanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchAttendanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchAttendanceResponse', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'workingDays')
    ..aInt64(2, _omitFieldNames ? '' : 'totalPresents')
    ..m<$core.String, $core.bool>(3, _omitFieldNames ? '' : 'attendance', entryClassName: 'FetchAttendanceResponse.AttendanceEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OB)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchAttendanceResponse clone() => FetchAttendanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchAttendanceResponse copyWith(void Function(FetchAttendanceResponse) updates) => super.copyWith((message) => updates(message as FetchAttendanceResponse)) as FetchAttendanceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchAttendanceResponse create() => FetchAttendanceResponse._();
  FetchAttendanceResponse createEmptyInstance() => create();
  static $pb.PbList<FetchAttendanceResponse> createRepeated() => $pb.PbList<FetchAttendanceResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchAttendanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchAttendanceResponse>(create);
  static FetchAttendanceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get workingDays => $_getI64(0);
  @$pb.TagNumber(1)
  set workingDays($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWorkingDays() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkingDays() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalPresents => $_getI64(1);
  @$pb.TagNumber(2)
  set totalPresents($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalPresents() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalPresents() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.bool> get attendance => $_getMap(2);
}

class FetchFeeDetailsResponse extends $pb.GeneratedMessage {
  factory FetchFeeDetailsResponse({
    $core.Iterable<$0.FeeDetail>? details,
  }) {
    final $result = create();
    if (details != null) {
      $result.details.addAll(details);
    }
    return $result;
  }
  FetchFeeDetailsResponse._() : super();
  factory FetchFeeDetailsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchFeeDetailsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchFeeDetailsResponse', createEmptyInstance: create)
    ..pc<$0.FeeDetail>(1, _omitFieldNames ? '' : 'details', $pb.PbFieldType.PM, subBuilder: $0.FeeDetail.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchFeeDetailsResponse clone() => FetchFeeDetailsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchFeeDetailsResponse copyWith(void Function(FetchFeeDetailsResponse) updates) => super.copyWith((message) => updates(message as FetchFeeDetailsResponse)) as FetchFeeDetailsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchFeeDetailsResponse create() => FetchFeeDetailsResponse._();
  FetchFeeDetailsResponse createEmptyInstance() => create();
  static $pb.PbList<FetchFeeDetailsResponse> createRepeated() => $pb.PbList<FetchFeeDetailsResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchFeeDetailsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchFeeDetailsResponse>(create);
  static FetchFeeDetailsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.FeeDetail> get details => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
