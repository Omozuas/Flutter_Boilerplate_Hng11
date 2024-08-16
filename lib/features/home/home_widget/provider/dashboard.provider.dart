

import 'dart:convert';

import 'package:flutter_boilerplate_hng11/features/home/home_widget/dashboard_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../services/service_locator.dart';
import '../../../../services/user.service.dart';
import '../model/dashboard_model.dart';

// part 'dashboard_api.g.dart';
//
// @Riverpod(keepAlive: true)
// ProductApi productApi(ProductApiRef ref) {
//   return ProductApi();
// }

class DashBoardState {
  final bool normalButtonLoading;
  final bool overLayLoading;
  final DashBoardModel dashBoardData;

  DashBoardState(
      {required this.normalButtonLoading,
        required this.overLayLoading,
        required this.dashBoardData,
      });

  DashBoardState copyWith(
      {bool? normalButtonLoading,
        bool? overLayLoading,
        DashBoardModel? dashBoardData,
      }) {
    return DashBoardState(
        normalButtonLoading: normalButtonLoading ?? this.normalButtonLoading,
        overLayLoading: overLayLoading ?? this.overLayLoading,
      dashBoardData: dashBoardData ?? DashBoardModel()
    );
  }
}

class DashBoardProvider extends StateNotifier<DashBoardState> {
  GetStorage _storageService = locator<GetStorage>();
  UserService _userService = locator<UserService>();

  DashBoardProvider() : super(DashBoardState(
      normalButtonLoading: false,
      overLayLoading: false,
      dashBoardData: DashBoardModel()
  )) {
    // Initialize the provider by getting cached data and then fetching fresh data
    _initializeDashboardData();
  }

  Future<void> _initializeDashboardData() async {
    // Step 1: Get cached data if available
    await getCachedDashboardData();

    // Step 2: Fetch fresh data from the service
    await getDashboardData();
  }

  set setNormalButtonLoading(bool value) {
    state = state.copyWith(normalButtonLoading: value);
  }

  set setOverLayLoading(bool value) {
    state = state.copyWith(overLayLoading: value);
  }

  set setDashBoardData(DashBoardModel value) {
    state = state.copyWith(dashBoardData: value);
  }

  Future<void> getDashboardData() async {
    setNormalButtonLoading = true;
    try {
      final res = await DashboardApi().getDashboardData();
      if (res.revenue != null) {
        await saveDashboardData(res);
      }
      setDashBoardData = res;
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setNormalButtonLoading = false;
    }
  }

  Future<void> getCachedDashboardData() async {
    try {
      final res = _storageService.read("dashboard_data");
      if(res!=null){
        setDashBoardData = DashBoardModel.fromJson(jsonDecode(res));
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setNormalButtonLoading = false;
    }
  }

  Future<bool> saveDashboardData(DashBoardModel value)async{
    try{
      _storageService.write("dashboard_data", jsonEncode(value));
      bool res = _storageService.hasData("dashboard_data");
      if(res){
        return true;
      }
      return false;
    }catch(err){
      return false;
    }
  }

}
//
// final dashBoardProvider = StateNotifierProvider<DashBoardProvider, DashBoardState>((ref) {
//   return DashBoardProvider();
// });

//final checkBoxState = StateProvider<bool>((ref) => false);
// final loadingGoogleButton = StateProvider<bool>((ref) => false);

