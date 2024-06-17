import 'package:flutter/material.dart';

class DashedDottedBorderPainter extends CustomPainter {
  final bool isHorizontal;
  final Color color;
  final double dashWidth;
  final double dotDiameter;
  final double space;

  DashedDottedBorderPainter({
    required this.isHorizontal,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dotDiameter = 3.0,
    this.space = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    if (isHorizontal) {
      double startX = 0;
      final double y = size.height / 2;

      while (startX < size.width) {
        // Draw dash
        canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);
        startX += dashWidth + space;

        // Draw dot
        if (startX < size.width) {
          canvas.drawCircle(Offset(startX + dotDiameter / 2, y), 1, paint);
          startX += dotDiameter + space;
        }
      }
    } else {
      double startY = 0;
      final double x = size.width / 2;

      while (startY < size.height) {
        // Draw dash
        canvas.drawLine(Offset(x, startY), Offset(x, startY + dashWidth), paint);
        startY += dashWidth + space;

        // Draw dot
        if (startY < size.height) {
          canvas.drawCircle(Offset(x, startY + dotDiameter / 2), dotDiameter / 2, paint);
          startY += dotDiameter + space;
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
