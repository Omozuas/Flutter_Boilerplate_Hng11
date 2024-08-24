import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_products.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AllProduct {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "data")
  List<Product>? data;

  AllProduct({
    this.message,
    this.metadata,
    this.data,
  });

  AllProduct copyWith({
    String? message,
    Metadata? metadata,
    List<Product>? data,
  }) =>
      AllProduct(
        message: message ?? this.message,
        metadata: metadata ?? this.metadata,
        data: data ?? this.data,
      );

  factory AllProduct.fromJson(Map<String, dynamic> json) =>
      _$AllProductFromJson(json);

  Map<String, dynamic> toJson() => _$AllProductToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Metadata {
  @JsonKey(name: "totalPages")
  int? totalPages;
  @JsonKey(name: "currentPage")
  int? currentPage;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "totalCount")
  int? totalCount;
  @JsonKey(name: "hasPrevious")
  bool? hasPrevious;
  @JsonKey(name: "hasNext")
  bool? hasNext;

  Metadata({
    this.totalPages,
    this.currentPage,
    this.pageSize,
    this.totalCount,
    this.hasPrevious,
    this.hasNext,
  });

  Metadata copyWith({
    int? totalPages,
    int? currentPage,
    int? pageSize,
    int? totalCount,
    bool? hasPrevious,
    bool? hasNext,
  }) =>
      Metadata(
        totalPages: totalPages ?? this.totalPages,
        currentPage: currentPage ?? this.currentPage,
        pageSize: pageSize ?? this.pageSize,
        totalCount: totalCount ?? this.totalCount,
        hasPrevious: hasPrevious ?? this.hasPrevious,
        hasNext: hasNext ?? this.hasNext,
      );

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
