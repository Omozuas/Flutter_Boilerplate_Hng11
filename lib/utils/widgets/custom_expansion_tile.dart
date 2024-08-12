import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global_colors.dart';



/// To the person who build this class, please update the divider color in the global colors.
/// For now it will be commented out
/// thank you.


class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          //dividerColor: GlobalColors.dividerColor
      ),
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
            //  color: GlobalColors.iconColor,
            ),
          ],
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: const [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ],
      ),
    );
  }
}
