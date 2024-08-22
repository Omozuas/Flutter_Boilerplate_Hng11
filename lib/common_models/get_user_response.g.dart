// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserData _$GetUserDataFromJson(Map<String, dynamic> json) => GetUserData(
      data: json['data'] == null
          ? null
          : AuthUser.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      statusCode: (json['status_code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetUserDataToJson(GetUserData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status_code': instance.statusCode,
    };

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => AuthUser(
      fullname: json['fullname'] as String?,
      id: json['id'] as String?,
      email: json['email'] as String?,
      profile: json['profile'],
      avatarUrl: json['avatar_url'],
      organisations: (json['organisations'] as List<dynamic>?)
          ?.map((e) => Organisation.fromJson(e as Map<String, dynamic>))
          .toList(),
      blogs: json['blogs'] as List<dynamic>?,
    );

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'id': instance.id,
      'email': instance.email,
      'profile': instance.profile,
      'avatar_url': instance.avatarUrl,
      'organisations': instance.organisations,
      'blogs': instance.blogs,
    };

Organisation _$OrganisationFromJson(Map<String, dynamic> json) => Organisation(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'],
      slug: json['slug'],
      email: json['email'] as String?,
      industry: json['industry'],
      type: json['type'],
      country: json['country'],
      address: json['address'],
      state: json['state'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      ownerId: json['owner_id'] as String?,
      isActive: json['is_active'] as bool?,
      usersRoles: json['usersRoles'] as List<dynamic>?,
    );

Map<String, dynamic> _$OrganisationToJson(Organisation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'slug': instance.slug,
      'email': instance.email,
      'industry': instance.industry,
      'type': instance.type,
      'country': instance.country,
      'address': instance.address,
      'state': instance.state,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'owner_id': instance.ownerId,
      'is_active': instance.isActive,
      'usersRoles': instance.usersRoles,
    };
