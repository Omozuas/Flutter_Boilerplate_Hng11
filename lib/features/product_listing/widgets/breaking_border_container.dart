import 'package:flutter/cupertino.dart';

class BreakingBorderContainer extends StatelessWidget {
  final Widget child;
  const BreakingBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BreakingBorderPainter(),
      child: child,
    );
  }
}

class BreakingBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 8, dashSpace = 5;
    final paint = Paint()
      ..color = const Color.fromRGBO(203, 213, 225, 10)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    var max = size.width;
    double startX = 0;
    while (startX < max) {
      final endX = (startX + dashWidth).clamp(0.0, size.width);
      canvas.drawLine(Offset(startX, 0), Offset(endX, 0), paint);
      startX += dashWidth + dashSpace;
    }

    max = size.height;
    double startY = 0;
    while (startY < max) {
      final endY = (startY + dashWidth).clamp(0.0, size.height);
      canvas.drawLine(
          Offset(size.width, startY), Offset(size.width, endY), paint);
      startY += dashWidth + dashSpace;
    }

    max = size.width;
    startX = 0;
    while (startX < max) {
      final endX = (startX + dashWidth).clamp(0.0, size.width);
      canvas.drawLine(
          Offset(startX, size.height), Offset(endX, size.height), paint);
      startX += dashWidth + dashSpace;
    }

    max = size.height;
    startY = 0;
    while (startY < max) {
      final endY = (startY + dashWidth).clamp(0.0, size.height);
      canvas.drawLine(Offset(0, startY), Offset(0, endY), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
