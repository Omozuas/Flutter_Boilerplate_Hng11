import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/rating_and_review_model.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/review_and_rating_detail.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRatingAndReviewSection extends StatefulWidget {
  const ProductRatingAndReviewSection({super.key});

  @override
  State<ProductRatingAndReviewSection> createState() =>
      _ProductRatingAndReviewSectionState();
}

class _ProductRatingAndReviewSectionState
    extends State<ProductRatingAndReviewSection> {
  bool showRatingAndReview = false;

  void handleShowRating() {
    setState(() {
      showRatingAndReview = !showRatingAndReview;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: handleShowRating,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product Ratings and Reviews",
                  style: TextStyle(color: GlobalColors.mutedTextColor),
                ),
                Icon(showRatingAndReview
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),
          Visibility(
            visible: showRatingAndReview,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const RatingsValueRow(),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 18.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: GlobalColors.borderColor)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        4,
                        (index) => ReviewAndRatingDetail(
                          /// itemIndex being the length
                          showDivider: index + 1 != 4,
                          review: ReviewAndRatingModel(
                            author: "Mercy",
                            content: "Bad product",
                            date: "08-08-2024",
                            rating: index + 1,
                            reaction: "Bad",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RatingsValueRow extends StatelessWidget {
  const RatingsValueRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: GlobalColors.lightGray),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
            decoration: BoxDecoration(
                border: Border.all(color: GlobalColors.orange),
                borderRadius: BorderRadius.circular(2),),
            child: Text(
              "3.75/5",
              style: CustomTextStyles.bannerbodyTextOrange,
            ),
          ),
          SizedBox(width: 9.w),
          Text(
            "(17381 ratings)",
            style: TextStyle(
              fontSize: 12.sp,
              color: GlobalColors.mutedTextColor,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Text(
              "See all reviews",
              style: CustomTextStyles.bannerbodyTextOrange,
            ),
          )
        ],
      ),
    );
  }
}
