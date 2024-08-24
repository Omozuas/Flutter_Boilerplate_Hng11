// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsByCategoryHash() =>
    r'60b5db89ebbfdbc9ab53b94ef3809684fe29e717';

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
String _$searchInputHash() => r'7fe9dd60db1196df18c6e98a988f3f13a88ccfc2';

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
