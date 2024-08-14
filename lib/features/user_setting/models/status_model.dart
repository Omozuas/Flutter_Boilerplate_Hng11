import 'dart:convert';

import 'user_models.dart';

RequestUserIndo requestUserIndoFromJson(String str) =>
    RequestUserIndo.fromJson(json.decode(str));

String requestUserIndoToJson(RequestUserIndo data) =>
    json.encode(data.toJson());

class RequestUserIndo {
  int statusCode;
  User user;

  RequestUserIndo({
    required this.statusCode,
    required this.user,
  });

  factory RequestUserIndo.fromJson(Map<String, dynamic> json) =>
      RequestUserIndo(
        statusCode: json["status_code"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "user": user.toJson(),
      };
}
