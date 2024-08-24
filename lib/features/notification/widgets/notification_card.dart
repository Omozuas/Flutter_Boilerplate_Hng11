import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/notification/widgets/profile_picture_notification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/custom_text_style.dart';
import '../../cart/utils/widget_extensions.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.h.padV,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: width(context),
          height: 48.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const NotificationProfilePicture(),
                  13.w.sbW,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("data",
                          style: CustomTextStyle.bold(color: Colors.black)),
                      Text("Made a new sale today",
                          style: CustomTextStyle.regular()),
                    ],
                  )
                ],
              ),
              Text(
                '1m ago.',
                style: CustomTextStyle.medium(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
