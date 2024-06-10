import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/kalakar_colors.dart';

class CustomMobileButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  CustomMobileButtonWidget({
    required this.text,
    required this.onTap,
    required this.horizontalPadding ,
    required this.verticalPadding,
    required this.fontSize,
    this.backgroundColor = KalakarColors.buttonBackground,
    this.textColor = KalakarColors.headerText,
    required this.borderRadius ,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w, vertical: verticalPadding.h),
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: boxShadow ??
                [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ],
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
