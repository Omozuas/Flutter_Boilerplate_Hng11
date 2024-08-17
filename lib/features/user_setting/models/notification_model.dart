import 'dart:convert';

class NotificationModel {
  final String? id;
  final String? userId;
  final bool? mobilePushNotifications;
  final bool? activityWorkspaceEmail;
  final bool? emailNotifications;
  final bool? emailDigests;
  final bool? announcementsUpdateEmails;
  final bool? activityWorkspaceSlack;
  final bool? slackNotifications;
  final bool? announcementsUpdateSlack;

  const NotificationModel(
      {required this.userId,
      required this.id,
      required this.mobilePushNotifications,
      required this.activityWorkspaceEmail,
      required this.emailNotifications,
      required this.emailDigests,
      required this.announcementsUpdateEmails,
      required this.activityWorkspaceSlack,
      required this.slackNotifications,
      required this.announcementsUpdateSlack});

  NotificationModel copyWith(
      {String? userId,
      String? id,
      bool? mobilePushNotifications,
      bool? activityWorkspaceEmail,
      bool? emailNotifications,
      bool? emailDigests,
      bool? announcementsUpdateEmails,
      bool? activityWorkspaceSlack,
      bool? slackNotifications,
      bool? announcementsUpdateSlack}) {
    return NotificationModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        mobilePushNotifications:
            mobilePushNotifications ?? this.mobilePushNotifications,
        activityWorkspaceEmail:
            activityWorkspaceEmail ?? this.activityWorkspaceEmail,
        emailNotifications: emailNotifications ?? this.emailNotifications,
        emailDigests: emailDigests ?? this.emailDigests,
        announcementsUpdateEmails:
            announcementsUpdateEmails ?? this.announcementsUpdateEmails,
        activityWorkspaceSlack:
            activityWorkspaceSlack ?? this.activityWorkspaceSlack,
        slackNotifications: slackNotifications ?? this.slackNotifications,
        announcementsUpdateSlack:
            announcementsUpdateSlack ?? this.announcementsUpdateSlack);
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    // if (map['data'] == false) {
    //   return const NotificationModel(
    //       id: '',
    //       userId: '',
    //       mobilePushNotifications: false,
    //       activityWorkspaceEmail: false,
    //       emailNotifications: false,
    //       emailDigests: false,
    //       announcementsUpdateEmails: false,
    //       activityWorkspaceSlack: false,
    //       slackNotifications: false,
    //       announcementsUpdateSlack: false);
    // }
    return NotificationModel(
        id: map['id'],
        userId: map['user_id'] as String,
        mobilePushNotifications: map['mobile_push_notifications'] as bool,
        activityWorkspaceEmail: map['activity_workspace_email'] as bool,
        emailNotifications: map['email_notifications'] as bool,
        emailDigests: map['email_digests'] as bool,
        announcementsUpdateEmails: map['announcements_update_emails'] as bool,
        activityWorkspaceSlack: map['activity_workspace_slack'] as bool,
        slackNotifications: map['slack_notifications'] as bool,
        announcementsUpdateSlack: map['announcements_update_slack'] as bool);
  }

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "user_id": userId,
      "mobile_push_notifications": mobilePushNotifications,
      "activity_workspace_email": activityWorkspaceEmail,
      "email_notifications": emailNotifications,
      "email_digests": emailDigests,
      "announcements_update_emails": announcementsUpdateEmails,
      "activity_workspace_slack": activityWorkspaceSlack,
      "slack_notifications": slackNotifications,
      "announcements_update_slack": announcementsUpdateSlack
    };
  }

  @override
  String toString() {
    return 'NotificationModel( id: $id, user_id: $userId, mobile_push_notifications: $mobilePushNotifications, activity_workspace_email: $activityWorkspaceEmail, email_notifications: $emailNotifications, email_digests: $emailDigests , announcements_update_emails: $announcementsUpdateEmails, activity_workspace_slack: $activityWorkspaceSlack, slack_notifications: $slackNotifications, announcements_update_slack: $announcementsUpdateSlack)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
