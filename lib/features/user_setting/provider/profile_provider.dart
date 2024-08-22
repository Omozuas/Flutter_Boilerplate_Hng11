import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../models/notification_model.dart';
import '../models/subscription_model.dart';
import '../models/updatepassword_model.dart';
import '../models/user_model.dart';
import '../models/user_profile.dart';
import '../settings_api.dart';
import '../widgets/ref_extension.dart';

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
        fetchSubcription: AsyncData(null),

        fetchSubcriptionbyUserId: AsyncData(null),

        inviteLink: AsyncData(null),
        
        initiateSubscription: AsyncData(null),

        updatePassword: AsyncData(null));

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

  Future<void> getNotifications() async {
    final settingsApi = ref.read(settingsApiProvider);
    final user = state.user.sureValue;
    if (user == null) return;
    try {
      state = state.copyWith(notificationFetch: const AsyncLoading());
      final res = await settingsApi.getNotification(user.id);
      state = state.copyWith(notificationFetch: AsyncData(res));
    } catch (e) {
      state =
          state.copyWith(notificationFetch: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> updateNotifications(NotificationModel notificationModel) async {
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

  Future<void> getsubscriptionOrgId({required String orgId}) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(fetchSubcription: const AsyncLoading());
      final res = await settingsApi.getsubscriptionOrgId(orgId: orgId);
      state = state.copyWith(fetchSubcription: AsyncData(res));
    } catch (e) {
      state =
          state.copyWith(fetchSubcription: AsyncError(e, StackTrace.current));
    }
  }


   Future<void> getSubscriptionUserId({required String userId}) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(fetchSubcriptionbyUserId: const AsyncLoading());
      final res = await settingsApi.getSubscriptionUserId(userId: userId);
      state = state.copyWith(fetchSubcriptionbyUserId: AsyncData(res));
    } catch (e) {
      state =
          state.copyWith(fetchSubcriptionbyUserId: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> updatePassword(
      {required String newPassword,
      required String confirmNewPassword,
      required String oldPassword}) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(updatePassword: const AsyncLoading());
      await settingsApi.updatePassword(
          newPassword: newPassword,
          confirmNewPassword: confirmNewPassword,
          oldPassword: oldPassword);
      state = state.copyWith(updatePassword: const AsyncData(null));
    } catch (e) {
      state = state.copyWith(updatePassword: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> generateInviteLink({required String orgId}) async {
    final settingsApi = ref.read(settingsApiProvider);
    try {
      state = state.copyWith(inviteLink: const AsyncLoading());
      final inviteLink = await settingsApi.generateInviteLink(orgId: orgId);
      state = state.copyWith(inviteLink: AsyncData(inviteLink));
    } catch (e) {
      state = state.copyWith(inviteLink: AsyncError(e, StackTrace.current));
    }
  }

  // Method to send the invite link to the specified email
  Future<void> sendInviteLink({required String email}) async {
    final settingsApi = ref.read(settingsApiProvider);
    final inviteLink = state.inviteLink.sureValue;
    if (inviteLink == null) return;

    try {
      await settingsApi.sendInviteLink(email: email, inviteLink: inviteLink);
    } catch (e) {
      state = state.copyWith(inviteLink: AsyncError(e, StackTrace.current));
    }
  }

  Future<void> initiateSubscription({
    required String email,
      required double amount,
      required String plan,
      required String frequency}) async {
          final settingsApi = ref.read(settingsApiProvider);
        try{
  state = state.copyWith(initiateSubscription: const AsyncLoading());
      final initiateSubscription = await settingsApi.initiateSubscription(email: email, amount: amount, plan: plan, frequency: frequency);
      state = state.copyWith(inviteLink: AsyncData(initiateSubscription));
   
        }catch (e) {
                state = state.copyWith(initiateSubscription: AsyncError(e, StackTrace.current));

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
  final AsyncValue<SubscriptionModel?> fetchSubcriptionbyUserId;
  final AsyncValue<UpdatePasswordModel?> updatePassword;
  final AsyncValue<String?> inviteLink;
  final AsyncValue<String?> initiateSubscription;

  const ProfileProviderStates({
    required this.pickedImage,
    required this.user,
    required this.profileUpdater,
    required this.profileAvatarUpdater,
    required this.notificationUpdater,
    required this.notificationFetch,
    required this.fetchSubcription,
    required this.fetchSubcriptionbyUserId,
    required this.updatePassword,
    required this.inviteLink,
    required this.initiateSubscription, 
  });

  ProfileProviderStates copyWith(
      {XFile? pickedImage,
      AsyncValue<UserModel?>? user,
      AsyncValue<UserProfile?>? profileUpdater,
      AsyncValue<String?>? profileAvatarUpdater,
      AsyncValue<NotificationModel?>? notificationUpdater,
      AsyncValue<NotificationModel?>? notificationFetch,
      AsyncValue<SubscriptionModel?>? fetchSubcription,

        AsyncValue<SubscriptionModel?>? fetchSubcriptionbyUserId,

        AsyncValue<String?>? inviteLink,
        AsyncValue<String?>? initiateSubscription,

      AsyncValue<UpdatePasswordModel?>? updatePassword}) {
    return ProfileProviderStates(
        pickedImage: pickedImage ?? this.pickedImage,
        user: user ?? this.user,
        profileUpdater: profileUpdater ?? this.profileUpdater,
        profileAvatarUpdater: profileAvatarUpdater ?? this.profileAvatarUpdater,
        notificationUpdater: notificationUpdater ?? this.notificationUpdater,
        notificationFetch: notificationFetch ?? this.notificationFetch,
        fetchSubcription: fetchSubcription ?? this.fetchSubcription,

        fetchSubcriptionbyUserId: fetchSubcriptionbyUserId ?? this.fetchSubcriptionbyUserId,

        inviteLink: inviteLink ?? this.inviteLink,
        initiateSubscription: initiateSubscription ?? this.initiateSubscription,

        updatePassword: updatePassword ?? this.updatePassword);
  }
}
