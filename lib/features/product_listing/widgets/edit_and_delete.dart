import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/product_detail/provider/product_detail.provider.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteAndEditActions extends ConsumerWidget {
  const DeleteAndEditActions({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 56.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // CustomButton(
          //   onTap: () {},
          //   borderColor: GlobalColors.borderColor,
          //   text: "Edit",
          //   height: 40,
          //   containerColor: GlobalColors.white,
          //   width: screenWidth * 0.4,
          //   textColor: Colors.black,
          // ),
          Expanded(
            child: CustomButton(
              onTap: () {
                ref.read(productDetailProvider.notifier).deleteProduct(
                    id: productId,
                    onSuccess: () {
                      Navigator.pop(context);
                    },
                    onError: () {});
              },
              borderColor: GlobalColors.orange,
              text: AppLocalizations.of(context)!.deleteButton,
              height: 40,
              loading: ref.watch(productDetailProvider).operationLoading,
              containerColor: GlobalColors.red,
              width: screenWidth * 0.4,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
