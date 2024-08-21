class Members {
  String? firstName;
  String? lastName;
  String? avatarUrl;
  String? email;
  String? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isSuperAdmin;

  Members({
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.email,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
  });

  factory Members.fromJson(Map<String, dynamic> json) => Members(
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatarUrl: json["avatar_url"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isSuperAdmin: json["is_super_admin"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "avatar_url": avatarUrl,
        "email": email,
        "phone_number": phoneNumber,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "is_super_admin": isSuperAdmin,
      };
}
