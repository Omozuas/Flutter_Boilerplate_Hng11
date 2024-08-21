// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      cartQuantity: (json['cartQuantity'] as num?)?.toInt(),
      category: json['category'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      image: json['image'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      size: json['size'] as String?,
      status: json['status'] as String?,
      costPrice: (json['cost_price'] as num?)?.toInt(),
      deleteAt: json['delete_at'] == null
          ? null
          : DateTime.parse(json['delete_at'] as String),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'cartQuantity': instance.cartQuantity,
      'category': instance.category,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
      'quantity': instance.quantity,
      'size': instance.size,
      'status': instance.status,
      'cost_price': instance.costPrice,
      'delete_at': instance.deleteAt?.toIso8601String(),
    };
