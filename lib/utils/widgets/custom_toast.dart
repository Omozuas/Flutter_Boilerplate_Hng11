import 'package:flutter/material.dart';

import '../global_colors.dart';

class CustomToast extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Border border;

  const CustomToast({
    super.key,
    required this.message,
    this.backgroundColor = Colors.black,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.border = const Border(),
  });

  @override
  CustomToastState createState() => CustomToastState();

  static void show(BuildContext context, CustomToast toast) {
    final overlayState = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: 20.0,
        right: 20.0,
        child: toast,
      ),
    );

    overlayState.insert(overlayEntry);

    // Auto-dismiss after a few seconds
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}

class CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadius,
          border: widget.border,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                widget.message,
                style:  TextStyle(color: GlobalColors.darkOne),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: GlobalColors.darkOne),
              onPressed: () {
                Navigator.of(context).pop(); // Close the toast
              },
            ),
          ],
        ),
      ),
    );
  }
}
