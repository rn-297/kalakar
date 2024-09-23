import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/controller/settings_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

import '../../data/local_database/hive_service.dart';
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
        ArtistProfileController artistProfileController =
            Get.put(ArtistProfileController());
        artistProfileController.checkIfArtist();
      } else if (accountType == KalakarConstants.company) {
        Get.offNamed(RouteHelper.bottomNavigationPage);
        ProfileController profileController = Get.put(ProfileController());
        profileController.getRequireData();
      }
      SettingsController settingsController = Get.put(SettingsController());
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

  static logOutDialog() {
    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      // title: "Log Out of Your Account?",
      // titleStyle: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
      radius: 5.r,
      barrierDismissible: false,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Log Out of Your Account?",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text("Are you sure you want to log out?"),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomMobileButtonWidget(
                  text: "Cancel",
                  onTap: () {
                    Get.back();
                  },
                  horizontalPadding: 20.w,
                  verticalPadding: 8.h,
                  fontSize: 14.sp,
                  width: 100.w,
                  borderRadius: 40.r),

              CustomMobileButtonWidget(
                  text: "Logout",
                  onTap: () {
                    HiveService.deleteLoginData();
                  },
                  horizontalPadding: 20.w,
                  verticalPadding: 8.h,
                  fontSize: 14.sp,
                  width: 100.w,
                  textColor: KalakarColors.white,
                  backgroundColor: Colors.red,
                  borderRadius: 40.r),
            ],
          )
        ],
      ),
    );
  }
}
