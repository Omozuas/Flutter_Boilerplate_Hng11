
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';

class SubscriptionBenefitsCard extends StatelessWidget {
  final List<String> benefits;

  const SubscriptionBenefitsCard({super.key, required this.benefits});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: GlobalColors.containerBgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: benefits
                .map(
                  (benefit) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: GlobalColors.black),
                    const SizedBox(width: 10),
                    Text(
                      benefit,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 17.5 / 14,
                      ),
                    ),
                  ],
                ),
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}

