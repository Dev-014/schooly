//
//  Generated code. Do not modify.
//  source: academicService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sectionTypeDescriptor instead')
const SectionType$json = {
  '1': 'SectionType',
  '2': [
    {'1': 'ALL', '2': 0},
    {'1': 'GRADE', '2': 1},
  ],
};

/// Descriptor for `SectionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sectionTypeDescriptor = $convert.base64Decode(
    'CgtTZWN0aW9uVHlwZRIHCgNBTEwQABIJCgVHUkFERRAB');

@$core.Deprecated('Use categoryDescriptor instead')
const Category$json = {
  '1': 'Category',
  '2': [
    {'1': 'Examination', '2': 0},
  ],
};

/// Descriptor for `Category`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List categoryDescriptor = $convert.base64Decode(
    'CghDYXRlZ29yeRIPCgtFeGFtaW5hdGlvbhAA');

@$core.Deprecated('Use noticeTypeDescriptor instead')
const NoticeType$json = {
  '1': 'NoticeType',
  '2': [
    {'1': 'SCHOOL', '2': 0},
    {'1': 'CLASS', '2': 1},
    {'1': 'SECTION', '2': 2},
  ],
};

/// Descriptor for `NoticeType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List noticeTypeDescriptor = $convert.base64Decode(
    'CgpOb3RpY2VUeXBlEgoKBlNDSE9PTBAAEgkKBUNMQVNTEAESCwoHU0VDVElPThAC');

@$core.Deprecated('Use statusDescriptor instead')
const Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'PENDING', '2': 0},
    {'1': 'APPROVED', '2': 1},
    {'1': 'REJECTED', '2': 2},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode(
    'CgZTdGF0dXMSCwoHUEVORElORxAAEgwKCEFQUFJPVkVEEAESDAoIUkVKRUNURUQQAg==');

@$core.Deprecated('Use attendanceTypeDescriptor instead')
const AttendanceType$json = {
  '1': 'AttendanceType',
  '2': [
    {'1': 'STUDENT_ATTENDANCE', '2': 0},
    {'1': 'TEACHER_ATTENDANCE', '2': 1},
  ],
};

/// Descriptor for `AttendanceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List attendanceTypeDescriptor = $convert.base64Decode(
    'Cg5BdHRlbmRhbmNlVHlwZRIWChJTVFVERU5UX0FUVEVOREFOQ0UQABIWChJURUFDSEVSX0FUVE'
    'VOREFOQ0UQAQ==');

@$core.Deprecated('Use addClassRequestDescriptor instead')
const AddClassRequest$json = {
  '1': 'AddClassRequest',
  '2': [
    {'1': 'class', '3': 1, '4': 1, '5': 11, '6': '.Class', '10': 'class'},
    {'1': 'subjects', '3': 2, '4': 3, '5': 11, '6': '.Subject', '10': 'subjects'},
  ],
};

/// Descriptor for `AddClassRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addClassRequestDescriptor = $convert.base64Decode(
    'Cg9BZGRDbGFzc1JlcXVlc3QSHAoFY2xhc3MYASABKAsyBi5DbGFzc1IFY2xhc3MSJAoIc3Viam'
    'VjdHMYAiADKAsyCC5TdWJqZWN0UghzdWJqZWN0cw==');

@$core.Deprecated('Use classDescriptor instead')
const Class$json = {
  '1': 'Class',
  '2': [
    {'1': 'grade', '3': 1, '4': 1, '5': 13, '10': 'grade'},
    {'1': 'teacher_id', '3': 2, '4': 1, '5': 9, '10': 'teacherId'},
    {'1': 'session', '3': 3, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `Class`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List classDescriptor = $convert.base64Decode(
    'CgVDbGFzcxIUCgVncmFkZRgBIAEoDVIFZ3JhZGUSHQoKdGVhY2hlcl9pZBgCIAEoCVIJdGVhY2'
    'hlcklkEhgKB3Nlc3Npb24YAyABKAlSB3Nlc3Npb24=');

@$core.Deprecated('Use subjectDescriptor instead')
const Subject$json = {
  '1': 'Subject',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'class_id', '3': 3, '4': 1, '5': 9, '10': 'classId'},
    {'1': 'file_path', '3': 4, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'school_id', '3': 5, '4': 1, '5': 9, '10': 'schoolId'},
    {'1': 'uploaded_by', '3': 6, '4': 1, '5': 9, '10': 'uploadedBy'},
  ],
};

/// Descriptor for `Subject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subjectDescriptor = $convert.base64Decode(
    'CgdTdWJqZWN0Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhkKCGNsYXNzX2'
    'lkGAMgASgJUgdjbGFzc0lkEhsKCWZpbGVfcGF0aBgEIAEoCVIIZmlsZVBhdGgSGwoJc2Nob29s'
    'X2lkGAUgASgJUghzY2hvb2xJZBIfCgt1cGxvYWRlZF9ieRgGIAEoCVIKdXBsb2FkZWRCeQ==');

