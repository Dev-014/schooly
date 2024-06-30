//
//  Generated code. Do not modify.
//  source: fetch_service/fetchService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fetchClassesResponseDescriptor instead')
const FetchClassesResponse$json = {
  '1': 'FetchClassesResponse',
  '2': [
    {'1': 'classes', '3': 1, '4': 3, '5': 11, '6': '.Class', '10': 'classes'},
  ],
};

/// Descriptor for `FetchClassesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchClassesResponseDescriptor = $convert.base64Decode(
    'ChRGZXRjaENsYXNzZXNSZXNwb25zZRIgCgdjbGFzc2VzGAEgAygLMgYuQ2xhc3NSB2NsYXNzZX'
    'M=');

@$core.Deprecated('Use fetchSectionsResponseDescriptor instead')
const FetchSectionsResponse$json = {
  '1': 'FetchSectionsResponse',
  '2': [
    {'1': 'sections', '3': 1, '4': 3, '5': 11, '6': '.Section', '10': 'sections'},
  ],
};

/// Descriptor for `FetchSectionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchSectionsResponseDescriptor = $convert.base64Decode(
    'ChVGZXRjaFNlY3Rpb25zUmVzcG9uc2USJAoIc2VjdGlvbnMYASADKAsyCC5TZWN0aW9uUghzZW'
    'N0aW9ucw==');

@$core.Deprecated('Use fetchSubjectsResponseDescriptor instead')
const FetchSubjectsResponse$json = {
  '1': 'FetchSubjectsResponse',
  '2': [
    {'1': 'subjects', '3': 1, '4': 3, '5': 11, '6': '.Subject', '10': 'subjects'},
  ],
};

/// Descriptor for `FetchSubjectsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchSubjectsResponseDescriptor = $convert.base64Decode(
    'ChVGZXRjaFN1YmplY3RzUmVzcG9uc2USJAoIc3ViamVjdHMYASADKAsyCC5TdWJqZWN0UghzdW'
    'JqZWN0cw==');

@$core.Deprecated('Use fetchAnnouncementResponseDescriptor instead')
const FetchAnnouncementResponse$json = {
  '1': 'FetchAnnouncementResponse',
  '2': [
    {'1': 'announcements', '3': 1, '4': 3, '5': 11, '6': '.Announcement', '10': 'announcements'},
    {'1': 'isLast', '3': 2, '4': 1, '5': 8, '10': 'isLast'},
  ],
};

/// Descriptor for `FetchAnnouncementResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchAnnouncementResponseDescriptor = $convert.base64Decode(
    'ChlGZXRjaEFubm91bmNlbWVudFJlc3BvbnNlEjMKDWFubm91bmNlbWVudHMYASADKAsyDS5Bbm'
    '5vdW5jZW1lbnRSDWFubm91bmNlbWVudHMSFgoGaXNMYXN0GAIgASgIUgZpc0xhc3Q=');

@$core.Deprecated('Use fetchNoticesResponseDescriptor instead')
const FetchNoticesResponse$json = {
  '1': 'FetchNoticesResponse',
  '2': [
    {'1': 'notices', '3': 1, '4': 3, '5': 11, '6': '.Notice', '10': 'notices'},
    {'1': 'isLast', '3': 2, '4': 1, '5': 8, '10': 'isLast'},
  ],
};

/// Descriptor for `FetchNoticesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchNoticesResponseDescriptor = $convert.base64Decode(
    'ChRGZXRjaE5vdGljZXNSZXNwb25zZRIhCgdub3RpY2VzGAEgAygLMgcuTm90aWNlUgdub3RpY2'
    'VzEhYKBmlzTGFzdBgCIAEoCFIGaXNMYXN0');

@$core.Deprecated('Use fetchHomeworksResponseDescriptor instead')
const FetchHomeworksResponse$json = {
  '1': 'FetchHomeworksResponse',
  '2': [
    {'1': 'homeworks', '3': 1, '4': 3, '5': 11, '6': '.Homework', '10': 'homeworks'},
    {'1': 'isLast', '3': 2, '4': 1, '5': 8, '10': 'isLast'},
  ],
};

