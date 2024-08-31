import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/Styles/text_styles.dart';

class ProductNameAndPriceSection extends StatelessWidget {
  const ProductNameAndPriceSection({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isInStock = product.status?.toLowerCase() == "in stock";
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      child: Text(
                        '${product.name}',
                        style: CustomTextStyles.productTextTitleBlack.copyWith(
                          color: GlobalColors.dark2,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '${product.category}',
                      style: TextStyle(
                        color: GlobalColors.dark2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text(
                      "\$${product.price?.toStringAsFixed(2)}",
                      style: CustomTextStyles.productTextTitleBlack.copyWith(
                        color: GlobalColors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: isInStock ? Colors.green : Colors.grey,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "${isInStock ? context.inStock : product.status}",
                        style: TextStyle(color: GlobalColors.darkOne),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
