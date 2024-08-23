import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/context_extensions.dart';
import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';
import '../../models/subscription_model.dart';

class PlanDescriptionSection extends StatelessWidget {
  const PlanDescriptionSection({super.key, required this.plan});
  final SubscriptionPlan plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.0),
          decoration: BoxDecoration(
            border: Border.all(color: GlobalColors.containerBorderColor),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.getText(context),
                style: CustomTextStyle.medium(
                  fontSize: 18.sp,
                  color: GlobalColors.dark2,
                ),
              ),
              SizedBox(height: 9.h),
              Text(
                plan.getDescription(context),
                style: CustomTextStyle.regular(
                  fontSize: 14.sp,
                  color: GlobalColors.dark2,
                ),
              ),
              SizedBox(height: 9.h),
              Text(
                '\$${plan.amount}/month',
                style: CustomTextStyle.regular(
                  fontSize: 14.sp,
                  color: GlobalColors.darkOne,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: context.pop,
                child: Text(
                  context.text.upgradeToAccessFeatures,
                  style: CustomTextStyle.regular(
                    fontSize: 14.sp,
                    color: GlobalColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 28.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.0),
          decoration: BoxDecoration(
            border: Border.all(color: GlobalColors.containerBorderColor),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Plan Benefits',
                style: CustomTextStyle.semiBold(
                  fontSize: 16.sp,
                  color: GlobalColors.dark2,
                ),
              ),
              SizedBox(height: 20.h),
              for (final descriptions
                  in plan.getBulletDescriptions(context)) ...[
                Text(
                  '•  $descriptions',
                  style: CustomTextStyle.regular(
                    fontSize: 14.sp,
                    color: GlobalColors.dark2,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
