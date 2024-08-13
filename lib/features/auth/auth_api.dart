import 'package:flutter_boilerplate_hng11/services/dio_provider.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import '../../services/response_model.dart';

class AuthApi {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();

  Future<ResponseModel?> registerSingleUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String? adminSecret,
  }) async {
    try {
      final response = await dioProvider.post(
        '/auth/register',
        data: {
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
          'password': password,
          'admin_secret': adminSecret ?? "123",
        },
      );
      return response;
    } catch (e) {
      debugPrint('Error during registration: ${e.toString()}');
      return null;
    }
  }

//You can start creating auth functions now

  Future<ResponseModel?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioProvider.post('auth/login', data: {
        'email': email,
        'password': password,
      });
      return response;
    } catch (e) {
      debugPrint('Error during login: ${e.toString()}');
      return null;
    }
  }

  /// Ensure you call updateAccessToken after login and registration success.
}
