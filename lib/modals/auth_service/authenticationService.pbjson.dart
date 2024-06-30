//
//  Generated code. Do not modify.
//  source: authenticationService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sendOtpForLoginDescriptor instead')
const SendOtpForLogin$json = {
  '1': 'SendOtpForLogin',
  '2': [
    {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'school_id', '3': 2, '4': 1, '5': 9, '10': 'schoolId'},
  ],
};

/// Descriptor for `SendOtpForLogin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendOtpForLoginDescriptor = $convert.base64Decode(
    'Cg9TZW5kT3RwRm9yTG9naW4SIQoMcGhvbmVfbnVtYmVyGAEgASgJUgtwaG9uZU51bWJlchIbCg'
    'lzY2hvb2xfaWQYAiABKAlSCHNjaG9vbElk');

@$core.Deprecated('Use verifyOtpForLoginDescriptor instead')
const VerifyOtpForLogin$json = {
  '1': 'VerifyOtpForLogin',
  '2': [
    {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'otp', '3': 2, '4': 1, '5': 9, '10': 'otp'},
    {'1': 'school_id', '3': 3, '4': 1, '5': 9, '10': 'schoolId'},
  ],
};

/// Descriptor for `VerifyOtpForLogin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyOtpForLoginDescriptor = $convert.base64Decode(
    'ChFWZXJpZnlPdHBGb3JMb2dpbhIhCgxwaG9uZV9udW1iZXIYASABKAlSC3Bob25lTnVtYmVyEh'
    'AKA290cBgCIAEoCVIDb3RwEhsKCXNjaG9vbF9pZBgDIAEoCVIIc2Nob29sSWQ=');

