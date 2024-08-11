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
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
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

  allProjectsMobileView() {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.all(16.h),
        child: ListView.builder(
            itemCount: controller.companyAllProjects.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.h),
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  border: Border.all(color: KalakarColors.textColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        image: DecorationImage(
                          image: NetworkImage(controller
                              .companyAllProjects[index].projectCoverDoc!),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.companyAllProjects[index].projectTitle!,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                            controller.companyAllProjects[index].projectTitle!),
                      ],
                    )
                  ],
                ),
              );
            }),
      );
    });
  }

  allProjectsWebView() {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.all(16.h),
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller
                .companyAllProjects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 4.0),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.h),
                margin: EdgeInsets.only(right: 16.h),
                decoration: BoxDecoration(
                  border: Border.all(color: KalakarColors.textColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 130.h,
                      width: 130.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(65.r),
                        image: DecorationImage(
                          image: NetworkImage(controller
                              .companyAllProjects[index].projectCoverDoc!),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.companyAllProjects[index].projectTitle!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                            controller.companyAllProjects[index].projectTitle!),
                      ],
                    )
                  ],
                ),
              );
            }),
      );
    });
  }
}
