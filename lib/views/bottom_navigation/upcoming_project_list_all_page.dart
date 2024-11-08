import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/models/artist/upcoming_company_projects.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class UpcomingProjectListAllPage extends StatelessWidget {
  const UpcomingProjectListAllPage({super.key});

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
        mobile: (BuildContext context) => upcomingProjectListMobileView(),
        tablet: (BuildContext context) => upcomingProjectListWebView(context),
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
            KalakarConstants.upcomingProject,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 20.sp),
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
            KalakarConstants.upcomingProject,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 8.sp),
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

  upcomingProjectListMobileView() {
    return SingleChildScrollView(
      child: GetBuilder<RequirementController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              controller.isArtistHomeUpcomingProjectsLoading
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: 8.h,
                            bottom: 8.h,
                            right: 8.h,
                          ),
                          // padding: EdgeInsets.all(8.h),
                          width: Get.size.width / 2,
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            border:
                                Border.all(color: KalakarColors.backgroundGrey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 80.h,
                                      width: Get.size.width / 2,
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: KalakarColors.backgroundGrey,
                                  height: 20,
                                  thickness: 1,
                                  // indent: 20,
                                  // endIndent: 20,
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 20.h,
                                    width: 80.h,
                                    color: KalakarColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : controller.upcomingProjectsDetailsList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              controller.upcomingProjectsDetailsList.length,
                          itemBuilder: (context, index) {
                            ResponseCompanyProjects upcomingProject =
                                controller.upcomingProjectsDetailsList[index];
                            return InkWell(
                              onTap: () {
                                controller.setUpcomingProjectViewData(
                                    upcomingProject);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 8.h,
                                  right: 8.h,
                                ),
                                // padding: EdgeInsets.all(8.h),
                                width: Get.size.width / 2,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                  border: Border.all(
                                      color: KalakarColors.backgroundGrey),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        upcomingProject.projectCoverDoc!,
                                        fit: BoxFit.cover,
                                        width: (Get.size.width / 2) / 1.5,
                                        height: 100.h,
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                          // Return a dummy or placeholder image when an error occurs
                                          return Image.asset(
                                            "assets/images/movie.png",
                                            height: 80.h,
                                            fit: BoxFit.fitWidth,
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            upcomingProject.projectTitle!,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,

                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            upcomingProject.projectSubTitle!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14.sp,
                                                color: KalakarColors.orange),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No Upcoming Projects Found"),
                              SizedBox(
                                height: 16.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.getUpcomingProjectsDetails();
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.refresh),
                                    Text("Refresh"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
            ],
          ),
        );
      }),
    );
  }

  upcomingProjectListWebView(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<RequirementController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              controller.isArtistHomeUpcomingProjectsLoading
                  ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 8.h,
                        bottom: 8.h,
                        right: 8.h,
                      ),
                      // padding: EdgeInsets.all(8.h),
                      width: Get.size.width / 2,
                      decoration: BoxDecoration(
                        color: KalakarColors.white,
                        border:
                        Border.all(color: KalakarColors.backgroundGrey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 80.h,
                                  width: Get.size.width / 2,
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                            Divider(
                              color: KalakarColors.backgroundGrey,
                              height: 20,
                              thickness: 1,
                              // indent: 20,
                              // endIndent: 20,
                            ),
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 80.h,
                                color: KalakarColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                  : controller.upcomingProjectsDetailsList.isNotEmpty
                  ? ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                  controller.upcomingProjectsDetailsList.length,
                  itemBuilder: (context, index) {
                    ResponseCompanyProjects upcomingProject =
                    controller.upcomingProjectsDetailsList[index];
                    return InkWell(
                      onTap: () {
                        controller.setUpcomingProjectViewData(
                            upcomingProject);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 8.h,
                          bottom: 8.h,
                          right: 8.h,
                        ),
                        // padding: EdgeInsets.all(8.h),
                        width: Get.size.width / 3,
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          border: Border.all(
                              color: KalakarColors.backgroundGrey),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                upcomingProject.projectCoverDoc!,
                                fit: BoxFit.cover,
                                width: (Get.size.width / 3) / 1.5,
                                height: 120.h,
                                errorBuilder: (BuildContext context,
                                    Object error,
                                    StackTrace? stackTrace) {
                                  // Return a dummy or placeholder image when an error occurs
                                  return Image.asset(
                                    "assets/images/movie.png",
                                    height: 80.h,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    upcomingProject.projectTitle!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 6.sp,

                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    upcomingProject.projectSubTitle!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 6.sp,
                                        color: KalakarColors.orange),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Upcoming Projects Found"),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.getUpcomingProjectsDetails();
                      },
                      child: Column(
                        children: [
                          Icon(Icons.refresh),
                          Text("Refresh"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
