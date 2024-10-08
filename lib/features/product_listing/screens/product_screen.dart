// ignore_for_file: unused_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product.provider.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';

import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_size.dart';
import '../widgets/product_listing_card_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/product_loader.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _searchController = TextEditingController();
  }

// please merge my codeeeeeeeeee pleasseeeeeeeeeeeee
  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _searchController,
              onChanged: (value) {
                if (value?.isNotEmpty ?? false) {
                  ref.read(searchInputProvider.notifier).update(value!);
                }
              },
            ),
          ),
          Expanded(
            child: ref.watch(productListProvider).when(
              data: (data) {
                if (data.isEmpty) {
                  return Center(
                    child: Lottie.asset(
                      'assets/animation/empty.json',
                      controller: _animationController,
                      onLoaded: (composition) {
                        _animationController
                          ..duration = composition.duration
                          ..repeat();
                      },
                      height: 250.h,
                      width: 250.w,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: SizedBox(
                    height: GlobalScreenSize.getScreenHeight(context),
                    child: Builder(builder: (context) {
                      final data = ref.watch(productsByCategoryProvider);
                      return data.when(
                        data: (data) {
                          final allKeys = data.keys.toList();
                          return RefreshIndicator.adaptive(
                            onRefresh: () =>
                                ref.refresh(productListProvider.future),
                            child: ListView.separated(
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
                            ),
                          );
                        },
                        error: (error, stackTrace) {
                          return RefreshIndicator.adaptive(
                            onRefresh: () =>
                                ref.refresh(productListProvider.future),
                            child: ListView(
                              children: [
                                //try to merge my code plssssssssssss
                                Center(
                                  child: Lottie.asset(
                                    'assets/animation/empty.json',
                                    controller: _animationController,
                                    onLoaded: (composition) {
                                      _animationController
                                        ..duration = composition.duration
                                        ..repeat();
                                    },
                                    height: 250.h,
                                    width: 250.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Center(
                                  child: Text(
                                    context.pullToRefresh,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 16.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        loading: () {
                          return const ProductLoader();
                        },
                      );
                    }),
                  ),
                );
              },
              error: (Object error, StackTrace stackTrace) {
                return RefreshIndicator.adaptive(
                  onRefresh: () => ref.refresh(productListProvider.future),
                  child: ListView(
                    children: [
                      Center(
                        child: Lottie.asset(
                          '/home/user/Flutter_Boilerplate_Hng11/assets/animation/empty.json',
                          controller: _animationController,
                          onLoaded: (composition) {
                            _animationController
                              ..duration = composition.duration
                              ..repeat();
                          },
                          height: 250.h,
                          width: 250.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Text(
                          context.pullToRefresh,
                          style: TextStyle(color: Colors.red, fontSize: 16.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                return const ProductLoader();
              },
            ),
          ),
        ],
      ),
    );
  }
}
