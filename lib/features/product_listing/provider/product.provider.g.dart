// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsByCategoryHash() =>
    r'de19701512a50a0ae88bf615249861870d5d0fbe';

/// See also [productsByCategory].
@ProviderFor(productsByCategory)
final productsByCategoryProvider =
    AutoDisposeProvider<AsyncValue<Map<String, List<Product>>>>.internal(
  productsByCategory,
  name: r'productsByCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsByCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsByCategoryRef
    = AutoDisposeProviderRef<AsyncValue<Map<String, List<Product>>>>;
String _$productListHash() => r'2e85e9e4ed06128a248ba1412d1eda885eda0cc5';

/// See also [ProductList].
@ProviderFor(ProductList)
final productListProvider =
    AsyncNotifierProvider<ProductList, List<Product>>.internal(
  ProductList.new,
  name: r'productListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductList = AsyncNotifier<List<Product>>;
String _$searchInputHash() => r'235a0a7a9976a5e9f45fc9f70349f1d74cd92fc0';

/// See also [SearchInput].
@ProviderFor(SearchInput)
final searchInputProvider =
    AutoDisposeNotifierProvider<SearchInput, String>.internal(
  SearchInput.new,
  name: r'searchInputProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchInput = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
