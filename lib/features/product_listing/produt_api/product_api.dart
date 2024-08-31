import 'dart:developer';

import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/product_endpoints.dart';
import 'package:flutter_boilerplate_hng11/services/error_handlers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/dio_provider.dart';
import '../../../services/service_locator.dart';

part 'product_api.g.dart';

@Riverpod(keepAlive: true)
ProductApi productApi(ProductApiRef ref) {
  return ProductApi();
}

class ProductApi implements ProductsApiContract {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();
  @override
  Future<Product?> createProduct({
    required String orgId,
    required Map product,
  }) async {
    try {
      log(product.toString());

      final result = await dioProvider.post(
        productsForOrganisationEndpoint(orgId: orgId),
        data: product,
      );

      if (result == null) return null;

      final data = result.data['data'] ?? result.data;
      try {
        return Product.fromJson(data);
      } catch (e) {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteProduct({required String id}) async {
    try {
      return dioProvider.delete(productsByIdEndpoint(id: id));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> getAllProducts({required String orgId}) async {
    try {
      log('API CALLED');
      final result =
          await dioProvider.get(productsForOrganisationEndpoint(orgId: orgId));

      final jsonList = result?.data['data'] as List;
      return jsonList
          .map(
            (e) => Product.fromJson(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProduct({required String id, required Map product}) async {
    try {
      await dioProvider.putUpdate(
        productsByIdEndpoint(id: id),
        data: product,
      );
    } catch (e) {
      ErrorHandlers.allErrorHandler(e);
    }
  }

  @override
  Future<Product?> getProduct({required String id}) async {
    try {
      final result = await dioProvider.get(productsByIdEndpoint(id: id));

      final data = result?.data['data'];

      if (data != null) {
        return Product.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      ErrorHandlers.allErrorHandler(e);
    }
    return null;
  }

//You can start creating product listing functions now
}

abstract class ProductsApiContract {
  Future getAllProducts({required String orgId});

  Future createProduct({required String orgId, required Map product});
  Future updateProduct(
      {required String id, required covariant dynamic product});
  Future deleteProduct({required String id});
  Future getProduct({required String id});
}
