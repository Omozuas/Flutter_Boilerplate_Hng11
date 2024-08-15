import 'package:flutter_boilerplate_hng11/features/product_listing/product_endpoints.dart';
import 'package:flutter_boilerplate_hng11/services/error_handlers.dart';

import '../../services/dio_provider.dart';
import '../../services/service_locator.dart';

class ProductApi implements ProductsApiContract {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();

  @override
  Future createProduct({required Map product}) async {}

  @override
  Future deleteProduct({required String id}) async {
    return null;
  }

  @override
  Future getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future updateProduct({required String id, required product}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductModel?> getProduct({required String id}) async {
    try {
      final result = await dioProvider.get(productsByIdEndpoint(id: id));

      final data = result?.data['data'];

      if (data != null) {
        return ProductModel.fromJson(data);
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
  Future getAllProducts();

  Future createProduct({required covariant dynamic product});
  Future updateProduct(
      {required String id, required covariant dynamic product});
  Future deleteProduct({required String id});
  Future getProduct({required String id});
}
