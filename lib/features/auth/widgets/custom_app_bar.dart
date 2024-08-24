import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, this.onBack, this.title, this.singleLine = true});
  final VoidCallback? onBack;
  final Widget? title;
  final bool singleLine;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: _buildBackButton(context),
      title: title,
      bottom: PreferredSize(
        preferredSize:
            const Size.fromHeight(1.0), // Adjust the height of the divider
        child: Divider(
          color: GlobalColors.diverColor,
        ),
      ),
    );
  }

  Widget? _buildBackButton(BuildContext context) {
    if (onBack != null) {
      return ChevronBackButton(onBack: onBack);
    }
    final canPop = ModalRoute.of(context)?.canPop;
    if (canPop != null && canPop) {
      return ChevronBackButton(
        onBack: () => Navigator.of(context).pop(),
      );
    }
    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(singleLine ? kToolbarHeight : 75);

  CustomAppBar.simpleTitle({
    super.key,
    this.onBack,
    String? titleText,
    String? subTitle,
  })  : singleLine = subTitle == null,
        title = _buildTitle(titleText, subTitle, onBack);

  static Widget? _buildTitle(
      String? titleText, String? subTitle, VoidCallback? onBack) {
    if (titleText == null) return null;
    return Padding(
      padding: EdgeInsets.only(
        left: onBack != null ? 0 : 24.0.w,
        top: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleText,
            style: CustomTextStyles.titleTextBlack,
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
