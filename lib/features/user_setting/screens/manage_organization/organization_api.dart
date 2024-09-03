import 'dart:convert';

import 'package:flutter_boilerplate_hng11/features/product_listing/product_endpoints.dart';

import '../../../../services/dio_provider.dart';
import '../../../../services/service_locator.dart';
import 'model/all_organization_model.dart';

class OrganizationsApi implements OrganizationsApiContract {
  //Inject the DioProvider Dependency
  final DioProvider _dioProvider = locator<DioProvider>();

  @override
  Future<AllOrganizationResponse?> getOrganizations() async {
    try {
      var response = await _dioProvider.get(organisationEndpoint);
      if (response != null) {
        return AllOrganizationResponse.fromJson(
          jsonDecode(
            jsonEncode(response.data),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<SingleOrganization?> createOrganizations({
    required SingleOrganization organisation,
  }) async {
    try {
      var response = await _dioProvider.post(
        organisationEndpoint,
        data: organisation.toJson(),
      );

      if (response != null) {
        return SingleOrganization.fromJson(
          jsonDecode(
            jsonEncode(response.data),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<AllOrganizationResponse?> switchOrganisation({
    required String organisationId,
  }) async {
    try {
      var response = await _dioProvider.putUpdate(
        "users/$organisationEndpoint/$organisationId",
        data: {
          "isActive": true,
        },
      );

      if (response != null) {
        return AllOrganizationResponse.fromJson(
          jsonDecode(
            jsonEncode(response.data),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}

abstract class OrganizationsApiContract {
  Future<AllOrganizationResponse?> getOrganizations();

  Future<SingleOrganization?> createOrganizations(
      {required SingleOrganization organisation});

  Future<AllOrganizationResponse?> switchOrganisation(
      {required String organisationId});
}
