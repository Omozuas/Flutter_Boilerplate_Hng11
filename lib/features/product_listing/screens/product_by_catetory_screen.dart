import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/string_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/global_size.dart';
import '../../../utils/routing/app_router.dart';
import '../models/product/product_model.dart';
import '../provider/product.provider.dart';
import '../widgets/add_product_formfields.dart';
import '../widgets/product_card.dart';

class ProductsByCategory extends ConsumerWidget {
  const ProductsByCategory({super.key});

 @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = [
      const Product(
          name: 'Product 1',
          status: 'In Stock',
          category: 'P001',
          price: 19,
          image: 'assets/images/png/product_listing/iphone.png'),
           const Product(
          name: 'Product 1',
          status: 'In Stock',
          category: 'P001',
          price: 19,
          image: 'assets/images/png/product_listing/iphone.png'),
           const Product(
          name: 'Product 1',
          status: 'In Stock',
          category: 'P001',
          price: 19,
          image: 'assets/images/png/product_listing/iphone.png'),
           const Product(
          name: 'Product 1',
          status: 'In Stock',
          category: 'P001',
          price: 5,
          image: 'assets/images/png/product_listing/iphone.png'),
           const Product(
          name: 'Product 1',
          status: 'In Stock',
          category: 'P001',
          price: 200,
          image: 'assets/images/png/product_listing/iphone.png'),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.push(AppRoute.addProduct);
              },
              backgroundColor: GlobalColors.orange,
              shape: const CircleBorder(),
              child: Icon(
                Icons.add,
                color: GlobalColors.white,
              ),
            ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.only(
                left: 10.w, top: 48.h, right: 24.w, bottom: 10.h),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Breakfast',
                      style: CustomTextStyles.producHeaderBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: GlobalColors.diverColor,
          ),
          SizedBox(
            height: 24.h,
          ),
           Padding(
            padding: EdgeInsets.only(left: 23.w, right: 23.w),
            child: CustomTextField(
              suffixIcon: const Icon(Icons.search),
              hintText: 'Search Product',
              onChanged: (value) {
                if (value != null) {
                  ref.read(searchInputProvider.notifier).update(value);
                }
              },
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
            ),
            child: SizedBox(
              height: GlobalScreenSize.getScreenHeight(context),
              child: Builder(builder: (context) {
                return ListView.separated(
                  itemCount: 3,
                  padding: EdgeInsets.zero,
                  itemBuilder: (txt, index) {
                    final product = products[index];
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: ProductCardWiget(
                          productNmae: '${product.name}',
                          status: '${product.status}'.capitalize,
                          category: '${product.category}',
                          price: product.price ?? 0,
                          image: product.image ?? '',
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 24.h,
                  ),
                );
              }),
            ),
          )),
        ],
      ),
    );
  }
}