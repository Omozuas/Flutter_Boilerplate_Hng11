// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_overview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationOverviewModel _$OrganizationOverviewModelFromJson(
        Map<String, dynamic> json) =>
    OrganizationOverviewModel(
      overview: (json['overview'] as List<dynamic>?)
          ?.map((e) => Overview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrganizationOverviewModelToJson(
        OrganizationOverviewModel instance) =>
    <String, dynamic>{
      'overview': instance.overview,
    };

Overview _$OverviewFromJson(Map<String, dynamic> json) => Overview(
      month: (json['month'] as num?)?.toInt(),
      revenue: (json['revenue'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OverviewToJson(Overview instance) => <String, dynamic>{
      'month': instance.month,
      'revenue': instance.revenue,
    };
