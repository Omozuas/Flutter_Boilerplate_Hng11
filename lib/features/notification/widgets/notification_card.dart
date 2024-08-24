import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/notification/widgets/profile_picture_notification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/custom_text_style.dart';
import '../../cart/utils/widget_extensions.dart';
import '../model/notification_response.dart';

class NotificationCard extends StatelessWidget {
  final Notifications notification;
  const NotificationCard({super.key, required this.notification});

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("New Notif",
                      //     style: CustomTextStyle.bold(color: Colors.black)),
                      Text(notification.message??"",
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
