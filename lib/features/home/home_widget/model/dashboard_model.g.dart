// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardModel _$DashBoardModelFromJson(Map<String, dynamic> json) =>
    DashBoardModel(
      revenue: (json['revenue'] as num?)?.toInt(),
      subscriptions: (json['subscriptions'] as num?)?.toInt(),
      sales: (json['sales'] as num?)?.toInt(),
      activeSubscription: (json['activeSubscription'] as num?)?.toInt(),
      monthSales: (json['monthSales'] as List<dynamic>?)
          ?.map((e) => MonthSale.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashBoardModelToJson(DashBoardModel instance) =>
    <String, dynamic>{
      'revenue': instance.revenue,
      'subscriptions': instance.subscriptions,
      'sales': instance.sales,
      'activeSubscription': instance.activeSubscription,
      'monthSales': instance.monthSales,
    };

MonthSale _$MonthSaleFromJson(Map<String, dynamic> json) => MonthSale(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      productId: json['product_id'] as String?,
      subscriptionId: json['subscription_id'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      partners: json['partners'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      reference: json['reference'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      paidAt: json['paid_at'] == null
          ? null
          : DateTime.parse(json['paid_at'] as String),
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
    );

Map<String, dynamic> _$MonthSaleToJson(MonthSale instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'product_id': instance.productId,
      'subscription_id': instance.subscriptionId,
      'type': instance.type,
      'status': instance.status,
      'partners': instance.partners,
      'amount': instance.amount,
      'reference': instance.reference,
      'created_at': instance.createdAt?.toIso8601String(),
      'paid_at': instance.paidAt?.toIso8601String(),
      'modified_at': instance.modifiedAt?.toIso8601String(),
    };
