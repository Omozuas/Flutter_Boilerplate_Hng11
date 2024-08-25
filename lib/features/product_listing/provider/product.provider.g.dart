// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsByCategoryHash() =>
    r'5ef918ade66907e52e7e9b67a28c016c7d7f6993';

/// See also [productsByCategory].
@ProviderFor(productsByCategory)
final productsByCategoryProvider =
    Provider<AsyncValue<Map<String, List<Product>>>>.internal(
  productsByCategory,
  name: r'productsByCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsByCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsByCategoryRef
    = ProviderRef<AsyncValue<Map<String, List<Product>>>>;
String _$productListHash() => r'c14b9767dcee72dbd31bcefc8c5376715236a026';

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
String _$productsInCategoryHash() =>
    r'd21c7a81db664b5c90fc5983a9adce501f31889b';

/// See also [ProductsInCategory].
@ProviderFor(ProductsInCategory)
final productsInCategoryProvider =
    AutoDisposeNotifierProvider<ProductsInCategory, List<Product>>.internal(
  ProductsInCategory.new,
  name: r'productsInCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsInCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsInCategory = AutoDisposeNotifier<List<Product>>;
String _$keyHash() => r'6940647495834a9981e29c4d3b86e09167a4a814';

/// See also [Key].
@ProviderFor(Key)
final keyProvider = NotifierProvider<Key, String>.internal(
  Key.new,
  name: r'keyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$keyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Key = Notifier<String>;
String _$searchInputHash() => r'5e4ea6afce0fbea6f69942c25fef206b215fad47';

/// See also [SearchInput].
@ProviderFor(SearchInput)
final searchInputProvider = NotifierProvider<SearchInput, String>.internal(
  SearchInput.new,
  name: r'searchInputProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchInput = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
