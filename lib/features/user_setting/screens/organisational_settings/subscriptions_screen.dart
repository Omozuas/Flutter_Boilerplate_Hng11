import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/context_extensions.dart';
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
    final currentPlan = ref.watch(profileProvider).fetchSubcription.sureValue;

    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: context.text.subscriptionPlan,
        showDivider: false,
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
