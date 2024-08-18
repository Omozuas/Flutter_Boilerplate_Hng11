import 'dart:convert';

UpdatePasswordModel updatePasswordModelFromJson(String str) =>
    UpdatePasswordModel.fromJson(json.decode(str));

String updatePasswordModelToJson(UpdatePasswordModel data) =>
    json.encode(data.toJson());

class UpdatePasswordModel {
  final String oldPassword;
  final String newPassword;
  final String confirmNewPassword;

  UpdatePasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordModel(
        oldPassword: json["oldPassword"],
        newPassword: json["newPassword"],
        confirmNewPassword: json["confirmNewPassword"],
      );

  Map<String, dynamic> toJson() => {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "confirmNewPassword": confirmNewPassword,
      };
}
