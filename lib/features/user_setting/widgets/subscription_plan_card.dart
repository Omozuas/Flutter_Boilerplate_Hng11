import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';

class PlanCard extends StatefulWidget {
  final String planCardPlan;
  final double planCardPrice;
  final String planCardDescription;
  final String? bulletDescription1;
  final String? bulletDescription2;
  final String? bulletDescription3;
  final String? bulletDescription4;
  final String? bulletDescription5;
  final String? bulletDescription6;
  final VoidCallback? onTap;
  final bool isItCurrentPlan;

  const PlanCard({
    super.key,
    required this.planCardPlan,
    required this.planCardPrice,
    required this.planCardDescription,
    this.bulletDescription1,
    this.bulletDescription2,
    this.bulletDescription3,
    this.bulletDescription4,
    this.bulletDescription5,
    this.bulletDescription6,
    this.onTap,
    required this.isItCurrentPlan,
  });

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        padding:
            const EdgeInsets.only(left: 40, top: 40, right: 35, bottom: 30),
        decoration: BoxDecoration(
            border: _isSelected
                ? Border.all(color: GlobalColors.orange, width: 0.5)
                : Border.all(color: GlobalColors.borderColor, width: 0.5),
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.planCardPlan,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, height: 19.2 / 16),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "\$${widget.planCardPrice}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    height: 30 / 25,
                  ),
                ),
                Text(
                  "/month",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      height: 23.4 / 13,
                      color: GlobalColors.darkOne),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.planCardDescription,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 16.9 / 14,
                  color: GlobalColors.darkOne),
            ),
            const SizedBox(
              height: 32,
            ),
            if (widget.bulletDescription1 != null)
              Text("• ${widget.bulletDescription1}"),
            if (widget.bulletDescription2 != null)
              Text("• ${widget.bulletDescription2}"),
            if (widget.bulletDescription3 != null)
              Text("• ${widget.bulletDescription3}"),
            if (widget.bulletDescription4 != null)
              Text("• ${widget.bulletDescription4}"),
            if (widget.bulletDescription5 != null)
              Text("• ${widget.bulletDescription5}"),
            if (widget.bulletDescription6 != null)
              Text("• ${widget.bulletDescription6}"),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              onTap: widget.onTap!,
              borderColor:
                  _isSelected ? GlobalColors.orange : Colors.transparent,
              borderColors:
                  _isSelected ? GlobalColors.orange : Colors.transparent,
              text: widget.isItCurrentPlan ? "Current Plan" : "Upgrade",
              height: 40,
              containerColor:
                  _isSelected ? GlobalColors.orange : GlobalColors.btnBgColor,
              width: 180,
              textColor:
                  _isSelected ? GlobalColors.white : GlobalColors.darkOne,
            ),
          ],
        ),
      ),
    );
  }
}
