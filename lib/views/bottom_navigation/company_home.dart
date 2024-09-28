import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/requirement_controller.dart';
import '../../data/models/artist/review_details_class.dart';
import '../../data/models/artist/upcoming_company_projects.dart';
import '../../data/models/company/company_requirement_list_class.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 150.h),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => appbarMobileView(),
            tablet: (BuildContext context) => appbarWebView(),
          ),
        ),
        body: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => companyHomeMobileView(),
          tablet: (BuildContext context) => companyHomeWebView(),
        ));
  }

  appbarMobileView() {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return AppBar(
          toolbarHeight: 70.h,
          backgroundColor: KalakarColors.appBarBackground,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60.h,
                width: 60.h,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(controller.companyLogo)),
                    border: Border.all(color: KalakarColors.headerText),
                    borderRadius: BorderRadius.circular(50.r)),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                controller.profileData!.name??"",
                style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.notifications,
              size: 35,
            ),
            SizedBox(
              width: 20.w,
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 70.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ], borderRadius: BorderRadius.circular(50.r)),
              child: TextField(
                //controller: controller,
                style: TextStyle(color: KalakarColors.textColor),
                // obscureText: passwordVisibility,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),

                  // labelText: KalakarConstants.searchAnything,
                  // labelStyle: TextStyle(color: labelColor),
                  hintText: KalakarConstants.searchArtist,
                  fillColor: KalakarColors.white,
                  filled: true,
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: KalakarColors.buttonText,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  appbarWebView() {
    return GetBuilder<ProfileController>(
        builder: (controller) {
          return AppBar(
            toolbarHeight: 70.h,
            backgroundColor: KalakarColors.lightAppBarBackground,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(controller.companyLogo)),
                      border: Border.all(color: KalakarColors.headerText),
                      borderRadius: BorderRadius.circular(50.r)),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  controller.profileData!.name??"",
                  style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
                ),
              ],
            ),
            actions: [
              Icon(
                Icons.notifications,
                size: 35,
              ),
              SizedBox(
                width: 20.w,
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 70.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ], borderRadius: BorderRadius.circular(50.r)),
                child: TextField(
                  //controller: controller,
                  style: TextStyle(color: KalakarColors.textColor),
                  // obscureText: passwordVisibility,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    // labelText: KalakarConstants.searchAnything,
                    // labelStyle: TextStyle(color: labelColor),
                    hintText: KalakarConstants.searchArtist,
                    fillColor: KalakarColors.white,
                    filled: true,
                    contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: KalakarColors.buttonText,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

  companyHomeMobileView() {
    /*return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              KalakarConstants.openOpportunities,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: Get.size.height / 3,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8.h),
                      width: Get.size.width/1.8,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                        color: KalakarColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            width: Get.size.width/1.8,
                            decoration: BoxDecoration(
                                color: KalakarColors.appBarBackground,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      color:
                                      KalakarColors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                    "OP NO. 001",
                                    style:
                                    TextStyle(color: KalakarColors.white,fontSize: 15.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Good Looking Actors",
                                  style: TextStyle(
                                      color: KalakarColors.white,
                                      fontSize: 15.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(color: KalakarColors.white,fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "20-28 Years",
                                  style: TextStyle(color: KalakarColors.white,fontSize: 14.sp),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );*/

    return Container(
      color: KalakarColors.appBarBackground1,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: GetBuilder<RequirementController>(builder: (controller) {
          return Column(
            children: [
             /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    KalakarConstants.newOpportunities,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      KalakarConstants.seeAll,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  )
                ],
              ),
              Container(
                height: Get.size.height / 2.8,
                child: controller.isArtistHomeRequirementsLoading
                    ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            right: 8.h, top: 8.h, bottom: 8.h),
                        padding: EdgeInsets.all(8.h),
                        width: Get.size.width / 2,
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          border: Border.all(
                              color: KalakarColors.backgroundGrey),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Align(
                              //     alignment: Alignment.centerRight,
                              //     child: Icon(CupertinoIcons.suit_heart)),
                              SizedBox(
                                height: 8.h,
                              ),
                              ClipOval(
                                // Image radius
                                child: Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 80.h,
                                    width: 80.h,
                                    color: KalakarColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 30.h,
                                  width: 100.h,
                                  color: KalakarColors.white,
                                ),
                              ),
                              Divider(
                                color: KalakarColors.backgroundGrey,
                                height: 20,
                                thickness: 2,
                                // indent: 20,
                                // endIndent: 20,
                              ),
                              Container(
                                color: KalakarColors.white,
                                padding: EdgeInsets.all(4.h),
                                child: Container(
                                  margin: EdgeInsets.all(4.h),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 16.w),
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),
                                  ], color: KalakarColors.white),
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 20.h,
                                      width: 80.h,
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Icon(Icons.cake),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 20.h,
                                        width: 80.h,
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container())
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Icon(Icons.person),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 20.h,
                                        width: 80.h,
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container())
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Icon(Icons.location_on),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 20.h,
                                        width: 80.h,
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container())
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Icon(Icons.calendar_month),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 20.h,
                                        width: 80.h,
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container())
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                    : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.newRequirementDetailsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      ObjResponesRequirementDetailsList requirement =
                      controller.newRequirementDetailsList[index];
                      DateTime shootingStartDate = DateTime.parse(
                          requirement.shootingStartDate.toString());
                      DateFormat formatter = DateFormat('dd-MM-yyyy');
                      return InkWell(
                        onTap: () {
                          controller.setRequirementViewData(
                              requirement, false);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: 8.h, top: 8.h, bottom: 8.h),
                          padding: EdgeInsets.all(8.h),
                          width: Get.size.width / 2,
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            border: Border.all(
                                color: KalakarColors.backgroundGrey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Align(
                                //     alignment: Alignment.centerRight,
                                //     child: Icon(CupertinoIcons.suit_heart)),
                                SizedBox(
                                  height: 8.h,
                                ),
                                ClipOval(
                                  // Image radius
                                  child: Image.network(
                                    requirement.refPhotoName!,
                                    fit: BoxFit.cover,
                                    height: 80.h,
                                    width: 80.h,
                                    errorBuilder: (BuildContext context,
                                        Object error,
                                        StackTrace? stackTrace) {
                                      // Return a dummy or placeholder image when an error occurs
                                      return Image.asset(
                                        "assets/images/app_bar_logo.png",
                                        height: 80.h,
                                        width: 80.h,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(requirement
                                    .companyNameProductionhouse!),
                                Divider(
                                  color: KalakarColors.backgroundGrey,
                                  height: 20,
                                  thickness: 2,
                                  // indent: 20,
                                  // endIndent: 20,
                                ),
                                Container(
                                  color: KalakarColors.white,
                                  padding: EdgeInsets.all(4.h),
                                  child: InkWell(
                                      child: Container(
                                        margin: EdgeInsets.all(4.h),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4.h, horizontal: 16.w),
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5.0,
                                          ),
                                        ], color: KalakarColors.white),
                                        child: Text(requirement.lookingFor!),
                                      )),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.cake),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(requirement.age!
                                          .contains(".")
                                          ? requirement.age!
                                          .split(".")
                                          .first +
                                          " Years"
                                          : requirement.age! + " Years"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.person),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(requirement.gender!),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.location_on),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                          requirement.shootingLocation!),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.calendar_month),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(formatter
                                          .format(shootingStartDate)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 16.h,
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    KalakarConstants.upcomingProjects,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      KalakarConstants.seeAll,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  )
                ],
              ),
              Container(
                height: Get.size.height / 4,
                child: controller.isArtistHomeUpcomingProjectsLoading
                    ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
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
                          border: Border.all(
                              color: KalakarColors.backgroundGrey),
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
                    : ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                    controller.upcomingProjectsDetailsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      ResponseCompanyProjects upcomingProject =
                      controller.upcomingProjectsDetailsList[index];
                      return InkWell(
                        onTap: () {
                          controller
                              .setUpcomingProjectViewData(upcomingProject);
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    upcomingProject.projectCoverDoc!,
                                    fit: BoxFit.cover,
                                    height: (Get.size.width / 2) / 1.5,
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
                                Divider(
                                  color: KalakarColors.backgroundGrey,
                                  height: 20,
                                  thickness: 1,
                                  // indent: 20,
                                  // endIndent: 20,
                                ),
                                Text(
                                  upcomingProject.projectTitle!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                KalakarConstants.reviews,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              controller.isArtistHomeReviewsLoading
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
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
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
                                        highlightColor:
                                        KalakarColors.blue20,
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
                                        child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Shimmer.fromColors(
                                              baseColor:
                                              KalakarColors.blue10,
                                              highlightColor:
                                              KalakarColors.blue20,
                                              child: Container(
                                                height: 15.h,
                                                width: 15.h,
                                                color: KalakarColors.white,
                                              ),
                                            );
                                          },
                                        ),
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
                  itemCount: controller.reviewDetailsList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    GetApplicationReviewList reviewData =
                    controller.reviewDetailsList[index];
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
                          controller.setReviewDataToView(reviewData);
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.network(
                                reviewData.reviewByProfilePic!,
                                fit: BoxFit.cover,
                                height: 40.h,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  // Return a dummy or placeholder image when an error occurs
                                  return Image.asset(
                                    "assets/images/app_bar_logo.png",
                                    height: 40.h,
                                    width: 40.h,
                                  );
                                },
                                width: 40.h,
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
                                    Text(reviewData.reviewBy!),
                                    Row(
                                      children: [
                                        Text(reviewData.reviewStar!
                                            .toString()),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                          width: 150.w,
                                          child: ListView.builder(
                                            itemCount: reviewData
                                                .reviewStar!
                                                .toInt(),
                                            scrollDirection:
                                            Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Icon(
                                                Icons.star,
                                                size: 15,
                                                color: CupertinoColors
                                                    .systemYellow,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
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
          );
        }),
      ),
    );
  }

  companyHomeWebView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              KalakarConstants.openOpportunities,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: Get.size.height / 3,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8.h),
                      width: Get.size.width/3,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                        color: KalakarColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            width: Get.size.width/1.8,
                            decoration: BoxDecoration(
                                color: KalakarColors.appBarBackground,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      color:
                                      KalakarColors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                    "OP NO. 001",
                                    style:
                                    TextStyle(color: KalakarColors.white,fontSize: 15.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Good Looking Actors",
                                  style: TextStyle(
                                      color: KalakarColors.white,
                                      fontSize: 15.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(color: KalakarColors.white,fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "20-28 Years",
                                  style: TextStyle(color: KalakarColors.white,fontSize: 14.sp),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
