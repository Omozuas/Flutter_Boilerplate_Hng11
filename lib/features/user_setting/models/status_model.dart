import 'dart:convert';

import 'user_models.dart';

RequestUserInfo requestUserInfoFromJson(String str) =>
    RequestUserInfo.fromJson(json.decode(str));

String requestUserInfoToJson(RequestUserInfo data) =>
    json.encode(data.toJson());

class RequestUserInfo {
  int statusCode;
  User user;

  RequestUserInfo({
    required this.statusCode,
    required this.user,
  });

  factory RequestUserInfo.fromJson(Map<String, dynamic> json) =>
      RequestUserInfo(
        statusCode: json["status_code"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "user": user.toJson(),
      };
}
