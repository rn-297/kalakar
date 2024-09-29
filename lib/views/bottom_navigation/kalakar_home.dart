import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/controller/navigation_controller.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/data/models/artist/review_details_class.dart';
import 'package:kalakar/data/models/artist/upcoming_company_projects.dart';
import 'package:kalakar/data/models/company/company_requirement_list_class.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

class KalakarHomePage extends StatelessWidget {
  const KalakarHomePage({super.key});

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
          mobile: (BuildContext context) => kalakarHomeMobileView(),
          tablet: (BuildContext context) => kalakarHomeWebView(),
        ));
  }

  kalakarHomeMobileView() {
    return SingleChildScrollView(
      child: GetBuilder<RequirementController>(builder: (controller) {
        return Container(
          color: KalakarColors.appBarBackground1,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    KalakarConstants.newOpportunities,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  InkWell(
                    onTap: () {
                      BottomNavigationController bottomNController =
                          Get.put(BottomNavigationController());
                      bottomNController.selectedIndex = 1;
                      bottomNController.update();
                    },
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
                    : controller.newRequirementDetailsList.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                controller.newRequirementDetailsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              RequirementDetailsData requirement =
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
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                                onTap: () {
                                                  if(requirement.artistFavoritesRequirementTransID ==
                                                      0)controller
                                                      .addRequirementInFavorites(
                                                          requirement
                                                              .requirementDetailsID!,false);
                                                },
                                                child: Icon(
                                                  requirement.artistFavoritesRequirementTransID ==
                                                          0
                                                      ? CupertinoIcons
                                                          .suit_heart
                                                      : CupertinoIcons
                                                          .heart_fill,
                                                  color: requirement
                                                              .artistFavoritesRequirementTransID ==
                                                          0
                                                      ? Colors.black
                                                      : Colors.red,
                                                ))),
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
                                                vertical: 4.h,
                                                horizontal: 16.w),
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5.0,
                                              ),
                                            ], color: KalakarColors.white),
                                            child:
                                                Text(requirement.lookingFor!),
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
                                              child: Text(
                                                  requirement.age!.contains(".")
                                                      ? requirement.age!
                                                              .split(".")
                                                              .first +
                                                          " Years"
                                                      : requirement.age! +
                                                          " Years"),
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
                                              child: Text(requirement
                                                  .shootingLocation!),
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
                            })
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("No New Opportunities Found"),
                                SizedBox(
                                  height: 16.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller
                                        .getArtistHomeRequirementDetails(false);
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
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    KalakarConstants.upcomingProjects,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.upcomingProjectListAllPage);
                    },
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
                    : controller.upcomingProjectsDetailsList.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                controller.upcomingProjectsDetailsList.length,
                            scrollDirection: Axis.horizontal,
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                  : controller.reviewDetailsList.isNotEmpty
                      ? ListView.builder(
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
                                border: Border.all(
                                    color: KalakarColors.backgroundGrey),
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
                                            Object error,
                                            StackTrace? stackTrace) {
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h),
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
                                                    itemBuilder:
                                                        (context, index) {
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
                          })
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Text("No Reviews Found"),
                              SizedBox(
                                height: 16.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.getReviewDetails();
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

  kalakarHomeWebView() {
    return SingleChildScrollView(
      child: Container(
        color: KalakarColors.appBarBackground1,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  KalakarConstants.newOpportunities,
                  style: TextStyle(fontSize: 8.sp),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    KalakarConstants.seeAll,
                    style: TextStyle(fontSize: 8.sp),
                  ),
                )
              ],
            ),
            Container(
              height: Get.size.height / 2.8,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8.h),
                      padding: EdgeInsets.all(8.h),
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: KalakarColors.appBarBackground1,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: Icon(CupertinoIcons.suit_heart)),
                            ClipOval(
                              // Image radius
                              child: Image.asset(
                                "assets/images/app_bar_logo.png",
                                fit: BoxFit.cover,
                                height: 80.h,
                                width: 80.h,
                              ),
                            ),
                            Text("Company Name"),
                            Divider(
                              color: Colors.grey,
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
                                    vertical: 4.h, horizontal: 4.w),
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ], color: KalakarColors.white),
                                child: Text("Good Looking Models"),
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
                                  child: Text("25-30 Years"),
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
                                  child: Text("Male/Female"),
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
                                  child: Text("Mumbai"),
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
                                  child: Text("30-06-2024"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  KalakarConstants.upcomingProjects,
                  style: TextStyle(fontSize: 8.sp),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    KalakarConstants.seeAll,
                    style: TextStyle(fontSize: 8.sp),
                  ),
                )
              ],
            ),
            Container(
              height: Get.size.height / 4,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8.h),
                      // padding: EdgeInsets.all(8.h),
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: KalakarColors.appBarBackground1,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                "assets/images/movie.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Text("Movie Name"),
                            Text("Hindi Movie"),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(KalakarConstants.reviews),
          ],
        ),
      ),
    );
  }

  appbarMobileView() {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: GetBuilder<ArtistProfileController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              KalakarConstants.namskarKalakar,
              style: TextStyle(color: KalakarColors.white, fontSize: 14.sp),
            ),
            Text(
              "${controller.artistProfileDetails.firstName ?? ""} ${controller.artistProfileDetails.lastName ?? ""} ",
              style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
            ),
          ],
        );
      }),
      actions: [
        Icon(
          Icons.notifications,
          size: 35,
        ),
        SizedBox(
          width: 8.h,
        ),
        /*Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            image: DecorationImage(
                image: AssetImage("assets/images/person.png"),
                fit: BoxFit.fill),
          ),
        ),*/
        SizedBox(
          width: 20.w,
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: InkWell(
            onTap: () {
              Get.toNamed(RouteHelper.artistSearchRequirementPage);
            },
            child: TextField(
              //controller: controller,
              enabled: false,
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
                hintText: KalakarConstants.searchAnything,
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
      ),
    );
  }

  appbarWebView() {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KalakarConstants.namskarKalakar,
            style: TextStyle(color: KalakarColors.white, fontSize: 5.sp),
          ),
          Text(
            "Rohan Warang",
            style: TextStyle(color: KalakarColors.textColor, fontSize: 8.sp),
          ),
        ],
      ),
      actions: [
        Icon(
          Icons.notifications,
          size: 35,
        ),
        SizedBox(
          width: 8.h,
        ),
        ClipOval(
          // Image radius
          child: Image.asset(
            "assets/images/app_bar_logo.png",
            fit: BoxFit.cover,
            height: 50.h,
            width: 50.h,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 40.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
              hintText: KalakarConstants.searchAnything,
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
}
