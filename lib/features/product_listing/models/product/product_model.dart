// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
@freezed
class Product with _$Product {
  const factory Product({
    String? id,
    String? name,
    String? description,
    int? price,
    String? category,
    @JsonKey(name: 'created_at') 
    @JsonKey(name: 'created_at') 
    DateTime? createdAt,
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
