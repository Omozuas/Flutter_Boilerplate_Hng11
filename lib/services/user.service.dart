import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../common_models/get_user_response.dart';
import 'service_locator.dart';

class UserService {
  String? userAccessToken;
  AuthUser user = AuthUser();
  GetStorage storageService = locator<GetStorage>();
  bool isUserLoggedIn = false;
  bool isUserOrganization = true;

  change(bool? userType, BuildContext context)async{
    isUserOrganization = userType??true;
    storageService.write("userType", isUserOrganization);
  }

  storeToken(String? token) async {
    if (token != null) {
      storageService.write('accessToken', token);
      userAccessToken = token;
      isUserLoggedIn = true;
    } else {
      isUserLoggedIn = false;
    }
    debugPrint("Is User Logged In:::: $isUserLoggedIn");
  }

  Future<String?> getToken() async {
    return storageService.read('accessToken');
  }

  initializer() async {
    String? userToken = storageService.read('accessToken');
    storeToken(userToken);
    if (userToken == null) {
      user = AuthUser();
      isUserLoggedIn = false;
    } else {
      isUserOrganization = true;
      isUserLoggedIn = true;
      await getStoreUser();
    }
    debugPrint("Is User Logged In:::: $isUserLoggedIn");
  }

  storeUser(AuthUser? response) async {
    debugPrint("Store User");
    if (response != null) {
      await storageService.write('user', jsonEncode(response));
      user = response;
      log("True");
    } else {
      debugPrint("Unable to store User");
      log("False");
    }
  }

  Future<AuthUser?> getStoreUser() async {
    String? data = storageService.read('user');
    if (data == null) {
      user = AuthUser();
      await logout();
      return null;
    } else {
      AuthUser userResponse = AuthUser.fromJson(jsonDecode(data));
      user = userResponse;
      return userResponse;
    }
  }

  logout() async {
    final box = locator<GetStorage>();
    box.remove('accessToken');
    box.remove('user');

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    // await storageService.deleteItem(key: DbTable.USER_TABLE_NAME);
    // await storageService.deleteItem(key: DbTable.TOKEN_TABLE_NAME);
    // await storageService.deleteItem(key: DbTable.LOGIN_TABLE_NAME);
    // await storageService.deleteItem(key: DbTable.BANK_LIST_TABLE_NAME);
    // await storageService.deleteItem(key: DbTable.STORE_ALL_CHATS_TABLE_NAME);
    // await storageService.deleteItem(key: DbTable.BOOKMARK_TABLE_NAME);
    // await storageService.deleteItem(key: DbTable.SERVICE_DETAIL_TABLE_NAME);
    // await locator<NotificationService>().channel?.sink.close();
    // await locator<ChatServices>().channel?.sink.close();
    // locator<ChatServices>().channel = null;
    // locator<NotificationService>().channel = null;
    // locator<NotificationService>().channel = null;
    // isUserLoggedIn = false;
    // user = User();
    // navigationService.navigateToAndRemoveUntil(loginScreenRoute);
    // showCustomToast("Session Has Ended, Log In to proceed");
  }
}
