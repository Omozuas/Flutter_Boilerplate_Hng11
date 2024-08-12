import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global_colors.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.space = 16,
  });
  final String title;
  final List<Widget> content;
  final double space;
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
        tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        trailing: const Icon(null),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
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
                      padding: EdgeInsets.only(bottom: widget.space),
                      child: child,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
