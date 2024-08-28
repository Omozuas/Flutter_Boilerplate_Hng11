// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsInCategoryDataHash() =>
    r'1e2826b19ab3bef8c4ca4c685ea7aedb2b0e2ed7';

/// See also [productsInCategoryData].
@ProviderFor(productsInCategoryData)
final productsInCategoryDataProvider = Provider<List<Product>>.internal(
  productsInCategoryData,
  name: r'productsInCategoryDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsInCategoryDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsInCategoryDataRef = ProviderRef<List<Product>>;
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
    r'f36f19ffe4efd5fe7ec74d7ed419260374b6d6a5';

/// See also [ProductsInCategory].
@ProviderFor(ProductsInCategory)
final productsInCategoryProvider =
    NotifierProvider<ProductsInCategory, CategoryData>.internal(
  ProductsInCategory.new,
  name: r'productsInCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsInCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsInCategory = Notifier<CategoryData>;
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
String _$searchInputCategoryHash() =>
    r'a971c04a7f4a978d6dd38a5ba76df5867a4d73aa';

/// See also [SearchInputCategory].
@ProviderFor(SearchInputCategory)
final searchInputCategoryProvider =
    NotifierProvider<SearchInputCategory, String>.internal(
  SearchInputCategory.new,
  name: r'searchInputCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchInputCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchInputCategory = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
