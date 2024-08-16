import 'dart:async';

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
    );
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
          image: image,
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
  final XFile? pickedImage;
  final AsyncValue<UserModel?> user;
  final AsyncValue<UserProfile?> profileUpdater;
  final AsyncValue<String?> profileAvatarUpdater;

  const ProfileProviderStates({
    required this.pickedImage,
    required this.user,
    required this.profileUpdater,
    required this.profileAvatarUpdater,
  });

  ProfileProviderStates copyWith({
    XFile? pickedImage,
    AsyncValue<UserModel?>? user,
    AsyncValue<UserProfile?>? profileUpdater,
    AsyncValue<String?>? profileAvatarUpdater,
  }) {
    return ProfileProviderStates(
      pickedImage: pickedImage ?? this.pickedImage,
      user: user ?? this.user,
      profileUpdater: profileUpdater ?? this.profileUpdater,
      profileAvatarUpdater: profileAvatarUpdater ?? this.profileAvatarUpdater,
    );
  }
}
