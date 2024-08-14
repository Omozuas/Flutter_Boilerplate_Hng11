import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/style.dart';
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
        children: [
          GestureDetector(
            // onTap: handleShowRating,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Product Ratings and Reviews",
                  style: TextStyle(color: DetailColors.mutedText),
                ),
                Icon(showRatingAndReview
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),

          /// Awaiting the change in design
          Visibility(
            visible: showRatingAndReview,
            child: Column(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("data $index"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
