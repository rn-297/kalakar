import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/kalakar_colors.dart'; // Adjust the import according to your project structure

class CustomSignInButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Widget icon;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final double textSize;

  CustomSignInButtonWidget({
    required this.onTap,
    required this.text,
    required this.icon,
    required this.paddingHorizontal ,
    required this.paddingVertical ,
    required this.borderRadius, required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
          decoration: BoxDecoration(
            border: Border.all(color: KalakarColors.border),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(
                width: 16.w,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: textSize,
                  color: KalakarColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
