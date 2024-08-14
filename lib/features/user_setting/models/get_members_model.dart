import 'dart:convert';

import 'list_members_model.dart';

GetMembers getMembersFromJson(String str) =>
    GetMembers.fromJson(json.decode(str));

String getMembersToJson(GetMembers data) => json.encode(data.toJson());

class GetMembers {
  int statusCode;
  String message;
  List<Members>? data;

  GetMembers({
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory GetMembers.fromJson(Map<String, dynamic> json) => GetMembers(
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Members>.from(json["data"].map((x) => Members.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
