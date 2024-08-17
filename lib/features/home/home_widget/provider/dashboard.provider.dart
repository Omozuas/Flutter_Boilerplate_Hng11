import 'dart:convert';

import 'package:flutter_boilerplate_hng11/features/home/home_widget/dashboard_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../services/service_locator.dart';
import '../../../../services/user.service.dart';
import '../../home_screen.dart';
import '../model/dashboard_model.dart';
import '../model/organization_overview_model.dart';
import '../model/sales_trend_model.dart';

class DashBoardState {
  final bool overViewLoading;
  final bool trendLoading;
  final bool recentSaleLoading;
  final DashBoardModel dashBoardData;
  final OrganizationOverviewModel organizationOverviewModel;
  final List<GetSalesTrend> salesTrend;
  final List<SalesData> mapData;

  DashBoardState({
    required this.overViewLoading,
    required this.trendLoading,
    required this.recentSaleLoading,
    required this.dashBoardData,
    required this.organizationOverviewModel,
    required this.salesTrend,
    required this.mapData,
  });

  DashBoardState copyWith({
    bool? overViewLoading,
    bool? trendLoading,
    bool? recentSaleLoading,
    DashBoardModel? dashBoardData,
    OrganizationOverviewModel? organizationOverviewModel,
    List<GetSalesTrend>? salesTrend,
    List<SalesData>? mapData,
  }) {
    return DashBoardState(
        overViewLoading: overViewLoading ?? this.overViewLoading,
        trendLoading: trendLoading ?? this.trendLoading,
        recentSaleLoading: recentSaleLoading ?? this.recentSaleLoading,
        organizationOverviewModel:
            organizationOverviewModel ?? OrganizationOverviewModel(),
        dashBoardData: dashBoardData ?? DashBoardModel(),
        salesTrend: salesTrend ?? [],
        mapData: mapData ?? []);
  }
}

class DashBoardProvider extends StateNotifier<DashBoardState> {
  final GetStorage _storageService = locator<GetStorage>();
  UserService userService = locator<UserService>();

  DashBoardProvider()
      : super(DashBoardState(
            overViewLoading: false,
            trendLoading: false,
            recentSaleLoading: false,
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
  }

  List<SalesData> data = [];

  String _getMonthAbbreviation(DateTime date) {
    // Create a DateFormat instance with the pattern 'MMM'
    DateFormat formatter = DateFormat('MMM');

    // Format the DateTime object to get the abbreviated month name
    String month = formatter.format(date);

    return month;
  }

  DateTime _subtractMonths(int months) {
    // Get the current date
    DateTime now = DateTime.now();

    // Subtract the specified number of months from the current date
    int newMonth = now.month - months;
    int newYear = now.year;

    // Handle the year adjustment if subtracting months results in a previous year
    while (newMonth <= 0) {
      newYear -= 1;
      newMonth += 12;
    }

    // Create a new DateTime object with the calculated year, month, and day
    DateTime newDate = DateTime(newYear, newMonth, now.day);

    // Handle cases where the resulting month has fewer days than the current day
    while (newDate.month != newMonth) {
      newDate = newDate.subtract(const Duration(days: 1));
    }

    return newDate;
  }

  set setOverViewLoading(bool value) {
    state = state.copyWith(overViewLoading: value);
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
