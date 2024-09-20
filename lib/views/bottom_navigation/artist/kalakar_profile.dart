import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/custom_widgets/custom_divider/custom_dashed_divider.dart';
import 'package:kalakar/data/models/artist/artist_comfortable_in_class.dart';
import 'package:kalakar/data/models/artist/artist_education_list_class.dart';
import 'package:kalakar/data/models/artist/artist_experience_list_class.dart';
import 'package:kalakar/data/models/artist/artist_hobbies_list_class.dart';
import 'package:kalakar/data/models/artist/artist_interested_in_class.dart';
import 'package:kalakar/data/models/artist/artist_profile_class.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      child: SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
          ArtistProfileDetailsClass profileDetails =
              controller.artistProfileDetails;
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        height: 80.h,
                        width: 80.h,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // border: Border.all(color: KalakarColors.headerText),
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image:
                                  NetworkImage(profileDetails.profilePic ?? "")),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            "${KalakarConstants.kalakarId} : ${profileDetails.artistProfileID}",
                            style: TextStyle(color: KalakarColors.headerText),
                          ),
                          Text(
                            "${profileDetails.firstName} ${profileDetails.lastName}",
                            style: TextStyle(
                                fontSize: 25.sp,
                                color: KalakarColors.buttonText,
                                fontWeight: FontWeight.bold),
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
                          Row(
                            children: [
                              Text(
                                KalakarConstants.age,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" : ${profileDetails.age}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                KalakarConstants.height,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" : ${profileDetails.height}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                KalakarConstants.weight,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" : ${profileDetails.weight}"),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                KalakarConstants.city,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" : ${profileDetails.address1}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                KalakarConstants.district,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" : ${profileDetails.district}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                KalakarConstants.state,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" : ${profileDetails.state}"),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            KalakarConstants.bio,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: KalakarColors.headerText),
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
                        InkWell(
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
                        ),
                        CustomMobileButtonWidget(
                          onTap: () {
                            Get.toNamed(RouteHelper.artistDocumentForm);
                          },
                          borderRadius: 50.r,
                          fontSize: 12.sp,
                          text: KalakarConstants.moreInfo,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              SizedBox(
                height: 24.h,
              ),
              Divider(
                thickness: 3.0,
                height: 10.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                margin: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  color: KalakarColors.backgroundGrey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${KalakarConstants.education} : ",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              controller.setEducationData(null);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.h)),
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
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.artistEducationList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          EducationList educationData =
                              controller.artistEducationList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    educationData.course!,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.setEducationData(educationData);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        size: 18.sp,
                                      )),
                                ],
                              ),
                              Text(
                                educationData.universityOrInstitute!,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              Text(
                                educationData.courseEndDate!,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 4.h,
                              )
                            ],
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                margin: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  color: KalakarColors.backgroundGrey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${KalakarConstants.comfortableIn} : ",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              controller.setComfortableInEditData(null);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.h)),
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
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.artistComfortableInList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          ComfortableInList comfortableInData =
                              controller.artistComfortableInList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    comfortableInData.comfortableName!,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.setComfortableInEditData
                                          (comfortableInData);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        size: 18.sp,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              )
                            ],
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                margin: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  color: KalakarColors.backgroundGrey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${KalakarConstants.hobby} : ",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                             controller.setEditHobbiesData(null);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.h)),
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
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.artistHobbiesList.length,
                        physics: NeverScrollableScrollPhysics(),

                        itemBuilder: (context, index) {
                          HobbiesList hobbiesData =
                              controller.artistHobbiesList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    hobbiesData.hobbyName!,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.setEditHobbiesData(hobbiesData);
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
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                margin: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  color: KalakarColors.backgroundGrey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${KalakarConstants.interestIn} : ",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              controller.setEditInterestInData(null);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.h)),
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
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.artistInterestedInList.length,
                        physics: NeverScrollableScrollPhysics(),

                        itemBuilder: (context, index) {
                          InterestList interestInData =
                              controller.artistInterestedInList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    interestInData.interestedName!,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.setEditInterestInData(interestInData);
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
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Divider(
                thickness: 3.0,
                height: 10.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(KalakarConstants.portfolio),
                  InkWell(
                      onTap: (){
                        controller.editArtistPortfolio(null);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4.h)),
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ))),
                ],
              ),

              SizedBox(height: 12.h,),
              Container(
                padding: EdgeInsets.all(10.h),
                height: 140 .h,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.artistPortfolioList.length,
                    itemBuilder: (context, index) {
                      return  Container(
                        margin: EdgeInsets.only(right: 15.w),
                        child: Stack(
                          children: [
                            Container(
                              height: 125.h,
                              width: 80.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(8.r),
                                image: DecorationImage(
                                    image: controller
                                        .artistPortfolioList[index]
                                        .filePath!
                                        .startsWith("http")
                                        ? NetworkImage(controller
                                        .artistPortfolioList[index]
                                        .filePath!)
                                        : FileImage(File(controller
                                        .artistPortfolioList[index]
                                        .filePath!)) as ImageProvider,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              right: 2,
                              top: 2,
                              child: InkWell(
                                onTap: () {
                                  controller.editArtistPortfolio(
                                      controller
                                          .artistPortfolioList[index],
                                     );
                                },
                                child: Container(
                                    padding: EdgeInsets.all(4.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            50.r),
                                        color: KalakarColors.white
                                            .withOpacity(.5)),
                                    child: Icon(Icons.edit,size: 16.sp,)),
                              ),
                            )
                          ],
                        ),
                      ); //Container();
                    }),
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
                height: 10.h,
                thickness: 3.0,
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                margin: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  color: KalakarColors.backgroundGrey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${KalakarConstants.experience} : ",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              controller.setEditExperienceData(null);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.h)),
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
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.artistExperienceList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          ExperienceList expereinceData =
                          controller.artistExperienceList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    expereinceData.roleProfile!,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.setEditExperienceData(expereinceData);

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
                          );
                        }),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  profileWebView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      "assets/images/app_bar_logo.png",
                      height: 100.h,
                      width: 100.h,
                      fit: BoxFit.cover,
                    )),
                    Text(
                      "${KalakarConstants.kalakarId} : MHS001",
                      style: TextStyle(color: KalakarColors.headerText),
                    ),
                    Text(
                      "Rohan Warang",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: KalakarColors.buttonText,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
                Expanded(
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.age,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : data"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.height,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : data"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.weight,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : data"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.city,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : Thane"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.district,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : Thane"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.state,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : Maharashtra"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          KalakarConstants.bio,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KalakarColors.headerText),
                        ),
                        ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15.h,
                                  ),
                                  Text("Hobbie $index")
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: IntrinsicWidth(
                  child: Column(
                    children: [
                      InkWell(
                        child: CustomMobileButtonWidget(
                          onTap: () {},
                          borderRadius: 50.r,
                          fontSize: 8.sp,
                          text: KalakarConstants.experienceLevel,
                          horizontalPadding: 8.w,
                          verticalPadding: 8.h,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomMobileButtonWidget(
                        onTap: () {
                          Get.toNamed(RouteHelper.artistDocumentForm);
                        },
                        borderRadius: 50.r,
                        fontSize: 8.sp,
                        text: KalakarConstants.moreInfo,
                        horizontalPadding: 8.w,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Divider(
              thickness: 3.0,
              height: 10.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(KalakarConstants.portfolio),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              height: 10.h,
              thickness: 3.0,
            ),
          ],
        ),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.profile1,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
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
  }

  appBarWebView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.profile1,
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.settings,
            size: 30.h,
          ),
        ),
        SizedBox(
          width: 16.h,
        )
      ],
    );
  }
}
