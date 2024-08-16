import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/user_model.dart';
import 'models/user_profile.dart';
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

  Future<UserProfile> updateProfile({
    required String email,
    required UserProfile profile,
  }) async {
    final dio = ref.read(settingsDioProvider);
    try {
      final response = await dio.put(
        '/profile/$email',
        data: profile.toMap(),
      );
      return UserProfile.fromMap(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateProfileAvatar({
    required File image,
    required String email,
  }) async {
    final dio = ref.read(settingsDioProvider);
    final bytes = await image.readAsBytes();
    final multipart = MultipartFile.fromBytes(
      bytes,
      filename: image.path.split('/').last,
    );
    try {
      final response = await dio.multipartPUT(
        '/profile/$email/picture',
        data: {'DisplayPhoto': multipart},
      );
      return response['data']['avatar_url'];
    } catch (e) {
      rethrow;
    }
  }
}

final settingsApiProvider = Provider<SettingsApi>((ref) => SettingsApi(ref));
