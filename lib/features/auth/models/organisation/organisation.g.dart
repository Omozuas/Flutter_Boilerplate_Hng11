// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganisationImpl _$$OrganisationImplFromJson(Map<String, dynamic> json) =>
    _$OrganisationImpl(
      organisationId: json['organisation_id'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      isOwner: json['is_owner'] as bool?,
    );

Map<String, dynamic> _$$OrganisationImplToJson(_$OrganisationImpl instance) =>
    <String, dynamic>{
      'organisation_id': instance.organisationId,
      'name': instance.name,
      'role': instance.role,
      'is_owner': instance.isOwner,
    };