/// Descriptor for `FetchHomeworksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchHomeworksResponseDescriptor = $convert.base64Decode(
    'ChZGZXRjaEhvbWV3b3Jrc1Jlc3BvbnNlEicKCWhvbWV3b3JrcxgBIAMoCzIJLkhvbWV3b3JrUg'
    'lob21ld29ya3MSFgoGaXNMYXN0GAIgASgIUgZpc0xhc3Q=');

@$core.Deprecated('Use syllabusDescriptor instead')
const Syllabus$json = {
  '1': 'Syllabus',
  '2': [
    {'1': 'subject_id', '3': 1, '4': 1, '5': 9, '10': 'subjectId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'class_id', '3': 3, '4': 1, '5': 9, '10': 'classId'},
    {'1': 'file_url', '3': 4, '4': 1, '5': 9, '10': 'fileUrl'},
  ],
};

/// Descriptor for `Syllabus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syllabusDescriptor = $convert.base64Decode(
    'CghTeWxsYWJ1cxIdCgpzdWJqZWN0X2lkGAEgASgJUglzdWJqZWN0SWQSEgoEbmFtZRgCIAEoCV'
    'IEbmFtZRIZCghjbGFzc19pZBgDIAEoCVIHY2xhc3NJZBIZCghmaWxlX3VybBgEIAEoCVIHZmls'
    'ZVVybA==');

@$core.Deprecated('Use fetchSyllabusResponseDescriptor instead')
const FetchSyllabusResponse$json = {
  '1': 'FetchSyllabusResponse',
  '2': [
    {'1': 'syllabus', '3': 1, '4': 3, '5': 11, '6': '.Syllabus', '10': 'syllabus'},
  ],
};

/// Descriptor for `FetchSyllabusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchSyllabusResponseDescriptor = $convert.base64Decode(
    'ChVGZXRjaFN5bGxhYnVzUmVzcG9uc2USJQoIc3lsbGFidXMYASADKAsyCS5TeWxsYWJ1c1IIc3'
    'lsbGFidXM=');

@$core.Deprecated('Use fetchStudyMaterialResponseDescriptor instead')
const FetchStudyMaterialResponse$json = {
  '1': 'FetchStudyMaterialResponse',
  '2': [
    {'1': 'study_materials', '3': 1, '4': 3, '5': 11, '6': '.StudyMaterial', '10': 'studyMaterials'},
  ],
};

/// Descriptor for `FetchStudyMaterialResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchStudyMaterialResponseDescriptor = $convert.base64Decode(
    'ChpGZXRjaFN0dWR5TWF0ZXJpYWxSZXNwb25zZRI3Cg9zdHVkeV9tYXRlcmlhbHMYASADKAsyDi'
    '5TdHVkeU1hdGVyaWFsUg5zdHVkeU1hdGVyaWFscw==');

@$core.Deprecated('Use fetchReportCardResponseDescriptor instead')
const FetchReportCardResponse$json = {
  '1': 'FetchReportCardResponse',
  '2': [
    {'1': 'report_cards', '3': 1, '4': 3, '5': 11, '6': '.ReportCard', '10': 'reportCards'},
  ],
};

/// Descriptor for `FetchReportCardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchReportCardResponseDescriptor = $convert.base64Decode(
    'ChdGZXRjaFJlcG9ydENhcmRSZXNwb25zZRIuCgxyZXBvcnRfY2FyZHMYASADKAsyCy5SZXBvcn'
    'RDYXJkUgtyZXBvcnRDYXJkcw==');

@$core.Deprecated('Use fetchStudentResponseDescriptor instead')
const FetchStudentResponse$json = {
  '1': 'FetchStudentResponse',
  '2': [
    {'1': 'students', '3': 1, '4': 3, '5': 11, '6': '.Student', '10': 'students'},
  ],
};

