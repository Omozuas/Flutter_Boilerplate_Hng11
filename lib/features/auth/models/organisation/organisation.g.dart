// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../organisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganisationImpl _$$OrganisationImplFromJson(Map<String, dynamic> json) =>
    _$OrganisationImpl(
      organisationId: json['organisationId'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      isOwner: json['is_owner'] as bool,
    );

Map<String, dynamic> _$$OrganisationImplToJson(_$OrganisationImpl instance) =>
    <String, dynamic>{
      'organisationId': instance.organisationId,
      'name': instance.name,
      'role': instance.role,
      'is_owner': instance.isOwner,
    };
