import 'dart:convert';

import '../../../services/dio_provider.dart';
import '../../../services/service_locator.dart';
import 'model/notification_response.dart';

class NotificationApi implements NotificationApiContract {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();

  @override
  Future<List<Notifications>> getAllNotifications() async {
    try {
      var response = await dioProvider.get("notifications/GetAll");
      return NotificationResponse.fromJson(jsonDecode(jsonEncode(response?.data))).data?.notifications??[];
    } catch (e) {
      return [];
    }
  }

//You can start creating product listing functions now
}

abstract class NotificationApiContract {
  Future<List<Notifications>> getAllNotifications();
}
