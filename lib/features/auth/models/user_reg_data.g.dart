// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'user_reg_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegData _$UserRegDataFromJson(Map<String, dynamic> json) => UserRegData(
      data: json['data'] as Map<String, dynamic>?,
      message: json['message'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$UserRegDataToJson(UserRegData instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'data': instance.data,
      'message': instance.message,
    };
