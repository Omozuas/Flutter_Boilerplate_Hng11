
class GetAllProductsResponse {
  String? message;
  Metadata? metadata;
  List<ProductData>? data;

  GetAllProductsResponse({this.message, this.metadata, this.data});

  GetAllProductsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] =message;
    if (this.metadata != null) {
      data['metadata'] =metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? totalPages;
  int? currentPage;
  int? pageSize;
  int? totalCount;
  bool? hasPrevious;
  bool? hasNext;

  Metadata(
      {this.totalPages,
        this.currentPage,
        this.pageSize,
        this.totalCount,
        this.hasPrevious,
        this.hasNext});

  Metadata.fromJson(Map<String, dynamic> json) {
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    hasPrevious = json['hasPrevious'];
    hasNext = json['hasNext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    data['pageSize'] = pageSize;
    data['totalCount'] = totalCount;
    data['hasPrevious'] = hasPrevious;
    data['hasNext'] = hasNext;
    return data;
  }
}

class ProductData {
  String? id;
  String? name;
  String? description;
  double? price;
  String? category;
  String? createdAt;
  String? updatedAt;

  ProductData(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.category,
        this.createdAt,
        this.updatedAt});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] =id;
    data['name'] =name;
    data['description'] =description;
    data['price'] =price;
    data['category'] =category;
    data['created_at'] =createdAt;
    data['updated_at'] =updatedAt;
    return data;
  }
}
