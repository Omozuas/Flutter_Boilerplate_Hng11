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
    if (org.organisationId == null) {
      return Future.error('organisation is not initialized');
    }

    return ref
        .watch(productApiProvider) 
        .getAllProducts(orgId: org.organisationId!);
  }
}

@riverpod
AsyncValue<Map<String, List<Product>>> productsByCategory(
    ProductsByCategoryRef ref) {
  return ref.watch(productListProvider).whenData(
        _getProductMapping,
      );
}

Map<String, List<Product>> _getProductMapping(List<Product> products) {
  final allCategories = products.map((e) => e.category).toSet().toList();
  final categoryMap = <String, List<Product>>{};
  for (final category in allCategories) {
    final categoryList =
        products.where((element) => element.category == category).toList();
    categoryMap[category!] = categoryList;
  }
  return categoryMap;
}
