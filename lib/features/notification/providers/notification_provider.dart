import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/notification_response.dart';
import '../notification_api.dart';

class NotificationState {
  final bool overViewLoading;
  final bool trendLoading;
  final List<Notifications> notifications;
  final int unReadNotificationCount;

  NotificationState({
    required this.overViewLoading,
    required this.trendLoading,
    required this.notifications,
    required this.unReadNotificationCount,
  });

  NotificationState copyWith({
    bool? overViewLoading,
    bool? trendLoading,
    List<Notifications>? notifications,
    int? unReadNotificationCount,
  }) {
    return NotificationState(
        overViewLoading: overViewLoading ?? this.overViewLoading,
        trendLoading: trendLoading ?? this.trendLoading,
        unReadNotificationCount: unReadNotificationCount ?? this.unReadNotificationCount,
        notifications: notifications ?? []);
  }
}

final notificationProvider =
    StateNotifierProvider<NotificationProvider, NotificationState>((ref) {
  return NotificationProvider();
});

class NotificationProvider extends StateNotifier<NotificationState> {
  NotificationProvider()
      : super(NotificationState(
            overViewLoading: false, trendLoading: false, unReadNotificationCount: 0, notifications: [])) {
    getNotifications();
  }

  set setNotificationLoading(bool value) {
    state = state.copyWith(overViewLoading: value);
  }

  set setTrendLoading(bool value) {
    state = state.copyWith(trendLoading: value);
  }

  set setNotifications(List<Notifications> value) {
    state = state.copyWith(notifications: value);
  }

  set setUnreadNotificationCount(int value) {
    state = state.copyWith(unReadNotificationCount: value);
  }

  Future<List<Notifications>> getNotifications() async {
    setNotificationLoading = true;
    try {
      List<Notifications> res = await NotificationApi().getAllNotifications();
      if (res.isNotEmpty) {
        setNotifications = res;
        List<Notifications> unread = state.notifications.where((e)=> e.isRead == false).toList();
        setUnreadNotificationCount = unread.length;
      }
      setTrendLoading = true;
      setNotificationLoading = false;
      return res;
    } catch (err) {
      return [];
    }
  }
}
