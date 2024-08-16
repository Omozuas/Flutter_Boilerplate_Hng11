import 'package:freezed_annotation/freezed_annotation.dart';

part 'organisation/organisation.freezed.dart';
part 'organisation/organisation.g.dart';

@freezed
class Organisation with _$Organisation {
  const factory Organisation({
    required String organisationId,
    required String name,
    required String role,
    @JsonKey(name: 'is_owner') required bool isOwner,
  }) = _Organisation;

  factory Organisation.fromJson(Map<String, dynamic> json) =>
      _$OrganisationFromJson(json);
}
