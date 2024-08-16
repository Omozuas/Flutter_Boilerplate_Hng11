import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/subscription_checkout.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
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
                decoration: BoxDecoration(color: GlobalColors.containerBgColor),
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
              const SizedBox(
                height: 28,
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

class PlanCard extends StatelessWidget {
  final String planCardPlan;
  final double planCardPrice;
  final bool isItCurrentPlan;
  final String planCardDescription;
  final String? bulletDescription1;
  final String? bulletDescription2;
  final String? bulletDescription3;
  final String? bulletDescription4;
  final String? bulletDescription5;
  final String? bulletDescription6;
  final VoidCallback? onTap;

  const PlanCard(
      {super.key,
      required this.planCardPlan,
      required this.planCardPrice,
      required this.isItCurrentPlan,
      required this.planCardDescription,
      this.bulletDescription1,
      this.bulletDescription2,
      this.bulletDescription3,
      this.bulletDescription4,
      this.bulletDescription5,
      this.bulletDescription6,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, top: 40, right: 35, bottom: 30),
      decoration: BoxDecoration(
          border: isItCurrentPlan
              ? Border.all(color: GlobalColors.orange, width: 0.5)
              : const Border(),
          borderRadius: BorderRadius.circular(10),
          color: isItCurrentPlan
              ? GlobalColors.white
              : GlobalColors.containerBgColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            planCardPlan,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, height: 19.2 / 16),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                "\$" "$planCardPrice",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  height: 30 / 25,
                ),
              ),
              Text(
                "/month",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    height: 23.4 / 13,
                    color: GlobalColors.darkOne),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            planCardDescription,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 16.9 / 14,
                color: GlobalColors.darkOne),
          ),
          const SizedBox(
            height: 32,
          ),
          if (bulletDescription1 != null) Text("•" " $bulletDescription1"),
          if (bulletDescription2 != null) Text("•" " $bulletDescription2"),
          if (bulletDescription3 != null) Text("•" " $bulletDescription3"),
          if (bulletDescription4 != null) Text("•" " $bulletDescription4"),
          if (bulletDescription5 != null) Text("•" " $bulletDescription5"),
          if (bulletDescription6 != null) Text("•" " $bulletDescription6"),
          const SizedBox(
            height: 32,
          ),
          if (isItCurrentPlan == true)
            CustomButton(
              onTap: () {},
              borderColor: Colors.transparent,
              borderColors: Colors.transparent,
              text: "Current Plan",
              height: 40,
              containerColor: GlobalColors.btnBgColor,
              width: 180,
              textColor: GlobalColors.darkOne,
            )
          else
            CustomButton(
              onTap: onTap ?? () {},
              borderColor: Colors.transparent,
              borderColors: Colors.transparent,
              text: "Upgrade",
              height: 40,
              containerColor: GlobalColors.orange,
              width: 180,
              textColor: GlobalColors.white,
            ),
        ],
      ),
    );
  }
}
