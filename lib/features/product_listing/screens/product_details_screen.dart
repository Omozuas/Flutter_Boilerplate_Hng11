import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final product = const ProductDetail(
    description:
        "A fusion of ripe bananas, pure honey, and succulent raspberries with our bread. Crafted to perfection.",
    inStock: true,
    name: "Product 01",
    price: 29.00,
    subname: "P002",
  );

  bool showRatingAndReview = false;

  void handleShowRating() {
    setState(() {
      showRatingAndReview = !showRatingAndReview;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Product Details",
          style: DetailStyles.header,
        ),
        centerTitle: true,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: GlobalColors.dividerColor,),
            Container(
              height: 162.h,
              margin: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 24.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber.shade500,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Divider(color: GlobalColors.dividerColor,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            product.name,
                            style: DetailStyles.label,
                          ),
                          SizedBox(height: 6.h),
                          Text(product.subname,
                              style:
                                  const TextStyle(color: DetailColors.dark2)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: DetailStyles.title,
                          ),
                          SizedBox(height: 6.h),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.green,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "In Stock",
                                style: TextStyle(color: DetailColors.dark1),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(children: [
                    ...List.generate(
                      5,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Icon(
                          Icons.star,
                          size: 16,
                          color: index < 4
                              ? GlobalColors.orange
                              : GlobalColors.borderColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "(4.5)",
                      style: TextStyle(color: DetailColors.mutedText),
                    ),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 12.h),
              child: Divider(color: GlobalColors.dividerColor,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Variation",
                    style:
                        TextStyle(color: DetailColors.dark1, fontSize: 14.sp),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 12.w),
                        height: 42.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: GlobalColors.orange.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
            Divider(color: GlobalColors.dividerColor,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24),
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: DetailColors.zinc50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    product.description,
                    style: TextStyle(
                        color: DetailColors.mutedText, fontSize: 14.sp),
                  )
                ],
              ),
            ),
            Divider(color: GlobalColors.dividerColor,),
            Container(
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
            ),
            CustomDropdownButton(
              borderRadius: 0,
              valueStyle: const TextStyle(color: DetailColors.mutedText),
              placeholder: "Delivery Address",
              items: const ["Ibadan", 'Eko', "Uyo"],
              borderColor: GlobalColors.borderColor,
              height: 64,
              containerColor: Colors.white,
              textPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 24.w),
              width: double.infinity,
              textColor: DetailColors.mutedText,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 56.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custombutton(
                    onTap: () {},
                    borderColor: GlobalColors.borderColor,
                    text: "Checkout",
                    height: 40,
                    containerColor: Colors.white,
                    width: screenWidth * 0.4,
                    textColor: Colors.black,
                  ),
                  Custombutton(
                    onTap: () {},
                    borderColor: GlobalColors.orange,
                    text: "Add to Cart",
                    height: 40,
                    containerColor: GlobalColors.orange,
                    width: screenWidth * 0.4,
                    textColor: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetail {
  const ProductDetail({
    required this.description,
    required this.inStock,
    required this.name,
    required this.price,
    required this.subname,
  });
  final String name, description, subname;
  final num price;
  final bool inStock;
}
