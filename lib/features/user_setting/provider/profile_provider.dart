import 'dart:async';
import 'dart:io';

import 'package:flutter_boilerplate_hng11/features/user_setting/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile.dart';
import '../settings_api.dart';

class ProfileProvider extends AutoDisposeNotifier<ProfileProviderStates> {
  @override
  ProfileProviderStates build() {
    return const ProfileProviderStates(
      user: AsyncData(null),
      profileUpdater: AsyncData(null),
      profileAvatarUpdater: AsyncData(null),
    );
  }

  Future<void> getUser() async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(user: const AsyncLoading());
      final res =
          await settingsApi.getUser('292460cf-7a45-4c66-aa5b-4fbf74e037e3');
      state = state.copyWith(user: AsyncData(res));
    } catch (e) {
      state = state.copyWith(user: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> updateProfile({
    required String email,
    required UserProfile profile,
  }) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(profileUpdater: const AsyncLoading());
      final res = await settingsApi.updateProfile(
        email: email,
        profile: profile,
      );
      await getUser();
      state = state.copyWith(profileUpdater: AsyncData(res));
    } catch (e) {
      state = state.copyWith(profileUpdater: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> updateProfileAvatar({
    required String email,
    required File image,
  }) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(profileAvatarUpdater: const AsyncLoading());
      final res = await settingsApi.updateProfileAvatar(
        email: email,
        image: image,
      );
      await getUser();
      state = state.copyWith(profileAvatarUpdater: AsyncData(res));
    } catch (e) {
      state = state.copyWith(
          profileAvatarUpdater: AsyncError(e, StackTrace.current));
    }
  }
}

final profileProvider =
    AutoDisposeNotifierProvider<ProfileProvider, ProfileProviderStates>(
        ProfileProvider.new);

class ProfileProviderStates {
  final AsyncValue<UserModel?> user;
  final AsyncValue<UserProfile?> profileUpdater;
  final AsyncValue<String?> profileAvatarUpdater;

  const ProfileProviderStates({
    required this.user,
    required this.profileUpdater,
    required this.profileAvatarUpdater,
  });

  ProfileProviderStates copyWith({
    AsyncValue<UserModel?>? user,
    AsyncValue<UserProfile?>? profileUpdater,
    AsyncValue<String?>? profileAvatarUpdater,
  }) {
    return ProfileProviderStates(
      user: user ?? this.user,
      profileUpdater: profileUpdater ?? this.profileUpdater,
      profileAvatarUpdater: profileAvatarUpdater ?? this.profileAvatarUpdater,
    );
  }
}
