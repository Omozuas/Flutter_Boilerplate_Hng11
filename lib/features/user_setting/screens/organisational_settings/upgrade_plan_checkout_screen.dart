import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';
import '../../models/subscription_model.dart';
import '../../provider/profile_provider.dart';
import '../../widgets/ref_extension.dart';
import '../../widgets/subscription_plan_card.dart';
import 'plan_description_section.dart';
import 'plan_details_section.dart';

class UpgradePlanCheckoutScreen extends ConsumerWidget {
  const UpgradePlanCheckoutScreen({super.key, required this.plan});
  final SubscriptionPlan plan;

 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlan =
        ref.watch(profileProvider).fetchSubcription.sureValue?.plan;
    final isCurrentPlan = currentPlan == plan;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isCurrentPlan ? 'Current Plan' : 'Upgrade to ${plan.text}',
          style: CustomTextStyle.semiBold(
            fontSize: 16,
            color: GlobalColors.iconColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.sp),
                child: !isCurrentPlan
                    ? PlanCard(
                        plan: plan,
                        onButtonTap: () {},
                      )
                    : PlanDescriptionSection(plan: plan),
              ),
              SizedBox(height: 28.h),
              PlanDetailsSection(plan: plan),
            ],
          ),
        ),
      ),
    );
  }
}
