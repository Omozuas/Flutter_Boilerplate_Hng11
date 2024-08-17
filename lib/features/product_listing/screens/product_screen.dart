import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product.provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/filter_product_bottomsheet.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_size.dart';
import '../widgets/product_listing_card_list.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(productListProvider).when(
      data: (data) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 24.w, top: 48.h, right: 24.w, bottom: 10.h),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Products",
                            style: CustomTextStyles.producHeaderBlack,
                          ),
                          Text(
                            "View all products",
                            style: CustomTextStyles.productSmallBodyTextBlack,
                          ),
                        ],
                      ),
                      // const Spacer(),
                      // Assets.images.svg.productListing.listIcon.svg(),
                      // SizedBox(
                      //   width: 8.w,
                      // ),
                      // Assets.images.svg.productListing.gridIcon.svg(),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          height: GlobalScreenSize.getScreenHeight(
                                context,
                              ) *
                              0.052,
                          width: GlobalScreenSize.getScreenWidth(
                                context,
                              ) *
                              0.7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                  color: GlobalColors.searchBorderColor)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Product",
                                suffixIcon: SvgPicture.asset(
                                  Assets
                                      .images.svg.productListing.sortIcon.path,
                                  height: 24.h,
                                  width: 24.w,
                                  fit: BoxFit.scaleDown,
                                )),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const FilterBottomSheet();
                            },
                          );
                        },
                        child:
                            Assets.images.svg.productListing.filterButton.svg(
                          height:
                              GlobalScreenSize.getScreenHeight(context) * 0.052,
                          width: GlobalScreenSize.getScreenWidth(context) * 0.7,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.h,
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
                              return ProductCardListWidget(
                                categoryName: allKeys[index],
                                products: data[myKey]!.reversed.toList(),
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
                )
              ],
            ),
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(
              'Something went wrong: $error',
              style: TextStyle(color: Colors.red, fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
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
    );
  }
}
