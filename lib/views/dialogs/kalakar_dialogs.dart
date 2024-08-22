import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/controller/settings_controller.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

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

  static successDialog1(String title, String message) {
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
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

  static goHomePage(String title, String message, String accountType) {
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      if (accountType == KalakarConstants.artist) {
        Get.offNamed(RouteHelper.bottomNavigationPage);
      } else if (accountType == KalakarConstants.company) {
        Get.offNamed(RouteHelper.bottomNavigationPage);
        ProfileController profileController=Get.put(ProfileController());
        profileController.getProfileData();
      }
      SettingsController settingsController=Get.put(SettingsController());
      settingsController.onInit();
    });
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontSize: 1.sp),
      radius: 5.r,
      barrierDismissible: false,
      content: Text(message),
    );
  }
}
