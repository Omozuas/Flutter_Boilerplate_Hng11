import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/produt_api/product_api.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_detail.provider.g.dart';

@Riverpod(keepAlive: true)
class ProductDetail extends _$ProductDetail {
  @override
  ProductDetailState build() {
    return ProductDetailState.loading();
  }

  set productId(String productId) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = ProductDetailState.loading();
      ref.read(productListProvider).whenData((products) {
        final product = products.firstWhere((value) => value.id == productId);
        state = state.copyWith(product: product, isLoading: false);
      });
    });
  }

  void deleteProduct(
      {required String id,
      required VoidCallback onSuccess,
      required VoidCallback onError}) async {
    try {
      state = state.copyWith(operationLoading: true);
      final result = await ref.read(productApiProvider).deleteProduct(id: id);

      log('DELETE RESULT $result');
      // ignore: unused_result
      ref.refresh(productListProvider.future);
      state = ProductDetailState.initial();
    } catch (e) {
      onError();
    } finally {
      state = state.copyWith(operationLoading: false);
    }
  }
}

class ProductDetailState {
  final Product? product;
  final bool isLoading;
  final bool operationLoading;

  ProductDetailState(
      {this.product, this.isLoading = false, this.operationLoading = false});

  ProductDetailState.loading()
      : product = null,
        isLoading = true,
        operationLoading = false;

  ProductDetailState.initial()
      : product = null,
        isLoading = false,
        operationLoading = false;

  ProductDetailState copyWith(
      {Product? product, bool? isLoading, bool? operationLoading}) {
    return ProductDetailState(
        product: product ?? this.product,
        isLoading: isLoading ?? this.isLoading,
        operationLoading: operationLoading ?? this.operationLoading);
  }
}
