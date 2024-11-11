import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/settings_controller.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helper/kalakar_colors.dart';
import '../../helper/route_helper.dart';
import '../../utils/kalakar_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appbarMobileView(),
          tablet: (BuildContext context) => appbarWebView(),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => settingsMobileView(),
        tablet: (BuildContext context) => settingsWebView(context),
      ),
    );
  }

  appbarMobileView() {
    return AppBar(
      toolbarHeight: 60.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   height: 60.h,
          //   width: 60.h,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(image: NetworkImage("")),
          //       border: Border.all(color: KalakarColors.headerText),
          //       borderRadius: BorderRadius.circular(50.r)),
          // ),
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
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.notificationPage);
          },
          child: Icon(
            Icons.notifications,
            size: 35,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
    );
  }

  appbarWebView() {
    return AppBar(
      toolbarHeight: 60.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   height: 60.h,
          //   width: 60.h,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(image: NetworkImage("")),
          //       border: Border.all(color: KalakarColors.headerText),
          //       borderRadius: BorderRadius.circular(50.r)),
          // ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            KalakarConstants.settings,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 8.sp),
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.notificationPage);
          },
          child: Icon(
            Icons.notifications,
            size: 25,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
    );
  }

  settingsMobileView() {
    return GetBuilder<SettingsController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.all(24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.settingsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: InkWell(
                      onTap: () {
                        controller.gotoNextPage(controller.settingsList[index]);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.settingsList[index],
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 10.h,
            ),
            if (controller.settingsData.fbLink != "" ||
                controller.settingsData.instaLink != "" ||
                controller.settingsData.ytLink != "" ||
                controller.settingsData.emailLink != "" ||
                controller.settingsData.whatsAppLink != "" ||
                controller.settingsData.websiteLink != "" ||
                controller.settingsData.xOrTwitterlink != "")
              Text(KalakarConstants.followUsOn),
            Container(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (controller.settingsData.fbLink != "")
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(controller.settingsData.fbLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/facebook.svg",
                        height: 30.h,
                      ),
                    ),
                  if (controller.settingsData.instaLink != "")
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(controller.settingsData.instaLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/instagram.svg",
                        height: 30.h,
                      ),
                    ),
                  if (controller.settingsData.whatsAppLink != "")
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(controller.settingsData.whatsAppLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/whatsapp.svg",
                        height: 30.h,
                      ),
                    ),
                  if (controller.settingsData.ytLink != "")
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(controller.settingsData.ytLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/youtube.svg",
                        height: 30.h,
                      ),
                    ),
                  if (controller.settingsData.emailLink != "")
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(controller.settingsData.emailLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/email.svg",
                        height: 30.h,
                      ),
                    ),
                  if (controller.settingsData.websiteLink != "")
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(controller.settingsData.websiteLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/website.svg",
                        height: 30.h,
                      ),
                    ),
                  if (controller.settingsData.xOrTwitterlink != "")
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(controller.settingsData.xOrTwitterlink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/twitter.svg",
                        height: 30.h,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              KalakarConstants.appVersion,
              style: TextStyle(fontSize: 18.sp),
            ),
            Text(
              "1.0.0",
              style: TextStyle(fontSize: 12.sp),
            ),
            Center(
                child: InkWell(
              onTap: () {
                controller.logOutMessage();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                decoration: BoxDecoration(
                    border: Border.all(color: KalakarColors.textColor),
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(KalakarConstants.logout),
              ),
            ))
          ],
        ),
      );
    });
  }

  settingsWebView(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal:72.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.settingsList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: InkWell(
                        onTap: () {
                          controller.gotoNextPage(controller.settingsList[index]);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.settingsList[index],
                              style: TextStyle(
                                fontSize: 6.sp,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 10.h,
              ),
              if (controller.settingsData.fbLink != "" ||
                  controller.settingsData.instaLink != "" ||
                  controller.settingsData.ytLink != "" ||
                  controller.settingsData.emailLink != "" ||
                  controller.settingsData.whatsAppLink != "" ||
                  controller.settingsData.websiteLink != "" ||
                  controller.settingsData.xOrTwitterlink != "")
                Text(KalakarConstants.followUsOn),
              Container(
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (controller.settingsData.fbLink != "")
                      InkWell(
                        onTap: () {
                          controller.openSocialMedia(controller.settingsData.fbLink!);
                        },
                        child: SvgPicture.asset(
                          "assets/svg/facebook.svg",
                          height: 30.h,
                        ),
                      ),
                    if (controller.settingsData.instaLink != "")
                      InkWell(
                        onTap: () {
                          controller.openSocialMedia(controller.settingsData.instaLink!);
                        },
                        child: SvgPicture.asset(
                          "assets/svg/instagram.svg",
                          height: 30.h,
                        ),
                      ),
                    if (controller.settingsData.whatsAppLink != "")
                      InkWell(
                        onTap: () {
                          controller.openSocialMedia(controller.settingsData.whatsAppLink!);
                        },
                        child: SvgPicture.asset(
                          "assets/svg/whatsapp.svg",
                          height: 30.h,
                        ),
                      ),
                    if (controller.settingsData.ytLink != "")
                      InkWell(
                        onTap: () {
                          controller.openSocialMedia(controller.settingsData.ytLink!);
                        },
                        child: SvgPicture.asset(
                          "assets/svg/youtube.svg",
                          height: 30.h,
                        ),
                      ),
                    if (controller.settingsData.emailLink != "")
                      InkWell(
                        onTap: () {
                          controller.openSocialMedia(controller.settingsData.emailLink!);
                        },
                        child: SvgPicture.asset(
                          "assets/svg/email.svg",
                          height: 30.h,
                        ),
                      ),
                    if (controller.settingsData.websiteLink != "")
                      InkWell(
                        onTap: () {
                          controller.openSocialMedia(controller.settingsData.websiteLink!);
                        },
                        child: SvgPicture.asset(
                          "assets/svg/website.svg",
                          height: 30.h,
                        ),
                      ),
                    if (controller.settingsData.xOrTwitterlink != "")
                      InkWell(
                        onTap: () {
                          controller.openSocialMedia(controller.settingsData.xOrTwitterlink!);
                        },
                        child: SvgPicture.asset(
                          "assets/svg/twitter.svg",
                          height: 30.h,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                KalakarConstants.appVersion,
                style: TextStyle(fontSize: 6.sp),
              ),
              Text(
                "1.0.0",
                style: TextStyle(fontSize: 5.sp),
              ),
              Center(
                  child: InkWell(
                    onTap: () {
                      controller.logOutMessage();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          border: Border.all(color: KalakarColors.textColor),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Text(KalakarConstants.logout),
                    ),
                  )),

              SizedBox(height: 12.h,)
            ],
          ),
        ),
      );
    });
  }
}