@$core.Deprecated('Use studyMaterialDescriptor instead')
const StudyMaterial$json = {
  '1': 'StudyMaterial',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'subject_id', '3': 2, '4': 1, '5': 9, '10': 'subjectId'},
    {'1': 'class_id', '3': 3, '4': 1, '5': 9, '10': 'classId'},
    {'1': 'section_id', '3': 4, '4': 1, '5': 9, '10': 'sectionId'},
    {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    {'1': 'file_path', '3': 6, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'uploaded_by', '3': 7, '4': 1, '5': 9, '10': 'uploadedBy'},
    {'1': 'uploaded_at', '3': 8, '4': 1, '5': 3, '10': 'uploadedAt'},
    {'1': 'school_id', '3': 9, '4': 1, '5': 9, '10': 'schoolId'},
  ],
};

/// Descriptor for `StudyMaterial`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studyMaterialDescriptor = $convert.base64Decode(
    'Cg1TdHVkeU1hdGVyaWFsEg4KAmlkGAEgASgJUgJpZBIdCgpzdWJqZWN0X2lkGAIgASgJUglzdW'
    'JqZWN0SWQSGQoIY2xhc3NfaWQYAyABKAlSB2NsYXNzSWQSHQoKc2VjdGlvbl9pZBgEIAEoCVIJ'
    'c2VjdGlvbklkEhQKBXRpdGxlGAUgASgJUgV0aXRsZRIbCglmaWxlX3BhdGgYBiABKAlSCGZpbG'
    'VQYXRoEh8KC3VwbG9hZGVkX2J5GAcgASgJUgp1cGxvYWRlZEJ5Eh8KC3VwbG9hZGVkX2F0GAgg'
    'ASgDUgp1cGxvYWRlZEF0EhsKCXNjaG9vbF9pZBgJIAEoCVIIc2Nob29sSWQ=');

@$core.Deprecated('Use sectionDescriptor instead')
const Section$json = {
  '1': 'Section',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.SectionType', '10': 'type'},
    {'1': 'grades', '3': 3, '4': 3, '5': 11, '6': '.Section.GradesEntry', '10': 'grades'},
  ],
  '3': [Section_GradesEntry$json],
};

@$core.Deprecated('Use sectionDescriptor instead')
const Section_GradesEntry$json = {
  '1': 'GradesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 8, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Section`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sectionDescriptor = $convert.base64Decode(
    'CgdTZWN0aW9uEhIKBG5hbWUYASABKAlSBG5hbWUSIAoEdHlwZRgCIAEoDjIMLlNlY3Rpb25UeX'
    'BlUgR0eXBlEiwKBmdyYWRlcxgDIAMoCzIULlNlY3Rpb24uR3JhZGVzRW50cnlSBmdyYWRlcxo5'
    'CgtHcmFkZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCFIFdmFsdWU6Aj'
    'gB');

@$core.Deprecated('Use announcementDescriptor instead')
const Announcement$json = {
  '1': 'Announcement',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'category', '3': 4, '4': 1, '5': 14, '6': '.Category', '10': 'category'},
    {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'uploaded_by', '3': 6, '4': 1, '5': 9, '10': 'uploadedBy'},
    {'1': 'visibility', '3': 7, '4': 1, '5': 8, '10': 'visibility'},
  ],
};

/// Descriptor for `Announcement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List announcementDescriptor = $convert.base64Decode(
    'CgxBbm5vdW5jZW1lbnQSDgoCaWQYASABKAlSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIgCg'
    'tkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SJQoIY2F0ZWdvcnkYBCABKA4yCS5DYXRl'
    'Z29yeVIIY2F0ZWdvcnkSHAoJdGltZXN0YW1wGAUgASgDUgl0aW1lc3RhbXASHwoLdXBsb2FkZW'
    'RfYnkYBiABKAlSCnVwbG9hZGVkQnkSHgoKdmlzaWJpbGl0eRgHIAEoCFIKdmlzaWJpbGl0eQ==');