/// Descriptor for `FetchStudentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchStudentResponseDescriptor = $convert.base64Decode(
    'ChRGZXRjaFN0dWRlbnRSZXNwb25zZRIkCghzdHVkZW50cxgBIAMoCzIILlN0dWRlbnRSCHN0dW'
    'RlbnRz');

@$core.Deprecated('Use fetchTeacherResponseDescriptor instead')
const FetchTeacherResponse$json = {
  '1': 'FetchTeacherResponse',
  '2': [
    {'1': 'teachers', '3': 1, '4': 3, '5': 11, '6': '.Teacher', '10': 'teachers'},
  ],
};

/// Descriptor for `FetchTeacherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchTeacherResponseDescriptor = $convert.base64Decode(
    'ChRGZXRjaFRlYWNoZXJSZXNwb25zZRIkCgh0ZWFjaGVycxgBIAMoCzIILlRlYWNoZXJSCHRlYW'
    'NoZXJz');

@$core.Deprecated('Use fetchLeaveResponseDescriptor instead')
const FetchLeaveResponse$json = {
  '1': 'FetchLeaveResponse',
  '2': [
    {'1': 'leaves', '3': 1, '4': 3, '5': 11, '6': '.Leave', '10': 'leaves'},
  ],
};

/// Descriptor for `FetchLeaveResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchLeaveResponseDescriptor = $convert.base64Decode(
    'ChJGZXRjaExlYXZlUmVzcG9uc2USHgoGbGVhdmVzGAEgAygLMgYuTGVhdmVSBmxlYXZlcw==');

@$core.Deprecated('Use fetchAttendanceResponseDescriptor instead')
const FetchAttendanceResponse$json = {
  '1': 'FetchAttendanceResponse',
  '2': [
    {'1': 'working_days', '3': 1, '4': 1, '5': 3, '10': 'workingDays'},
    {'1': 'total_presents', '3': 2, '4': 1, '5': 3, '10': 'totalPresents'},
    {'1': 'attendance', '3': 3, '4': 3, '5': 11, '6': '.FetchAttendanceResponse.AttendanceEntry', '10': 'attendance'},
  ],
  '3': [FetchAttendanceResponse_AttendanceEntry$json],
};

@$core.Deprecated('Use fetchAttendanceResponseDescriptor instead')
const FetchAttendanceResponse_AttendanceEntry$json = {
  '1': 'AttendanceEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 8, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `FetchAttendanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchAttendanceResponseDescriptor = $convert.base64Decode(
    'ChdGZXRjaEF0dGVuZGFuY2VSZXNwb25zZRIhCgx3b3JraW5nX2RheXMYASABKANSC3dvcmtpbm'
    'dEYXlzEiUKDnRvdGFsX3ByZXNlbnRzGAIgASgDUg10b3RhbFByZXNlbnRzEkgKCmF0dGVuZGFu'
    'Y2UYAyADKAsyKC5GZXRjaEF0dGVuZGFuY2VSZXNwb25zZS5BdHRlbmRhbmNlRW50cnlSCmF0dG'
    'VuZGFuY2UaPQoPQXR0ZW5kYW5jZUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIg'
    'ASgIUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use fetchFeeDetailsResponseDescriptor instead')
const FetchFeeDetailsResponse$json = {
  '1': 'FetchFeeDetailsResponse',
  '2': [
    {'1': 'details', '3': 1, '4': 3, '5': 11, '6': '.FeeDetail', '10': 'details'},
  ],
};

/// Descriptor for `FetchFeeDetailsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchFeeDetailsResponseDescriptor = $convert.base64Decode(
    'ChdGZXRjaEZlZURldGFpbHNSZXNwb25zZRIkCgdkZXRhaWxzGAEgAygLMgouRmVlRGV0YWlsUg'
    'dkZXRhaWxz');

