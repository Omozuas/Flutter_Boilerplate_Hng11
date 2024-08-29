import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.onBack,
      this.title,
      this.singleLine = true,
      this.showDivider = true});
  final VoidCallback? onBack;
  final Widget? title;
  final bool singleLine;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: AppBar(
        titleSpacing: !canPop && onBack == null ? 24.w : 0,
        leading: _buildBackButton(context),
        title: title,
        centerTitle: false,
        bottom: showDivider
            ? PreferredSize(
                preferredSize: const Size.fromHeight(
                    1.0), // Adjust the height of the divider
                child: Divider(
                  color: GlobalColors.diverColor,
                ),
              )
            : null,
      ),
    );
  }

  Widget? _buildBackButton(BuildContext context) {
    if (onBack != null) {
      return ChevronBackButton(
        onBack: onBack,
        includeBottomSpace: !singleLine,
      );
    }
    final canPop = ModalRoute.of(context)?.canPop;
    if (canPop != null && canPop) {
      return ChevronBackButton(
        onBack: () => Navigator.of(context).pop(),
        includeBottomSpace: !singleLine,
      );
    }
    return null;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(singleLine ? kToolbarHeight.h : 75.h);

  const CustomAppBar.empty({super.key})
      : singleLine = true,
        onBack = null,
        showDivider = false,
        title = null;

  CustomAppBar.simpleTitle({
    super.key,
    this.onBack,
    String? titleText,
    String? subTitle,
    bool? showDivider,
  })  : singleLine = subTitle == null,
        title = _buildTitle(titleText, subTitle, onBack),
        showDivider = showDivider ?? true;

  static Widget? _buildTitle(
      String? titleText, String? subTitle, VoidCallback? onBack) {
    if (titleText == null) return null;
    return Padding(
      padding: const EdgeInsets.only(left: .0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (subTitle == null) ...[
            2.h.sbH,
          ],
          Text(
            titleText,
            style: CustomTextStyles.titleTextBlack,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          if (subTitle != null) ...[
            Text(
              subTitle,
              style: CustomTextStyles.productSmallBodyTextBlack,
            ),
          ],
        ],
      ),
    );
  }
}
