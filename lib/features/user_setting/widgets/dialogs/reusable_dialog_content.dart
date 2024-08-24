import 'package:flutter/material.dart';

import '../../../../utils/custom_text_style.dart';
import '../../../../utils/global_colors.dart';

class ReusableDialogContent extends StatelessWidget {
  final String title;
  final String description;
  final String? btnText;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? contentPadding;

  const ReusableDialogContent({
    super.key,
    required this.title,
    required this.description,
    this.contentPadding,
    this.btnText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyle.semiBold(
                fontSize: 18,
                color: GlobalColors.dark2,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: CustomTextStyle.regular(
                fontSize: 14,
                color: GlobalColors.dialogDesc,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            if (btnText != null)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: GlobalColors.orange,
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    btnText!,
                    style: CustomTextStyle.medium(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
