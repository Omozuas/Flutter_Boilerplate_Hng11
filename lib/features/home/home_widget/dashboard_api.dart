
import 'dart:convert';

import 'package:flutter_boilerplate_hng11/services/user.service.dart';

import 'package:get_storage/get_storage.dart';

import '../../../services/dio_provider.dart';
import '../../../services/service_locator.dart';
import 'model/dashboard_model.dart';
import 'model/organization_overview_model.dart';
import 'model/sales_trend_model.dart';

class DashboardApi implements DashboardApiContract {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();
  final UserService _userService = locator<UserService>();
  final GetStorage _storageService = locator<GetStorage>();

  @override
  Future<DashBoardModel> getDashboardData() async {
    print(_userService.user.id);
    try {
      var response = await dioProvider.get("Dashboards", query: {
        "userId": _userService.user.id
      });
      return DashBoardModel.fromJson(jsonDecode(jsonEncode(response?.data)));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<GetSalesTrend>> getSalesTrend({DateTime? startDate, DateTime? endDate}) async {
    try {
      var response = await dioProvider.get("Dashboards/sales-trend", query: {
        "StartDate": "${getStartDateFromNow(endDate?? DateTime.now())}Z",
        "EndDate": "${(endDate?? DateTime.now()).toIso8601String()}Z"
      });
      return getSalesTrendListFromStringtoJson(jsonEncode(response?.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrganizationOverviewModel> getOrganizationOverView() async {
    try {
      var response = await dioProvider.get("Dashboards/overview-navigation-data");
      return OrganizationOverviewModel.fromJson(jsonDecode(jsonEncode(response?.data)));
    } catch (e) {
      rethrow;
    }
  }

  String getStartDateFromNow(DateTime endDate) {
    // Subtract 6 months from the current date
    DateTime sixMonthsAgo = DateTime(endDate.year, endDate.month - 6, 1);

    return sixMonthsAgo.toIso8601String();
  }

//You can start creating product listing functions now
}

abstract class DashboardApiContract {
  Future<DashBoardModel> getDashboardData();
  Future<OrganizationOverviewModel> getOrganizationOverView();
  Future<List<GetSalesTrend>> getSalesTrend({DateTime? startDate, DateTime? endDate});

}