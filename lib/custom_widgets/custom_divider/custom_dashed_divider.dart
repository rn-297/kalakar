import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'custom_dashed_painter.dart';

class DashedDottedDivider extends StatelessWidget {
  final bool isHorizontal;
  final Color color;
  final double dashWidth;
  final double dotDiameter;
  final double space;
  final double thickness;
  final double length;

  DashedDottedDivider({
    this.isHorizontal = true,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dotDiameter = 3.0,
    this.space = 3.0,
    this.thickness = 1.0,
    this.length = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: isHorizontal ? Size(length, thickness) : Size(thickness, length),
      painter: DashedDottedBorderPainter(
        isHorizontal: isHorizontal,
        color: color,
        dashWidth: dashWidth,
        dotDiameter: dotDiameter,
        space: space,
      ),
    );
  }
}
