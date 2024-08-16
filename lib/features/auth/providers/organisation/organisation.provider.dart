import 'dart:convert';
import 'dart:developer';

import 'package:flutter_boilerplate_hng11/features/auth/models/organisation.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/user.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'organisation.provider.g.dart';

@riverpod
class GetOrganisation extends _$GetOrganisation {
  @override
  Organisation? build() {
    final data = ref.watch(userRegStateProviderModelProvider).userReg?.data;

    if (data != null) {
      log('data is not null ${jsonEncode(data)}');
      final listjson = data['organisations'] as List;

      log('OrgJson $listjson');

      final data =  listjson
          .map<Organisation>(
            (e) => Organisation.fromJson(e),
          )
          .toList()[0];

          
    }

    log('data is null');
    return null;
  }
}
