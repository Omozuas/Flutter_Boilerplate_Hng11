import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_boilerplate_hng11/services/user.service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import '../services/service_locator.dart';

initializeApp() async {
  await GetStorage.init();
  setupLocator();
  await dotenv.load();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: dotenv.env['apiKey']!,
    appId: dotenv.env['appId']!,
    messagingSenderId: dotenv.env['messagingSenderId']!,
    projectId: dotenv.env['projectId']!,
  ));

  await locator<UserService>().initializer();
  return;
}
