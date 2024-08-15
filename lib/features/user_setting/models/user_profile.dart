import 'dart:convert';

class UserProfile {
  final String userID;
  final String firstname;
  final String lastname;
  final String? phoneNumber;
  final String? avatarURL;
  final String? username;
  final String? pronoun;
  final String? jobTitle;
  final String? bio;
  final String? department;
  final String? facebookLink;
  final String? twitterLink;
  final String? linkedInLink;

  const UserProfile({
    required this.userID,
    required this.firstname,
    required this.lastname,
    required this.phoneNumber,
    required this.avatarURL,
    required this.username,
    required this.pronoun,
    required this.jobTitle,
    required this.bio,
    required this.department,
    required this.facebookLink,
    required this.twitterLink,
    required this.linkedInLink,
  });

  UserProfile copyWith({
    String? userID,
    String? firstname,
    String? lastname,
    String? phoneNumber,
    String? avatarURL,
    String? username,
    String? pronoun,
    String? jobTitle,
    String? bio,
    String? department,
    String? facebookLink,
    String? twitterLink,
    String? linkedInLink,
  }) {
    return UserProfile(
      userID: userID ?? this.userID,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarURL: avatarURL ?? this.avatarURL,
      username: username ?? this.username,
      pronoun: pronoun ?? this.pronoun,
      bio: bio ?? this.bio,
      department: department ?? this.department,
      facebookLink: facebookLink ?? this.facebookLink,
      twitterLink: twitterLink ?? this.twitterLink,
      linkedInLink: linkedInLink ?? this.linkedInLink,
      jobTitle: jobTitle ?? this.jobTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "bio": bio,
      "department": department,
      "phone_number": phoneNumber,
      "job_title": jobTitle,
      "last_name": lastname,
      "pronoun": pronoun,
      "first_name": firstname,
      "user_name": username,
      "facebook_link": facebookLink,
      "twitter_link": twitterLink,
      "linkedin_link": linkedInLink,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      userID: map['user_id'] as String,
      firstname: map['first_name'] as String,
      lastname: map['last_name'] as String,
      phoneNumber: map['phone_number'] as String?,
      avatarURL: map['avatar_url'] as String?,
      username: map['user_name'] as String?,
      pronoun: map['pronoun'] as String?,
      jobTitle: map['job_title'] as String?,
      bio: map['bio'] as String?,
      department: map['department'] as String?,
      facebookLink: map['facebook_link'] as String?,
      twitterLink: map['twitter_link'] as String?,
      linkedInLink: map['linkedin_link'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant UserProfile other) {
    if (identical(this, other)) return true;

    return other.userID == userID;
  }

  @override
  int get hashCode {
    return userID.hashCode;
  }

  @override
  String toString() {
    return 'UserProfile(userID: $userID, firstname: $firstname, lastname: $lastname, phoneNumber: $phoneNumber, avatarURL: $avatarURL, username: $username, pronoun: $pronoun, jobTitle: $jobTitle, bio: $bio, department: $department, facebookLink: $facebookLink, twitterLink: $twitterLink, linkedInLink: $linkedInLink)';
  }
}
