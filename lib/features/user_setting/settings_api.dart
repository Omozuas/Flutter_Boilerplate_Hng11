import '../../services/dio_provider.dart';
import '../../services/service_locator.dart';
import 'models/user_model.dart';

class SettingsApi {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();

//You can start creating account settings functions now

  // fetches a single user with a give id.
  // this doesn't really work well for now because the ResponseModel
  // being returned from "dioProvider.get" is wrong.
  Future<User> getUser(String id) async {
    try {
      final response = await dioProvider.get('/users/$id');
      return User.fromMap(response.data['user']);
    } catch (e) {
      rethrow;
    }
  }
}
