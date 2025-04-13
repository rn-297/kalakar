import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/custom_widgets/custom_divider/custom_dashed_divider.dart';
import 'package:kalakar/data/models/artist/artist_apply_for_class.dart';
import 'package:kalakar/data/models/artist/artist_comfortable_in_class.dart';
import 'package:kalakar/data/models/artist/artist_education_list_class.dart';
import 'package:kalakar/data/models/artist/artist_experience_list_class.dart';
import 'package:kalakar/data/models/artist/artist_hobbies_list_class.dart';
import 'package:kalakar/data/models/artist/artist_interested_in_class.dart';
import 'package:kalakar/data/models/artist/artist_profile_class.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:kalakar/data/models/company/company_applied_details_class.dart'as artist_profile;


import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class KalakarProfilePage extends StatelessWidget {
  const KalakarProfilePage({super.key});

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
        mobile: (BuildContext context) => profileMobileView(),
        tablet: (BuildContext context) => profileWebView(),
      ),
    );
  }

  profileMobileView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<ArtistProfileController>(builder: (controller) {
        if(controller.isArtist){
          ArtistProfileDetailsClass profileDetails =
              controller.artistProfileDetails;
          return RefreshIndicator(
            onRefresh: () async {
              controller.checkIfArtist();
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: controller.artistProfileID != 0
                  ? Column(
                children: [
                  controller.isArtistProfileBasicLoading
                      ? basicsLoadingMobile()
                      : profileDetails.firstName != null
                      ? Column(
                    children: [
                      Row(
                        children: [
                          Center(
                              child: Container(
                                height: 80.h,
                                width: 80.h,
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(50),
                                  child: Image.network(
                                    profileDetails.profilePic ?? "",
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error,
                                        stackTrace) {
                                      return Image.asset(
                                        "assets/images/NA.jpg",
                                        // Your default image
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    "${KalakarConstants.kalakarId} : ${profileDetails.artistProfileID}",
                                    style: TextStyle(
                                        color: KalakarColors
                                            .headerText),
                                  ),
                                  Text(
                                    "${profileDetails.firstName} ${profileDetails.lastName}",
                                    style: TextStyle(
                                        fontSize: 25.sp,
                                        color: KalakarColors
                                            .buttonText,
                                        fontWeight:
                                        FontWeight.bold),
                                  )
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        KalakarConstants.age,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                      Text(
                                          " : ${profileDetails.age}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        KalakarConstants.height,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                      Text(
                                          " : ${profileDetails.height}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        KalakarConstants.weight,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                      Text(
                                          " : ${profileDetails.weight}"),
                                    ],
                                  ),
                                ],
                              ),
                              DashedDottedDivider(
                                isHorizontal: false,
                                color: Colors.blue,
                                dashWidth: 5.0,
                                dotDiameter: 3.0,
                                space: 3.0,
                                thickness: 2.0,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        KalakarConstants.city,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                      Text(
                                          " : ${profileDetails.address1}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        KalakarConstants
                                            .district,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                      Text(
                                          " : ${profileDetails.district}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        KalakarConstants.state,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                      Text(
                                          " : ${profileDetails.state}"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    KalakarConstants.bio,
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        color: KalakarColors
                                            .headerText),
                                  ),
                                  Text("${profileDetails.bio}")
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: IntrinsicWidth(
                                child: Column(
                                  children: [
                                    /*InkWell(
                                child: CustomMobileButtonWidget(
                                  onTap: () {},
                                  borderRadius: 50.r,
                                  fontSize: 12.sp,
                                  text: KalakarConstants.experienceLevel,
                                  horizontalPadding: 24.w,
                                  verticalPadding: 8.h,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),*/
                                    CustomMobileButtonWidget(
                                      onTap: () {
                                        // Get.toNamed(RouteHelper
                                        //     .artistDocumentForm);
                                        controller
                                            .gotoArtistMoreInfo(
                                            false);
                                      },
                                      borderRadius: 50.r,
                                      fontSize: 12.sp,
                                      text:
                                      KalakarConstants.moreInfo,
                                      horizontalPadding: 24.w,
                                      verticalPadding: 8.h,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          CustomMobileButtonWidget(
                            text: KalakarConstants
                                .profileVerification,
                            onTap: () {
                              Get.toNamed(
                                  RouteHelper.payAndVerifyPage);
                            },
                            horizontalPadding: 10.w,
                            verticalPadding: 8.h,
                            fontSize: 12.sp,
                            backgroundColor:
                            KalakarColors.buttonBackground,
                            textColor: KalakarColors.headerText,
                            borderRadius: 50.0,
                            width: 200.w,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(0);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/facebook.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(1);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/instagram.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(2);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/whatsapp.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(3);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/youtube.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(4);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/email.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(5);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/website.svg",
                              height: 30.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                      : Center(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        Text("Unable To Get Profile Data"),
                        SizedBox(
                          height: 16.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.getArtistProfileBasic();
                            controller.getArtistDocuments();
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

                  SizedBox(
                    height: 24.h,
                  ),
                  Divider(
                    thickness: 2.0,
                    height: 10.h,
                    color: Colors.green.shade900,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            KalakarConstants.portfolio,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: KalakarColors.headerText),
                          ),
                          InkWell(
                              onTap: () {
                                controller.editArtistPortfolio(null);
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w),
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      borderRadius:
                                      BorderRadius.circular(4.h)),
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(2.h),
                        height: 160.h,
                        width: double.infinity,
                        child: controller.isArtistProfilePortfolioLoading
                            ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 12.w),
                                child: Stack(
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor:
                                      KalakarColors.blue20,
                                      child: Container(
                                        height: 155.h,
                                        width: 100.h,
                                        decoration: BoxDecoration(
                                            color:
                                            KalakarColors.white,
                                            borderRadius:
                                            BorderRadius.circular(
                                                8.r)),
                                      ),
                                    ),
                                  ],
                                ),
                              ); //Container();
                            })
                            : controller
                            .artistPortfolioImagesList.isNotEmpty
                            ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller
                                .artistPortfolioImagesList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                EdgeInsets.only(right: 12.w),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 155.h,
                                      width: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            8.r),
                                        border: Border.all(
                                            color: KalakarColors
                                                .backgroundGrey),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                            8.r),
                                        child: controller
                                            .artistPortfolioImagesList[
                                        index]
                                            .fileType ==
                                            1
                                            ? (controller
                                            .artistPortfolioImagesList[
                                        index]
                                            .filePath!
                                            .startsWith(
                                            "http")
                                            ? Image.network(
                                          controller
                                              .artistPortfolioImagesList[
                                          index]
                                              .filePath!,
                                          fit: BoxFit
                                              .cover,
                                          errorBuilder:
                                              (context,
                                              error,
                                              stackTrace) {
                                            return Image
                                                .asset(
                                              "assets/images/NA.jpg",
                                              // Default fallback image
                                              fit: BoxFit
                                                  .cover,
                                            );
                                          },
                                        )
                                            : Image.file(
                                          File(controller
                                              .artistPortfolioImagesList[
                                          index]
                                              .filePath!),
                                          fit: BoxFit
                                              .cover,
                                          errorBuilder:
                                              (context,
                                              error,
                                              stackTrace) {
                                            return Image
                                                .asset(
                                              "assets/images/NA.jpg",
                                              fit: BoxFit
                                                  .cover,
                                            );
                                          },
                                        ))
                                            : Image.memory(
                                          controller
                                              .artistPortfolioImagesList[
                                          index]
                                              .thumbnail!,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context,
                                              error,
                                              stackTrace) {
                                            return Image
                                                .asset(
                                              "assets/images/NA.jpg",
                                              fit: BoxFit
                                                  .cover,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 2,
                                      top: 2,
                                      child: InkWell(
                                        onTap: () {
                                          controller
                                              .editArtistPortfolio(
                                            controller
                                                .artistPortfolioImagesList[
                                            index],
                                          );
                                        },
                                        child: Container(
                                            padding:
                                            EdgeInsets.all(
                                                4.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    50.r),
                                                color: KalakarColors
                                                    .white
                                                    .withOpacity(
                                                    .5)),
                                            child: Icon(
                                              Icons.edit,
                                              size: 16.sp,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ); //Container();
                            })
                            : Center(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                  "Unable To Get Portfolio Data"),
                              SizedBox(
                                height: 16.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller
                                      .getArtistPortFolio(0);
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
                    ],
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                  //   child: Divider(
                  //     height: 10.h,
                  //     thickness: 1.0,
                  //   ),
                  // ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Divider(
                    thickness: 2.0,
                    height: 10.h,
                    color: Colors.green.shade900,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2.h),
                        height: 160.h,
                        width: double.infinity,
                        child: controller.isArtistProfilePortfolioLoading
                            ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 12.w),
                                child: Stack(
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor:
                                      KalakarColors.blue20,
                                      child: Container(
                                        height: 155.h,
                                        width: 100.h,
                                        decoration: BoxDecoration(
                                            color:
                                            KalakarColors.white,
                                            borderRadius:
                                            BorderRadius.circular(
                                                8.r)),
                                      ),
                                    ),
                                  ],
                                ),
                              ); //Container();
                            })
                            : controller
                            .artistPortfolioVideosList.isNotEmpty
                            ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller
                                .artistPortfolioVideosList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                EdgeInsets.only(right: 12.w),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 155.h,
                                      width: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            8.r),
                                        border: Border.all(
                                            color: KalakarColors
                                                .backgroundGrey),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                            8.r),
                                        child: controller
                                            .artistPortfolioVideosList[
                                        index]
                                            .fileType ==
                                            1
                                            ? (controller
                                            .artistPortfolioVideosList[
                                        index]
                                            .filePath!
                                            .startsWith(
                                            "http")
                                            ? Image.network(
                                          controller
                                              .artistPortfolioVideosList[
                                          index]
                                              .filePath!,
                                          fit: BoxFit
                                              .cover,
                                          errorBuilder:
                                              (context,
                                              error,
                                              stackTrace) {
                                            return Image
                                                .asset(
                                              "assets/images/NA.jpg",
                                              // Default fallback
                                              fit: BoxFit
                                                  .cover,
                                            );
                                          },
                                        )
                                            : Image.file(
                                          File(controller
                                              .artistPortfolioVideosList[
                                          index]
                                              .filePath!),
                                          fit: BoxFit
                                              .cover,
                                          errorBuilder:
                                              (context,
                                              error,
                                              stackTrace) {
                                            return Image
                                                .asset(
                                              "assets/images/NA.jpg",
                                              fit: BoxFit
                                                  .cover,
                                            );
                                          },
                                        ))
                                            : Image.memory(
                                          controller
                                              .artistPortfolioVideosList[
                                          index]
                                              .thumbnail!,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context,
                                              error,
                                              stackTrace) {
                                            return Image
                                                .asset(
                                              "assets/images/NA.jpg",
                                              fit: BoxFit
                                                  .cover,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 2,
                                      top: 2,
                                      child: InkWell(
                                        onTap: () {
                                          controller
                                              .editArtistPortfolio(
                                            controller
                                                .artistPortfolioVideosList[
                                            index],
                                          );
                                        },
                                        child: Container(
                                            padding:
                                            EdgeInsets.all(
                                                4.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    50.r),
                                                color: KalakarColors
                                                    .white
                                                    .withOpacity(
                                                    .5)),
                                            child: Icon(
                                              Icons.edit,
                                              size: 16.sp,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ); //Container();
                            })
                            : Center(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                  "Unable To Get Portfolio Data"),
                              SizedBox(
                                height: 16.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller
                                      .getArtistPortFolio(0);
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
                    ],
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                  //   child: Divider(
                  //     height: 10.h,
                  //     thickness: 1.0,
                  //   ),
                  // ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Divider(
                    thickness: 2.0,
                    height: 10.h,
                    color: Colors.green.shade900,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  Container(
                    padding: EdgeInsets.all(16.h),
                    margin: EdgeInsets.all(4.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border:
                      Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${KalakarConstants.experience} : ",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  controller.setEditExperienceData(null);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(4.h)),
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        controller.isArtistProfileExperienceLoading
                            ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor:
                                        KalakarColors.blue10,
                                        highlightColor:
                                        KalakarColors.blue20,
                                        child: Container(
                                          height: 20.h,
                                          width: 80.h,
                                          color: KalakarColors.white,
                                        ),
                                      ),
                                      Shimmer.fromColors(
                                        baseColor:
                                        KalakarColors.blue10,
                                        highlightColor:
                                        KalakarColors.blue20,
                                        child: Container(
                                          height: 20.h,
                                          width: 80.h,
                                          color: KalakarColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  )
                                ],
                              );
                            })
                            : controller.artistExperienceList.isNotEmpty
                            ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller
                                .artistExperienceList.length,
                            physics:
                            NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              ExperienceList expereinceData =
                              controller.artistExperienceList[
                              index];
                              print(
                                expereinceData.roleImage!,
                              );
                              return Container(
                                margin:
                                EdgeInsets.only(bottom: 12.h),
                                padding: EdgeInsets.all(8.h),
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                  borderRadius:
                                  BorderRadius.circular(4.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Image.network(
                                          expereinceData
                                              .roleImage!,
                                          fit: BoxFit.cover,
                                          height: 60.h,
                                          width: 60.h,
                                          errorBuilder:
                                              (BuildContext
                                          context,
                                              Object error,
                                              StackTrace?
                                              stackTrace) {
                                            // Return a dummy or placeholder image when an error occurs
                                            return Image.asset(
                                              "assets/images/NA.jpg",
                                              height: 60.h,
                                              width: 60.h,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                expereinceData
                                                    .roleName!,
                                                style: TextStyle(
                                                    fontSize:
                                                    14.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Text(
                                                expereinceData
                                                    .roleProfile!,
                                                style: TextStyle(
                                                    fontSize:
                                                    12.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .normal),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Text(
                                                expereinceData
                                                    .skillUsed!,
                                                style: TextStyle(
                                                    fontSize:
                                                    12.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller
                                                  .setEditExperienceData(
                                                  expereinceData);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              size: 18.sp,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    )
                                  ],
                                ),
                              );
                            })
                            : Center(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                  "Unable To Get Experience Data"),
                              SizedBox(
                                height: 16.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller
                                      .getArtistExperience(0);
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
                  ),
                ],
              )
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.size.height / 3,
                    ),
                    Text(" Profile Data Not Added"),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteHelper.artistProfileForm);
                      },
                      child: Column(
                        children: [
                          Icon(Icons.add),
                          Text("Add"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }else{

          return GetBuilder<RequirementController>(
            builder: (requirementController) {

              artist_profile.GetArtistProfileModelForRequirememt artistData = requirementController
                  .artistData!;
              List<artist_profile.ExperienceList> artistExperienceData =
              requirementController.artistExperienceData!;
              List<artist_profile.PortfolioList> artistPortfolioImagesData =
              requirementController.artistPortfolioImagesList!;
              List<artist_profile.PortfolioList> artistPortfolioVideosData =
              requirementController.artistPortfolioVideosList!;

              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child:  Column(
                  children: [
                     Column(
                      children: [
                        Row(
                          children: [
                            Center(
                                child: Container(
                                  height: 80.h,
                                  width: 80.h,
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(50),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(50),
                                    child: Image.network(
                                      artistData.profilePic ?? "",
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error,
                                          stackTrace) {
                                        return Image.asset(
                                          "assets/images/NA.jpg",
                                          // Your default image
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      "${KalakarConstants.kalakarId} : ${requirementController.artistProfileId}",
                                      style: TextStyle(
                                          color: KalakarColors
                                              .headerText),
                                    ),
                                    Text(
                                      "${artistData.firstName} ${artistData.lastName}",
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          color: KalakarColors
                                              .buttonText,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        IntrinsicHeight(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          KalakarConstants.age,
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        Text(
                                            " : ${artistData.age}"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          KalakarConstants.height,
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        Text(
                                            " : ${artistData.height}"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          KalakarConstants.weight,
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        Text(
                                            " : ${artistData.weight}"),
                                      ],
                                    ),
                                  ],
                                ),
                                DashedDottedDivider(
                                  isHorizontal: false,
                                  color: Colors.blue,
                                  dashWidth: 5.0,
                                  dotDiameter: 3.0,
                                  space: 3.0,
                                  thickness: 2.0,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          KalakarConstants.city,
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        Text(
                                            " : ${artistData.address1}"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          KalakarConstants
                                              .district,
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        Text(
                                            " : ${artistData.district}"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          KalakarConstants.state,
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        Text(
                                            " : ${artistData.state}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      KalakarConstants.bio,
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          color: KalakarColors
                                              .headerText),
                                    ),
                                    Text("${artistData.bio}")
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                child: IntrinsicWidth(
                                  child: Column(
                                    children: [
                                      /*InkWell(
                                  child: CustomMobileButtonWidget(
                                    onTap: () {},
                                    borderRadius: 50.r,
                                    fontSize: 12.sp,
                                    text: KalakarConstants.experienceLevel,
                                    horizontalPadding: 24.w,
                                    verticalPadding: 8.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),*/
                                      CustomMobileButtonWidget(
                                        onTap: () {
                                          // Get.toNamed(RouteHelper
                                          //     .artistDocumentForm);
                                          controller
                                              .gotoArtistMoreInfo(
                                              false);
                                        },
                                        borderRadius: 50.r,
                                        fontSize: 12.sp,
                                        text:
                                        KalakarConstants.moreInfo,
                                        horizontalPadding: 24.w,
                                        verticalPadding: 8.h,
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),

                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                requirementController.openSocialMedia(0,artistData.fbLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/facebook.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                requirementController.openSocialMedia(1,artistData.instalink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/instagram.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                requirementController.openSocialMedia(2, artistData.wpLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/whatsapp.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                requirementController.openSocialMedia(3,artistData.ytLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/youtube.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                requirementController.openSocialMedia(4,artistData.emailLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/email.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                requirementController.openSocialMedia(5,artistData.websiteLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/website.svg",
                                height: 30.h,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 24.h,
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 10.h,
                      color: Colors.green.shade900,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Column(
                      children: [

                        Text(
                          KalakarConstants.portfolio,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: KalakarColors.headerText),
                        ),
                        SizedBox(height: 8.h,),
                        Container(
                          padding: EdgeInsets.all(2.h),
                          height: 160.h,
                          width: double.infinity,
                          child:artistPortfolioImagesData.isNotEmpty
                              ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: artistPortfolioImagesData.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    controller.viewPortfolio(artistPortfolioImagesData[index].filePath!, "IMAGE");
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.only(right: 12.w),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 155.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8.r),
                                            border: Border.all(
                                                color: KalakarColors
                                                    .backgroundGrey),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8.r),
                                            child: artistPortfolioImagesData[
                                            index]
                                                .fileType ==
                                                1
                                                ? (artistPortfolioImagesData[
                                            index]
                                                .filePath!
                                                .startsWith(
                                                "http")
                                                ? Image.network(
                                              artistPortfolioImagesData[
                                              index]
                                                  .filePath!,
                                              fit: BoxFit
                                                  .cover,
                                              errorBuilder:
                                                  (context,
                                                  error,
                                                  stackTrace) {
                                                return Image
                                                    .asset(
                                                  "assets/images/NA.jpg",
                                                  // Default fallback image
                                                  fit: BoxFit
                                                      .cover,
                                                );
                                              },
                                            )
                                                : Image.file(
                                              File(artistPortfolioImagesData[
                                              index]
                                                  .filePath!),
                                              fit: BoxFit
                                                  .cover,
                                              errorBuilder:
                                                  (context,
                                                  error,
                                                  stackTrace) {
                                                return Image
                                                    .asset(
                                                  "assets/images/NA.jpg",
                                                  fit: BoxFit
                                                      .cover,
                                                );
                                              },
                                            ))
                                                : Image.memory(
                                              artistPortfolioImagesData[
                                              index]
                                                  .thumbnail!,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context,
                                                  error,
                                                  stackTrace) {
                                                return Image
                                                    .asset(
                                                  "assets/images/NA.jpg",
                                                  fit: BoxFit
                                                      .cover,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ); //Container();
                              })
                              : Center(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                    "No Portfolio Data"),
                                SizedBox(
                                  height: 16.h,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                    //   child: Divider(
                    //     height: 10.h,
                    //     thickness: 1.0,
                    //   ),
                    // ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 10.h,
                      color: Colors.green.shade900,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.h),
                          height: 160.h,
                          width: double.infinity,
                          child:  artistPortfolioVideosData.isNotEmpty
                              ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: artistPortfolioVideosData.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    controller.viewPortfolio(artistPortfolioVideosData[index].filePath!, "VIDEO");
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.only(right: 12.w),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 155.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8.r),
                                            border: Border.all(
                                                color: KalakarColors
                                                    .backgroundGrey),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8.r),
                                            child: artistPortfolioVideosData[
                                            index]
                                                .fileType ==
                                                1
                                                ? (artistPortfolioVideosData[
                                            index]
                                                .filePath!
                                                .startsWith(
                                                "http")
                                                ? Image.network(
                                              artistPortfolioVideosData[
                                              index]
                                                  .filePath!,
                                              fit: BoxFit
                                                  .cover,
                                              errorBuilder:
                                                  (context,
                                                  error,
                                                  stackTrace) {
                                                return Image
                                                    .asset(
                                                  "assets/images/NA.jpg",
                                                  // Default fallback
                                                  fit: BoxFit
                                                      .cover,
                                                );
                                              },
                                            )
                                                : Image.file(
                                              File(artistPortfolioVideosData[
                                              index]
                                                  .filePath!),
                                              fit: BoxFit
                                                  .cover,
                                              errorBuilder:
                                                  (context,
                                                  error,
                                                  stackTrace) {
                                                return Image
                                                    .asset(
                                                  "assets/images/NA.jpg",
                                                  fit: BoxFit
                                                      .cover,
                                                );
                                              },
                                            ))
                                                : Image.memory(
                                              artistPortfolioVideosData[
                                              index]
                                                  .thumbnail!,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context,
                                                  error,
                                                  stackTrace) {
                                                return Image
                                                    .asset(
                                                  "assets/images/NA.jpg",
                                                  fit: BoxFit
                                                      .cover,
                                                );
                                              },
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ); //Container();
                              })
                              : Center(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                    "No Portfolio Data"),
                                SizedBox(
                                  height: 16.h,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                    //   child: Divider(
                    //     height: 10.h,
                    //     thickness: 1.0,
                    //   ),
                    // ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 10.h,
                      color: Colors.green.shade900,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    Container(
                      padding: EdgeInsets.all(16.h),
                      margin: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                        color: KalakarColors.white,
                        border:
                        Border.all(color: KalakarColors.backgroundGrey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${KalakarConstants.experience} : ",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                           artistExperienceData.isNotEmpty
                              ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: artistExperienceData.length,
                              physics:
                              NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                artist_profile.ExperienceList expereinceData =
                                artistExperienceData[
                                index];
                                print(
                                  expereinceData.roleImage!,
                                );
                                return InkWell(
                                  onTap: (){
                                    requirementController.selectedExperienceData=expereinceData;
                                    Get.toNamed(RouteHelper.artistExperienceForm);
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.only(bottom: 12.h),
                                    padding: EdgeInsets.all(8.h),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius:
                                      BorderRadius.circular(4.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Image.network(
                                              expereinceData
                                                  .roleImage!,
                                              fit: BoxFit.cover,
                                              height: 60.h,
                                              width: 60.h,
                                              errorBuilder:
                                                  (BuildContext
                                              context,
                                                  Object error,
                                                  StackTrace?
                                                  stackTrace) {
                                                // Return a dummy or placeholder image when an error occurs
                                                return Image.asset(
                                                  "assets/images/NA.jpg",
                                                  height: 60.h,
                                                  width: 60.h,
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    expereinceData
                                                        .roleName!,
                                                    style: TextStyle(
                                                        fontSize:
                                                        14.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Text(
                                                    expereinceData
                                                        .roleProfile!,
                                                    style: TextStyle(
                                                        fontSize:
                                                        12.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Text(
                                                    expereinceData
                                                        .skillUsed!,
                                                    style: TextStyle(
                                                        fontSize:
                                                        12.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })
                              : Center(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                    "No Experience Data"),
                                SizedBox(
                                  height: 16.h,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      color: KalakarColors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomMobileButtonWidget(
                              text: requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  4
                                  ? KalakarConstants.select
                                  : requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  1
                                  ? KalakarConstants.selected
                                  : KalakarConstants.select,
                              onTap: () {
                                /*if (controller.selectedArtistProfileData
                                          .fKApplyStatusMasterID ==
                                      1 ||
                                  controller.selectedArtistProfileData
                                          .fKApplyStatusMasterID ==
                                      2) */
                                requirementController.saveChangesAppliedRequirementStatus(1);
                              },
                              backgroundColor: requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  4 ||
                                  requirementController.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                      1
                                  ? KalakarColors.appBarBackground
                                  : KalakarColors.backgroundGrey,
                              horizontalPadding: 4.h,
                              verticalPadding: 8.h,
                              fontSize: 16.sp,
                              width: 100.w,
                              borderRadius: 4.r),
                          CustomMobileButtonWidget(
                              text: requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  4
                                  ? KalakarConstants.reject
                                  : requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  3
                                  ? KalakarConstants.rejected
                                  : KalakarConstants.reject,
                              onTap: () {
                                requirementController.saveChangesAppliedRequirementStatus(3);
                              },
                              horizontalPadding: 4.h,
                              verticalPadding: 8.h,
                              backgroundColor: requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  4 ||
                                  requirementController.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                      3
                                  ? KalakarColors.appBarBackground
                                  : KalakarColors.backgroundGrey,
                              width: 100.w,
                              fontSize: 16.sp,
                              borderRadius: 4.r),
                          CustomMobileButtonWidget(
                              text: requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  4
                                  ? KalakarConstants.hold
                                  : requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  2
                                  ? KalakarConstants.onHold
                                  : KalakarConstants.hold,
                              onTap: () {
                                requirementController.saveChangesAppliedRequirementStatus(2);
                              },
                              backgroundColor: requirementController.selectedArtistProfileData
                                  .fKApplyStatusMasterID ==
                                  4 ||
                                  requirementController.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                      2
                                  ? KalakarColors.appBarBackground
                                  : KalakarColors.backgroundGrey,
                              horizontalPadding: 4.h,
                              verticalPadding: 8.h,
                              width: 100.w,
                              fontSize: 16.sp,
                              borderRadius: 4.r),
                        ],
                      ),
                    )

                  ],
                )

              );
            }
          );
        }
      }),
    );
  }

  profileWebView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<ArtistProfileController>(builder: (controller) {
        ArtistProfileDetailsClass profileDetails =
            controller.artistProfileDetails;
        if (controller.isArtist) {
          return RefreshIndicator(
                    onRefresh: () async {
                      controller.checkIfArtist();
                    },
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: controller.artistProfileID != 0
                          ? Column(
                              children: [
                                controller.isArtistProfileBasicLoading
                                    ? basicsLoadingMobile()
                                    : profileDetails.firstName != null
                                        ? Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          height: 80.h,
                                                          width: 80.h,
                                                          margin: EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(50),
                                                            child: Image.network(
                                                              profileDetails.profilePic ?? "",
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context, error, stackTrace) {
                                                                return Image.asset(
                                                                  "assets/images/NA.jpg", // Default fallback image
                                                                  fit: BoxFit.cover,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        )
                                                        ,
                                                      ),
                                                      Text(
                                                        "${KalakarConstants.kalakarId} : ${profileDetails.artistProfileID}",
                                                        style: TextStyle(
                                                            color:
                                                                KalakarColors.headerText),
                                                      ),
                                                      Text(
                                                        "${profileDetails.firstName} ${profileDetails.lastName}",
                                                        style: TextStyle(
                                                            fontSize: 8.sp,
                                                            color:
                                                                KalakarColors.buttonText,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 16.h,
                                                  ),
                                                  IntrinsicHeight(
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 24.w),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        KalakarConstants
                                                                            .age,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      Text(
                                                                          " : ${profileDetails.age}"),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        KalakarConstants
                                                                            .height,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      Text(
                                                                          " : ${profileDetails.height}"),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        KalakarConstants
                                                                            .weight,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      Text(
                                                                          " : ${profileDetails.weight}"),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 8.w,
                                                              ),
                                                              SizedBox(
                                                                height: 100.h,
                                                                child:
                                                                    DashedDottedDivider(
                                                                  isHorizontal: false,
                                                                  color: Colors.blue,
                                                                  dashWidth: 5.0,
                                                                  dotDiameter: 3.0,
                                                                  space: 3.0,
                                                                  thickness: 2.0,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 8.w,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        KalakarConstants
                                                                            .city,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      Text(
                                                                          " : ${profileDetails.address1}"),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        KalakarConstants
                                                                            .district,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      Text(
                                                                          " : ${profileDetails.district}"),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        KalakarConstants
                                                                            .state,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      Text(
                                                                          " : ${profileDetails.state}"),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 24.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        KalakarConstants.bio,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color:
                                                                KalakarColors.headerText),
                                                      ),
                                                      Text("${profileDetails.bio}")
                                                    ],
                                                  ),
                                                  SizedBox(width: 4.w,),
                                                  CustomMobileButtonWidget(
                                                    text: KalakarConstants.verifyProfile,
                                                    onTap: () {
                                                      Get.toNamed(
                                                          RouteHelper.payAndVerifyPage);
                                                    },
                                                    horizontalPadding: 2.w,
                                                    verticalPadding: 8.h,
                                                    fontSize: 5.sp,
                                                    backgroundColor:
                                                        KalakarColors.buttonBackground,
                                                    textColor: KalakarColors.headerText,
                                                    borderRadius: 50.0,
                                                    width: 70.w,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5.0,
                                                      ),
                                                    ],
                                                  ),
                                                  CustomMobileButtonWidget(
                                                    onTap: () {
                                                      // Get.toNamed(RouteHelper
                                                      //     .artistDocumentForm);
                                                      controller
                                                          .gotoArtistMoreInfo(false);
                                                    },
                                                    borderRadius: 50.r,
                                                    fontSize: 5.sp,
                                                    width: 70.w,
                                                    text: KalakarConstants.moreInfo,
                                                    horizontalPadding: 4.h,
                                                    verticalPadding: 8.h,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 24.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller.openSocialMedia(0);
                                                    },
                                                    child: SvgPicture.asset(
                                                      "assets/svg/facebook.svg",
                                                      height: 30.h,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.openSocialMedia(1);
                                                    },
                                                    child: SvgPicture.asset(
                                                      "assets/svg/instagram.svg",
                                                      height: 30.h,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.openSocialMedia(2);
                                                    },
                                                    child: SvgPicture.asset(
                                                      "assets/svg/whatsapp.svg",
                                                      height: 30.h,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.openSocialMedia(3);
                                                    },
                                                    child: SvgPicture.asset(
                                                      "assets/svg/youtube.svg",
                                                      height: 30.h,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.openSocialMedia(4);
                                                    },
                                                    child: SvgPicture.asset(
                                                      "assets/svg/email.svg",
                                                      height: 30.h,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.openSocialMedia(5);
                                                    },
                                                    child: SvgPicture.asset(
                                                      "assets/svg/website.svg",
                                                      height: 30.h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 32.h,
                                                ),
                                                Text("Unable To Get Profile Data"),
                                                SizedBox(
                                                  height: 16.h,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    controller.getArtistProfileBasic();
                                                    controller.getArtistDocuments();
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

                                SizedBox(
                                  height: 24.h,
                                ),
                                Divider(
                                  thickness: 2.0,
                                  height: 10.h,
                                  color: Colors.green.shade900,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          KalakarConstants.portfolio,
                                          style: TextStyle(
                                              fontSize: 6.sp,
                                              fontWeight: FontWeight.bold,
                                              color: KalakarColors.headerText),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.editArtistPortfolio(null);
                                            },
                                            child: Container(
                                                padding:
                                                    EdgeInsets.symmetric(horizontal: 8.w),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(4.h)),
                                                child: Text(
                                                  "Add",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 4.sp),
                                                ))),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(2.h),
                                      height: 260.h,
                                      width: double.infinity,
                                      child: controller.isArtistProfilePortfolioLoading
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 5,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.only(right: 12.w),
                                                  child: Stack(
                                                    children: [
                                                      Shimmer.fromColors(
                                                        baseColor: KalakarColors.blue10,
                                                        highlightColor:
                                                            KalakarColors.blue20,
                                                        child: Container(
                                                          height: 255.h,
                                                          width: 150.h,
                                                          decoration: BoxDecoration(
                                                              color: KalakarColors.white,
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      8.r)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ); //Container();
                                              })
                                          : controller
                                                  .artistPortfolioImagesList.isNotEmpty
                                              ? ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: controller
                                                      .artistPortfolioImagesList.length,
                                                  itemBuilder: (context, index) {
                                                    return InkWell(
                                                      onTap: (){
                                                        controller.viewPortfolio(controller.artistPortfolioImagesList[index].filePath!,"IMAGE");
                                                      },
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.only(right: 12.w),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              height: 255.h,
                                                              width: 150.h,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8.r),
                                                                border: Border.all(color: KalakarColors.backgroundGrey),
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(8.r),
                                                                child: controller.artistPortfolioImagesList[index].fileType == 1
                                                                    ? (controller.artistPortfolioImagesList[index].filePath!.startsWith("http")
                                                                    ? Image.network(
                                                                  controller.artistPortfolioImagesList[index].filePath!,
                                                                  fit: BoxFit.cover,
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                    return Image.asset(
                                                                      "assets/images/NA.jpg", // Default fallback image
                                                                      fit: BoxFit.cover,
                                                                    );
                                                                  },
                                                                )
                                                                    : Image.file(
                                                                  File(controller.artistPortfolioImagesList[index].filePath!),
                                                                  fit: BoxFit.cover,
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                    return Image.asset(
                                                                      "assets/images/NA.jpg",
                                                                      fit: BoxFit.cover,
                                                                    );
                                                                  },
                                                                ))
                                                                    : Image.memory(
                                                                  controller.artistPortfolioImagesList[index].thumbnail!,
                                                                  fit: BoxFit.cover,
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                    return Image.asset(
                                                                      "assets/images/NA.jpg",
                                                                      fit: BoxFit.cover,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            )
                                                            ,
                                                            Positioned(
                                                              right: 2,
                                                              top: 2,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .editArtistPortfolio(
                                                                    controller
                                                                            .artistPortfolioImagesList[
                                                                        index],
                                                                  );
                                                                },
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(4.h),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                    50.r),
                                                                        color: KalakarColors
                                                                            .white
                                                                            .withOpacity(
                                                                                .5)),
                                                                    child: Icon(
                                                                      Icons.edit,
                                                                      size: 6.sp,
                                                                    )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ); //Container();
                                                  })
                                              : Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                      Text(
                                                          "Unable To Get Portfolio Data"),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .getArtistPortFolio(0);
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
                                  ],
                                ),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                                //   child: Divider(
                                //     height: 10.h,
                                //     thickness: 1.0,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Divider(
                                  thickness: 2.0,
                                  height: 10.h,
                                  color: Colors.green.shade900,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(2.h),
                                      height: 260.h,
                                      width: double.infinity,
                                      child: controller.isArtistProfilePortfolioLoading
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 5,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.only(right: 12.w),
                                                  child: Stack(
                                                    children: [
                                                      Shimmer.fromColors(
                                                        baseColor: KalakarColors.blue10,
                                                        highlightColor:
                                                            KalakarColors.blue20,
                                                        child: Container(
                                                          height: 255.h,
                                                          width: 150.h,
                                                          decoration: BoxDecoration(
                                                              color: KalakarColors.white,
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      8.r)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ); //Container();
                                              })
                                          : controller
                                                  .artistPortfolioVideosList.isNotEmpty
                                              ? ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: controller
                                                      .artistPortfolioVideosList.length,
                                                  itemBuilder: (context, index) {
                                                    return InkWell(
                                                      onTap: (){
                                                        controller.viewPortfolio(controller.artistPortfolioVideosList[index].filePath!, "VIDEO");
                                                      },
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.only(right: 12.w),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              height: 255.h,
                                                              width: 150.h,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8.r),
                                                                border: Border.all(color: KalakarColors.backgroundGrey),
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(8.r),
                                                                child: controller.artistPortfolioVideosList[index].fileType == 1
                                                                    ? (controller.artistPortfolioVideosList[index].filePath!.startsWith("http")
                                                                    ? Image.network(
                                                                  controller.artistPortfolioVideosList[index].filePath!,
                                                                  fit: BoxFit.cover,
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                    return Image.asset(
                                                                      "assets/images/NA.jpg", // Default fallback image
                                                                      fit: BoxFit.cover,
                                                                    );
                                                                  },
                                                                )
                                                                    : Image.file(
                                                                  File(controller.artistPortfolioVideosList[index].filePath!),
                                                                  fit: BoxFit.cover,
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                    return Image.asset(
                                                                      "assets/images/NA.jpg",
                                                                      fit: BoxFit.cover,
                                                                    );
                                                                  },
                                                                ))
                                                                    : Image.memory(
                                                                  controller.artistPortfolioVideosList[index].thumbnail!,
                                                                  fit: BoxFit.cover,
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                    return Image.asset(
                                                                      "assets/images/NA.jpg",
                                                                      fit: BoxFit.cover,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            )
                                                      ,
                                                            Positioned(
                                                              right: 2,
                                                              top: 2,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .editArtistPortfolio(
                                                                    controller
                                                                            .artistPortfolioVideosList[
                                                                        index],
                                                                  );
                                                                },
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(4.h),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                    50.r),
                                                                        color: KalakarColors
                                                                            .white
                                                                            .withOpacity(
                                                                                .5)),
                                                                    child: Icon(
                                                                      Icons.edit,
                                                                      size: 6.sp,
                                                                    )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ); //Container();
                                                  })
                                              : Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                      Text(
                                                          "Unable To Get Portfolio Data"),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .getArtistPortFolio(0);
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
                                  ],
                                ),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                                //   child: Divider(
                                //     height: 10.h,
                                //     thickness: 1.0,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Divider(
                                  thickness: 2.0,
                                  height: 10.h,
                                  color: Colors.green.shade900,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),

                                Container(
                                  padding: EdgeInsets.all(16.h),
                                  margin: EdgeInsets.all(4.h),
                                  decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                    border:
                                        Border.all(color: KalakarColors.backgroundGrey),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${KalakarConstants.experience} ",
                                            style: TextStyle(
                                                fontSize: 6.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                controller.setEditExperienceData(null);
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.w),
                                                  decoration: BoxDecoration(
                                                      border:
                                                          Border.all(color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(4.h)),
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 4.sp),
                                                  ))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      controller.isArtistProfileExperienceLoading
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 5,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Shimmer.fromColors(
                                                          baseColor: KalakarColors.blue10,
                                                          highlightColor:
                                                              KalakarColors.blue20,
                                                          child: Container(
                                                            height: 20.h,
                                                            width: 80.h,
                                                            color: KalakarColors.white,
                                                          ),
                                                        ),
                                                        Shimmer.fromColors(
                                                          baseColor: KalakarColors.blue10,
                                                          highlightColor:
                                                              KalakarColors.blue20,
                                                          child: Container(
                                                            height: 20.h,
                                                            width: 80.h,
                                                            color: KalakarColors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    )
                                                  ],
                                                );
                                              })
                                          : controller.artistExperienceList.isNotEmpty
                                              ? GridView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: controller
                                                      .artistExperienceList.length,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemBuilder: (context, index) {
                                                    ExperienceList expereinceData =
                                                        controller
                                                            .artistExperienceList[index];
                                                    return Container(
                                                      margin:
                                                      EdgeInsets.only(bottom: 12.h,right: 12.h),
                                                      padding: EdgeInsets.all(8.h),
                                                      decoration: BoxDecoration(
                                                        color: KalakarColors.white,
                                                        borderRadius:
                                                        BorderRadius.circular(4.r),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            blurRadius: 5.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [
                                                              Image.network(
                                                                expereinceData.roleImage!,
                                                                fit: BoxFit.cover,
                                                                height: 60.h,
                                                                width: 60.h,
                                                                errorBuilder:
                                                                    (BuildContext context,
                                                                    Object error,
                                                                    StackTrace?
                                                                    stackTrace) {
                                                                  // Return a dummy or placeholder image when an error occurs
                                                                  return Image.asset(
                                                                    "assets/images/NA.jpg",
                                                                    height: 60.h,
                                                                    width: 60.h,
                                                                  );
                                                                },
                                                              ),
                                                              SizedBox(
                                                                width: 8.w,
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Text(
                                                                      expereinceData
                                                                          .roleName!,
                                                                      style: TextStyle(
                                                                          fontSize: 5.sp,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 4.h,
                                                                    ),
                                                                    Text(
                                                                      expereinceData
                                                                          .roleProfile!,
                                                                      style: TextStyle(
                                                                          fontSize: 4.sp,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 2.h,
                                                                    ),
                                                                    Text(
                                                                      expereinceData
                                                                          .skillUsed!,
                                                                      style: TextStyle(
                                                                          fontSize: 4.sp,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    controller
                                                                        .setEditExperienceData(
                                                                        expereinceData);
                                                                  },
                                                                  child: Icon(
                                                                    Icons.edit,
                                                                    size: 6.sp,
                                                                  )),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 4.h,
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2, childAspectRatio: 4.h),)
                                              : Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                      Text(
                                                          "Unable To Get Experience Data"),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .getArtistExperience(0);
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
                                ),
                              ],
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: Get.size.height / 3,
                                  ),
                                  Text(" Profile Data Not Added"),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.artistProfileForm);
                                    },
                                    child: Column(
                                      children: [
                                        Icon(Icons.add),
                                        Text("Add"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                  );
        } else {

          return GetBuilder<RequirementController>(
            builder: (requirementController) {
              artist_profile.GetArtistProfileModelForRequirememt artistData = requirementController
                  .artistData!;
              List<artist_profile.ExperienceList> artistExperienceData =
              requirementController.artistExperienceData!;
              List<artist_profile.PortfolioList> artistPortfolioImagesData =
              requirementController.artistPortfolioImagesList!;
              List<artist_profile.PortfolioList> artistPortfolioVideosData =
              requirementController.artistPortfolioVideosList!;
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Center(
                                  child: Container(
                                    height: 80.h,
                                    width: 80.h,
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        artistData.profilePic ?? "",
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            "assets/images/NA.jpg", // Default fallback image
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                  ,
                                ),
                                Text(
                                  "${KalakarConstants.kalakarId} : ${requirementController.artistProfileId}",
                                  style: TextStyle(
                                      color:
                                      KalakarColors.headerText),
                                ),
                                Text(
                                  "${artistData.firstName} ${artistData.lastName}",
                                  style: TextStyle(
                                      fontSize: 8.sp,
                                      color:
                                      KalakarColors.buttonText,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            IntrinsicHeight(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  KalakarConstants
                                                      .age,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                    " : ${artistData.age}"),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  KalakarConstants
                                                      .height,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                    " : ${artistData.height}"),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  KalakarConstants
                                                      .weight,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                    " : ${artistData.weight}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        SizedBox(
                                          height: 100.h,
                                          child:
                                          DashedDottedDivider(
                                            isHorizontal: false,
                                            color: Colors.blue,
                                            dashWidth: 5.0,
                                            dotDiameter: 3.0,
                                            space: 3.0,
                                            thickness: 2.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  KalakarConstants
                                                      .city,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                    " : ${artistData.address1}"),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  KalakarConstants
                                                      .district,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                    " : ${artistData.district}"),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  KalakarConstants
                                                      .state,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                Text(
                                                    " : ${artistData.state}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  KalakarConstants.bio,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                      KalakarColors.headerText),
                                ),
                                Text("${artistData.bio}")
                              ],
                            ),
                            SizedBox(width: 4.w,),
                            CustomMobileButtonWidget(
                              onTap: () {
                                // Get.toNamed(RouteHelper
                                //     .artistDocumentForm);
                                controller
                                    .gotoArtistMoreInfo(false);
                              },
                              borderRadius: 50.r,
                              fontSize: 5.sp,
                              width: 70.w,
                              text: KalakarConstants.moreInfo,
                              horizontalPadding: 4.h,
                              verticalPadding: 8.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(0);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/facebook.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(1);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/instagram.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(2);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/whatsapp.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(3);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/youtube.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(4);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/email.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(5);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/website.svg",
                                height: 30.h,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
              ,
                    SizedBox(
                      height: 24.h,
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 10.h,
                      color: Colors.green.shade900,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              KalakarConstants.portfolio,
                              style: TextStyle(
                                  fontSize: 6.sp,
                                  fontWeight: FontWeight.bold,
                                  color: KalakarColors.headerText),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(2.h),
                          height: 260.h,
                          width: double.infinity,
                          child:  artistPortfolioImagesData.isNotEmpty
                              ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: artistPortfolioImagesData.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    controller.viewPortfolio(artistPortfolioImagesData[index].filePath!,"IMAGE");
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.only(right: 12.w),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 255.h,
                                          width: 150.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.r),
                                            border: Border.all(color: KalakarColors.backgroundGrey),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.r),
                                            child: artistPortfolioImagesData[index].fileType == 1
                                                ? (artistPortfolioImagesData[index].filePath!.startsWith("http")
                                                ? Image.network(
                                              artistPortfolioImagesData[index].filePath!,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg", // Default fallback image
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                                : Image.file(
                                              File(artistPortfolioImagesData[index].filePath!),
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg",
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ))
                                                : Image.memory(
                                              artistPortfolioImagesData[index].thumbnail!,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg",
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                        ,
                                      ],
                                    ),
                                  ),
                                ); //Container();
                              })
                              : Center(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                    "No Portfolio Data"),
                                SizedBox(
                                  height: 16.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                    //   child: Divider(
                    //     height: 10.h,
                    //     thickness: 1.0,
                    //   ),
                    // ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 10.h,
                      color: Colors.green.shade900,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.h),
                          height: 260.h,
                          width: double.infinity,
                          child:artistPortfolioVideosData.isNotEmpty
                              ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: artistPortfolioVideosData.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    controller.viewPortfolio(artistPortfolioVideosData[index].filePath!, "VIDEO");
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.only(right: 12.w),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 255.h,
                                          width: 150.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.r),
                                            border: Border.all(color: KalakarColors.backgroundGrey),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.r),
                                            child: artistPortfolioVideosData[index].fileType == 1
                                                ? (artistPortfolioVideosData[index].filePath!.startsWith("http")
                                                ? Image.network(
                                              artistPortfolioVideosData[index].filePath!,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg", // Default fallback image
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                                : Image.file(
                                              File(artistPortfolioVideosData[index].filePath!),
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg",
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ))
                                                : Image.memory(
                                              artistPortfolioVideosData[index].thumbnail!,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg",
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                        ,
                             ],
                                    ),
                                  ),
                                ); //Container();
                              })
                              : Center(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                    "No Portfolio Data"),
                                SizedBox(
                                  height: 16.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                    //   child: Divider(
                    //     height: 10.h,
                    //     thickness: 1.0,
                    //   ),
                    // ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 10.h,
                      color: Colors.green.shade900,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    Container(
                      padding: EdgeInsets.all(16.h),
                      margin: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                        color: KalakarColors.white,
                        border:
                        Border.all(color: KalakarColors.backgroundGrey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${KalakarConstants.experience} ",
                                style: TextStyle(
                                    fontSize: 6.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                           artistExperienceData.isNotEmpty
                              ? GridView.builder(
                            shrinkWrap: true,
                            itemCount: artistExperienceData.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              artist_profile.ExperienceList expereinceData =
                              artistExperienceData[index];
                              return InkWell(
                                onTap: (){
                                  requirementController.selectedExperienceData=expereinceData;
                                  Get.toNamed(RouteHelper.artistExperienceForm);
                                },
                                child: Container(
                                  margin:
                                  EdgeInsets.only(bottom: 12.h,right: 12.h),
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                    borderRadius:
                                    BorderRadius.circular(4.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            expereinceData.roleImage!,
                                            fit: BoxFit.cover,
                                            height: 60.h,
                                            width: 60.h,
                                            errorBuilder:
                                                (BuildContext context,
                                                Object error,
                                                StackTrace?
                                                stackTrace) {
                                              // Return a dummy or placeholder image when an error occurs
                                              return Image.asset(
                                                "assets/images/NA.jpg",
                                                height: 60.h,
                                                width: 60.h,
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  expereinceData
                                                      .roleName!,
                                                  style: TextStyle(
                                                      fontSize: 5.sp,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(
                                                  expereinceData
                                                      .roleProfile!,
                                                  style: TextStyle(
                                                      fontSize: 4.sp,
                                                      fontWeight:
                                                      FontWeight
                                                          .normal),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Text(
                                                  expereinceData
                                                      .skillUsed!,
                                                  style: TextStyle(
                                                      fontSize: 4.sp,
                                                      fontWeight:
                                                      FontWeight
                                                          .normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 4.h),)
                              : Center(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                    "No Experience Data"),
                                SizedBox(
                                  height: 16.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomMobileButtonWidget(
                            text: requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                4
                                ? KalakarConstants.select
                                : requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                1
                                ? KalakarConstants.selected
                                : KalakarConstants.select,
                            onTap: () {
                              /*if (controller.selectedArtistProfileData
                                            .fKApplyStatusMasterID ==
                                        1 ||
                                    controller.selectedArtistProfileData
                                            .fKApplyStatusMasterID ==
                                        2) */
                              requirementController.saveChangesAppliedRequirementStatus(1);
                            },
                            backgroundColor: requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                4 ||
                                requirementController.selectedArtistProfileData
                                    .fKApplyStatusMasterID ==
                                    1
                                ? KalakarColors.appBarBackground
                                : KalakarColors.backgroundGrey,
                            horizontalPadding: 4.h,
                            verticalPadding: 8.h,
                            fontSize: 4.sp,
                            width: 60.w,
                            borderRadius: 40.r),
                        CustomMobileButtonWidget(
                            text: requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                4
                                ? KalakarConstants.reject
                                : requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                3
                                ? KalakarConstants.rejected
                                : KalakarConstants.reject,
                            onTap: () {
                              requirementController.saveChangesAppliedRequirementStatus(3);
                            },
                            horizontalPadding: 4.h,
                            verticalPadding: 8.h,
                            backgroundColor: requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                4 ||
                                requirementController.selectedArtistProfileData
                                    .fKApplyStatusMasterID ==
                                    3
                                ? KalakarColors.appBarBackground
                                : KalakarColors.backgroundGrey,
                            width: 60.w,
                            fontSize: 4.sp,
                            borderRadius: 40.r),
                        CustomMobileButtonWidget(
                            text: requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                4
                                ? KalakarConstants.hold
                                : requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                2
                                ? KalakarConstants.onHold
                                : KalakarConstants.hold,
                            onTap: () {
                              requirementController.saveChangesAppliedRequirementStatus(2);
                            },
                            backgroundColor: requirementController.selectedArtistProfileData
                                .fKApplyStatusMasterID ==
                                4 ||
                                requirementController.selectedArtistProfileData
                                    .fKApplyStatusMasterID ==
                                    2
                                ? KalakarColors.appBarBackground
                                : KalakarColors.backgroundGrey,
                            horizontalPadding: 4.h,
                            verticalPadding: 8.h,
                            width: 60.w,
                            fontSize: 4.sp,
                            borderRadius: 40.r),
                      ],
                    ),
                    SizedBox(height: 24.h,)
                  ],
                )

              );
            }
          );
        }


      }),
    );
  }

  appBarMobileView() {
    return GetBuilder<ArtistProfileController>(
        builder: (artistProfileController) {
      return AppBar(
        backgroundColor: KalakarColors.appBarBackground,
        surfaceTintColor: KalakarColors.appBarBackground,
        title: Text(
          KalakarConstants.profile1,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          if (artistProfileController.artistProfileDetails.firstName != null)
            InkWell(
              onTap: () {
                Get.toNamed(RouteHelper.artistProfileForm);
              },
              child: Icon(
                Icons.edit,
                size: 30.h,
              ),
            ),
          SizedBox(
            width: 16.h,
          )
        ],
      );
    });
  }

  appBarWebView() {
    return GetBuilder<ArtistProfileController>(
        builder: (artistProfileController) {
      return AppBar(
        backgroundColor: KalakarColors.appBarBackground,
        surfaceTintColor: KalakarColors.appBarBackground,
        title: Text(
          KalakarConstants.profile1,
          style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          if (artistProfileController.artistProfileDetails.firstName != null)
            InkWell(
              onTap: () {
                Get.toNamed(RouteHelper.artistProfileForm);
              },
              child: Icon(
                Icons.edit,
                size: 30.h,
              ),
            ),
          SizedBox(
            width: 16.h,
          )
        ],
      );
    });
  }

  basicsLoadingMobile() {
    return Column(
      children: [
        Row(
          children: [
            Center(
              child: Shimmer.fromColors(
                baseColor: KalakarColors.blue10,
                highlightColor: KalakarColors.blue20,
                child: Container(
                  margin: EdgeInsets.all(20.h),
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                      color: KalakarColors.white,
                      borderRadius: BorderRadius.circular(50.r)),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 15.h,
                        width: 120.h,
                        color: KalakarColors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 30.h,
                        width: 120.h,
                        color: KalakarColors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 15.h,
                        width: 120.h,
                        color: KalakarColors.white,
                      ),
                    )
                  ],
                ))
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 15.h,
                        width: 50.h,
                        color: KalakarColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 15.h,
                        width: 50.h,
                        color: KalakarColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 15.h,
                        width: 50.h,
                        color: KalakarColors.white,
                      ),
                    )
                  ],
                ),
                DashedDottedDivider(
                  isHorizontal: false,
                  color: Colors.blue,
                  dashWidth: 5.0,
                  dotDiameter: 3.0,
                  space: 3.0,
                  thickness: 2.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 20.h,
                            width: 50.h,
                            color: KalakarColors.white,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 20.h,
                            width: 50.h,
                            color: KalakarColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 20.h,
                            width: 50.h,
                            color: KalakarColors.white,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 20.h,
                            width: 50.h,
                            color: KalakarColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 20.h,
                            width: 50.h,
                            color: KalakarColors.white,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 20.h,
                            width: 50.h,
                            color: KalakarColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: 24.h,
        // ),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 20.h,
                        width: 50.h,
                        color: KalakarColors.white,
                      ),
                    ),
                    SizedBox(height: 2.w,),
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 35.h,
                        width: 150.h,
                        color: KalakarColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: IntrinsicWidth(
              child: Column(
                children: [
                  */ /*InkWell(
                              child: CustomMobileButtonWidget(
                                onTap: () {},
                                borderRadius: 50.r,
                                fontSize: 12.sp,
                                text: KalakarConstants.experienceLevel,
                                horizontalPadding: 24.w,
                                verticalPadding: 8.h,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),*/ /*
                  Shimmer.fromColors(
                    baseColor: KalakarColors.blue10,
                    highlightColor: KalakarColors.blue20,
                    child: Container(
                      height: 30.h,
                      width: 80.h,
                      decoration:BoxDecoration(color: KalakarColors.white,borderRadius: BorderRadius.circular(15.r)) ,

                    ),
                  ),
                ],
              ),
            ))
          ],
        ),*/
        SizedBox(
          height: 24.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Shimmer.fromColors(
              baseColor: KalakarColors.blue10,
              highlightColor: KalakarColors.blue20,
              child: Container(
                height: 30.h,
                width: 30.h,
                color: KalakarColors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: KalakarColors.blue10,
              highlightColor: KalakarColors.blue20,
              child: Container(
                height: 30.h,
                width: 30.h,
                color: KalakarColors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: KalakarColors.blue10,
              highlightColor: KalakarColors.blue20,
              child: Container(
                height: 30.h,
                width: 30.h,
                color: KalakarColors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: KalakarColors.blue10,
              highlightColor: KalakarColors.blue20,
              child: Container(
                height: 30.h,
                width: 30.h,
                color: KalakarColors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: KalakarColors.blue10,
              highlightColor: KalakarColors.blue20,
              child: Container(
                height: 30.h,
                width: 30.h,
                color: KalakarColors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: KalakarColors.blue10,
              highlightColor: KalakarColors.blue20,
              child: Container(
                height: 30.h,
                width: 30.h,
                color: KalakarColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  commonLoadingMobile() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Shimmer.fromColors(
                    baseColor: KalakarColors.blue10,
                    highlightColor: KalakarColors.blue20,
                    child: Container(
                      height: 20.h,
                      width: 20.h,
                      color: KalakarColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          );
        });
  }
}
