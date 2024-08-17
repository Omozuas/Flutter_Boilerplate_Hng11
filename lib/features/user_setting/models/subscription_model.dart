import 'dart:convert';

// class SubscriptionModel {
//   final String? id;
//   final String? userId;
//   final bool? organizationId;
//   final bool? transactionId;
//   final bool? plan;
//   final bool? frequency;
//   final bool? isActive;
//   final bool? activityWorkspaceSlack;
//   final bool? slackNotifications;
//   final bool? announcementsUpdateSlack;

//   const SubscriptionModel(
//       {required this.userId,
//       required this.id,
//       required this.organizationId,
//       required this.transactionId,
//       required this.plan,
//       required this.frequency,
//       required this.isActive,
//       required this.activityWorkspaceSlack,
//       required this.slackNotifications,
//       required this.announcementsUpdateSlack});

//   SubscriptionModel copyWith(
//       {String? userId,
//       String? id,
//       bool? organizationId,
//       bool? transactionId,
//       bool? plan,
//       bool? frequency,
//       bool? isActive,
//       bool? activityWorkspaceSlack,
//       bool? slackNotifications,
//       bool? announcementsUpdateSlack}) {
//     return SubscriptionModel(
//         userId: userId ?? this.userId,
//         id: id ?? this.id,
//         organizationId:
//             organizationId ?? this.organizationId,
//         transactionId:
//             transactionId ?? this.transactionId,
//         plan: plan ?? this.plan,
//         frequency: frequency ?? this.frequency,
//         isActive:
//             isActive ?? this.isActive,
//         activityWorkspaceSlack:
//             activityWorkspaceSlack ?? this.activityWorkspaceSlack,
//         slackNotifications: slackNotifications ?? this.slackNotifications,
//         announcementsUpdateSlack:
//             announcementsUpdateSlack ?? this.announcementsUpdateSlack);
//   }

//   factory SubscriptionModel.fromMap(Map<String, dynamic> map) {
//     // if (map['data'] == false) {
//     //   return const SubscriptionModel(
//     //       id: '',
//     //       userId: '',
//     //       organizationId: false,
//     //       transactionId: false,
//     //       plan: false,
//     //       frequency: false,
//     //       isActive: false,
//     //       activityWorkspaceSlack: false,
//     //       slackNotifications: false,
//     //       announcementsUpdateSlack: false);
//     // }
//     return SubscriptionModel(
//         id: map['id'],
//         userId: map['userId'] as String,
//         organizationId: map['organizationId'] as bool,
//         transactionId: map['transactionId'] as bool,
//         plan: map['plan'] as bool,
//         frequency: map['frequency'] as bool,
//         isActive: map['isActive'] as bool,
//         activityWorkspaceSlack: map['activity_workspace_slack'] as bool,
//         slackNotifications: map['slack_notifications'] as bool,
//         announcementsUpdateSlack: map['announcements_update_slack'] as bool);
//   }

//   factory SubscriptionModel.fromJson(String source) =>
//       SubscriptionModel.fromMap(json.decode(source) as Map<String, dynamic>);
//   String toJson() => json.encode(toMap());

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       "id": id,
//       "userId": userId,
//       "organizationId": organizationId,
//       "transactionId": transactionId,
//       "plan": plan,
//       "frequency": frequency,
//       "isActive": isActive,
//       "activity_workspace_slack": activityWorkspaceSlack,
//       "slack_notifications": slackNotifications,
//       "announcements_update_slack": announcementsUpdateSlack
//     };
//   }

//   @override
//   String toString() {
//     return 'SubscriptionModel( id: $id, userId: $userId, organizationId: $organizationId, transactionId: $transactionId, plan: $plan, frequency: $frequency , isActive: $isActive, activity_workspace_slack: $activityWorkspaceSlack, slack_notifications: $slackNotifications, announcements_update_slack: $announcementsUpdateSlack)';
//   }

//   @override
//   bool operator ==(covariant SubscriptionModel other) {
//     if (identical(this, other)) return true;

//     return other.id == id;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode;
//   }
// }

// To parse this JSON data, do
//
//     final SubscriptionModel = SubscriptionModelFromJson(jsonString);

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

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
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

  Map<String, dynamic> toJson() => {
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
}
