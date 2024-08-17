import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DashBoardModel {
  @JsonKey(name: "revenue")
  num? revenue;
  @JsonKey(name: "subscriptions")
  int? subscriptions;
  @JsonKey(name: "sales")
  int? sales;
  @JsonKey(name: "activeSubscription")
  int? activeSubscription;
  @JsonKey(name: "monthSales")
  List<MonthSale>? monthSales;

  DashBoardModel({
    this.revenue,
    this.subscriptions,
    this.sales,
    this.activeSubscription,
    this.monthSales,
  });

  DashBoardModel copyWith({
    int? revenue,
    int? subscriptions,
    int? sales,
    int? activeSubscription,
    List<MonthSale>? monthSales,
  }) =>
      DashBoardModel(
        revenue: revenue ?? this.revenue,
        subscriptions: subscriptions ?? this.subscriptions,
        sales: sales ?? this.sales,
        activeSubscription: activeSubscription ?? this.activeSubscription,
        monthSales: monthSales ?? this.monthSales,
      );

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => _$DashBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashBoardModelToJson(this);
}

@JsonSerializable()
class MonthSale {
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
  num? amount;
  @JsonKey(name: "reference")
  String? reference;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "paid_at")
  DateTime? paidAt;
  @JsonKey(name: "modified_at")
  DateTime? modifiedAt;

  MonthSale({
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

  MonthSale copyWith({
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
      MonthSale(
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

  factory MonthSale.fromJson(Map<String, dynamic> json) => _$MonthSaleFromJson(json);

  Map<String, dynamic> toJson() => _$MonthSaleToJson(this);
}
