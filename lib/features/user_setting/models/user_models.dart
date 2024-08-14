import 'organization_model.dart';
import 'profile_model.dart';

class User {
  String id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? firstName;
  String? lastName;
  String? email;
  dynamic status;
  dynamic phone;
  bool isActive;
  dynamic backupCodes;
  dynamic attemptsLeft;
  dynamic timeLeft;
  dynamic secret;
  bool is2FaEnabled;
  dynamic deletedAt;
  Profile profile;
  List<OwnedOrganisation> ownedOrganisations;

  User({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.email,
    this.status,
    this.phone,
    required this.isActive,
    this.backupCodes,
    this.attemptsLeft,
    this.timeLeft,
    this.secret,
    required this.is2FaEnabled,
    this.deletedAt,
    required this.profile,
    required this.ownedOrganisations,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        status: json["status"],
        phone: json["phone"],
        isActive: json["is_active"],
        backupCodes: json["backup_codes"],
        attemptsLeft: json["attempts_left"],
        timeLeft: json["time_left"],
        secret: json["secret"],
        is2FaEnabled: json["is_2fa_enabled"],
        deletedAt: json["deletedAt"],
        profile: Profile.fromJson(json["profile"]),
        ownedOrganisations: List<OwnedOrganisation>.from(
            json["owned_organisations"]
                .map((x) => OwnedOrganisation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "status": status,
        "phone": phone,
        "is_active": isActive,
        "backup_codes": backupCodes,
        "attempts_left": attemptsLeft,
        "time_left": timeLeft,
        "secret": secret,
        "is_2fa_enabled": is2FaEnabled,
        "deletedAt": deletedAt,
        "profile": profile.toJson(),
        "owned_organisations":
            List<dynamic>.from(ownedOrganisations.map((x) => x.toJson())),
      };
}
