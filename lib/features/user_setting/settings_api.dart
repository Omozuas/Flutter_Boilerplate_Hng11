import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/list_members_model.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_boilerplate_hng11/features/user_setting/models/notification_model.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/subscription_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';

import '../../services/dio_provider.dart';
import '../../services/service_locator.dart';
import 'models/user_model.dart';
import 'models/user_profile.dart';

class SettingsApi {
  GetStorage storage = GetStorage();
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

  Future<UserProfile> updateProfile(UserProfile profile) async {
    try {
      final response = await dio.putUpdate('/profile', data: profile.toMap());
      return UserProfile.fromMap(response?.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateProfileAvatar(File file) async {
    try {
      final multipart = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: MediaType('image', 'png'),
      );
      final response = await dio.multipartPut(
        '/profile/picture',
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
      return SubscriptionModel.fromMap(response?.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<SubscriptionModel> getSubscriptionUserId(String userId) async {
    try {
      final response = await dio.get(
        '/subscriptions/user/$userId',
      );
      return SubscriptionModel.fromMap(response?.data['data']);
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
      final response =
      await dio.get('organisations/$orgId/invites');
      return response?.data['data']['invite_link'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendInviteLink(
      {required String email, required String inviteLink}) async {
    try {
      await dio.post('/invite/send',
          data: {'email': email, 'inviteLink': inviteLink});
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Members>> getOrganisationMembers({required String orgId}) async {
    try {
      final response = await dio.get('/organisations/$orgId/users');
      List<dynamic> usersJson = response?.data['data']['users'];
      return usersJson.map((json) => Members.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> initiateSubscription({
    required String email,
    required double amount,
    required String plan,
    required String frequency,
  }) async {
    try {
      final response = await dio.post('/transactions/initiate/subscription',
          data: {
            "email": email,
            "amount": amount,
            "plan": plan,
            "frequency": frequency
          });
      return response?.data['data']['authorization_url'];
    } catch (e) {
      rethrow;
    }
  }
}

final settingsApiProvider = Provider<SettingsApi>((ref) => SettingsApi(ref));
