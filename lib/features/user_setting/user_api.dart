import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/get_members_model.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/status_model.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/settings_api.dart';

import '../../services/service_locator.dart';

class SettingsApi {
  //Inject the DioProvider Dependency
  UserDioProvider dioProvider = locator<UserDioProvider>();
  Future<void> addToken(token)async{
    dioProvider.updateAccessToken(token);
  }

//You can start creating account settings functions now

// User settings API

  Future<RequestUserInfo?> updateUser( String username,
   String jobTitle, 
   String pronouns,
    String department,
    String language,
    String email,
    String socialLinks,
    String bio,
    String region,
    String timezones,
    String profilePicUrl,
    String id,
    ) async {
    try {
      final response = await dioProvider.putUpdate(
        '/users/$id',
        data: {
          "username": username,
        "jobTitle": jobTitle,
        "pronouns": pronouns,
        "department": department,
        "email": email,
        "bio": bio,
        "social_links": socialLinks,
        "language": language,
        "region": region,
        "timezones": timezones,
        "profile_pic_url": profilePicUrl,
        },
      );
      return response;
    } catch (e) {
      debugPrint('Error during registration: ${e.toString()}');
      return null;
    }
  }






  // Organization settings API
 Future<GetMembers?> getAllMembersOfAnOrganizationById(
  
    String id,
    ) async {
    try {
      final response = await dioProvider.getAllMembersOrganization(
        '/organisations/$id/users',

      );
      return response;
    } catch (e) {
      debugPrint('Error during registration: ${e.toString()}');
      return null;
    }
  }


}