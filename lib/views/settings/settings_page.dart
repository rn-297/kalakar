import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appbarMobileView(),
          tablet: (BuildContext context) => appbarWebView(),
        ),
      ),
      body: Center(child: Text("settings_page"),),
    );
  }

  appbarMobileView() {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60.h,
            width: 60.h,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("")),
                border: Border.all(color: KalakarColors.headerText),
                borderRadius: BorderRadius.circular(50.r)),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
           KalakarConstants.settings,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
          ),
        ],
      ),
      actions: [
        Icon(
          Icons.notifications,
          size: 35,
        ),
        SizedBox(
          width: 20.w,
        )
      ],

    );
  }

  appbarWebView() {}
}
