import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:flutter_boilerplate_hng11/features/user_setting/models/notification_model.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/subscription_model.dart';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/dio_provider.dart';
import '../../services/service_locator.dart';
import 'models/user_model.dart';
import 'models/user_profile.dart';

class SettingsApi {
  SettingsApi(this.ref);
  final Ref ref;

  DioProvider dio = locator<DioProvider>();

//You can start creating account settings functions now

  // fetches a single user with a give id.
  // this doesn't really work well for now because the ResponseModel
  // being returned from "dioProvider.get" is wrong.

  Future<UserModel> getCurrentUser() async {
    try {
      final response = await dio.get('/auth/@me');
      return UserModel.fromMap(response?.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
      final response = await dio.get('/users/$id');
      return UserModel.fromMap(response?.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfile> updateProfile({
    required String email,
    required UserProfile profile,
  }) async {
    try {
      final response = await dio.putUpdate(
        '/profile/$email',
        data: profile.toMap(),
      );
      return UserProfile.fromMap(response?.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateProfileAvatar({
    required File file,
    required String email,
  }) async {
    try {
      final multipart = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: MediaType('image', 'png'),
      );
      final response = await dio.multipartPut(
        '/profile/$email/picture',
        data: {'DisplayPhoto': multipart},
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
      return response?.data['data']['avatar_url'] ?? '';
    } catch (e) {
      rethrow;
    }
  }

  Future<NotificationModel> getNotification(String userId) async {
    try {
      final response = await dio.get('/settings/notification-settings/$userId');
      return NotificationModel.fromMap(response?.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateNotification(
      {required NotificationModel notificationModel}) async {
    try {
      await dio.post(
        '/settings/notification-settings',
        data: notificationModel.toMap(),
      );
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<SubscriptionModel> getsubscriptionOrgId(
      {required String orgId}) async {
    try {
      final response = await dio.get(
        '/subscriptions/organization/$orgId',
      );
      return subscriptionModelFromJson(response?.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postSubscriptionFree({required String orgId}) async {
    try {
      await dio.post('/subscriptions/free', data: {'organizationId': orgId});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      await dio.putUpdate('/auth/password', data: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "confirmNewPassword": confirmNewPassword
      });
      return;
    } catch (e) {
      rethrow;
    }
  }
  Future<String> generateInviteLink({required String orgId}) async {
    try {
      final response = await dio.post('/invite/generate', data: {'organizationId': orgId});
      return response?.data['data']['inviteLink'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendInviteLink({required String email, required String inviteLink}) async {
    try {
      await dio.post('/invite/send', data: {'email': email, 'inviteLink': inviteLink});
    } catch (e) {
      rethrow;
    }
  }
}

final settingsApiProvider = Provider<SettingsApi>((ref) => SettingsApi(ref));
