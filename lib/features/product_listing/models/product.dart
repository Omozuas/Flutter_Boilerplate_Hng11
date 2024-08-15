class Product {
  Product({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.costPrice,
    required this.quantity,
    required this.size,
    required this.stockStatus,
    required this.deletedAt,
  });

  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String name;
  final String description;
  final String category;
  final String image;
  final double price;
  final double costPrice;
  final int quantity;
  final String size;
  final String stockStatus;
  final DateTime? deletedAt;

  Product copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    String? category,
    String? image,
    double? price,
    double? costPrice,
    int? quantity,
    String? size,
    String? stockStatus,
    DateTime? deletedAt,
  }) {
    return Product(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      price: price ?? this.price,
      costPrice: costPrice ?? this.costPrice,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      stockStatus: stockStatus ?? this.stockStatus,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      name: map['name'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      costPrice: map['costPrice'] as double,
      quantity: map['quantity'] as int,
      size: map['size'] as String,
      stockStatus: map['stockStatus'] as String,
      deletedAt: DateTime.tryParse(map['deletedAt'] ?? ''),
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, description: $description, category: $category, image: $image, price: $price, costPrice: $costPrice, quantity: $quantity, size: $size, stockStatus: $stockStatus, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.name == name &&
        other.description == description &&
        other.category == category &&
        other.image == image &&
        other.price == price &&
        other.costPrice == costPrice &&
        other.quantity == quantity &&
        other.size == size &&
        other.stockStatus == stockStatus &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        name.hashCode ^
        description.hashCode ^
        category.hashCode ^
        image.hashCode ^
        price.hashCode ^
        costPrice.hashCode ^
        quantity.hashCode ^
        size.hashCode ^
        stockStatus.hashCode ^
        deletedAt.hashCode;
  }
}
