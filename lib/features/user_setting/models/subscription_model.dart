import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String str) =>
    SubscriptionModel.fromJson(json.decode(str));

String subscriptionModelToJson(SubscriptionModel data) =>
    json.encode(data.toJson());

class SubscriptionModel {
  String? id;
  String? userId;
  String? organizationId;
  String? transactionId;
  String? plan;
  String? frequency;
  bool? isActive;
  int? amount;
  DateTime? startDate;
  DateTime? expiryDate;
  DateTime? createdAt;
  dynamic updatedAt;

  SubscriptionModel({
    this.id,
    this.userId,
    this.organizationId,
    this.transactionId,
    this.plan,
    this.frequency,
    this.isActive,
    this.amount,
    this.startDate,
    this.expiryDate,
    this.createdAt,
    this.updatedAt,
  });
  SubscriptionModel copyWith({
    String? id,
    String? userId,
    String? organizationId,
    String? transactionId,
    String? plan,
    String? frequency,
    bool? isActive,
    int? amount,
    DateTime? startDate,
    DateTime? expiryDate,
    DateTime? createdAt,
    dynamic updatedAt,
  }) {
    return SubscriptionModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      transactionId: transactionId ?? this.transactionId,
      plan: plan ?? this.plan,
      frequency: frequency ?? this.frequency,
      isActive: isActive ?? this.isActive,
      amount: amount ?? this.amount,
      startDate: startDate ?? this.startDate,
      expiryDate: expiryDate ?? this.expiryDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory SubscriptionModel.fromJson(String source) =>
      SubscriptionModel.fromMap(json.decode(source) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  factory SubscriptionModel.fromMap(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json["id"],
        userId: json["userId"],
        organizationId: json["organizationId"],
        transactionId: json["transactionId"],
        plan: json["plan"],
        frequency: json["frequency"],
        isActive: json["isActive"],
        amount: json["amount"],
        startDate: DateTime.parse(json["startDate"]),
        expiryDate: DateTime.parse(json["expiryDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "organizationId": organizationId,
        "transactionId": transactionId,
        "plan": plan,
        "frequency": frequency,
        "isActive": isActive,
        "amount": amount,
        "startDate": startDate!.toIso8601String(),
        "expiryDate": expiryDate!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt,
      };

  @override
  bool operator ==(covariant SubscriptionModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
