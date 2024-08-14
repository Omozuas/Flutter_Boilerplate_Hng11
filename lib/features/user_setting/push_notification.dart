import 'package:permission_handler/permission_handler.dart';

class PushNotificationServices {
  Future<void> requestPermission() async {
    PermissionStatus permissionStatus = await Permission.notification.request();
    if (permissionStatus != PermissionStatus.granted) {
      await Permission.notification.request();
    }
  }
}
