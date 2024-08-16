// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'organisation.freezed.dart';
part 'organisation.g.dart';

@freezed
class Organisation with _$Organisation {
  const factory Organisation({
    @JsonKey(name: 'organisation_id') String? organisationId,
    String? name,
    String? role,
    @JsonKey(name: 'is_owner') bool? isOwner,
  }) = _Organisation;

  factory Organisation.fromJson(Map<String, dynamic> json) =>
      _$OrganisationFromJson(json);
}
