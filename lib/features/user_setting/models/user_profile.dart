import 'dart:convert';

class UserProfile {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? username;
  final String? jobTitle;
  final String? pronouns;
  final String? department;
  final String email;
  final String? bio;
  final List<String> socialLinks;
  final String? language;
  final String? region;
  final String? timezones;
  final String? profilePicURL;
  final DateTime? deletedAt;

  const UserProfile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.jobTitle,
    required this.pronouns,
    required this.department,
    required this.email,
    required this.bio,
    required this.socialLinks,
    required this.language,
    required this.region,
    required this.timezones,
    required this.profilePicURL,
    required this.deletedAt,
  });

  UserProfile copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? username,
    String? jobTitle,
    String? pronouns,
    String? department,
    String? email,
    String? bio,
    List<String>? socialLinks,
    String? language,
    String? region,
    String? timezones,
    String? profilePicURL,
    DateTime? deletedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      username: username ?? this.username,
      jobTitle: jobTitle ?? this.jobTitle,
      pronouns: pronouns ?? this.pronouns,
      department: department ?? this.department,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      socialLinks: socialLinks ?? this.socialLinks,
      language: language ?? this.language,
      region: region ?? this.region,
      timezones: timezones ?? this.timezones,
      profilePicURL: profilePicURL ?? this.profilePicURL,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      if (username != null) 'username': username,
      if (jobTitle != null) 'jobTitle': jobTitle,
      if (pronouns != null) 'pronouns': pronouns,
      if (department != null) 'department': department,
      'email': email,
      if (bio != null) 'bio': bio,
      'social_links': socialLinks,
      if (language != null) 'language': language,
      if (region != null) 'region': region,
      if (timezones != null) 'timezones': timezones,
      if (profilePicURL != null) 'profile_pic_url': profilePicURL,
      if (deletedAt != null) 'deletedAt': deletedAt!.toIso8601String(),
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at'] ?? ''),
      updatedAt: DateTime.parse(map['updated_at'] ?? ''),
      username: map['username'] as String?,
      jobTitle: map['jobTitle'] as String?,
      pronouns: map['pronouns'] as String?,
      department: map['department'] as String?,
      email: map['email'] as String,
      bio: map['bio'] as String?,
      socialLinks: List<String>.from((map['social_links'] ?? [])),
      language: map['language'] as String?,
      region: map['region'] as String?,
      timezones: map['timezones'] as String?,
      profilePicURL: map['profile_pic_url'] as String?,
      deletedAt: DateTime.tryParse(map['deletedAt'] ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfile(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, username: $username, jobTitle: $jobTitle, pronouns: $pronouns, department: $department, email: $email, bio: $bio, socialLinks: $socialLinks, language: $language, region: $region, timezones: $timezones, profilePicURL: $profilePicURL, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant UserProfile other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
