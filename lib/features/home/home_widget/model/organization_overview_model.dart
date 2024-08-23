import 'package:json_annotation/json_annotation.dart';
part 'organization_overview_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrganizationOverviewModel {
  @JsonKey(name: "overview")
  List<Overview>? overview;

  OrganizationOverviewModel({
    this.overview,
  });

  OrganizationOverviewModel copyWith({
    List<Overview>? overview,
  }) =>
      OrganizationOverviewModel(
        overview: overview ?? this.overview,
      );

  factory OrganizationOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationOverviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationOverviewModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Overview {
  @JsonKey(name: "month")
  num? month;
  @JsonKey(name: "revenue")
  num? revenue;

  Overview({
    this.month,
    this.revenue,
  });

  Overview copyWith({
    num? month,
    num? revenue,
  }) =>
      Overview(
        month: month ?? this.month,
        revenue: revenue ?? this.revenue,
      );

  factory Overview.fromJson(Map<String, dynamic> json) =>
      _$OverviewFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewToJson(this);
}
