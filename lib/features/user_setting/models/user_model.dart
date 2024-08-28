import 'dart:convert';

import 'user_profile.dart';

class UserModel {
  final String id;
  final String fullname;
  final String email;
  final String? avatarURL;
  final UserProfile? profile;
  final String orgId;

  const UserModel(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.avatarURL,
      required this.profile,
      required this.orgId});

  UserModel copyWith({
    String? id,
    String? fullname,
    String? email,
    String? avatarURL,
    UserProfile? profile,
    String? orgId,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      avatarURL: avatarURL ?? this.avatarURL,
      profile: profile ?? this.profile,
      orgId: orgId ?? this.orgId,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      avatarURL: map['avatar_url'] as String?,
      profile: map['profile'] == null
          ? null
          : UserProfile.fromMap(map['profile'] as Map<String, dynamic>),
      orgId: map['organisations'] != null &&
              (map['organisations'] as List).isNotEmpty
          ? (map['organisations'][0]['id'] as String)
          : '', // Handle the case where there might be no organisations
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, fullname: $fullname, email: $email, avatarURL: $avatarURL, profile: $profile, orgId: $orgId)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
