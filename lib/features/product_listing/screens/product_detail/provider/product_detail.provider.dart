import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_detail.provider.g.dart';

@Riverpod(keepAlive: true)
class ProductDetail extends _$ProductDetail {
  @override
  ProductDetailState build() {
    return ProductDetailState.initial();
  }
  set productId(String productId) {
    state = ProductDetailState.loading();
    ref.read(productListProvider).whenData((products) {
      final product = products.firstWhere((value) => value.id == productId);
      state = state.copyWith(product: product, isLoading: false);
    });
  }
}

class ProductDetailState {
  final Product? product;
  final bool isLoading;

  ProductDetailState({this.product, this.isLoading = false});

  ProductDetailState.loading()
      : product = null,
        isLoading = true;
  ProductDetailState.initial()
      : product = null,
        isLoading = false;

  ProductDetailState copyWith({Product? product, bool? isLoading}) {
    return ProductDetailState(
      product: product ?? this.product,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
