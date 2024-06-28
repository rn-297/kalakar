import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          SizedBox(
              height: 50.h,
              width: 50.h,
              child: FlareActor("assets/flr_files/success.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:"idle")),

        ],
      ),
    );
  }
}
