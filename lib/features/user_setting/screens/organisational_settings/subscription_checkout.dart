import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/subscriptions_screen.dart';

import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/subscription_dialog.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/recent_transaction_card.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/subscription_benefit_card.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/subscription_header_card.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';

import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../models/subscription_model.dart';

class SubscriptionCheckout extends StatelessWidget {
  final SubscriptionPlan plan;

  const SubscriptionCheckout({super.key, required this.plan});

  String getPlanName() {
    switch (plan) {
      case SubscriptionPlan.free:
        return "Free";
      case SubscriptionPlan.basic:
        return "Basic";
      case SubscriptionPlan.advanced:
        return "Advanced";
      default:
        return "";
    }
  }

  String getPlanDescription() {
    switch (plan) {
      case SubscriptionPlan.free:
        return "You're currently enjoying the benefits of our Free plan. Your subscription will auto-renew on the 30th of July 2024";
      case SubscriptionPlan.basic:
        return "You're currently enjoying the benefits of our Basic plan. Your subscription will auto-renew on the 30th of July 2024";
      case SubscriptionPlan.advanced:
        return "You're currently enjoying the benefits of our Advanced plan. Your subscription will auto-renew on the 30th of July 2024";
      default:
        return "";
    }
  }

  double getPlanPrice() {
    switch (plan) {
      case SubscriptionPlan.free:
        return 0;
      case SubscriptionPlan.basic:
        return 20;
      case SubscriptionPlan.advanced:
        return 50;
      default:
        return 0;
    }
  }

  List<String> getPlanBenefits() {
    switch (plan) {
      case SubscriptionPlan.free:
        return ["10 Projects", "Up to 10 subscribers", "Advanced analytics"];
      case SubscriptionPlan.basic:
        return [
          "100 Projects",
          "Up to 50 subscribers",
          "Advanced analytics",
          "24-hour support"
        ];
      case SubscriptionPlan.advanced:
        return [
          "200 Projects",
          "Up to 100 subscribers",
          "Advanced analytics",
          "24-hour support",
          "Marketing advisor"
        ];
      default:
        return [];
    }
  }

  void _showCancelSubscriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SubscriptionDialog(
        title: 'We are sorry to see you go!',
        message:
            'Are you sure you want to cancel your subscription? By cancelling, you will lose access to all premium features.',
        buttonText1: 'Cancel Subscription',
        buttonText2: 'Keep Subscription',
        onTap1: () {
          Navigator.pop(context);
          _showSubscriptionCanceledDialog(context);
        },
        onTap2: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showSubscriptionCanceledDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SubscriptionDialog(
        title: 'Subscription Canceled',
        message:
            'Your subscription has been successfully canceled. If you change your mind, you can reactivate your subscription anytime.',
        buttonText1: 'Reactivate Subscription',
        buttonText2: 'Go to Dashboard',
        onTap1: () {
          const CustomToast(
            message: 'Subscription Reactivated',
          );
          Navigator.pop(context);
        },
        onTap2: () {
          Navigator.pop(context);
          // context.push(AppRoute.settings);
          // Navigator.push(context, MaterialPageRoute(builder: (context){
          //   return SettingsScreen();
          // }));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Checkout for ${getPlanName()} Plan",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 21.78 / 18,
                ),
              ),
              const SizedBox(height: 20),
              SubscriptionHeaderCard(
                planName: getPlanName(),
                planPrice: getPlanPrice(),
                planDescription: getPlanDescription(),
              ),
              const SizedBox(height: 20),
              SubscriptionBenefitsCard(
                benefits: getPlanBenefits(),
              ),
              SizedBox(height: 20.h),
              const RecentTransactionsCard(),
              SizedBox(height: 20.h),
              CustomButton(
                onTap: () {},
                borderColor: Colors.transparent,
                text: "Upgrade Subscription",
                height: 40.h,
                containerColor: GlobalColors.orange,
                width: 350.w,
                textColor: GlobalColors.white,
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                onTap: () {
                  _showCancelSubscriptionDialog(context);
                },
                borderColor: GlobalColors.lightGray,
                text: "Cancel Subscription",
                height: 40.h,
                containerColor: GlobalColors.white,
                width: 350.w,
                textColor: GlobalColors.darkTwo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
