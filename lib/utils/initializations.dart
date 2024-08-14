import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import '../services/service_locator.dart';

final box = GetStorage();


 initializeApp()async{
  setupLocator();
  await dotenv.load();
  await GetStorage.init();
  return;
}