import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

class KalakarHomePage extends StatelessWidget {
  const KalakarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: KalakarColors.appBarBackground,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              KalakarConstants.namskarKalakar,
              style: TextStyle(color: KalakarColors.white),
            ),
            Text(
              "Rohan Warang",
              style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.notifications,
            size: 35,
          ),
          // Image(image: image)
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 70.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: TextField(
              //controller: controller,
              style: TextStyle(color: KalakarColors.textColor),
              // obscureText: passwordVisibility,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.white),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.white),
                ),

                // labelText: KalakarConstants.searchAnything,
                // labelStyle: TextStyle(color: labelColor),
                hintText: KalakarConstants.searchAnything,
                fillColor: KalakarColors.white,
                filled: true,
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: KalakarColors.buttonText,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(child: Text("Kalakar Home")),
    );
  }
}
