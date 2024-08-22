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
        notifications: notifications ?? []
    );
  }
}

final notificationProvider =
StateNotifierProvider<NotificationProvider, NotificationState>((ref) {
  return NotificationProvider();
});

class NotificationProvider extends StateNotifier<NotificationState> {

  NotificationProvider()
      : super(
      NotificationState(
        overViewLoading: false,
        trendLoading: false,
        notifications: []
      )
  );

  set setNotificationLoading(bool value){
    state = state.copyWith(overViewLoading: value);
  }

  set setNotifications(List<Notifications> value){
    state = state.copyWith(notifications: value);
  }

  Stream<List<Notifications>> getNotifications() async* {
    setNotificationLoading = state.notifications.isEmpty? true: false;
    while(true){
      List<Notifications> res = await NotificationApi().getAllNotifications();
      if(res.isNotEmpty){
        setNotifications = res;
      }
      yield res;
      await Future.delayed(const Duration(seconds: 5));
      setNotificationLoading = false;
    }
  }

}