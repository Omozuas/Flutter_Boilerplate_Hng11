
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';

class SubscriptionHeaderCard extends StatelessWidget {
  final String planName;
  final double planPrice;
  final String planDescription;

  const SubscriptionHeaderCard({
    super.key,
    required this.planName,
    required this.planPrice,
    required this.planDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: GlobalColors.containerBorderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            planName,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 21.78 / 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            planDescription,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 14.52 / 12,
              color: GlobalColors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Total: \$${planPrice.toStringAsFixed(2)}",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 19.36 / 16,
              color: GlobalColors.black,
            ),
          ),
        ],
      ),
    );
  }
}