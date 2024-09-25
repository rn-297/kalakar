import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/data/models/company/company_applied_details_class.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/models/artist/review_details_class.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class AppliedProfilesPage extends StatelessWidget {
  const AppliedProfilesPage({super.key});

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
        mobile: (BuildContext context) => notificationsMobileView(),
        tablet: (BuildContext context) => notificationsWebView(context),
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
            KalakarConstants.appliedProfiles,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
          ),
        ],
      ),
/*
      actions: [
        InkWell(
          onTap: (){
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
*/
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
            KalakarConstants.appliedProfiles,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
          ),
        ],
      ),
/*
      actions: [
        InkWell(
          onTap: (){
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
*/
    );
  }

  notificationsMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(16.h),
          child: Column(
            children: [
              controller.isAppliedProfileLoading
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          padding: EdgeInsets.all(8.h),
                          // width: Get.size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: KalakarColors.white,
                            border:
                                Border.all(color: KalakarColors.backgroundGrey),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 40.h,
                                    width: 40.h,
                                    color: KalakarColors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: KalakarColors.blue10,
                                        highlightColor: KalakarColors.blue20,
                                        child: Container(
                                          height: 20.h,
                                          width: 80.h,
                                          color: KalakarColors.white,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: KalakarColors.blue10,
                                            highlightColor: KalakarColors.blue20,
                                            child: Container(
                                              height: 20.h,
                                              width: 20.h,
                                              color: KalakarColors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16.w,
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                            width: 150.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.companyAppliedRequirementDetailsList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        AppliedArtistDetailsList appliedProfileDetail =
                            controller.companyAppliedRequirementDetailsList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          padding: EdgeInsets.all(8.h),
                          // width: Get.size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: KalakarColors.white,
                            border:
                                Border.all(color: KalakarColors.backgroundGrey),
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.setArtistProfileDataToView(appliedProfileDetail);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image.network(
                                    appliedProfileDetail.profilePic!,
                                    fit: BoxFit.cover,
                                    height: 50.h,
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      // Return a dummy or placeholder image when an error occurs
                                      return Image.asset(
                                        "assets/images/app_logo2.PNG.png",
                                        height: 50.h,
                                        width: 50.h,
                                      );
                                    },
                                    width: 50.h,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${appliedProfileDetail.firstName!} ${appliedProfileDetail.middleName!} "),
                                        Text(appliedProfileDetail.experiences!
                                            .toString()),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
            ],
          ),
        ),
      );
    });
  }

  notificationsWebView(BuildContext context) {}
}
