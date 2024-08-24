import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product.provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/add_product_formfields.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_size.dart';
import '../widgets/product_listing_card_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: AppLocalizations.of(context)!.products,
        subTitle: AppLocalizations.of(context)!.viewAllProducts,
        onBack: () {
          context.go(AppRoute.home);
        },
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
              hintText: AppLocalizations.of(context)!.searchProductButton,
              onChanged: (value) {
                if (value != null) {
                  ref.read(searchInputProvider.notifier).update(value);
                }
              },
            ),
          ),
          Expanded(
            child: ref.watch(productListProvider).when(
              data: (data) {
                if (data.isEmpty) {
                  return ListView(
                    children: [
                      (MediaQuery.sizeOf(context).height / 4).sbH,
                      Center(
                        child: Text(
                          'Your products will show here',
                          style: CustomTextStyles.productTextBody4Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(
                    top: 24.h,
                  ),
                  child: SizedBox(
                    height: GlobalScreenSize.getScreenHeight(context),
                    child: Builder(builder: (context) {
                      final data = ref.watch(productsByCategoryProvider);
                      return data.when(
                        data: (data) {
                          final allKeys = data.keys.toList();
                          return ListView.separated(
                            itemCount: allKeys.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (txt, index) {
                              final myKey = allKeys[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: allKeys.last == myKey ? 60 : 0),
                                child: ProductCardListWidget(
                                  categoryName: allKeys[index],
                                  products: data[myKey]!.reversed.toList(),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 24.h,
                            ),
                          );
                        },
                        error: (error, stackTrace) {
                          return const SizedBox();
                        },
                        loading: () {
                          return const SizedBox();
                        },
                      );
                    }),
                  ),
                );
              },
              error: (Object error, StackTrace stackTrace) {
                return Scaffold(
                  body: ListView(
                    children: [
                      (MediaQuery.sizeOf(context).height / 3).sbH,
                      Center(
                        child: Text(
                          'Something went wrong: $error',
                          style: TextStyle(color: Colors.red, fontSize: 16.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
