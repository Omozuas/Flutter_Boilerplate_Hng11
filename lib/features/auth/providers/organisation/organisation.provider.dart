// ignore_for_file: unused_local_variable

import 'package:flutter_boilerplate_hng11/features/auth/models/organisation/organisation.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'organisation.provider.g.dart';

@Riverpod(keepAlive: true)
class GetOrganisation extends _$GetOrganisation {
  @override
  Organisation build() {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    final organizations = ref.watch(authProvider).organisations;
    final index = ref.watch(orgnaisationIndexProvider);
    return organizations[index];
  }
}

@Riverpod(keepAlive: true)
class OrgnaisationIndex extends _$OrgnaisationIndex {
    GetStorage box = locator<GetStorage>();

  @override
  int build() {

    

    return 0;
  }
}
