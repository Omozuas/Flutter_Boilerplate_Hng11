
import 'package:flutter/material.dart';

import '../model/notification_response.dart';
import 'notification_card.dart';

class NotificationListView extends StatelessWidget {
  final List<Notifications> notifications;
  const NotificationListView({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (_, index) {
          Notifications notification = notifications[index];
          return NotificationCard(
            notification: notification,
          );
        });
  }
}
