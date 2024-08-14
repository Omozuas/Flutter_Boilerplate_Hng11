import 'dart:convert';

import 'user_owned_organization.dart';
import 'user_profile.dart';

class User {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String firstName;
  final String lastName;
  final String email;
  final String? status;
  final String? phone;
  final bool isActive;
  final List<String> backupCodes;
  final int? attemptsLeft;
  final int? timeLeft;
  final String? secret;
  final bool is2FAEnabled;
  final DateTime? deletedAt;
  final UserProfile profile;
  final List<UserOwnedOrganization> organisations;

  const User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.status,
    required this.phone,
    required this.isActive,
    required this.backupCodes,
    required this.attemptsLeft,
    required this.timeLeft,
    required this.secret,
    required this.is2FAEnabled,
    required this.deletedAt,
    required this.profile,
    required this.organisations,
  });

  User copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? firstName,
    String? lastName,
    String? email,
    String? status,
    String? phone,
    bool? isActive,
    List<String>? backupCodes,
    int? attemptsLeft,
    int? timeLeft,
    String? secret,
    bool? is2FAEnabled,
    DateTime? deletedAt,
    UserProfile? profile,
    List<UserOwnedOrganization>? organisations,
  }) {
    return User(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      status: status ?? this.status,
      phone: phone ?? this.phone,
      isActive: isActive ?? this.isActive,
      backupCodes: backupCodes ?? this.backupCodes,
      attemptsLeft: attemptsLeft ?? this.attemptsLeft,
      timeLeft: timeLeft ?? this.timeLeft,
      secret: secret ?? this.secret,
      is2FAEnabled: is2FAEnabled ?? this.is2FAEnabled,
      deletedAt: deletedAt ?? this.deletedAt,
      profile: profile ?? this.profile,
      organisations: organisations ?? this.organisations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      if (status != null) 'status': status,
      if (phone != null) 'phone': phone,
      'is_active': isActive,
      'backup_codes': backupCodes,
      if (attemptsLeft != null) 'attempts_left': attemptsLeft,
      if (timeLeft != null) 'time_left': timeLeft,
      if (secret != null) 'secret': secret,
      'is_2fa_enabled': is2FAEnabled,
      if (deletedAt != null) 'deletedAt': deletedAt!.toIso8601String(),
      'profile': profile.toMap(),
      'owned_organisations': organisations.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      email: map['email'] as String,
      status: map['status'] as String,
      phone: map['phone'] as String,
      isActive: map['is_active'] as bool,
      backupCodes: List<String>.from((map['backup_codes'] ?? [])),
      attemptsLeft: map['attempts_left'] as int?,
      timeLeft: map['time_left'] as int?,
      secret: map['secret'] as String,
      is2FAEnabled: map['is_2fa_enabled'] as bool,
      deletedAt: DateTime.tryParse(map['deletedAt'] ?? ''),
      profile: UserProfile.fromMap(map['profile'] as Map<String, dynamic>),
      organisations: List<UserOwnedOrganization>.from(
        (map['owned_organisations'] as List<Map<String, dynamic>>)
            .map(UserOwnedOrganization.fromMap),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, firstName: $firstName, lastName: $lastName, email: $email, status: $status, phone: $phone, isActive: $isActive, backupCodes: $backupCodes, attemptsLeft: $attemptsLeft, timeLeft: $timeLeft, secret: $secret, is2FAEnabled: $is2FAEnabled, deletedAt: $deletedAt, profile: $profile, organization: $organisations)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
