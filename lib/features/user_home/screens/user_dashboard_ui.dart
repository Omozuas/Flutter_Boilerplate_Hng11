import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/add_product_formfields.dart';
import 'package:flutter_boilerplate_hng11/features/user_home/provider/user.home.provider.dart';
import 'package:flutter_boilerplate_hng11/utils/app_images.dart';
import 'package:flutter_boilerplate_hng11/utils/cart_utils/cart_functions.dart';
import 'package:flutter_boilerplate_hng11/utils/string_extension.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/shimmer_loaders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/Styles/text_styles.dart';
import '../../auth/providers/auth.provider.dart';
import '../../product_listing/widgets/product_card.dart';

class UserDashBoardScreen extends ConsumerWidget {
  const UserDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashBoardStateProvider = ref.watch(userDashBoardProvider);
    final dashboardProvider = ref.read(userDashBoardProvider.notifier);
    final authStateProvider = ref.watch(authProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await dashboardProvider.getAllProduct();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/cartoon-character-with-handbag-sunglasses_71767-99.jpg"),
                        fit: BoxFit.cover)),
              ),
              8.sp.sbHW,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: CustomTextStyles.productSmallBodyTextBlack
                        .copyWith(color: const Color(0xFF71717A)),
                  ),
                  Text(
                    authStateProvider.user?.firstName ?? "",
                    style: CustomTextStyles.productTextBody2Black
                        .copyWith(fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppSvgs.notification,
                  height: 24.h,
                  width: 24.w,
                ),
                16.w.sbW
              ],
            )
          ],
        ),
        body: Padding(
          padding: 16.h.padT,
          child: Padding(
            padding: 16.w.padH,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: CustomTextStyles.headerTextBlack,
                ),
                16.h.sbH,
                CustomTextField(
                  controller: dashboardProvider.searchController,
                  onChanged: dashboardProvider.searchProduct,
                  hintText: "Search Product",
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    size: 24.sp,
                  ),
                ),
                10.h.sbH,
                Expanded(
                  child: ListView(
                    children: [
                      Image.asset(
                        AppImages.boilerCard,
                        width: MediaQuery.of(context).size.width,
                        height: 168.h,
                        fit: BoxFit.fill,
                      ),
                      24.h.sbH,
                      Row(
                        children: [
                          Text(
                            'Recent Sales',
                            style: CustomTextStyles.titleTextBlack,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See more',
                              style: CustomTextStyles.productTextBodyBlack,
                            ),
                          )
                        ],
                      ),
                      0.h.sbH,
                      dashBoardStateProvider.isLoading && dashboardProvider.displayedProducts.isEmpty
                          ? const ProductLoadingWidget()
                          : !dashBoardStateProvider.isLoading && dashboardProvider.displayedProducts.isEmpty
                          ? Center(
                        child: Text(
                          "No products available.",
                          style: CustomTextStyles.productTextBodyBlack,
                        ),
                      )
                          : Column(
                        children: List.generate(
                          dashboardProvider.displayedProducts.length,
                              (index) {
                            final product =
                            dashboardProvider.displayedProducts[index];
                            log("Product: ${product.name}");
                            return Padding(
                              padding: 8.h.padV,
                              child: GestureDetector(
                                onTap: (){
                                  addItemToCart(product);
                                },
                                child: ProductCardWiget(
                                  productNmae: '${product.name}',
                                  status: '${product.status}'.capitalize,
                                  category: '${product.category}',
                                  price: product.price ?? 0,
                                  image: product.image ?? '',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      50.h.sbH,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class ProductLoadingWidget extends StatelessWidget {
  const ProductLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (_, i) {
        return Container(
          height: 130.h,
          padding: 16.sp.padA,
          width: width(context),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.h, color: const Color(0xFFF6F6F6)),
              borderRadius: BorderRadius.circular(8.sp),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.sp),
                  child: const Column(
                    children: [
                      Expanded(child: ShimmerCard()),
                    ],
                  ),
                ),
              ),
              16.sp.sbW,
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 130.h- 32.sp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.h),
                            child: SizedBox(
                              height: 20.h,
                              width: 100.w,
                              child: const ShimmerCard(),
                            ),
                          ),
                          10.h.sbH,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.h),
                            child: SizedBox(
                              height: 16.h,
                              child: const ShimmerCard(),
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.h),
                            child: SizedBox(
                              height: 20.h,
                              width: 100.w,
                              child: const ShimmerCard(),
                            ),
                          ),
                          10.h.sbH,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.h),
                            child: SizedBox(
                              height: 16.h,
                              child: const ShimmerCard(),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
        );
      }
    );
  }
}
