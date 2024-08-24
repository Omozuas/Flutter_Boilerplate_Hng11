import 'package:flutter/material.dart';

import '../../../utils/context_extensions.dart';

class SubscriptionModel {
  final String id;
  final String userId;
  final String organizationId;
  final String transactionId;
  final SubscriptionPlan plan;
  final String frequency;
  final bool isActive;
  final int amount;
  final DateTime? createdAt;
  final DateTime? startDate;
  final DateTime? expiryDate;
  final DateTime? updatedAt;

  SubscriptionModel({
    required this.id,
    required this.userId,
    required this.organizationId,
    required this.transactionId,
    required this.plan,
    required this.frequency,
    required this.isActive,
    required this.amount,
    required this.startDate,
    required this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  SubscriptionModel copyWith({
    String? id,
    String? userId,
    String? organizationId,
    String? transactionId,
    SubscriptionPlan? plan,
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

  factory SubscriptionModel.fromMap(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json["id"] as String,
        userId: json["userId"] as String,
        organizationId: json["organizationId"] as String,
        transactionId: json["transactionId"] as String,
        plan: SubscriptionPlan.fromString(json["plan"]),
        frequency: json["frequency"] as String,
        isActive: json["isActive"] ?? false,
        amount: int.tryParse(json["amount"].toString()) ?? 0,
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        startDate: DateTime.tryParse(json["startDate"] ?? ''),
        expiryDate: DateTime.tryParse(json["expiryDate"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

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

enum SubscriptionPlan {
  free,
  basic,
  advanced;

  factory SubscriptionPlan.fromString(String data) {
    return SubscriptionPlan.values.firstWhere(
      (val) => val.name.toLowerCase() == data.toLowerCase(),
      orElse: () => SubscriptionPlan.free,
    );
  }
}

extension SubExtension on SubscriptionPlan {
  String getText(BuildContext ctx) {
    return switch (this) {
      SubscriptionPlan.free => ctx.text.free,
      SubscriptionPlan.basic => ctx.text.basic,
      SubscriptionPlan.advanced => ctx.text.advanced,
    };
  }

  int get amount {
    return switch (this) {
      SubscriptionPlan.free => 0,
      SubscriptionPlan.basic => 20,
      SubscriptionPlan.advanced => 50,
    };
  }

  String get frequency => 'month';

  String getAbout(BuildContext ctx) {
    return switch (this) {
      SubscriptionPlan.free => ctx.text.freeSubPlanAbout,
      SubscriptionPlan.basic => ctx.text.basicSubPlanAbout,
      SubscriptionPlan.advanced => ctx.text.advancedSubPlanAbout,
    };
  }

  List<String> getBulletDescriptions(BuildContext ctx) {
    return switch (this) {
      SubscriptionPlan.free => [
          ctx.text.freeSubPlanBulletDesc1,
          ctx.text.freeSubPlanBulletDesc2,
          ctx.text.freeSubPlanBulletDesc3,
        ],
      SubscriptionPlan.basic => [
          ctx.text.basicSubPlanBulletDesc1,
          ctx.text.basicSubPlanBulletDesc2,
          ctx.text.basicSubPlanBulletDesc3,
          ctx.text.basicSubPlanBulletDesc4,
        ],
      SubscriptionPlan.advanced => [
          ctx.text.advancedSubPlanBulletDesc1,
          ctx.text.advancedSubPlanBulletDesc2,
          ctx.text.advancedSubPlanBulletDesc3,
          ctx.text.advancedSubPlanBulletDesc4,
          ctx.text.advancedSubPlanBulletDesc5,
        ],
    };
  }

  String getDescription(BuildContext ctx) {
    return switch (this) {
      SubscriptionPlan.free => ctx.text.freeSubPlanDescription,
      SubscriptionPlan.basic => ctx.text.basicSubPlanDescription,
      SubscriptionPlan.advanced => ctx.text.advancedSubPlanDescription,
    };
  }

  String getUpgradeToText(BuildContext ctx) {
    return switch (this) {
      SubscriptionPlan.free => ctx.text.currentPlan,
      SubscriptionPlan.basic => ctx.text.upgradeToBasic,
      SubscriptionPlan.advanced => ctx.text.upgradeToAdvanced,
    };
  }

  List<(String, List<(String, Object)>)> getDetails(BuildContext ctx) {
    final text = ctx.text;
    return switch (this) {
      SubscriptionPlan.free => [
          (
            ctx.text.projectManagement,
            [
              (text.projects, text.upTo10),
              (text.fileUpload, text.tenGB),
              (text.userAccount, text.one),
              (text.teams, text.one),
            ],
          ),
          (
            text.shareAndCollab,
            [
              (text.integration, true),
              (text.guestAccess, true),
              (text.pageAnalysis, true),
              (text.taskManagement, true),
            ],
          ),
          (
            text.support,
            [
              (text.prioritySupport, true),
              (text.customerSupport, false),
            ],
          ),
        ],
      SubscriptionPlan.basic => [
          (
            text.projectManagement,
            [
              (text.projects, text.upTo100),
              (text.fileUpload, text.twentyGB),
              (text.userAccount, text.ten),
              (text.teams, text.unlimited),
            ],
          ),
          (
            text.shareAndCollab,
            [
              (text.integration, true),
              (text.guestAccess, true),
              (text.pageAnalysis, true),
              (text.taskManagement, true),
            ],
          ),
          (
            text.managementAndSecurity,
            [
              (text.teamSecurity, true),
              (text.dataBackup, true),
              (text.hIPAACompliance, true),
            ],
          ),
          (
            text.support,
            [
              (text.prioritySupport, true),
              (text.customerSupport, true),
            ],
          ),
        ],
      SubscriptionPlan.advanced => [
          (
            text.projectManagement,
            [
              (text.projects, text.upTo200),
              (text.fileUpload, text.fiftyGB),
              (text.userAccount, text.fifty),
              (text.teams, text.unlimited),
            ],
          ),
          (
            text.shareAndCollab,
            [
              (text.integration, true),
              (text.guestAccess, true),
              (text.pageAnalysis, true),
              (text.taskManagement, true),
            ],
          ),
          (
            text.managementAndSecurity,
            [
              (text.teamSecurity, true),
              (text.dataBackup, true),
              (text.hIPAACompliance, true),
            ],
          ),
          (
            text.support,
            [
              (text.prioritySupport, true),
              (text.customerSupport, true),
            ],
          ),
        ],
    };
  }
}
