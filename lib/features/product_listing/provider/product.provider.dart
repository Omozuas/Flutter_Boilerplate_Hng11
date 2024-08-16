import 'dart:developer';

import 'package:flutter_boilerplate_hng11/features/auth/providers/organisation/organisation.provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/produt_api/product_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product.provider.g.dart';

@Riverpod(keepAlive: true)
class ProductList extends _$ProductList {
  @override
  Future<List<Product>> build() async {
    final org = ref.watch(getOrganisationProvider);
    if (org == null || org.organisationId == null) {
      return Future.error('organisation is not initialized');
    }
    final value = ref.watch(getOrganisationProvider);

    log('Organization provider ${value?.name}');

    return ref
        .watch(productApiProvider)
        .getAllProducts(orgId: org.organisationId!);
  }
}
