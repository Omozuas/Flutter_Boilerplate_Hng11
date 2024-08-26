import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/organisation/organisation.provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/produt_api/product_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product.provider.g.dart';
part 'product.provider.freezed.dart';

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

  void addProduct(Product product) {
    if (state.value != null) {
      final currentData = List<Product>.from(state.value!);
      currentData.add(product);
      state = AsyncValue.data(currentData);
    }
  }
}

@Riverpod(keepAlive: true)
class ProductsInCategory extends _$ProductsInCategory {
  @override
  CategoryData build() => CategoryData(name: '', products: []);

  getProductsInCategory(String key) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final data = ref.watch(productListProvider).whenData(
          (value) {
            return value.where((element) => element.category == key).toList();
          },
        );
        data.whenData(
          (value) {
            state = CategoryData(
              name: key,
              products: value,
            );
          },
        );
      },
    );
  }
}

@freezed
class CategoryData with _$CategoryData {
  factory CategoryData({
    required String name,
    required List<Product> products,
  }) = _CategoryData;
}

@Riverpod(keepAlive: true)
List<Product> productsInCategoryData(ProductsInCategoryDataRef ref) {
  final queryString = ref.watch(searchInputCategoryProvider);
  final data = ref.watch(productsInCategoryProvider).products;
  return data
      .where(
        (element) =>
            element.name!.toLowerCase().contains(queryString.toLowerCase()),
      )
      .toList();
}

@Riverpod(keepAlive: true)
AsyncValue<Map<String, List<Product>>> productsByCategory(
    ProductsByCategoryRef ref) {
  final queryString = ref.watch(searchInputProvider);
  return ref.watch(productListProvider).whenData(
        (value) => _getProductMapping(
          value.where(
            (element) {
              return (element.name
                          ?.toLowerCase()
                          .contains(queryString.toLowerCase()) ??
                      true) ||
                  (element.category
                          ?.toLowerCase()
                          .contains(queryString.toLowerCase()) ??
                      true);
            },
          ).toList(),
        ),
      );
}

@Riverpod(keepAlive: true)
class Key extends _$Key {
  @override
  String build() {
    return '';
  }

  void update(String queryString) {
    log(queryString);
    state = queryString;
  }
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

@Riverpod(keepAlive: true)
class SearchInput extends _$SearchInput {
  @override
  String build() {
    return '';
  }

  void update(String queryString) {
    log(queryString);
    state = queryString;
  }
}

@Riverpod(keepAlive: true)
class SearchInputCategory extends _$SearchInputCategory {
  @override
  String build() {
    return '';
  }

  void update(String queryString) {
    log(queryString);
    state = queryString;
  }
}