@$core.Deprecated('Use homeworkDescriptor instead')
const Homework$json = {
  '1': 'Homework',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'subject_id', '3': 2, '4': 1, '5': 9, '10': 'subjectId'},
    {'1': 'class_id', '3': 3, '4': 1, '5': 9, '10': 'classId'},
    {'1': 'section_id', '3': 4, '4': 1, '5': 9, '10': 'sectionId'},
    {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    {'1': 'uploaded_by', '3': 7, '4': 1, '5': 9, '10': 'uploadedBy'},
    {'1': 'timestamp', '3': 8, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'file_path', '3': 9, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'school_id', '3': 10, '4': 1, '5': 9, '10': 'schoolId'},
  ],
};

/// Descriptor for `Homework`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeworkDescriptor = $convert.base64Decode(
    'CghIb21ld29yaxIOCgJpZBgBIAEoCVICaWQSHQoKc3ViamVjdF9pZBgCIAEoCVIJc3ViamVjdE'
    'lkEhkKCGNsYXNzX2lkGAMgASgJUgdjbGFzc0lkEh0KCnNlY3Rpb25faWQYBCABKAlSCXNlY3Rp'
    'b25JZBIUCgV0aXRsZRgFIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YBiABKAlSC2Rlc2NyaX'
    'B0aW9uEh8KC3VwbG9hZGVkX2J5GAcgASgJUgp1cGxvYWRlZEJ5EhwKCXRpbWVzdGFtcBgIIAEo'
    'A1IJdGltZXN0YW1wEhsKCWZpbGVfcGF0aBgJIAEoCVIIZmlsZVBhdGgSGwoJc2Nob29sX2lkGA'
    'ogASgJUghzY2hvb2xJZA==');

@$core.Deprecated('Use noticeDescriptor instead')
const Notice$json = {
  '1': 'Notice',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'file_path', '3': 4, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'uploaded_by', '3': 6, '4': 1, '5': 9, '10': 'uploadedBy'},
    {'1': 'type', '3': 7, '4': 1, '5': 14, '6': '.NoticeType', '10': 'type'},
    {'1': 'class_id', '3': 8, '4': 1, '5': 9, '9': 0, '10': 'classId', '17': true},
    {'1': 'section_id', '3': 9, '4': 1, '5': 9, '9': 1, '10': 'sectionId', '17': true},
  ],
  '8': [
    {'1': '_class_id'},
    {'1': '_section_id'},
  ],
};

/// Descriptor for `Notice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noticeDescriptor = $convert.base64Decode(
    'CgZOb3RpY2USDgoCaWQYASABKAlSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIYCgdjb250ZW'
    '50GAMgASgJUgdjb250ZW50EhsKCWZpbGVfcGF0aBgEIAEoCVIIZmlsZVBhdGgSHQoKY3JlYXRl'
    'ZF9hdBgFIAEoA1IJY3JlYXRlZEF0Eh8KC3VwbG9hZGVkX2J5GAYgASgJUgp1cGxvYWRlZEJ5Eh'
    '8KBHR5cGUYByABKA4yCy5Ob3RpY2VUeXBlUgR0eXBlEh4KCGNsYXNzX2lkGAggASgJSABSB2Ns'
    'YXNzSWSIAQESIgoKc2VjdGlvbl9pZBgJIAEoCUgBUglzZWN0aW9uSWSIAQFCCwoJX2NsYXNzX2'
    'lkQg0KC19zZWN0aW9uX2lk');

