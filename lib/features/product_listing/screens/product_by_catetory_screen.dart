import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/string_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_size.dart';
import '../provider/product.provider.dart';
import '../widgets/add_product_formfields.dart';
import '../widgets/product_card.dart';

class ProductsByCategory extends ConsumerWidget {
  const ProductsByCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(productsInCategoryProvider).name;

    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: name,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  ref.read(searchInputCategoryProvider.notifier).update(value);
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
              child: Consumer(builder: (context, ref, child) {
                final data = ref.watch(productsInCategoryDataProvider);
                if (data.isEmpty) {
                  return ListView(
                    children: [
                      (MediaQuery.sizeOf(context).height / 4).sbH,
                      Center(
                        child: Text(
                          context.yourProductsWillShowHere,
                          style: CustomTextStyles.productTextBody4Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                }
                return ListView.separated(
                  itemCount: data.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (txt, index) {
                    final product = data[index];
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: data.last == product ? 60 : 0),
                        child: InkWell(
                          onTap: () => context
                              .push('${AppRoute.products}/${product.id!}'),
                          child: ProductCardWiget(
                            productNmae: '${product.name}',
                            status: '${product.status}'.capitalize,
                            category: '${product.category}',
                            price: product.price ?? 0,
                            image: product.image ?? '',
                          ),
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
