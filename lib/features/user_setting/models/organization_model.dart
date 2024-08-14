class OwnedOrganisation {
  String id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  String? email;
  String? industry;
  String? type;
  String? country;
  String? address;
  String? state;
  bool? isDeleted;

  OwnedOrganisation({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.email,
    this.industry,
    this.type,
    this.country,
    this.address,
    this.state,
    this.isDeleted,
  });

  factory OwnedOrganisation.fromJson(Map<String, dynamic> json) =>
      OwnedOrganisation(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        email: json["email"],
        industry: json["industry"],
        type: json["type"],
        country: json["country"],
        address: json["address"],
        state: json["state"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "name": name,
        "description": description,
        "email": email,
        "industry": industry,
        "type": type,
        "country": country,
        "address": address,
        "state": state,
        "isDeleted": isDeleted,
      };
}
