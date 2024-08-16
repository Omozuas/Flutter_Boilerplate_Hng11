import 'package:flutter_boilerplate_hng11/features/auth/models/organisation/organisation.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/user.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'organisation.provider.g.dart';

@Riverpod(keepAlive: true)
class GetOrganisation extends _$GetOrganisation {
  @override
  Organisation? build() {
    final data = ref.watch(userRegStateProviderModelProvider).userReg?.data;

    if (data != null) {
      final listjson = data['organisations'] as List;

      final item = listjson
          .map<Organisation>(
            (e) => Organisation.fromJson(e),
          )
          .toList()[0];

      return item;
    }

    return null;
  }
}
