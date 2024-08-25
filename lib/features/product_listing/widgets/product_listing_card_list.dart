import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/Styles/text_styles.dart';
import 'product_card.dart';

class ProductCardListWidget extends StatelessWidget {
   const ProductCardListWidget(
      {super.key, required this.categoryName, required this.products});

  final String categoryName;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: PlusJakartaTextStyle.headerText2,
              ),
              TextButton(
                // onPressed: () => context.push(AppRoute.productsByCategory),
                onPressed: () {context.go(AppRoute.productsByCategory);},
                child: Text(
                  'See More',
                  // '',
                  style: PlusJakartaTextStyle.bodyTextGrey,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
            height: GlobalScreenSize.getScreenHeight(context) * .156,
            width: GlobalScreenSize.getScreenWidth(context),
            child: ListView.separated(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                final product = products[index];
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 24.w : 0,
                      right: index == products.length - 1 ? 24.0.w : 0),
                  child: InkWell(
                    onTap: () =>
                        context.push('${AppRoute.products}/${product.id!}'),
                    child: SizedBox(
                      width: GlobalScreenSize.getScreenWidth(context) * 0.88,
                      child: ProductCardWiget(
                        productNmae: '${product.name}',
                        status: '${product.status}'.capitalize,
                        category: '${product.category}',
                        price: product.price ?? 0,
                        image: product.image ?? '',
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 16.w,
              ),
            ))
      ],
    );
  }
}
