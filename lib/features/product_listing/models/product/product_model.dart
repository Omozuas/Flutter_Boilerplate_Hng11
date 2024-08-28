// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

List<Product> getProductListFromStringtoJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String getProductListFromJsontoString(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Product with _$Product {
  @JsonSerializable(explicitToJson: true)
  const factory Product({
    String? id,
    String? name,
    String? description,
    num? price,
    int? cartQuantity,
    String? category,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? image,
    int? quantity,
    String? size,
    String? status,
    @JsonKey(name: 'cost_price') int? costPrice,
    @JsonKey(name: 'delete_at') DateTime? deleteAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
