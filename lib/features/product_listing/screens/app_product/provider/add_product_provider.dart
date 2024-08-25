import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/organisation/organisation.provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/produt_api/product_api.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_product_provider.g.dart';

class AddProductState {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final String? error;

  AddProductState({
    required this.isLoading,
    required this.isError,
    required this.isSuccess,
    this.error,
  });

  AddProductState.loaded()
      : isLoading = false,
        isError = false,
        isSuccess = false,
        error = null;

  AddProductState.isLoading()
      : isLoading = true,
        isError = false,
        isSuccess = false,
        error = null;

  AddProductState.isError({String? e})
      : isLoading = false,
        isError = true,
        isSuccess = false,
        error = e;

  AddProductState.isSuccess()
      : isLoading = false,
        isError = false,
        isSuccess = true,
        error = null;

  AddProductState copyWith({
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
  }) =>
      AddProductState(
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        isSuccess: isSuccess ?? this.isSuccess,
      );
}

@riverpod
class AddProductProvider extends _$AddProductProvider {
  @override
  AddProductState build() {
    return AddProductState.loaded();
  }

  void addProduct({
    required Map data,
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    final org = ref.read(getOrganisationProvider);
    try {
      state = AddProductState.isLoading();
      final product = await ref.read(productApiProvider).createProduct(
            product: data,
            orgId: org.organisationId!,
          );

      if (product != null) {
        log('ADD PRODUCT RESULT $product');
        ref.read(productListProvider.notifier).addProduct(product);
      }

      onSuccess();
      state = AddProductState.isSuccess();
    } catch (e) {
      onError();
      state = AddProductState.isError(e: e.toString());
    }
  }
}
