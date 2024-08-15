import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? searchController;
  final String? hintText;
  final Widget? leading;
  final Iterable<Widget>? trailing;
  final Color? borderColor;

  const CustomSearchField({
    super.key,
    this.searchController,
    this.hintText,
    this.leading,
    this.trailing,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: searchController,
      leading: leading,
      trailing: trailing,
      hintText: hintText,
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8.r)),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(
            color: GlobalColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}
