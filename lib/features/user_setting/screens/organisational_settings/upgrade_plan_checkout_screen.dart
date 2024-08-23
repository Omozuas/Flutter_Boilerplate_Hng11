import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';
import '../../models/subscription_model.dart';
import '../../provider/profile_provider.dart';
import '../../widgets/dialogs/reusable_dialog_content.dart';
import '../../widgets/ref_extension.dart';
import '../../widgets/subscription_plan_card.dart';
import 'plan_description_section.dart';
import 'plan_details_section.dart';

class UpgradePlanCheckoutScreen extends ConsumerStatefulWidget {
  const UpgradePlanCheckoutScreen({super.key, required this.plan});
  final SubscriptionPlan plan;

  @override
  ConsumerState<UpgradePlanCheckoutScreen> createState() =>
      _UpgradePlanCheckoutScreenState();
}

class _UpgradePlanCheckoutScreenState
    extends ConsumerState<UpgradePlanCheckoutScreen> {
  late final SubChromeSafariBrowser browser;

  @override
  void initState() {
    super.initState();
    browser = SubChromeSafariBrowser(
      onClose: () async {
        ref.read(profileProvider.notifier).getSubscription();

        if (!context.mounted) return;
        await showDialog(
          context: context,
          builder: (ctx) => ReusableDialogContent(
            title: 'Transaction Pending',
            description: 'Your current transaction is awaiting review.',
            btnText: 'View Subscriptions',
            onPressed: () => Navigator.pop(ctx),
          ),
        );

        if (!mounted) return;
        context.pop();
      },
    );
  }

  @override
  void dispose() {
    try {
      browser.dispose();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPlan =
        ref.watch(profileProvider).fetchSubcription.sureValue?.plan;
    final isCurrentPlan = currentPlan == widget.plan;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isCurrentPlan ? 'Current Plan' : 'Upgrade to ${widget.plan.text}',
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
                        plan: widget.plan,
                        onButtonTap: () async {
                          await browser.open(
                            url: WebUri('https://www.google.com'),
                            settings: ChromeSafariBrowserSettings(
                              showTitle: false,
                              shareState: CustomTabsShareState.SHARE_STATE_OFF,
                              barCollapsingEnabled: true,
                            ),
                          );
                        },
                      )
                    : PlanDescriptionSection(plan: widget.plan),
              ),
              SizedBox(height: 28.h),
              PlanDetailsSection(plan: widget.plan),
            ],
          ),
        ),
      ),
    );
  }
}

class SubChromeSafariBrowser extends ChromeSafariBrowser {
  SubChromeSafariBrowser({required this.onClose});
  final VoidCallback onClose;

  @override
  void onClosed() => onClose();
}
