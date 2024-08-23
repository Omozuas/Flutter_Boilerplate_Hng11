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
    required String confirmPassword,
    required String token,
  }) async {
    try {
      await _dio.put('auth/reset-password-mobile', data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmNewPassword': confirmPassword,
        'access_token': token
      });
    } catch (e) {
      rethrow;
    }
  }
}