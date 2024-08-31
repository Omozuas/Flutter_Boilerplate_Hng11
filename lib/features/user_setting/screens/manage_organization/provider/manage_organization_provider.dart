import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/manage_organization/organization_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../../../services/service_locator.dart';
import '../../../../../services/user.service.dart';
import '../../../widgets/dialogs/profile_dialog/switch_organization_dialog.dart';
import '../model/all_organization_model.dart';

class ManageOrganizationState {
  final bool initialLoading;
  final List<SingleOrganization> allOrganizations;
  final SingleOrganization? selectedOrganization;

  ManageOrganizationState({
    required this.initialLoading,
    required this.allOrganizations,
    this.selectedOrganization,
  });

  ManageOrganizationState copyWith({
    bool? initialLoading,
    List<SingleOrganization>? allOrganizations,
    SingleOrganization? selectedOrganization,
  }){
    return ManageOrganizationState(
      initialLoading: initialLoading ?? this.initialLoading,
      allOrganizations: allOrganizations ?? this.allOrganizations,
      selectedOrganization: selectedOrganization ?? this.selectedOrganization
    );
  }
}

final manageOrgBoardProvider =
StateNotifierProvider<ManageOrganizationProvider, ManageOrganizationState>((ref) {
  return ManageOrganizationProvider();
});

class ManageOrganizationProvider extends StateNotifier<ManageOrganizationState>  {
  final GetStorage _storageService = locator<GetStorage>();
  final UserService userService = locator<UserService>();

  ManageOrganizationProvider() : super(
    ManageOrganizationState(
      initialLoading: false,
      allOrganizations: [],
      selectedOrganization: null
    )
  ){
    _init();
  }

  selectOrganizations(SingleOrganization data){
    setSelectedOrganization = data;
    userService.selectedOrganization = state.selectedOrganization;
    saveSelectedOrganizations(data);
  }

  _init()async{
    getSelectedLocalOrganizations();
    await getLocalOrganizations();
    getOrganizations();
  }

  set setLoading(bool isLoading){
    state = state.copyWith(initialLoading: isLoading);
  }

  set setAllOrganizations(List<SingleOrganization> allOrganization){
    state = state.copyWith(allOrganizations: allOrganization);
  }

  set setSelectedOrganization(SingleOrganization? organization){
    state = state.copyWith(selectedOrganization: organization);
  }

  switchOrg(BuildContext context, SingleOrganization? organization){
    showDialog(
      context: context,
      builder: (context) {
        return SwitchOrganizationDialog(
          onPress: (){
            selectOrganizations(organization!);
            context.pop();
          },
        );
      }
    );
  }

  getOrganizations()async{
    setLoading = state.allOrganizations.isEmpty;
    try{
      var res = await OrganizationsApi().getOrganizations();
      if(res?.data != null){
        setAllOrganizations = res?.data??[];
        userService.allOrgainzations = state.allOrganizations;
      }
    }catch(err){
      log("Get Organization Error $err");
    } finally{
      setLoading = false;
    }
  }
  //final organizationManageProvider = ref.read(provider)

  saveOrganizations(AllOrganizationResponse? allOrganizations)async{
    _storageService.write("all_organizations", jsonEncode(allOrganizations));
    log("Is organization saved = ${_storageService.hasData("all_organizations")}");
  }

  saveSelectedOrganizations(SingleOrganization? selectedOrganizations)async{
    _storageService.write("selected_organizations", jsonEncode(selectedOrganizations));
    log("Is Selected organization saved = ${_storageService.hasData("selected_organizations")}");
  }

  getLocalOrganizations() async {
    try{
      var res = await _storageService.read("all_organizations");
      if(res != null){
        setAllOrganizations = AllOrganizationResponse.fromJson(jsonDecode(res)).data??[];
      }
    }catch(err){
      log("Getting Saved Organization Error $err");
    }
  }

  getSelectedLocalOrganizations() async {
    try{
      var res = await _storageService.read("selected_organizations");
      if(res != null){
        setSelectedOrganization = SingleOrganization.fromJson(jsonDecode(res));
        userService.selectedOrganization = SingleOrganization.fromJson(jsonDecode(res));
      }
    }catch(err){
      log("Getting Saved Organization Error $err");
    }
  }

}