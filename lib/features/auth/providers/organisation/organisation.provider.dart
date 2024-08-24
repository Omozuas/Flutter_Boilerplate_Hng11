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
  final GetStorage _box = locator<GetStorage>();
  final _indexKey = 'org-index';
  @override
  int build() {
    final value = _box.read<int>(_indexKey);
    return value ?? 0;
  }

  void updateByIndex(int index) {
    _box.write(_indexKey, index);
    state = index;
  }

  void updateByOrgId(String orgId) {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    final targetIndex = ref.read(authProvider).organisations.indexWhere(
          (element) => element.organisationId == orgId,
        );
    if (targetIndex > -1) {
      updateByIndex(targetIndex);
    }
  }
}
