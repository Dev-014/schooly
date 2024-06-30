//
//  Generated code. Do not modify.
//  source: userService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use typesDescriptor instead')
const Types$json = {
  '1': 'Types',
  '2': [
    {'1': 'STUDENT', '2': 0},
    {'1': 'TEACHER', '2': 1},
    {'1': 'STAFF', '2': 2},
  ],
};

/// Descriptor for `Types`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typesDescriptor = $convert.base64Decode(
    'CgVUeXBlcxILCgdTVFVERU5UEAASCwoHVEVBQ0hFUhABEgkKBVNUQUZGEAI=');

@$core.Deprecated('Use rolesDescriptor instead')
const Roles$json = {
  '1': 'Roles',
  '2': [
    {'1': 'student', '2': 0},
    {'1': 'principal', '2': 1},
    {'1': 'teacher', '2': 2},
    {'1': 'classTeacher', '2': 3},
    {'1': 'staff', '2': 4},
  ],
};

/// Descriptor for `Roles`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rolesDescriptor = $convert.base64Decode(
    'CgVSb2xlcxILCgdzdHVkZW50EAASDQoJcHJpbmNpcGFsEAESCwoHdGVhY2hlchACEhAKDGNsYX'
    'NzVGVhY2hlchADEgkKBXN0YWZmEAQ=');

@$core.Deprecated('Use detailsDescriptor instead')
const Details$json = {
  '1': 'Details',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'phone_number', '3': 4, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    {'1': 'blood_group', '3': 6, '4': 1, '5': 9, '10': 'bloodGroup'},
    {'1': 'roles', '3': 7, '4': 1, '5': 5, '10': 'roles'},
  ],
};

/// Descriptor for `Details`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailsDescriptor = $convert.base64Decode(
    'CgdEZXRhaWxzEg4KAmlkGAEgASgJUgJpZBIdCgpmaXJzdF9uYW1lGAIgASgJUglmaXJzdE5hbW'
    'USGwoJbGFzdF9uYW1lGAMgASgJUghsYXN0TmFtZRIhCgxwaG9uZV9udW1iZXIYBCABKAlSC3Bo'
    'b25lTnVtYmVyEhQKBWVtYWlsGAUgASgJUgVlbWFpbBIfCgtibG9vZF9ncm91cBgGIAEoCVIKYm'
    'xvb2RHcm91cBIUCgVyb2xlcxgHIAEoBVIFcm9sZXM=');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'student', '3': 1, '4': 1, '5': 11, '6': '.Student', '10': 'student'},
    {'1': 'teacher', '3': 2, '4': 1, '5': 11, '6': '.Teacher', '10': 'teacher'},
    {'1': 'staff', '3': 3, '4': 1, '5': 11, '6': '.Staff', '10': 'staff'},
    {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.Types', '10': 'type'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEiIKB3N0dWRlbnQYASABKAsyCC5TdHVkZW50UgdzdHVkZW50EiIKB3RlYWNoZXIYAi'
    'ABKAsyCC5UZWFjaGVyUgd0ZWFjaGVyEhwKBXN0YWZmGAMgASgLMgYuU3RhZmZSBXN0YWZmEhoK'
    'BHR5cGUYBCABKA4yBi5UeXBlc1IEdHlwZQ==');

@$core.Deprecated('Use studentDescriptor instead')
const Student$json = {
  '1': 'Student',
  '2': [
    {'1': 'details', '3': 1, '4': 1, '5': 11, '6': '.Details', '10': 'details'},
    {'1': 'roll_number', '3': 2, '4': 1, '5': 3, '10': 'rollNumber'},
    {'1': 'class_id', '3': 3, '4': 1, '5': 9, '10': 'classId'},
    {'1': 'section_id', '3': 4, '4': 1, '5': 9, '10': 'sectionId'},
    {'1': 'uploaded_by', '3': 5, '4': 1, '5': 9, '10': 'uploadedBy'},
  ],
};

/// Descriptor for `Student`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentDescriptor = $convert.base64Decode(
    'CgdTdHVkZW50EiIKB2RldGFpbHMYASABKAsyCC5EZXRhaWxzUgdkZXRhaWxzEh8KC3JvbGxfbn'
    'VtYmVyGAIgASgDUgpyb2xsTnVtYmVyEhkKCGNsYXNzX2lkGAMgASgJUgdjbGFzc0lkEh0KCnNl'
    'Y3Rpb25faWQYBCABKAlSCXNlY3Rpb25JZBIfCgt1cGxvYWRlZF9ieRgFIAEoCVIKdXBsb2FkZW'
    'RCeQ==');

@$core.Deprecated('Use teacherDescriptor instead')
const Teacher$json = {
  '1': 'Teacher',
  '2': [
    {'1': 'details', '3': 1, '4': 1, '5': 11, '6': '.Details', '10': 'details'},
    {'1': 'is_class_teacher', '3': 2, '4': 1, '5': 8, '10': 'isClassTeacher'},
    {'1': 'class_id', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'classId', '17': true},
    {'1': 'section_id', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'sectionId', '17': true},
    {'1': 'uploaded_by', '3': 5, '4': 1, '5': 9, '10': 'uploadedBy'},
  ],
  '8': [
    {'1': '_class_id'},
    {'1': '_section_id'},
  ],
};

/// Descriptor for `Teacher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teacherDescriptor = $convert.base64Decode(
    'CgdUZWFjaGVyEiIKB2RldGFpbHMYASABKAsyCC5EZXRhaWxzUgdkZXRhaWxzEigKEGlzX2NsYX'
    'NzX3RlYWNoZXIYAiABKAhSDmlzQ2xhc3NUZWFjaGVyEh4KCGNsYXNzX2lkGAMgASgJSABSB2Ns'
    'YXNzSWSIAQESIgoKc2VjdGlvbl9pZBgEIAEoCUgBUglzZWN0aW9uSWSIAQESHwoLdXBsb2FkZW'
    'RfYnkYBSABKAlSCnVwbG9hZGVkQnlCCwoJX2NsYXNzX2lkQg0KC19zZWN0aW9uX2lk');

@$core.Deprecated('Use staffDescriptor instead')
const Staff$json = {
  '1': 'Staff',
  '2': [
    {'1': 'details', '3': 1, '4': 1, '5': 11, '6': '.Details', '10': 'details'},
    {'1': 'uploaded_by', '3': 5, '4': 1, '5': 9, '10': 'uploadedBy'},
  ],
};

/// Descriptor for `Staff`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List staffDescriptor = $convert.base64Decode(
    'CgVTdGFmZhIiCgdkZXRhaWxzGAEgASgLMgguRGV0YWlsc1IHZGV0YWlscxIfCgt1cGxvYWRlZF'
    '9ieRgFIAEoCVIKdXBsb2FkZWRCeQ==');

