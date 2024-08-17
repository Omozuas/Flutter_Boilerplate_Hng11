import 'dart:async';
import 'dart:io';

import 'package:flutter_boilerplate_hng11/features/user_setting/models/notification_model.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/subscription_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';
import '../models/user_profile.dart';
import '../settings_api.dart';

class ProfileProvider extends AutoDisposeNotifier<ProfileProviderStates> {
  @override
  ProfileProviderStates build() {
    return const ProfileProviderStates(
        pickedImage: null,
        user: AsyncData(null),
        profileUpdater: AsyncData(null),
        profileAvatarUpdater: AsyncData(null),
        notificationUpdater: AsyncData(null),
        notificationFetch: AsyncData(null),
        fetchSubcription: AsyncData(null));
  }

  Future<void> pickImage(ImageSource? source) async {
    if (source == null) {
      state = state.copyWith(pickedImage: null);

      return;
    }
    final XFile? image = await ImagePicker().pickImage(source: source);

    if (image != null) {
      state = state.copyWith(pickedImage: image);
      return;
    }

    state = state.copyWith(pickedImage: null);
    return;
  }

  Future<void> getUser() async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(user: const AsyncLoading());
      final res = await settingsApi.getCurrentUser();
      state = state.copyWith(user: AsyncData(res));
    } catch (e) {
      state = state.copyWith(user: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> updateProfile({
    required String email,
    required UserProfile profile,
    XFile? image,
  }) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(profileUpdater: const AsyncLoading());
      final res = await settingsApi.updateProfile(
        email: email,
        profile: profile,
      );
      if (image != null) {
        await settingsApi.updateProfileAvatar(
          email: email,
          file: File(image.path),
        );
      }
      await getUser();
      state = state.copyWith(profileUpdater: AsyncData(res));
    } catch (e) {
      state = state.copyWith(profileUpdater: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> updateProfileAvatar({
    required String email,
    required XFile image,
  }) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(profileAvatarUpdater: const AsyncLoading());
      final res = await settingsApi.updateProfileAvatar(
        email: email,
        file: File(image.path),
      );
      await getUser();
      state = state.copyWith(profileAvatarUpdater: AsyncData(res));
    } catch (e) {
      state = state.copyWith(
          profileAvatarUpdater: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> getNotifications({required String userId}) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(notificationFetch: const AsyncLoading());
      final res = await settingsApi.getNotification(userId);
      state = state.copyWith(notificationFetch: AsyncData(res));
    } catch (e) {
      state =
          state.copyWith(notificationFetch: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> updateNotifications(
      {required String userId,
      required NotificationModel notificationModel}) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(notificationUpdater: const AsyncLoading());
      await settingsApi.updateNotification(
          notificationModel: notificationModel);
      state = state.copyWith(notificationUpdater: const AsyncData(null));
    } catch (e) {
      state = state.copyWith(
          notificationUpdater: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> getsubscription({required String orgId}) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(fetchSubcription: const AsyncLoading());
      final res = await settingsApi.getsubscription(orgId: orgId);
      state = state.copyWith(fetchSubcription: AsyncData(res));
    } catch (e) {
      state =
          state.copyWith(fetchSubcription: AsyncError(e, StackTrace.current));
    }
  }
}

final profileProvider =
    AutoDisposeNotifierProvider<ProfileProvider, ProfileProviderStates>(
        ProfileProvider.new);

class ProfileProviderStates {
  final XFile? pickedImage;
  final AsyncValue<UserModel?> user;
  final AsyncValue<UserProfile?> profileUpdater;
  final AsyncValue<String?> profileAvatarUpdater;
  final AsyncValue<NotificationModel?> notificationUpdater;
  final AsyncValue<NotificationModel?> notificationFetch;
  final AsyncValue<SubscriptionModel?> fetchSubcription;

  const ProfileProviderStates({
    required this.pickedImage,
    required this.user,
    required this.profileUpdater,
    required this.profileAvatarUpdater,
    required this.notificationUpdater,
    required this.notificationFetch,
    required this.fetchSubcription,
  });

  ProfileProviderStates copyWith(
      {XFile? pickedImage,
      AsyncValue<UserModel?>? user,
      AsyncValue<UserProfile?>? profileUpdater,
      AsyncValue<String?>? profileAvatarUpdater,
      AsyncValue<NotificationModel?>? notificationUpdater,
      AsyncValue<NotificationModel?>? notificationFetch,
      AsyncValue<SubscriptionModel?>? fetchSubcription}) {
    return ProfileProviderStates(
        pickedImage: pickedImage ?? this.pickedImage,
        user: user ?? this.user,
        profileUpdater: profileUpdater ?? this.profileUpdater,
        profileAvatarUpdater: profileAvatarUpdater ?? this.profileAvatarUpdater,
        notificationUpdater: notificationUpdater ?? this.notificationUpdater,
        notificationFetch: notificationFetch ?? this.notificationFetch,
        fetchSubcription: fetchSubcription ?? this.fetchSubcription);
  }
}
