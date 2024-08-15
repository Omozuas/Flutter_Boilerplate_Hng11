import 'package:flutter_boilerplate_hng11/services/dio_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DioProvider());
  locator.registerLazySingleton(() => GetStorage());
}
