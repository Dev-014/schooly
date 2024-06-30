//
//  Generated code. Do not modify.
//  source: authenticationService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SendOtpForLogin extends $pb.GeneratedMessage {
  factory SendOtpForLogin({
    $core.String? phoneNumber,
    $core.String? schoolId,
  }) {
    final $result = create();
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (schoolId != null) {
      $result.schoolId = schoolId;
    }
    return $result;
  }
  SendOtpForLogin._() : super();
  factory SendOtpForLogin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendOtpForLogin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendOtpForLogin', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(2, _omitFieldNames ? '' : 'schoolId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendOtpForLogin clone() => SendOtpForLogin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendOtpForLogin copyWith(void Function(SendOtpForLogin) updates) => super.copyWith((message) => updates(message as SendOtpForLogin)) as SendOtpForLogin;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendOtpForLogin create() => SendOtpForLogin._();
  SendOtpForLogin createEmptyInstance() => create();
  static $pb.PbList<SendOtpForLogin> createRepeated() => $pb.PbList<SendOtpForLogin>();
  @$core.pragma('dart2js:noInline')
  static SendOtpForLogin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendOtpForLogin>(create);
  static SendOtpForLogin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phoneNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set phoneNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get schoolId => $_getSZ(1);
  @$pb.TagNumber(2)
  set schoolId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSchoolId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSchoolId() => clearField(2);
}

class VerifyOtpForLogin extends $pb.GeneratedMessage {
  factory VerifyOtpForLogin({
    $core.String? phoneNumber,
    $core.String? otp,
    $core.String? schoolId,
  }) {
    final $result = create();
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (otp != null) {
      $result.otp = otp;
    }
    if (schoolId != null) {
      $result.schoolId = schoolId;
    }
    return $result;
  }
  VerifyOtpForLogin._() : super();
  factory VerifyOtpForLogin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyOtpForLogin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyOtpForLogin', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(2, _omitFieldNames ? '' : 'otp')
    ..aOS(3, _omitFieldNames ? '' : 'schoolId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyOtpForLogin clone() => VerifyOtpForLogin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyOtpForLogin copyWith(void Function(VerifyOtpForLogin) updates) => super.copyWith((message) => updates(message as VerifyOtpForLogin)) as VerifyOtpForLogin;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyOtpForLogin create() => VerifyOtpForLogin._();
  VerifyOtpForLogin createEmptyInstance() => create();
  static $pb.PbList<VerifyOtpForLogin> createRepeated() => $pb.PbList<VerifyOtpForLogin>();
  @$core.pragma('dart2js:noInline')
  static VerifyOtpForLogin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyOtpForLogin>(create);
  static VerifyOtpForLogin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phoneNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set phoneNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get otp => $_getSZ(1);
  @$pb.TagNumber(2)
  set otp($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOtp() => $_has(1);
  @$pb.TagNumber(2)
  void clearOtp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get schoolId => $_getSZ(2);
  @$pb.TagNumber(3)
  set schoolId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSchoolId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchoolId() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
