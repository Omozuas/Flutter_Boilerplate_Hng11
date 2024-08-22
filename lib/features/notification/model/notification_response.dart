class NotificationResponse {
  NotificationData? data;
  String? message;
  int? statusCode;

  NotificationResponse({this.data, this.message, this.statusCode});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? NotificationData.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status_code'] = statusCode;
    return data;
  }
}

class NotificationData {
  int? totalNotificationCount;
  int? totalUnreadNotificationCount;
  List<Notifications>? notifications;

  NotificationData(
      {this.totalNotificationCount,
        this.totalUnreadNotificationCount,
        this.notifications});

  NotificationData.fromJson(Map<String, dynamic> json) {
    totalNotificationCount = json['total_notification_count'];
    totalUnreadNotificationCount = json['total_unread_notification_count'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total_notification_count'] = totalNotificationCount;
    data['total_unread_notification_count'] = totalUnreadNotificationCount;
    if (notifications != null) {
      data['notifications'] =
          notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String? id;
  String? userId;
  bool? isRead;
  String? message;
  String? createdAt;
  String? updatedAt;

  Notifications(
      {this.id,
        this.userId,
        this.isRead,
        this.message,
        this.createdAt,
        this.updatedAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    isRead = json['is_read'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['is_read'] = isRead;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
