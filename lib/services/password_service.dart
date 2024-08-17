import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL']!));
});

final passwordServiceProvider = Provider<PasswordService>((ref) {
  final dio = ref.read(dioProvider);
  return PasswordService(dio);
});

class PasswordService {
  final Dio _dio;

  PasswordService(this._dio);

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.put('auth/password', data: {
        'current_password': currentPassword,
        'new_password': newPassword,
      });
      // Handle the response as necessary
     
      print('Password updated successfully: ${response.data}');
    } catch (e) {

      rethrow;
    }
  }
}
