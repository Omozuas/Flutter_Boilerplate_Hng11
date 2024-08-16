import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/rating_and_review_model.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/icons/icon_paths.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewAndRatingDetail extends StatelessWidget {
  const ReviewAndRatingDetail({
    required this.review,
    this.showDivider = true,
    super.key,
  });
  final ReviewAndRatingModel review;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Icon(
                    Icons.star,
                    size: 16,
                    color: index < review.rating
                        ? GlobalColors.orange
                        : GlobalColors.borderColor,
                  ),
                ),
              ),
            ),
            Text(
              review.date,
              style: TextStyle(
                color: GlobalColors.mutedTextColor,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14.h),
            Text(
              review.content,
              style: CustomTextStyles.productTextBody4Black.copyWith(
                color: GlobalColors.black,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  "Reaction: ",
                  style: TextStyle(
                    color: GlobalColors.mutedTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  review.reaction,
                  style: TextStyle(
                    color: GlobalColors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),SizedBox(height: 8.h),
                        Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "By: ",
                      style: TextStyle(
                        color: GlobalColors.mutedTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      review.author,
                      style: TextStyle(
                        color: GlobalColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(IconPaths.verified,height: 16,),
                    SizedBox(width: 6.w),
                    Text(
                      "Verified Buyer",
                      style: TextStyle(
                        color: GlobalColors.verified,
                        fontSize: 12.sp,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        Visibility(
          visible: showDivider,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Divider(
              color: GlobalColors.dividerColor,
            ),
          ),
        )
      ],
    );
  }
}
