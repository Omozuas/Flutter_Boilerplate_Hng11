import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';
import '../../../../utils/routing/app_router.dart';
import '../../models/subscription_model.dart';
import '../../provider/profile_provider.dart';
import '../../widgets/ref_extension.dart';
import '../../widgets/subscription_plan_card.dart';

class SubscriptionsScreen extends ConsumerStatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends ConsumerState<SubscriptionsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).getSubscription();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(profileProvider).fetchSubcription.isLoading;
    final currentPlan = ref.watch(profileProvider).fetchSubcription.sureValue?.plan;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscription Plan',
          style: CustomTextStyle.semiBold(
            fontSize: 16,
            color: GlobalColors.iconColor,
          ),
        ),
        // leading: InkWell(
        //   onTap: () {
        //     // context.pop();
        //     ref.read(profileProvider.notifier).getSubscription();
        //   },
        //   child: const Icon(Icons.arrow_back_ios_new),
        // ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              child: SafeArea(
                child: Column(
                  children: [
                    for (final plan in SubscriptionPlan.values) ...[
                      PlanCard(
                        plan: plan,
                        isItCurrentPlan: plan == currentPlan,
                        onButtonTap: () {
                          context.push(
                            AppRoute.upgradePlanCheckout,
                            extra: plan,
                          );
                        },
                      ),
                      SizedBox(height: 28.h),
                    ],
                  ],
                ),
              ),
            ),
    );
  }
}
