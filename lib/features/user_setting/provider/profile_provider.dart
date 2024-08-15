import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile.dart';
import '../settings_api.dart';

class ProfileUpdater extends AutoDisposeAsyncNotifier {
  @override
  FutureOr<UserProfile?> build() => null;

  Future<void> updateProfile({
    required String email,
    required UserProfile profile,
  }) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      final res = await settingsApi.updateProfile(
        email: email,
        profile: profile,
      );
      state = AsyncData(res);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

final profileUpdaterProvider =
    AutoDisposeAsyncNotifierProvider<ProfileUpdater, void>(ProfileUpdater.new);

class ProfileAvatarUpdater extends AutoDisposeAsyncNotifier {
  @override
  FutureOr<String?> build() => null;

  Future<void> updateProfileAvatar({
    required String email,
    required File image,
  }) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      final res = await settingsApi.updateProfileAvatar(
        email: email,
        image: image,
      );
      state = AsyncData(res);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

final profileAvatarUpdaterProvider =
    AutoDisposeAsyncNotifierProvider<ProfileAvatarUpdater, void>(
        ProfileAvatarUpdater.new);
