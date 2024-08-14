import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/product_card.dart';
import 'package:flutter_boilerplate_hng11/gen/assets.gen.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Products",
                      style: CustomTextStyles.titleTextBlack,
                    ),
                    Text(
                      "View all products",
                      style: CustomTextStyles.productTextBodyBlack,
                    ),
                  ],
                ),
                // const Spacer(),
                Assets.images.svg.productListing.listIcon.svg(),
                // SizedBox(
                //   width: 8.w,
                // ),
                Assets.images.svg.productListing.gridIcon.svg(),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: GlobalScreenSize.getScreenHeight(
                    context,
                  ) *
                  0.052,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: GlobalColors.searchBorderColor)),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Product",
                    suffixIcon: SvgPicture.asset(
                      Assets.images.svg.productListing.searchIcon.path,
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  "Breakfast",
                  style: CustomTextStyles.titleTextBlack,
                ),
                const Spacer(),
                Text(
                  "See more",
                  style: CustomTextStyles.productTextBodyBlack,
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
                return const ProductCardWiget();
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
