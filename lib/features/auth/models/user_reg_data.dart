

import 'package:json_annotation/json_annotation.dart';

part 'user_reg_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserRegData {
  String? accessToken;
  Map<String, dynamic>? data;
  String? message;

  UserRegData({
    this.data,
    this.message,
    this.accessToken
  });

  factory UserRegData.fromJson(Map<String, dynamic> json) => _$UserRegDataFromJson(json);
}


