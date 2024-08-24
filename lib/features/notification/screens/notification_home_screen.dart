import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/localiza/strings.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/notification_provider.dart';
import '../widgets/loading_notification_list.dart';
import '../widgets/notification_count_card.dart';
import '../widgets/notification_list.dart';

class NotificationHomeScreen extends ConsumerWidget {
  const NotificationHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notificationStateProvider = ref.watch(notificationProvider);
    //  var  notificationProviderController = ref.watch(notificationProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: AppLocalizations.of(context)!.notification,
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: 16.w.padH,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                  padding: 0.w.padA,
                  automaticIndicatorColorAdjustment: false,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  labelPadding: 8.w.padR,
                  tabAlignment: TabAlignment.start,
                  indicator: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2.h, color: GlobalColors.lightOrange))),
                  tabs: [
                    Tab(
                      icon: Padding(
                        padding: 16.sp.padH,
                        child: Row(
                          children: [
                            Text(
                              "General",
                              style: GoogleFonts.outfit(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: GlobalColors.black),
                            ),
                            if (notificationStateProvider
                                    .unReadNotificationCount >
                                0)
                              NotificationCountCard(
                                count: notificationStateProvider
                                    .unReadNotificationCount,
                              )
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      icon: Padding(
                        padding: 16.sp.padH,
                        child: Row(
                          children: [
                            Text(
                              "System",
                              style: GoogleFonts.outfit(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: GlobalColors.black),
                            ),
                            // if(notificationStateProvider.unReadNotificationCount > 0)
                            // NotificationCountCard(
                            //   count: notificationStateProvider.unReadNotificationCount,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ]),
              Expanded(
                  child: TabBarView(
                children: notificationStateProvider.notifications.isEmpty &&
                        notificationStateProvider.overViewLoading
                    ? [
                        const LoadingNotificationListView(),
                        const LoadingNotificationListView(),
                      ]
                    : notificationStateProvider.notifications.isEmpty &&
                            !notificationStateProvider.overViewLoading
                        ? [
                            const EmptyNotification(),
                            const EmptyNotification(),
                          ]
                        : [
                            NotificationListView(
                              notifications:
                                  notificationStateProvider.notifications,
                            ),
                            const Scaffold(),
                          ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        StringManager.noNotification,
        style: CustomTextStyle.regular(
          fontSize: 16.sp,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
