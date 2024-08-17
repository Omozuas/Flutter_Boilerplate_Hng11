import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/subscription_checkout.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/subscription_plan_card.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum SubscriptionPlan { free, basic, advanced, premium }

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  void navigateToCheckout(SubscriptionPlan plan) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubscriptionCheckout(plan: plan),
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
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Current Plan",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 21.78 / 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: GlobalColors.borderColor, width: 0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Free",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        height: 21.78 / 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your account is on a free 90-day trial of our free plan, through September 27th. Upgrade anytime to stay on this plan when your trial ends.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 14.52 / 12,
                          color: GlobalColors.darkOne),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              PlanCard(
                planCardPlan: SubscriptionPlan.free.name,
                planCardPrice: 0,
                isItCurrentPlan: true,
                planCardDescription:
                    "The essential to provide \nyour best work for clients.",
                bulletDescription1: "10 Projects",
                bulletDescription2: "Up to 10 subscribers",
                bulletDescription3: "Advanced analytics",
                onTap: () => navigateToCheckout(SubscriptionPlan.free),
              ),
              const SizedBox(
                height: 28,
              ),
              PlanCard(
                planCardPlan: SubscriptionPlan.basic.name,
                planCardPrice: 20,
                isItCurrentPlan: false,
                planCardDescription:
                    "The essential to provide \nyour best work for clients.",
                bulletDescription1: "100 Projects",
                bulletDescription2: "Up to 50 subscribers",
                bulletDescription3: "Advanced analytics",
                bulletDescription4: "24-hour support",
                onTap: () => navigateToCheckout(SubscriptionPlan.basic),
              ),
              SizedBox(
                height: 28.h,
              ),
              PlanCard(
                planCardPlan: SubscriptionPlan.advanced.name,
                planCardPrice: 50,
                isItCurrentPlan: false,
                planCardDescription:
                    "The essential to provide \nyour best work for clients.",
                bulletDescription1: "200 Projects",
                bulletDescription2: "Up to 100 subscribers",
                bulletDescription3: "Advanced analytics",
                bulletDescription4: "24-hour support",
                bulletDescription5: "Marketing advisor",
                onTap: () => navigateToCheckout(SubscriptionPlan.advanced),
              ),
              const SizedBox(
                height: 28,
              ),
              PlanCard(
                planCardPlan: SubscriptionPlan.premium.name,
                planCardPrice: 100,
                isItCurrentPlan: false,
                planCardDescription:
                    "The essential to provide \nyour best work for clients.",
                bulletDescription1: "300 Projects",
                bulletDescription2: "Up to 500 subscribers",
                bulletDescription3: "Advanced analytics",
                bulletDescription4: "24-hour support",
                bulletDescription5: "Marketing advisor",
                onTap: () => navigateToCheckout(SubscriptionPlan.premium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