@$core.Deprecated('Use leaveDescriptor instead')
const Leave$json = {
  '1': 'Leave',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'reviewer_id', '3': 3, '4': 1, '5': 9, '10': 'reviewerId'},
    {'1': 'from', '3': 4, '4': 1, '5': 3, '10': 'from'},
    {'1': 'to', '3': 5, '4': 1, '5': 3, '10': 'to'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 3, '10': 'updatedAt'},
    {'1': 'reason', '3': 8, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'status', '3': 9, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
    {'1': 'school_id', '3': 10, '4': 1, '5': 9, '10': 'schoolId'},
    {'1': 'user_id', '3': 11, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `Leave`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveDescriptor = $convert.base64Decode(
    'CgVMZWF2ZRIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIfCgtyZXZpZXdlcl'
    '9pZBgDIAEoCVIKcmV2aWV3ZXJJZBISCgRmcm9tGAQgASgDUgRmcm9tEg4KAnRvGAUgASgDUgJ0'
    'bxIdCgpjcmVhdGVkX2F0GAYgASgDUgljcmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgHIAEoA1IJdX'
    'BkYXRlZEF0EhYKBnJlYXNvbhgIIAEoCVIGcmVhc29uEh8KBnN0YXR1cxgJIAEoDjIHLlN0YXR1'
    'c1IGc3RhdHVzEhsKCXNjaG9vbF9pZBgKIAEoCVIIc2Nob29sSWQSFwoHdXNlcl9pZBgLIAEoCV'
    'IGdXNlcklk');

@$core.Deprecated('Use reportCardDescriptor instead')
const ReportCard$json = {
  '1': 'ReportCard',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'grade', '3': 2, '4': 1, '5': 13, '10': 'grade'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'uploaded_by', '3': 4, '4': 1, '5': 9, '10': 'uploadedBy'},
    {'1': 'file_path', '3': 5, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'school_id', '3': 6, '4': 1, '5': 9, '10': 'schoolId'},
  ],
};

/// Descriptor for `ReportCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportCardDescriptor = $convert.base64Decode(
    'CgpSZXBvcnRDYXJkEg4KAmlkGAEgASgJUgJpZBIUCgVncmFkZRgCIAEoDVIFZ3JhZGUSFwoHdX'
    'Nlcl9pZBgDIAEoCVIGdXNlcklkEh8KC3VwbG9hZGVkX2J5GAQgASgJUgp1cGxvYWRlZEJ5EhsK'
    'CWZpbGVfcGF0aBgFIAEoCVIIZmlsZVBhdGgSGwoJc2Nob29sX2lkGAYgASgJUghzY2hvb2xJZA'
    '==');

@$core.Deprecated('Use slotDescriptor instead')
const Slot$json = {
  '1': 'Slot',
  '2': [
    {'1': 'slot', '3': 1, '4': 1, '5': 9, '10': 'slot'},
    {'1': 'subject', '3': 2, '4': 1, '5': 9, '10': 'subject'},
  ],
};

/// Descriptor for `Slot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List slotDescriptor = $convert.base64Decode(
    'CgRTbG90EhIKBHNsb3QYASABKAlSBHNsb3QSGAoHc3ViamVjdBgCIAEoCVIHc3ViamVjdA==');

@$core.Deprecated('Use dayScheduleDescriptor instead')
const DaySchedule$json = {
  '1': 'DaySchedule',
  '2': [
    {'1': 'schedule', '3': 1, '4': 3, '5': 11, '6': '.Slot', '10': 'schedule'},
  ],
};

/// Descriptor for `DaySchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dayScheduleDescriptor = $convert.base64Decode(
    'CgtEYXlTY2hlZHVsZRIhCghzY2hlZHVsZRgBIAMoCzIFLlNsb3RSCHNjaGVkdWxl');

@$core.Deprecated('Use timeTableDescriptor instead')
const TimeTable$json = {
  '1': 'TimeTable',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'class_id', '3': 2, '4': 1, '5': 9, '10': 'classId'},
    {'1': 'section_id', '3': 3, '4': 1, '5': 9, '10': 'sectionId'},
    {'1': 'data', '3': 4, '4': 3, '5': 11, '6': '.TimeTable.DataEntry', '10': 'data'},
  ],
  '3': [TimeTable_DataEntry$json],
};

