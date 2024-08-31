import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
// import 'package:flutter_boilerplate_hng11/features/auth/widgets/loading_overlay.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_detail/provider/product_detail.provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/edit_and_delete.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/product_name_and_price_section.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/string_extension.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.simpleTitle(
        titleText: context.productDescription,
      ),
      body: Consumer(builder: (context, ref, child) {
        final state = ref.watch(productDetailProvider);
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return
            // LoadingOverlay(
            //   isLoading: state.operationLoading,
            SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 20.h,
                ),
                child: Builder(builder: (context) {
                  final product = state.product!;
                  if (product.image!.isNotEmpty) {
                    if (product.image!.startsWith('http')) {
                      return Image.network(product.image!);
                    } else if (product.image!.isValidBase64) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius here

                        child: Image.memory(
                          width: double.infinity,
                          height: 200.h,
                          fit: BoxFit.cover,
                          base64Decode(product.image!),
                          errorBuilder: (context, error, stackTrace) =>
                              const EmptyImage(),
                        ),
                      );
                    } else {
                      return const EmptyImage();
                    }
                  }
                  return const EmptyImage();
                }),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Divider(
                  color: GlobalColors.dividerColor,
                ),
              ),
              ProductNameAndPriceSection(product: state.product!),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Divider(
                  color: GlobalColors.dividerColor,
                ),
              ),
              // const ProductVariationSection(),
              // Divider(
              //   color: GlobalColors.dividerColor,
              // ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 16.h,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                  color: GlobalColors.zinc50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.description,
                      style: CustomTextStyles.productTextBodyBlack.copyWith(
                        color: GlobalColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '${state.product?.description}',
                      style: CustomTextStyles.productTextBodyBlack.copyWith(
                        color: GlobalColors.mutedTextColor,
                      ),
                    )
                  ],
                ),
              ),
              Divider(color: GlobalColors.dividerColor),
              CustomDropdownButton(
                borderRadius: 0,
                valueStyle: TextStyle(color: GlobalColors.mutedTextColor),
                placeholder: "Delivery Address",
                items: const ["Ibadan", 'Eko', "Uyo"],
                borderColor: GlobalColors.borderColor,
                height: 64,
                containerColor: Colors.white,
                textPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 24.w),
                width: double.infinity,
                textColor: GlobalColors.mutedTextColor,
              ),
              DeleteAndEditActions(
                productId: '${state.product?.id}',
              )
            ],
          ),
        );
      }),
    );
  }
}

class EmptyImage extends StatelessWidget {
  const EmptyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162.h,
      margin: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 24.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
