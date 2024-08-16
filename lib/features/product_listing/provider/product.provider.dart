import 'dart:developer';

import 'package:flutter_boilerplate_hng11/features/auth/providers/organisation/organisation.provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/produt_api/product_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product.provider.g.dart';

@Riverpod(keepAlive: true)
class ProductList extends _$ProductList {
  @override
  Future<List<Product>> build() async {
    final org = ref.watch(getOrganisationProvider);
    if (org == null || org.organisationId == null) {
      return Future.error('organisation is not initialized');
    }
    final value = ref.watch(getOrganisationProvider);

    log('Organization provider ${value?.name}');

    return ref
        .watch(productApiProvider)
        .getAllProducts(orgId: org.organisationId!);
  }
}

class ProductState {
  final bool normalButtonLoading;
  final bool productLoading;
  final bool overlayLoading;
  final bool checkBoxState;
  final List<ProductByCategory> products;

  ProductState(
      {required this.normalButtonLoading,
        required this.productLoading,
      required this.overlayLoading,
      required this.checkBoxState,
      required this.products
      });

  ProductState copyWith(
      {bool? normalButtonLoading,
      bool? productLoading,
      bool? overlayLoading,
      bool? checkBoxState,
      List<ProductByCategory>? products}) {
    return ProductState(
        normalButtonLoading: normalButtonLoading ?? this.normalButtonLoading,
        productLoading: productLoading ?? this.productLoading,
        overlayLoading: overlayLoading ?? this.overlayLoading,
        checkBoxState: checkBoxState ?? this.checkBoxState,
        products: products?? []);
  }
}

class ProductProvider extends StateNotifier<ProductState> {
  DioProvider dioProvider = locator<DioProvider>();
  GetStorage box = locator<GetStorage>();

  ProductProvider()
      : super(ProductState(
      productLoading: false,
      overlayLoading: false,
      checkBoxState: false,
      products: [],
      normalButtonLoading: false
  ));

  set setNormalButtonLoading(bool value) {
    state = state.copyWith(normalButtonLoading: value);
  }

  set setFullScreenLoading(bool value) {
    state = state.copyWith(overlayLoading: value);
  }

  set setCheckBoxState(bool value) {
    state = state.copyWith(checkBoxState: value);
  }

  set setProducts(List<ProductByCategory> u) {
    state = state.copyWith(products: u);
  }

  set setProductLoading(bool u) {
    state = state.copyWith(productLoading: u);
  }

  getProducts({int? page, int? pageSize}) async {
    setProductLoading = true;
    try {
      final res = await ProductApi().getAllProducts(page: page, pageSize: pageSize);
      if (res != null) {
        setProducts= groupProductsByCategory(res) ??[];
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setNormalButtonLoading = false;
    }
  }
  //
  // Future<void> googleSignin(BuildContext context) async {
  //   setGoogleButtonLoading = true;
  //
  //   //  FirebaseAuth auth = FirebaseAuth.instance;
  //   final googleSignIn = GoogleSignIn(
  //     scopes: [
  //       'email',
  //       'https://www.googleapis.com/auth/userinfo.profile',
  //     ],
  //   );
  //
  //   final googleUser = await googleSignIn.signIn();
  //   if (googleUser != null) {
  //     final googleAuth = await googleUser.authentication;
  //     // final AuthCredential credential = GoogleAuthProvider.credential(
  //     //   idToken: googleAuth.idToken,
  //     //   accessToken: googleAuth.accessToken,
  //     // );
  //     //  final u = await auth.signInWithCredential(credential);
  //     final res = await AuthApi().googleSignIn(googleAuth.idToken!);
  //     if (res != null) {
  //       showSnackBar(res.message.toString());
  //       UserRegData userRegData = UserRegData.fromJson(res.data);
  //       setUser = User.fromJson(userRegData.data?['user']);
  //
  //       if (context.mounted) {
  //         context.go(AppRoute.home);
  //         box.write('accessToken', userRegData.accessToken);
  //       }
  //     }
  //   }
  //
  //   try {} catch (e) {
  //     rethrow;
  //   } finally {
  //     setGoogleButtonLoading = false;
  //   }
  // }
  //
  // Future<void> login(Map<String, dynamic> data, BuildContext context) async {
  //   setNormalButtonLoading = true;
  //   try {
  //     final res = await AuthApi().loginUser(data);
  //
  //     if (res != null) {
  //       showSnackBar(res.message.toString());
  //       UserRegData userRegData = UserRegData.fromJson(res.data);
  //       setUser = User.fromJson(userRegData.data?['user']);
  //       if (context.mounted) {
  //         context.go(AppRoute.home);
  //         box.write('accessToken', userRegData.accessToken);
  //         _userService.storeToken(userRegData.accessToken??"");
  //         getUser();
  //       }
  //     }
  //   } catch (e) {
  //     //TODO: Do something with caught error;
  //   } finally {
  //     setNormalButtonLoading = false;
  //   }
  // }
  //
  // Future<void> getUser() async {
  //   setNormalButtonLoading = true;
  //   try {
  //     final res = await AuthApi().getUser();
  //     if (res?.data != null) {
  //       _userService.storeUser(res?.data);
  //     }
  //   } catch (e) {
  //     //tODO: Do something with caught error;
  //   } finally {
  //     setNormalButtonLoading = false;
  //   }
  // }
}

final productProvider = StateNotifierProvider<ProductProvider, ProductState>((ref) {
  return ProductProvider();
});

//final checkBoxState = StateProvider<bool>((ref) => false);
// final loadingGoogleButton = StateProvider<bool>((ref) => false);

List<ProductByCategory>? groupProductsByCategory(List<ProductData>? products) {
  if (products == null || products.isEmpty) return null;

  final Map<String, List<ProductData>> groupedMap =
  <String, List<ProductData>>{};

  for (var product in products) {
    if (!groupedMap.containsKey(product.category)) {
      groupedMap[product.category??""] = [];
    }
    groupedMap[product.category]!.add(product);
  }

  return groupedMap.entries
      .map((entry) => ProductByCategory(
    category: entry.key,
    products: entry.value,
  ))
      .toList();
}