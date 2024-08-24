import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/notification_response.dart';
import '../notification_api.dart';

class NotificationState {
  final bool overViewLoading;
  final bool trendLoading;
  final List<Notifications> notifications;

  NotificationState({
    required this.overViewLoading,
    required this.trendLoading,
    required this.notifications,
  });

  NotificationState copyWith({
    bool? overViewLoading,
    bool? trendLoading,
    List<Notifications>? notifications,
  }) {
    return NotificationState(
        overViewLoading: overViewLoading ?? this.overViewLoading,
        trendLoading: trendLoading ?? this.trendLoading,
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
            overViewLoading: false, trendLoading: false, notifications: [])) {
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

  Future<List<Notifications>> getNotifications() async {
    setNotificationLoading = true;
    try {
      List<Notifications> res = await NotificationApi().getAllNotifications();
      if (res.isNotEmpty) {
        setNotifications = res;
      }
      setTrendLoading = true;
      setNotificationLoading = false;
      return res;
    } catch (err) {
      return [];
    }
  }
}
