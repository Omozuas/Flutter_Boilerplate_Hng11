import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/dashboard_api.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/service_locator.dart';
import '../../../../services/user.service.dart';
import '../../home_screen.dart';
import '../model/dashboard_model.dart';
import '../model/organization_overview_model.dart';
import '../model/sales_trend_model.dart';
import '../model/user_by_id_response.dart';

class DashBoardState {
  final bool overViewLoading;
  final bool trendLoading;
  final bool recentSaleLoading;
  final int productCount;
  final DashBoardModel dashBoardData;
  final OrganizationOverviewModel organizationOverviewModel;
  final List<GetSalesTrend> salesTrend;
  final List<SalesData> mapData;

  DashBoardState({
    required this.overViewLoading,
    required this.trendLoading,
    required this.recentSaleLoading,
    required this.productCount,
    required this.dashBoardData,
    required this.organizationOverviewModel,
    required this.salesTrend,
    required this.mapData,
  });

  DashBoardState copyWith({
    bool? overViewLoading,
    bool? trendLoading,
    bool? recentSaleLoading,
    int? productCount,
    DashBoardModel? dashBoardData,
    OrganizationOverviewModel? organizationOverviewModel,
    List<GetSalesTrend>? salesTrend,
    List<SalesData>? mapData,
  }) {
    return DashBoardState(
        overViewLoading: overViewLoading ?? this.overViewLoading,
        trendLoading: trendLoading ?? this.trendLoading,
        productCount: productCount ?? this.productCount,
        recentSaleLoading: recentSaleLoading ?? this.recentSaleLoading,
        organizationOverviewModel:
            organizationOverviewModel ?? OrganizationOverviewModel(),
        dashBoardData: dashBoardData ?? DashBoardModel(),
        salesTrend: salesTrend ?? [],
        mapData: mapData ?? []);
  }
}

class DashBoardProvider extends StateNotifier<DashBoardState>
    with WidgetsBindingObserver {
  final GetStorage _storageService = locator<GetStorage>();
  UserService userService = locator<UserService>();

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // App has resumed, re-initialize the dashboard data
      _initializeDashboardData();
    }
  }

  DashBoardProvider()
      : super(DashBoardState(
            overViewLoading: false,
            trendLoading: false,
            recentSaleLoading: false,
            productCount: 0,
            dashBoardData: DashBoardModel(),
            organizationOverviewModel: OrganizationOverviewModel(),
            salesTrend: [],
            mapData: [])) {
    // Initialize the provider by getting cached data and then fetching fresh data
    _initializeDashboardData();
  }

  Future<void> _initializeDashboardData() async {
    // Step 1: Get cached data if available
    await getAllCached();

    // Step 2: Fetch fresh data from the service
    await getRemote();
  }

  getAllCached() async {
    data = [];
    await getCachedDashboardData();
    await getCachedSalesTrend();
    await getCachedOrganizationOverview();
  }

  getRemote() {
    getSalesTrend();
    getDashboardData();
    getOrganizationOverView();
    getAllOrgProducts();
  }

  List<SalesData> data = [];

  set setOverViewLoading(bool value) {
    state = state.copyWith(overViewLoading: value);
  }

  set setAllProductCount(int value) {
    state = state.copyWith(productCount: value);
  }

  set setRecentSaleLoading(bool value) {
    state = state.copyWith(recentSaleLoading: value);
  }

  set setTrendLoading(bool value) {
    state = state.copyWith(trendLoading: value);
  }

  set setDashBoardData(DashBoardModel value) {
    state = state.copyWith(dashBoardData: value);
  }

  set setSalesTrend(List<GetSalesTrend> value) {
    state = state.copyWith(salesTrend: value);
  }

  set setOrganizationOverView(OrganizationOverviewModel value) {
    state = state.copyWith(organizationOverviewModel: value);
  }

  Future<GetUserByIDResponse?> getUserByID(String userID) async {
    try {
      final res = await DashboardApi().getUserById(userId: userID);
      if (res.id != null) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
      //tODO: Do something with caught error;
    }
  }

  getAllOrgProducts() async {
    try {
      final res = await DashboardApi().getAllOrgProducts();
      if (res.isNotEmpty) {
        setAllProductCount = res.length;
      } else {
        setAllProductCount = 0;
      }
    } catch (e) {
      setAllProductCount = 0;
      rethrow;
      //tODO: Do something with caught error;
    }
  }

  Future<void> getDashboardData() async {
    setRecentSaleLoading = state.dashBoardData.revenue == null ? true : false;
    try {
      final res = await DashboardApi().getDashboardData();
      if (res.revenue != null) {
        await saveDashboardData(res);
      }
      setDashBoardData = res;
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setRecentSaleLoading = false;
    }
  }

  goToNotification(BuildContext context) {
    context.push(AppRoute.notification);
  }

  Future<void> getOrganizationOverView() async {
    setOverViewLoading = state.dashBoardData.revenue == null ? true : false;
    try {
      final res = await DashboardApi().getOrganizationOverView();
      if (res.overview != null) {
        await saveOrganizationOverview(res);
      }
      setOrganizationOverView = res;
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setOverViewLoading = false;
    }
  }

  Future<void> getSalesTrend({DateTime? startDate, DateTime? endDate}) async {
    setTrendLoading = state.salesTrend.isEmpty ? true : false;
    try {
      final res = await DashboardApi().getSalesTrend();
      if (res.isNotEmpty) {
        await saveSalesTrend(res);
      }
      setSalesTrend = res;
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setTrendLoading = false;
    }
  }

  Future<void> getCachedDashboardData() async {
    try {
      final res = _storageService.read("dashboard_data");
      if (res != null) {
        setDashBoardData = DashBoardModel.fromJson(jsonDecode(res));
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      // setNormalButtonLoading = false;
    }
  }

  Future<void> getCachedSalesTrend() async {
    try {
      final res = _storageService.read("sales_trend");
      if (res != null) {
        List<GetSalesTrend> trend = getSalesTrendListFromStringtoJson(res);
        setSalesTrend = trend;
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      // setNormalButtonLoading = false;
    }
  }

  Future<void> getCachedOrganizationOverview() async {
    try {
      final res = _storageService.read("organization_overview");
      if (res != null) {
        setOrganizationOverView =
            OrganizationOverviewModel.fromJson(jsonDecode(res));
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      // setNormalButtonLoading = false;
    }
  }

  Future<bool> saveDashboardData(DashBoardModel value) async {
    try {
      _storageService.write("dashboard_data", jsonEncode(value));
      bool res = _storageService.hasData("dashboard_data");
      if (res) {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<bool> saveOrganizationOverview(OrganizationOverviewModel value) async {
    try {
      _storageService.write("organization_overview", jsonEncode(value));
      bool res = _storageService.hasData("organization_overview");
      if (res) {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<bool> saveSalesTrend(List<GetSalesTrend> value) async {
    try {
      _storageService.write(
          "sales_trend", getSalesTrendListFromJsontoString(value));
      bool res = _storageService.hasData("sales_trend");
      if (res) {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }
}

final dashBoardProvider =
    StateNotifierProvider<DashBoardProvider, DashBoardState>((ref) {
  return DashBoardProvider();
});

//final checkBoxState = StateProvider<bool>((ref) => false);
// final loadingGoogleButton = StateProvider<bool>((ref) => false);
