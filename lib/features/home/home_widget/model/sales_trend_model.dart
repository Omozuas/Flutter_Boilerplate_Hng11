import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'sales_trend_model.g.dart';

List<GetSalesTrend> getSalesTrendListFromStringtoJson(String str) =>
    List<GetSalesTrend>.from(
        json.decode(str).map((x) => GetSalesTrend.fromJson(x)));

String getSalesTrendListFromJsontoString(List<GetSalesTrend> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable(fieldRename: FieldRename.snake)
class GetSalesTrend {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "product_id")
  String? productId;
  @JsonKey(name: "subscription_id")
  String? subscriptionId;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "partners")
  String? partners;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "reference")
  String? reference;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "paid_at")
  DateTime? paidAt;
  @JsonKey(name: "modified_at")
  DateTime? modifiedAt;

  GetSalesTrend({
    this.id,
    this.userId,
    this.productId,
    this.subscriptionId,
    this.type,
    this.status,
    this.partners,
    this.amount,
    this.reference,
    this.createdAt,
    this.paidAt,
    this.modifiedAt,
  });

  GetSalesTrend copyWith({
    String? id,
    String? userId,
    String? productId,
    String? subscriptionId,
    String? type,
    String? status,
    String? partners,
    int? amount,
    String? reference,
    DateTime? createdAt,
    DateTime? paidAt,
    DateTime? modifiedAt,
  }) =>
      GetSalesTrend(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        productId: productId ?? this.productId,
        subscriptionId: subscriptionId ?? this.subscriptionId,
        type: type ?? this.type,
        status: status ?? this.status,
        partners: partners ?? this.partners,
        amount: amount ?? this.amount,
        reference: reference ?? this.reference,
        createdAt: createdAt ?? this.createdAt,
        paidAt: paidAt ?? this.paidAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );

  factory GetSalesTrend.fromJson(Map<String, dynamic> json) => _$GetSalesTrendFromJson(json);

  Map<String, dynamic> toJson() => _$GetSalesTrendToJson(this);
}