@$core.Deprecated('Use timeTableDescriptor instead')
const TimeTable_DataEntry$json = {
  '1': 'DataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.DaySchedule', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TimeTable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeTableDescriptor = $convert.base64Decode(
    'CglUaW1lVGFibGUSDgoCaWQYASABKAlSAmlkEhkKCGNsYXNzX2lkGAIgASgJUgdjbGFzc0lkEh'
    '0KCnNlY3Rpb25faWQYAyABKAlSCXNlY3Rpb25JZBIoCgRkYXRhGAQgAygLMhQuVGltZVRhYmxl'
    'LkRhdGFFbnRyeVIEZGF0YRpFCglEYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSIgoFdmFsdW'
    'UYAiABKAsyDC5EYXlTY2hlZHVsZVIFdmFsdWU6AjgB');

@$core.Deprecated('Use assignClassDescriptor instead')
const AssignClass$json = {
  '1': 'AssignClass',
  '2': [
    {'1': 'teacher_id', '3': 1, '4': 1, '5': 9, '10': 'teacherId'},
    {'1': 'class_id', '3': 2, '4': 1, '5': 9, '10': 'classId'},
    {'1': 'section_id', '3': 3, '4': 1, '5': 9, '10': 'sectionId'},
  ],
};

/// Descriptor for `AssignClass`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignClassDescriptor = $convert.base64Decode(
    'CgtBc3NpZ25DbGFzcxIdCgp0ZWFjaGVyX2lkGAEgASgJUgl0ZWFjaGVySWQSGQoIY2xhc3NfaW'
    'QYAiABKAlSB2NsYXNzSWQSHQoKc2VjdGlvbl9pZBgDIAEoCVIJc2VjdGlvbklk');

@$core.Deprecated('Use markAttendanceDescriptor instead')
const MarkAttendance$json = {
  '1': 'MarkAttendance',
  '2': [
    {'1': 'attendance', '3': 1, '4': 3, '5': 11, '6': '.MarkAttendance.AttendanceEntry', '10': 'attendance'},
    {'1': 'class_id', '3': 2, '4': 1, '5': 9, '10': 'classId'},
    {'1': 'section_id', '3': 3, '4': 1, '5': 9, '10': 'sectionId'},
    {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.AttendanceType', '10': 'type'},
  ],
  '3': [MarkAttendance_AttendanceEntry$json],
};

@$core.Deprecated('Use markAttendanceDescriptor instead')
const MarkAttendance_AttendanceEntry$json = {
  '1': 'AttendanceEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 8, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `MarkAttendance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAttendanceDescriptor = $convert.base64Decode(
    'Cg5NYXJrQXR0ZW5kYW5jZRI/CgphdHRlbmRhbmNlGAEgAygLMh8uTWFya0F0dGVuZGFuY2UuQX'
    'R0ZW5kYW5jZUVudHJ5UgphdHRlbmRhbmNlEhkKCGNsYXNzX2lkGAIgASgJUgdjbGFzc0lkEh0K'
    'CnNlY3Rpb25faWQYAyABKAlSCXNlY3Rpb25JZBIjCgR0eXBlGAQgASgOMg8uQXR0ZW5kYW5jZV'
    'R5cGVSBHR5cGUaPQoPQXR0ZW5kYW5jZUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVl'
    'GAIgASgIUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use updateLeaveStatusDescriptor instead')
const UpdateLeaveStatus$json = {
  '1': 'UpdateLeaveStatus',
  '2': [
    {'1': 'leave_id', '3': 1, '4': 1, '5': 9, '10': 'leaveId'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
  ],
};

/// Descriptor for `UpdateLeaveStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLeaveStatusDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVMZWF2ZVN0YXR1cxIZCghsZWF2ZV9pZBgBIAEoCVIHbGVhdmVJZBIfCgZzdGF0dX'
    'MYAiABKA4yBy5TdGF0dXNSBnN0YXR1cw==');

@$core.Deprecated('Use feeDetailDescriptor instead')
const FeeDetail$json = {
  '1': 'FeeDetail',
  '2': [
    {'1': 'quarter', '3': 1, '4': 1, '5': 9, '10': 'quarter'},
    {'1': 'amount', '3': 2, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'payment_date', '3': 3, '4': 1, '5': 9, '10': 'paymentDate'},
    {'1': 'payment_status', '3': 4, '4': 1, '5': 9, '10': 'paymentStatus'},
    {'1': 'due_date', '3': 5, '4': 1, '5': 9, '10': 'dueDate'},
  ],
};

/// Descriptor for `FeeDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feeDetailDescriptor = $convert.base64Decode(
    'CglGZWVEZXRhaWwSGAoHcXVhcnRlchgBIAEoCVIHcXVhcnRlchIWCgZhbW91bnQYAiABKAlSBm'
    'Ftb3VudBIhCgxwYXltZW50X2RhdGUYAyABKAlSC3BheW1lbnREYXRlEiUKDnBheW1lbnRfc3Rh'
    'dHVzGAQgASgJUg1wYXltZW50U3RhdHVzEhkKCGR1ZV9kYXRlGAUgASgJUgdkdWVEYXRl');

