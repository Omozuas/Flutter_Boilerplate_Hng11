import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product.provider.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                SizedBox(
                    height: GlobalScreenSize.getScreenHeight(context) * 0.053,
                    child: Assets.images.png.productListing.profile.image()),
                SizedBox(
                  width: 8.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: CustomTextStyles.productSmallBodyTextBlack,
                    ),
                    Text(
                      "DesignKid",
                      style: CustomTextStyles.productTextBody2Black,
                    ),
                  ],
                ),
                const Spacer(),
                Assets.images.svg.productListing.notification.svg()
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              AppLocalizations.of(context)!.discoverButton,
              style: CustomTextStyles.headerTextBlack,
            ),
            SizedBox(
              height: 16.h,
            ),
            Consumer(builder: (context, ref, child) {
              return Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                height: GlobalScreenSize.getScreenHeight(
                      context,
                    ) *
                    0.052,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: GlobalColors.searchBorderColor)),
                child: TextFormField(
                  onChanged: ref.watch(searchInputProvider.notifier).update,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          AppLocalizations.of(context)!.searchProductButton,
                      suffixIcon: SvgPicture.asset(
                        Assets.images.svg.productListing.searchIcon.path,
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.scaleDown,
                      )),
                ),
              );
            }),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: GlobalScreenSize.getScreenHeight(context) * 0.168,
              width: GlobalScreenSize.getScreenWidth(context),
              padding: EdgeInsets.only(left: 22.w, top: 10.h),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalColors.cardGradintColorOne,
                    GlobalColors.cardGradintColorTwo,
                    GlobalColors.cardGradintColorThree,
                  ]),
                  borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: GlobalScreenSize.getScreenWidth(context) * 0.4,
                        child: Text(
                          AppLocalizations.of(context)!.topBoilerplatesForYou,
                          style: CustomTextStyles.bannerHeaderTextWhite,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height:
                            GlobalScreenSize.getScreenHeight(context) * 0.04,
                        width: GlobalScreenSize.getScreenWidth(context) * 0.25,
                        decoration: BoxDecoration(
                            color: GlobalColors.white,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.discountLabel,
                            style: CustomTextStyles.bannerbodyTextOrange,
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Assets.images.png.productListing.iphone.image(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.availableProducts,
                  style: CustomTextStyles.titleTextBlack,
                ),
                Text(
                  AppLocalizations.of(context)!.seeMore,
                  style: PlusJakartaTextStyle.bodyTextGrey,
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
                child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return InkWell(
                    onTap: () => context.push('${AppRoute.products}/sdfsdf'),
                    child: const SizedBox());
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 16.h,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
