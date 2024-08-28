import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/context_extensions.dart';
import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';
import '../../../../utils/widgets/custom_snackbar.dart';
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
            title: context.text.transactionPending,
            description: context.text.transactionAwaitingReview,
            btnText: context.text.viewSubscriptions,
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
    final uriLoading =
        ref.watch(profileProvider).initiateSubscription.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isCurrentPlan
              ? context.text.currentPlan
              : widget.plan.getUpgradeToText(context),
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
                        isLoading: uriLoading,
                        onButtonTap: () async {
                          try {
                            await ref
                                .read(profileProvider.notifier)
                                .initiateSubscription(
                                  amount: widget.plan.amount.toDouble(),
                                  plan: widget.plan.name,
                                  frequency: widget.plan.frequency,
                                );
                            final uri = ref
                                .read(profileProvider)
                                .initiateSubscription
                                .sureValue;
                            if (uri == null) {
                              if (!context.mounted) return;
                              showSnackBar(context.text.errorOccurred);
                              return;
                            }
                            await browser.open(
                              url: WebUri(uri),
                              settings: ChromeSafariBrowserSettings(
                                showTitle: false,
                                shareState:
                                    CustomTabsShareState.SHARE_STATE_OFF,
                                barCollapsingEnabled: true,
                              ),
                            );
                          } catch (e) {
                            if (!context.mounted) return;
                            showSnackBar(
                              context.text.errorOccurred,
                            );
                          }
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
