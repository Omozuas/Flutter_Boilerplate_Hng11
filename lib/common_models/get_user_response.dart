import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_user_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetUserData {
  @JsonKey(name: "data")
  AuthUser? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status_code")
  int? statusCode;

  GetUserData({
    this.data,
    this.message,
    this.statusCode,
  });

  GetUserData copyWith({
    AuthUser? data,
    String? message,
    int? statusCode,
  }) =>
      GetUserData(
        data: data ?? this.data,
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
      );

  factory GetUserData.fromJson(Map<String, dynamic> json) =>
      _$GetUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserDataToJson(this);
}

@JsonSerializable()
class AuthUser {
  @JsonKey(name: "fullname")
  String? fullname;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "profile")
  dynamic profile;
  @JsonKey(name: "avatar_url")
  dynamic avatarUrl;
  @JsonKey(name: "organisations")
  List<Organisation>? organisations;
  @JsonKey(name: "blogs")
  List<dynamic>? blogs;

  AuthUser({
    this.fullname,
    this.id,
    this.email,
    this.profile,
    this.avatarUrl,
    this.organisations,
    this.blogs,
  });

  AuthUser copyWith({
    String? fullname,
    String? id,
    String? email,
    dynamic profile,
    dynamic avatarUrl,
    List<Organisation>? organisations,
    List<dynamic>? blogs,
  }) =>
      AuthUser(
        fullname: fullname ?? this.fullname,
        id: id ?? this.id,
        email: email ?? this.email,
        profile: profile ?? this.profile,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        organisations: organisations ?? this.organisations,
        blogs: blogs ?? this.blogs,
      );

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}

@JsonSerializable()
class Organisation {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "slug")
  dynamic slug;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "industry")
  dynamic industry;
  @JsonKey(name: "type")
  dynamic type;
  @JsonKey(name: "country")
  dynamic country;
  @JsonKey(name: "address")
  dynamic address;
  @JsonKey(name: "state")
  dynamic state;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "owner_id")
  String? ownerId;
  @JsonKey(name: "is_active")
  bool? isActive;
  @JsonKey(name: "usersRoles")
  List<dynamic>? usersRoles;

  Organisation({
    this.id,
    this.name,
    this.description,
    this.slug,
    this.email,
    this.industry,
    this.type,
    this.country,
    this.address,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.ownerId,
    this.isActive,
    this.usersRoles,
  });

  Organisation copyWith({
    String? id,
    String? name,
    dynamic description,
    dynamic slug,
    String? email,
    dynamic industry,
    dynamic type,
    dynamic country,
    dynamic address,
    dynamic state,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? ownerId,
    bool? isActive,
    List<dynamic>? usersRoles,
  }) =>
      Organisation(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        slug: slug ?? this.slug,
        email: email ?? this.email,
        industry: industry ?? this.industry,
        type: type ?? this.type,
        country: country ?? this.country,
        address: address ?? this.address,
        state: state ?? this.state,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ownerId: ownerId ?? this.ownerId,
        isActive: isActive ?? this.isActive,
        usersRoles: usersRoles ?? this.usersRoles,
      );

  factory Organisation.fromJson(Map<String, dynamic> json) =>
      _$OrganisationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganisationToJson(this);
}
