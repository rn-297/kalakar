import 'package:flutter/material.dart';

import 'kalakar_colors.dart';

class CommonWidgets {
  static Widget commonMobileTextField({
    required TextEditingController controller,
    required String labelText,
    required bool obscureText,
    required bool passwordVisibility,
    required VoidCallback? togglePasswordVisibility,
    required TextInputType? textInputType,
    required String? Function(String?)? validator, // Added validator parameter
    Color textColor = KalakarColors.textColor,
    Color borderColor = KalakarColors.border,
    Color focusedBorderColor = KalakarColors.selectedBorder,
    Color labelColor = KalakarColors.textColor,
    bool editable = true,
    int  maxLines =1,
    double borderRadius = 50.0,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 12),
  }) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: textColor),
      obscureText: passwordVisibility,
      validator: validator,
      keyboardType: textInputType,
      enabled: editable,
      maxLines: maxLines,
      // Added validator
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        contentPadding: contentPadding,
        suffixIcon: obscureText
            ? InkWell(
                onTap: togglePasswordVisibility,
                child: Icon(passwordVisibility
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
              )
            : null,
      ),
    );
  }
}
