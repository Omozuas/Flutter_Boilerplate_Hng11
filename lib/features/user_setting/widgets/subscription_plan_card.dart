import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/custom_text_style.dart';
import '../../../utils/context_extensions.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import '../models/subscription_model.dart';
import '../provider/profile_provider.dart';

class PlanCard extends ConsumerWidget {
  final SubscriptionPlan plan;
  final VoidCallback? onButtonTap;
  final bool isItCurrentPlan;
  final bool isLoading;

  const PlanCard({
    super.key,
    required this.plan,
    this.onButtonTap,
    this.isItCurrentPlan = false,
    this.isLoading = false,
  });

  Color get btnColor =>
      !isItCurrentPlan ? GlobalColors.orange : GlobalColors.btnBgColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlan = ref.watch(profileProvider).selectedPlan;

    return GestureDetector(
      onTap: () => ref.read(profileProvider.notifier).selectPlan(plan),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 18.sp),
        decoration: BoxDecoration(
            border: selectedPlan == plan
                ? Border.all(color: GlobalColors.orange, width: 0.5)
                : Border.all(color: GlobalColors.borderColor, width: 0.5),
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              plan.getText(context),
              style: CustomTextStyle.semiBold(
                fontSize: 21.sp,
                color: GlobalColors.dark2,
              ),
            ),
            const SizedBox(height: 21),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '\$${plan.amount}',
                  style: CustomTextStyle.medium(
                    fontSize: 33.sp,
                    color: GlobalColors.dark2,
                  ),
                ),
                Text(
                  ' /month',
                  style: CustomTextStyle.regular(
                    fontSize: 16.sp,
                    color: GlobalColors.darkOne,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 21),
            Text(
              plan.getAbout(context),
              style: CustomTextStyle.regular(
                fontSize: 19.sp,
                color: GlobalColors.darkOne,
              ),
            ),
            const SizedBox(height: 44),
            if (plan.getBulletDescriptions(context).isNotEmpty)
              for (final descriptions
                  in plan.getBulletDescriptions(context)) ...[
                Text(
                  '•  $descriptions',
                  style: CustomTextStyle.regular(
                    fontSize: 19.sp,
                    color: GlobalColors.dark2,
                  ),
                ),
                const SizedBox(height: 21),
              ],
            const SizedBox(height: 11),
            Padding(
              padding: EdgeInsets.only(right: 20.sp),
              child: CustomButton(
                onTap: () {
                  if (isLoading) return;
                  ref.read(profileProvider.notifier).selectPlan(plan);
                  onButtonTap?.call();
                },
                borderColor: btnColor,
                text: isItCurrentPlan
                    ? context.text.currentPlan
                    : context.text.upgrade,
                height: 53.0,
                loading: isLoading,
                containerColor: btnColor,
                width: double.infinity,
                textColor: !isItCurrentPlan
                    ? GlobalColors.white
                    : GlobalColors.darkOne,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
