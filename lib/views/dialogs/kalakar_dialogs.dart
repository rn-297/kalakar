import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helper/route_helper.dart';

class KalakarDialogs {
  static successDialog(String title, String message) {
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
    });
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontSize: 1.sp),
      radius: 5.r,
      barrierDismissible: false,
      content: Text(message),
    );
  }

  static successGoLoginDialog(String title, String message) {
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      Get.until((route) => route.settings.name == RouteHelper.login);
    });
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontSize: 1.sp),
      radius: 5.r,
      barrierDismissible: false,
      content: Text(message),
    );
  }

  static loadingDialog(String title, String message) {
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontSize: 1.sp),
      radius: 5.r,
      barrierDismissible: false,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(),
          Text(message),
        ],
      ),
    );
  }
}
