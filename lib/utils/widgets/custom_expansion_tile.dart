import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global_colors.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.space,
    this.icon,
    this.horizontalTitlePadding,
    this.verticalTitlePadding,
    this.verticalChildrenPadding,
    this.horizontalChildrenPadding,
  });
  final String title;
  final List<Widget> content;
  final double? space;
  final IconData? icon;
  final EdgeInsets? horizontalTitlePadding;
  final EdgeInsets? verticalTitlePadding;
  final EdgeInsets? verticalChildrenPadding;
  final EdgeInsets? horizontalChildrenPadding;
  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: GlobalColors.dividerColor),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(
            horizontal: widget.horizontalTitlePadding?.horizontal ?? 15,
            vertical: widget.verticalChildrenPadding?.vertical ?? 0),
        childrenPadding: EdgeInsets.symmetric(
            horizontal: widget.horizontalChildrenPadding?.horizontal ?? 15,
            vertical: widget.verticalChildrenPadding?.vertical ?? 10),
        trailing: Icon(widget.icon),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
            const SizedBox(width: 8),
            Icon(
              _isExpanded
                  ? Icons.keyboard_arrow_down_outlined
                  : Icons.keyboard_arrow_up,
              color: GlobalColors.iconColor,
            ),
          ],
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          Column(
            children: widget.content
                .map((child) => Padding(
                      padding: EdgeInsets.only(bottom: widget.space ?? 16),
                      child: child,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
