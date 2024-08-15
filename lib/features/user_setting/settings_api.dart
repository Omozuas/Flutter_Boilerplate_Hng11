import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/user_model.dart';
import 'provider/settings_dio_provider.dart';

class SettingsApi {
  SettingsApi(this.ref);
  final Ref ref;

//You can start creating account settings functions now

  // fetches a single user with a give id.
  // this doesn't really work well for now because the ResponseModel
  // being returned from "dioProvider.get" is wrong.
  Future<UserModel> getUser(String id) async {
    final dio = ref.read(settingsDioProvider);
    try {
      final response = await dio.get('/users/$id');
      return UserModel.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }
}

final settingsApiProvider = Provider<SettingsApi>((ref) => SettingsApi(ref));
