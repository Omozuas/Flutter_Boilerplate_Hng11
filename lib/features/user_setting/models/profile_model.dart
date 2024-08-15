class Profile {
  String id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? username;
  dynamic jobTitle;
  dynamic pronouns;
  dynamic department;
  String? email;
  dynamic bio;
  dynamic socialLinks;
  dynamic language;
  dynamic region;
  dynamic timezones;
  dynamic profilePicUrl;
  dynamic deletedAt;

  Profile({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.jobTitle,
    this.pronouns,
    this.department,
    this.email,
    this.bio,
    this.socialLinks,
    this.language,
    this.region,
    this.timezones,
    this.profilePicUrl,
    this.deletedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        jobTitle: json["jobTitle"],
        pronouns: json["pronouns"],
        department: json["department"],
        email: json["email"],
        bio: json["bio"],
        socialLinks: json["social_links"],
        language: json["language"],
        region: json["region"],
        timezones: json["timezones"],
        profilePicUrl: json["profile_pic_url"],
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "username": username,
        "jobTitle": jobTitle,
        "pronouns": pronouns,
        "department": department,
        "email": email,
        "bio": bio,
        "social_links": socialLinks,
        "language": language,
        "region": region,
        "timezones": timezones,
        "profile_pic_url": profilePicUrl,
        "deletedAt": deletedAt,
      };
}
