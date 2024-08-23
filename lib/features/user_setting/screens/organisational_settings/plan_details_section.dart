import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';
import '../../models/subscription_model.dart';

class PlanDetailsSection extends StatelessWidget {
  const PlanDetailsSection({super.key, required this.plan});
  final SubscriptionPlan plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final details in plan.details) ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 26.sp),
            color: GlobalColors.containerBgColor,
            child: Text(
              details.$1,
              style: CustomTextStyle.bold(
                fontSize: 16,
                color: GlobalColors.dark2,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: GlobalColors.containerBorderColor),
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, i) => const Divider(),
              itemCount: details.$2.length,
              itemBuilder: (_, i) {
                final item = details.$2[i];
                final text = item.$1;
                final answer = item.$2;
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 14.sp, vertical: 26.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: CustomTextStyle.regular(
                            fontSize: 16,
                            color: GlobalColors.dark2,
                          ),
                        ),
                      ),
                      if (answer is bool)
                        const Expanded(
                          child: Icon(Icons.check),
                        ),
                      if (answer is String)
                        Expanded(
                          child: Text(
                            answer,
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.regular(
                              fontSize: 16,
                              color: GlobalColors.dark2,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15.h),
        ],
      ],
    );
  }
}
