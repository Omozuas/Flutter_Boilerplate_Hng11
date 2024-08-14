// import 'package:flutter/material.dart';
// import 'package:flutter_boilerplate_hng11/features/user_setting/models/user_models.dart';


// import '../../services/dio_provider.dart';
// import '../../services/service_locator.dart';

// class SettingsApi {
//   //Inject the DioProvider Dependency
//   DioProvider dioProvider = locator<DioProvider>();

// //You can start creating account settings functions now


//   Future<UserModels?> updateUser(
//     ) async {
//     try {
//       final response = await dioProvider.putUpdate(
//         '/auth/register',
//         data: {
//           'email': email,
//           'first_name': firstName,
//           'last_name': lastName,
//           'password': password,
//           'admin_secret': adminSecret ?? "123",
//         },
//       );
//       return response;
//     } catch (e) {
//       debugPrint('Error during registration: ${e.toString()}');
//       return null;
//     }
//   }


// }