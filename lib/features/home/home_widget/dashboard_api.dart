import 'dart:convert';
import 'dart:developer';

import 'package:flutter_boilerplate_hng11/services/user.service.dart';
import '../../../services/dio_provider.dart';
import '../../../services/service_locator.dart';
import '../../product_listing/models/product/product_model.dart';
import '../../user_home/model/all_products.dart';
import 'model/dashboard_model.dart';
import 'model/organization_overview_model.dart';
import 'model/sales_trend_model.dart';
import 'model/user_by_id_response.dart';

class DashboardApi implements DashboardApiContract {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();
  final UserService _userService = locator<UserService>();
  //final GetStorage _storageService = locator<GetStorage>();

  @override
  Future<DashBoardModel> getDashboardData() async {
    try {
      var response = await dioProvider
          .get("Dashboards", query: {"userId": _userService.user.id});
      return DashBoardModel.fromJson(jsonDecode(jsonEncode(response?.data)));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetUserByIDResponse> getUserById({required String userId}) async {
    try {
      var response = await dioProvider.get("users/$userId");
      return GetUserByIDResponse.fromJson(
          jsonDecode(jsonEncode(response?.data)));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> getAllProducts({int? pageSize, int? page}) async {
    try {
      var response = await dioProvider.get("products",
          query: {"PageSize": pageSize ?? 100000, "PageNumber": page ?? 1});
      var res =
          AllProduct.fromJson(jsonDecode(jsonEncode(response?.data))).data ??
              [];
      return res;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<GetSalesTrend>> getSalesTrend(
      {DateTime? startDate, DateTime? endDate}) async {
    try {
      var response = await dioProvider.get("Dashboards/sales-trend", query: {
        "StartDate": "${getStartDateFromNow(endDate ?? DateTime.now())}Z",
        "EndDate": "${(endDate ?? DateTime.now()).toIso8601String()}Z"
      });
      return getSalesTrendListFromStringtoJson(jsonEncode(response?.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrganizationOverviewModel> getOrganizationOverView() async {
    try {
      var response =
          await dioProvider.get("Dashboards/overview-navigation-data");
      return OrganizationOverviewModel.fromJson(
          jsonDecode(jsonEncode(response?.data)));
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
  Future<GetUserByIDResponse> getUserById({required String userId});
  Future<List<Product>> getAllProducts({int? pageSize, int? page});
  Future<OrganizationOverviewModel> getOrganizationOverView();
  Future<List<GetSalesTrend>> getSalesTrend(
      {DateTime? startDate, DateTime? endDate});
}
