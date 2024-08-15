import 'package:flutter_boilerplate_hng11/features/product_listing/product_endpoints.dart';

import '../../services/dio_provider.dart';
import '../../services/service_locator.dart';

class ProductApi implements ProductsApiContract {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();
  
  @override
  Future createProduct({required Map product}) async{
  }
  
  @override
  Future deleteProduct({required String id}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
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
  Future getProduct({required String id}) {
        return dioProvider.get(productsByIdEndpoint(id: id));

  }

//You can start creating product listing functions now
}


abstract class ProductsApiContract {
  Future getAllProducts();

  Future createProduct({required covariant dynamic product});
  Future updateProduct({required String id, required covariant dynamic product});
  Future deleteProduct({required String id});
  Future getProduct({required String id});
}





