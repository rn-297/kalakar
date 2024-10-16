import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/models/artist/upcoming_company_projects.dart';
import '../../data/models/company/project_details_documents_class.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class UpcomingProjectsViewPage extends StatelessWidget {
  const UpcomingProjectsViewPage({super.key});

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
        mobile: (BuildContext context) => UpcomingProjectsMobileView(),
        tablet: (BuildContext context) => aboutUsWebView(context),
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
            KalakarConstants.upcomingProject,
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

  UpcomingProjectsMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      ProjectDetailAndDocuments upcomingProject =
          controller.upcomingCompanyProject;
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: controller.isDocumentsLoading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: ClipOval(
                        // Image radius
                        child: Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 120.h,
                            width: 120.h,
                            color: KalakarColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(12.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: KalakarColors.white,
                        border: Border.all(color: KalakarColors.backgroundGrey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: KalakarColors.blue10,
                            highlightColor: KalakarColors.blue20,
                            child: Container(
                              height: 20.h,
                              width: 120.h,
                              color: KalakarColors.white,
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Shimmer.fromColors(
                            baseColor: KalakarColors.blue10,
                            highlightColor: KalakarColors.blue20,
                            child: Container(
                              height: 20.h,
                              width: 120.h,
                              color: KalakarColors.white,
                            ),
                          ),
                          SizedBox(height: 2.h,),

                          Shimmer.fromColors(
                            baseColor: KalakarColors.blue10,
                            highlightColor: KalakarColors.blue20,
                            child: Container(
                              height: 20.h,
                              width: 120.h,
                              color: KalakarColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(12.h),
                      height: 180.h,
                      decoration: BoxDecoration(
                        color: KalakarColors.white,
                        border: Border.all(color: KalakarColors.backgroundGrey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child:ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  3,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 165.h,
                                  width: 125.h,
                                  margin: EdgeInsets.only(right: 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                        color: KalakarColors.backgroundGrey),

                                  ),
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 165.h,
                                      width: 125.h,
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ); //Container();
                              })
                          ),

                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: ClipOval(
                        // Image radius
                        child: Image.network(
                          upcomingProject.projectCoverDoc ?? "",
                          fit: BoxFit.cover,
                          height: 120.h,
                          width: 120.h,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            // Return a dummy or placeholder image when an error occurs
                            return Image.asset(
                              "assets/images/app_bar_logo.png",
                              height: 120.h,
                              width: 120.h,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                        color: KalakarColors.turquoise15,
                        border: Border.all(color: KalakarColors.backgroundGrey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          rowDataToShow("Title : ",
                              upcomingProject.projectTitle.toString()),
                          rowDataToShow("Description : ",
                              upcomingProject.projectDescription.toString()),
                          rowDataToShow("Project Status : ",
                              upcomingProject.projectStatus.toString()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(12.h),
                      height: 180.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: KalakarColors.appBarBackground1,
                        border: Border.all(color: KalakarColors.backgroundGrey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: upcomingProject.projectDocuments!.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  upcomingProject.projectDocuments!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    controller.showDocument(upcomingProject
                                        .projectDocuments![index]
                                        .projectDocuments
                                        .toString(), KalakarConstants.upcomingProject);
                                  },
                                  child: Container(
                                    height: 165.h,
                                    width: 125.h,
                                    margin: EdgeInsets.only(right: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: KalakarColors.backgroundGrey),
                                      image: DecorationImage(
                                          image: upcomingProject
                                                  .projectDocuments![index]
                                                  .projectDocuments
                                                  .toString()
                                                  .startsWith("http")
                                              ? NetworkImage(upcomingProject
                                                  .projectDocuments![index]
                                                  .projectDocuments
                                                  .toString())
                                              : FileImage(File(upcomingProject
                                                  .projectDocuments![index]
                                                  .projectDocuments
                                                  .toString())) as ImageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ); //Container();
                              })
                          : Center(child: Text("No Projects Documnets Found")),
                    )
                  ],
                ),
        ),
      );
    });
  }

  rowDataToShow(String title, String titleData) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp,color: KalakarColors.headerText),
            ),
            Text(
              titleData,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  aboutUsWebView(BuildContext context) {}
}
