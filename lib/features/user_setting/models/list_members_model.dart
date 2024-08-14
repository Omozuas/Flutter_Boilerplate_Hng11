class Members {
  String id;
  String name;
  dynamic phoneNumber;
  String email;

  Members({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  factory Members.fromJson(Map<String, dynamic> json) => Members(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
      };
}
