import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/subscriptions_screen.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/profile_settings/account_settings.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/subscription_dialog.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/recent_transaction_card.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/subscription_benefit_card.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/subscription_header_card.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_toast.dart';

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
      case SubscriptionPlan.premium:
        return "Premium";
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
      case SubscriptionPlan.premium:
        return "You're currently enjoying the benefits of our Premium plan. Your subscription will auto-renew on the 30th of July 2024";
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
      case SubscriptionPlan.premium:
        return 100;
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
      case SubscriptionPlan.premium:
        return [
          "300 Projects",
          "Up to 500 subscribers",
          "Advanced analytics",
          "24-hour support",
          "Marketing advisor"
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
              const SizedBox(height: 20),
              const RecentTransactionsCard(),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {},
                borderColor: Colors.transparent,
                text: "Upgrade Subscription",
                height: 40,
                containerColor: GlobalColors.orange,
                width: 300,
                textColor: GlobalColors.white,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                  onTap: () {
                    showDialog(
                              context: context,
                              builder: (context) =>  SubscriptionDialog(
                                title: 'We are sorry to see you go!',
                                message: 'Are you sure you want to cancel your subscription ? By cancelling, you will lose access to all premium features ',
                                buttonText1: 'Cancel Subscription',
                                buttonText2: 'Keep Subscription',
                                onTap1: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>  SubscriptionDialog(
                                      title: 'Subscription Canceled',
                                      message: 'Your subscription has been successfully canceled. If you change your mind, you can reactivate your subscription anytime',
                                      buttonText1: 'Reactivate Subscription',
                                      buttonText2: 'Go to Dashboard',
                                      onTap1: () {
                                        const CustomToast(message: 'Subscription Reactivated',);
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return const SettingsScreen();
                                        }));
                                      },
                                      onTap2: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return const SettingsScreen();
                                        }));
                                      },),
                                  );

                                }, onTap2: () {
                                Navigator.pop(context);
                              },),
                            );
                  },
                  borderColor: GlobalColors.lightGray,
                  text: "Cancel Subscription",
                  height: 40,
                  containerColor: GlobalColors.white,
                  width: 300,
                  textColor: GlobalColors.darkTwo),
            ],
          ),
        ),
      ),
    );
  }
}

