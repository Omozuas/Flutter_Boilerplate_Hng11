
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  String? id;
  String? firstName;
  String? lastName;
  String? avatarUrl;
  String? email;
  String? createdAt;
  bool? isSuperadmin;


  User({
    this.id,
    this.email,
    this.avatarUrl,
    this.createdAt,
    this.firstName,this.isSuperadmin,
    this.lastName
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}