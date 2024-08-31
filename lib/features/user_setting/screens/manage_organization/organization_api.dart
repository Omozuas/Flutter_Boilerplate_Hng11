import 'dart:convert';

import '../../../../services/dio_provider.dart';
import '../../../../services/service_locator.dart';
import '../../../../services/user.service.dart';
import 'model/all_organization_model.dart';

class OrganizationsApi implements OrganizationsApiContract {
  //Inject the DioProvider Dependency
  final DioProvider _dioProvider = locator<DioProvider>();
  final UserService _userService = locator<UserService>();

  @override
  Future<AllOrganizationResponse?> getOrganizations() async {
    try {
      var response = await _dioProvider.get("organisations");
      return AllOrganizationResponse.fromJson(jsonDecode(jsonEncode(response?.data)));
    } catch (e) {
      rethrow;
    }
  }

}

abstract class OrganizationsApiContract {
  Future<AllOrganizationResponse?> getOrganizations();
}