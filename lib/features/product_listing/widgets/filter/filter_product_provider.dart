import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/filter/filter_api_service.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/filter/filter_product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier(ref.read(apiServiceProvider));
});

class ProductNotifier extends StateNotifier<List<Product>> {
  final ApiService _apiService;
  List<Product> _allProducts = [];

  ProductNotifier(this._apiService) : super([]) {
    loadProducts();  // Automatically load products when the notifier is initialized
  }

  Future<void> loadProducts() async {
    try {
      _allProducts = await _apiService.fetchProducts();
      state = _allProducts;
    } catch (e) {
      state = [];
      throw Exception('Failed to load products: $e');
    }
  }

  void filterProductsByStatus(String status) {
    state = _allProducts.where((product) => product.status == status).toList();
  }

  void filterProductsByPriceRange(double minPrice, double maxPrice) {
    state = _allProducts.where((product) => product.price >= minPrice && product.price <= maxPrice).toList();
  }

  void resetFilters() {
    state = _allProducts;
  }

  void searchProducts(String query) {
    state = _allProducts.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
