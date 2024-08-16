
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/services/user.service.dart';

import 'package:flutter_boilerplate_hng11/services/user.service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';

import '../../../services/dio_provider.dart';
import '../../../services/service_locator.dart';
import 'model/dashboard_model.dart';

class DashboardApi implements DashboardApiContract {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();
  UserService _userService = locator<UserService>();
  GetStorage _storageService = locator<GetStorage>();

  @override
  Future<DashBoardModel> getDashboardData() async {
    try {
      var response = await dioProvider.get("Dashboards", query: {
        "userId": _userService.user.id
      });
      return DashBoardModel.fromJson(jsonDecode(jsonEncode(response?.data)));
    } catch (e) {
      rethrow;
    }
  }

//You can start creating product listing functions now
}

abstract class DashboardApiContract {
  Future getDashboardData();

}