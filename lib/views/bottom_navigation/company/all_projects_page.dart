import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class AllProjectsPage extends StatelessWidget {
  const AllProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appBarMobileView(),
          tablet: (BuildContext context) => appBarWebView(),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: ((BuildContext context) => allProjectsMobileView()),
        tablet: ((BuildContext context) => allProjectsWebView()),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.projects,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      /*actions: [
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.companyProfileFormPage);
          },
          child: Icon(
            Icons.edit,
            size: 30.h,
          ),
        ),
        SizedBox(
          width: 16.h,
        )
      ],*/
    );
  }

  appBarWebView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.projects,
        style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
      ),
      centerTitle:false,
      /*actions: [
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.companyProfileFormPage);
          },
          child: Icon(
            Icons.edit,
            size: 30.h,
          ),
        ),
        SizedBox(
          width: 16.h,
        )
      ],*/
    );
  }

  allProjectsMobileView() {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.all(16.h),
        child: ListView.builder(
            itemCount: controller.companyAllProjects.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller
                      .openProjectDetails(controller.companyAllProjects[index]);
                },
                child: Container(
                  // padding: EdgeInsets.all(8.h),
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: KalakarColors.textColor),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    controller.companyAllProjects[index].projectCoverDoc!,
                    fit: BoxFit.cover,
                    width: (Get.size.width / 3) / 1.5,
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
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              controller.companyAllProjects[index].projectTitle!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(controller
                                .companyAllProjects[index].projectTitle!,style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              controller
                                  .companyAllProjects[index].projectDescription!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12  .sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }

  allProjectsWebView() {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 32.w),
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.companyAllProjects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 3.8.h),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller
                      .openProjectDetails(controller.companyAllProjects[index]);
                },
                child: Container(
                  // padding: EdgeInsets.all(8.h),
                  margin: EdgeInsets.only(right: 16.h,bottom: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: KalakarColors.textColor),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                controller.companyAllProjects[index].projectCoverDoc!,
                                fit: BoxFit.cover,
                                width: (Get.size.width / 4) / 1.5,
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
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              controller.companyAllProjects[index].projectTitle!,maxLines: 1,
                              style: TextStyle(
                                fontSize: 5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                                controller.companyAllProjects[index].projectTitle!,maxLines: 1,style: TextStyle(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.normal,
                            )), SizedBox(
                              height: 4.h,
                            ),
                            Text(
                                controller.companyAllProjects[index].projectDescription!,
                                maxLines: 2,
                                style: TextStyle(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.normal,
                            )),
                            SizedBox(
                              height: 12.h,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
