import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/custom_widgets/custom_divider/custom_dashed_divider.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

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
        mobile: (BuildContext context) => profileMobileView(context),
        tablet: (BuildContext context) => profileWebView(context),
      ),
    );
  }

  profileMobileView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<ProfileController>(builder: (controller) {
        var profileDta = controller.profileData;
        // print(profileDta!.verificationStatus);
        return RefreshIndicator(
          onRefresh: () async {
            controller.getRequireData();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                controller.isProfileLoading
                    ? Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 100.h,
                                  width: 100.h,
                                  margin: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                ),
                              ),
                              SizedBox(
                                width: 8.h,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 15.h,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          color: KalakarColors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 20.h,
                                        width: 150.h,
                                        decoration: BoxDecoration(
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
                                        height: 15.h,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          color: KalakarColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 24.h,
                              ),
                              Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 35.h,
                                  width: 150.h,
                                  decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              )
                            ],
                          )
                        ],
                      )
                    : (controller.companyProfileID != 0 || controller.isArtist)
                        ? profileDta != null
                            ? Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 100.h,
                                        width: 100.h,
                                        margin: EdgeInsets.all(8.h),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: KalakarColors.headerText),
                                          borderRadius:
                                              BorderRadius.circular(60.r),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  profileDta!.companyLogo ??
                                                      "")),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.h,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${KalakarConstants.companyId} ${profileDta.userID}",
                                              style: TextStyle(
                                                  color:
                                                      KalakarColors.headerText,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            SizedBox(height: 8.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.profileData!
                                                          .companyNameProductionhouse ??
                                                      "NA",
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      color: KalakarColors
                                                          .buttonText,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                /* InkWell(
                                                    onTap: () {
                                                      controller
                                                          .setProfileFormData();
                                                      Get.toNamed(RouteHelper
                                                          .companyProfileFormPage);
                                                    },
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 25,
                                                    ))*/
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Text(
                                              "${profileDta.authoriseAdminName}",
                                              style: TextStyle(
                                                  color: KalakarColors.orange,
                                                  fontSize: 14.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  if (!controller.isArtist)
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
                                          horizontalPadding: 20.w,
                                          verticalPadding: 8.h,
                                          fontSize: 14.sp,
                                          backgroundColor:
                                              KalakarColors.buttonBackground,
                                          textColor: KalakarColors.headerText,
                                          borderRadius: 50.0,
                                          width: 250.w,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        )
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
                                    Text("Unable TO Get Profile Data"),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.getProfileData();
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.refresh),
                                          Text("Refresh"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                  ],
                                ),
                              )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 32.h,
                                ),
                                Text("Profile Data Not Added"),
                                SizedBox(
                                  height: 16.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        RouteHelper.companyProfileFormPage);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.add),
                                      Text("Add"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                              ],
                            ),
                          ),
                if(controller.companyProfileID != 0)Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Divider(
                    height: 10.h,
                    color: Colors.green.shade900,
                    thickness: 2.0,
                  ),
                ),

                controller.isProfileLoading
                    ? Padding(
                        padding: EdgeInsets.all(8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 20.h,
                                      width: 150.h,
                                      decoration: BoxDecoration(
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.h,
                                ),
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 20.h,
                                      width: 150.h,
                                      decoration: BoxDecoration(
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 16.h,
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 20.h,
                                    width: 50.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(8.h),
                              decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                  borderRadius: BorderRadius.circular(8.h),
                                  boxShadow: [
                                    BoxShadow(
                                        color: KalakarColors.blue20,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 2)),
                                  ]),
                              child: Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 15.h,
                                  width: 150.h,
                                  decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
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
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.green.shade900,
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 15.h,
                                      width: 150.h,
                                      decoration: BoxDecoration(
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 15.h,
                                    width: 150.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : profileDta != null
                        ? (controller.companyProfileID != 0||controller.isArtist)?
                Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSpanToShow(
                                    context,
                                    "${KalakarConstants.address} : ",
                                    profileDta.address ?? "",
                                    Icons.location_on),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: textSpanToShow(
                                          context,
                                          "${KalakarConstants.state} : ",
                                          profileDta.state ?? "",
                                          Icons.map_outlined),
                                    ),
                                    SizedBox(
                                      width: 4.h,
                                    ),
                                    Expanded(
                                      child: textSpanToShow(
                                          context,
                                          "${KalakarConstants.district} : ",
                                          profileDta.district ?? '',
                                          Icons.location_searching),
                                    )
                                  ],
                                ),
                                textSpanToShow(
                                    context,
                                    "${KalakarConstants.pinCode} : ",
                                    profileDta.postalcode ?? '',
                                    CupertinoIcons.pin),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 16.h,
                                    ),
                                    Text(
                                      "${KalakarConstants.about} :",
                                      style: TextStyle(
                                          color: KalakarColors.orange,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(8.h),
                                      boxShadow: [
                                        BoxShadow(
                                            color: KalakarColors.blue20,
                                            blurRadius: 2.0,
                                            offset: Offset(0, 2)),
                                      ]),
                                  child: Text(
                                    "                ${profileDta.bio ?? ""}",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
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
                                Divider(
                                  color: Colors.green.shade900,
                                  height: 30.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${KalakarConstants.moreInfo} :",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: KalakarColors.orange),
                                      ),
                                    ),
                                    controller.isArtist
                                        ? Container()
                                        : InkWell(
                                            onTap: () {
                                              controller.setProfileFormData();
                                              Get.toNamed(RouteHelper
                                                  .companyMoreInfoFormPage);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              size: 20,
                                            ))
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                textSpanToShow(
                                    context,
                                    "${KalakarConstants.email} : ",
                                    profileDta.email ?? "",
                                    CupertinoIcons.at),
                                textSpanToShow(
                                    context,
                                    "${KalakarConstants.mobileNumber} : ",
                                    profileDta.mobileNumber ?? "",
                                    Icons.call),
                              ],
                            ),
                          ):Container()
                        : Container(),
                // SizedBox(
                //   height: 32.h,
                //   width: Get.size.width / 2,
                //   child: DashedDottedDivider(
                //     isHorizontal: true,
                //   ),
                // ),

                if(controller.companyProfileID != 0||controller.isArtist)Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Divider(
                    height: 10.h,
                    color: Colors.green.shade900,
                    thickness: 2.0,
                  ),
                ),

                controller.isProfileLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 35.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                    borderRadius: BorderRadius.circular(25.r)),
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: KalakarColors.blue10,
                            highlightColor: KalakarColors.blue20,
                            child: Container(
                              height: 35.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                color: KalakarColors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : !controller.isArtist
                        ? (controller.companyProfileID != 0||controller.isArtist)?
                Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: CustomMobileButtonWidget(
                                  text: KalakarConstants.createProject,
                                  onTap: () {
                                    controller.createNewProject();
                                  },
                                  horizontalPadding: 20.w,
                                  verticalPadding: 8.h,
                                  fontSize: 14.sp,
                                  backgroundColor:
                                      KalakarColors.buttonBackground,
                                  textColor: KalakarColors.headerText,
                                  borderRadius: 50.0,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.allProjects);
                                      },
                                      child: Text(KalakarConstants.viewAll)),
                                  Icon(Icons.double_arrow_rounded),
                                ],
                              )
                            ],
                          ):Container()
                        : Container(),
                !controller.isArtist
                    ? (controller.companyProfileID != 0||controller.isArtist)?Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Divider(
                          height: 10.h,
                          color: Colors.green.shade900,
                          thickness: 1.0,
                        ),
                      ):Container()
                    : Container(),
                SizedBox(
                  height: 8.h,
                ),
                if(controller.companyProfileID != 0||controller.isArtist)Column(
                  children: [
                    Center(
                      child: Text(
                        KalakarConstants.newProjects,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: KalakarColors.orange),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 160.h,
                      padding: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                          color: KalakarColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 5.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(2.r)),
                      child: controller.isProfileLoading
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  // padding: EdgeInsets.all(16.h),
                                  margin: EdgeInsets.only(right: 16.h),
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    // border: Border.all(
                                    //     color: KalakarColors.backgroundGrey)
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: KalakarColors.blue10,
                                        highlightColor: KalakarColors.blue20,
                                        child: Container(
                                          height: 150.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              color: KalakarColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.companyNewProjects.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.openProjectDetails(
                                        controller.companyNewProjects[index]);
                                  },
                                  child: Container(
                                    // padding: EdgeInsets.all(16.h),
                                    margin: EdgeInsets.only(
                                        right:
                                            controller.companyNewProjects.length > 1
                                                ? 16.h
                                                : 0.0),
                                    width: 100.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      // border: Border.all(
                                      //     color: KalakarColors.backgroundGrey)
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 150.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .companyNewProjects[index]
                                                      .projectCoverDoc!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        /*SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      controller
                                          .companyNewProjects[index].projectTitle!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      controller.companyNewProjects[index]
                                          .projectDescription!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),*/
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Center(
                      child: Text(
                        KalakarConstants.upcomingProject,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: KalakarColors.orange),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 160.h,
                      padding: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                          color: KalakarColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 5.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(2.r)),
                      child: controller.isProfileLoading
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  // padding: EdgeInsets.all(16.h),
                                  margin: EdgeInsets.only(right: 16.h),
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    // border: Border.all(
                                    //     color: KalakarColors.backgroundGrey)
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: KalakarColors.blue10,
                                        highlightColor: KalakarColors.blue20,
                                        child: Container(
                                          height: 150.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              color: KalakarColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.companyUpcomingProjects.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.openProjectDetails(
                                        controller.companyUpcomingProjects[index]);
                                  },
                                  child: Container(
                                    // padding: EdgeInsets.all(16.h),
                                    margin: EdgeInsets.only(
                                        right: controller.companyUpcomingProjects
                                                    .length >
                                                1
                                            ? 16.h
                                            : 0.0),
                                    width: 100.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 150.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .companyUpcomingProjects[
                                                          index]
                                                      .projectCoverDoc!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        /*SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      controller.companyUpcomingProjects[index]
                                          .projectTitle!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      controller.companyUpcomingProjects[index]
                                          .projectDescription!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),*/
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),

                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  profileWebView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<ProfileController>(builder: (controller) {
        var profileDta = controller.profileData;
        // print(profileDta!.verificationStatus);
        return RefreshIndicator(
          onRefresh: () async {
            controller.getRequireData();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                controller.isProfileLoading
                    ? Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 100.h,
                                  width: 100.h,
                                  margin: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                ),
                              ),
                              SizedBox(
                                width: 8.h,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 15.h,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          color: KalakarColors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 20.h,
                                        width: 150.h,
                                        decoration: BoxDecoration(
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
                                        height: 15.h,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          color: KalakarColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 24.h,
                              ),
                              Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 35.h,
                                  width: 150.h,
                                  decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              )
                            ],
                          )
                        ],
                      )
                    : (controller.companyProfileID != 0 || controller.isArtist)
                        ? profileDta != null
                            ? Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 100.h,
                                        width: 100.h,
                                        margin: EdgeInsets.all(8.h),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: KalakarColors.headerText),
                                          borderRadius:
                                              BorderRadius.circular(60.r),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  profileDta!.companyLogo ??
                                                      "")),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.h,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${KalakarConstants.companyId} ${profileDta.userID}",
                                              style: TextStyle(
                                                  color:
                                                      KalakarColors.headerText,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            SizedBox(height: 8.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.profileData!
                                                          .companyNameProductionhouse ??
                                                      "NA",
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      color: KalakarColors
                                                          .buttonText,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                /* InkWell(
                                                    onTap: () {
                                                      controller
                                                          .setProfileFormData();
                                                      Get.toNamed(RouteHelper
                                                          .companyProfileFormPage);
                                                    },
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 25,
                                                    ))*/
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Text(
                                              "${profileDta.authoriseAdminName}",
                                              style: TextStyle(
                                                  color: KalakarColors.orange,
                                                  fontSize: 6.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: Column(
                                        children: [
                                          textSpanToShow(
                                              context,
                                              "${KalakarConstants.address} : ",
                                              profileDta.address ?? "",
                                              Icons.location_on),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: textSpanToShow(
                                                    context,
                                                    "${KalakarConstants.state} : ",
                                                    profileDta.state ?? "",
                                                    Icons.map_outlined),
                                              ),
                                              SizedBox(
                                                width: 4.h,
                                              ),
                                              Expanded(
                                                child: textSpanToShow(
                                                    context,
                                                    "${KalakarConstants.district} : ",
                                                    profileDta.district ?? '',
                                                    Icons.location_searching),
                                              )
                                            ],
                                          ),
                                          textSpanToShow(
                                              context,
                                              "${KalakarConstants.pinCode} : ",
                                              profileDta.postalcode ?? '',
                                              CupertinoIcons.pin),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                  if (!controller.isArtist)
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
                                          horizontalPadding: 2.w,
                                          verticalPadding: 8.h,
                                          fontSize: 5.sp,
                                          backgroundColor:
                                              KalakarColors.buttonBackground,
                                          textColor: KalakarColors.headerText,
                                          borderRadius: 50.0,
                                          width: 125.w,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        )
                                      ],
                                    )
                                ],
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 32.h,
                                    ),
                                    Text("Unable TO Get Profile Data"),
                                    SizedBox(
                                      height: 16.h,
                                    ),

                                    InkWell(
                                      onTap: () {
                                        controller.getProfileData();
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.refresh),
                                          Text("Refresh"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                  ],
                                ),
                              )
                        :
                Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 32.h,
                                ),
                                Text("Profile Data Not Added"),
                                SizedBox(
                                  height: 16.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        RouteHelper.companyProfileFormPage);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.add),
                                      Text("Add"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                              ],
                            ),
                          ),
                if(controller.companyProfileID != 0||controller.isArtist)Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Divider(
                    height: 10.h,
                    color: Colors.green.shade900,
                    thickness: 2.0,
                  ),
                ),

                controller.isProfileLoading
                    ? Padding(
                        padding: EdgeInsets.all(8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 20.h,
                                      width: 150.h,
                                      decoration: BoxDecoration(
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.h,
                                ),
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 20.h,
                                      width: 150.h,
                                      decoration: BoxDecoration(
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 16.h,
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 20.h,
                                    width: 50.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(8.h),
                              decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                  borderRadius: BorderRadius.circular(8.h),
                                  boxShadow: [
                                    BoxShadow(
                                        color: KalakarColors.blue20,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 2)),
                                  ]),
                              child: Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 15.h,
                                  width: 150.h,
                                  decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
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
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.green.shade900,
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 15.h,
                                      width: 150.h,
                                      decoration: BoxDecoration(
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 15.h,
                                    width: 150.h,
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 20.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : profileDta != null
                        ? (controller.companyProfileID != 0||controller.isArtist)?
                Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 16.h,
                                    ),
                                    Text(
                                      "${KalakarConstants.about} :",
                                      style: TextStyle(
                                          color: KalakarColors.orange,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(8.h),
                                      boxShadow: [
                                        BoxShadow(
                                            color: KalakarColors.blue20,
                                            blurRadius: 2.0,
                                            offset: Offset(0, 2)),
                                      ]),
                                  child: Text(
                                    "                ${profileDta.bio ?? ""}",
                                    style: TextStyle(fontSize: 5.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
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
                                Divider(
                                  color: Colors.green.shade900,
                                  height: 30.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${KalakarConstants.moreInfo} :",
                                        style: TextStyle(
                                            fontSize: 5.sp,
                                            fontWeight: FontWeight.bold,
                                            color: KalakarColors.orange),
                                      ),
                                    ),
                                    controller.isArtist
                                        ? Container()
                                        : InkWell(
                                            onTap: () {
                                              controller.setProfileFormData();
                                              Get.toNamed(RouteHelper
                                                  .companyMoreInfoFormPage);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              size: 20,
                                            ))
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                textSpanToShow(
                                    context,
                                    "${KalakarConstants.email} : ",
                                    profileDta.email ?? "",
                                    CupertinoIcons.at),
                                textSpanToShow(
                                    context,
                                    "${KalakarConstants.mobileNumber} : ",
                                    profileDta.mobileNumber ?? "",
                                    Icons.call),
                              ],
                            ),
                          ):Container()
                        : Container(),
                // SizedBox(
                //   height: 32.h,
                //   width: Get.size.width / 2,
                //   child: DashedDottedDivider(
                //     isHorizontal: true,
                //   ),
                // ),

               if(controller.companyProfileID != 0||controller.isArtist) Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Divider(
                    height: 10.h,
                    color: Colors.green.shade900,
                    thickness: 2.0,
                  ),
                ),

                controller.isProfileLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 35.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                    borderRadius: BorderRadius.circular(25.r)),
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: KalakarColors.blue10,
                            highlightColor: KalakarColors.blue20,
                            child: Container(
                              height: 35.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                color: KalakarColors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : !controller.isArtist
                        ? controller.companyProfileID != 0?
                Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: CustomMobileButtonWidget(
                                  text: KalakarConstants.createProject,
                                  onTap: () {
                                    controller.createNewProject();
                                  },
                                  horizontalPadding: 2.w,
                                  verticalPadding: 8.h,
                                  fontSize: 5.sp,
                                  backgroundColor:
                                      KalakarColors.buttonBackground,
                                  textColor: KalakarColors.headerText,
                                  width: 60.w,
                                  borderRadius: 50.0,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.allProjects);
                                      },
                                      child: Text(KalakarConstants.viewAll)),
                                  Icon(Icons.double_arrow_rounded),
                                  SizedBox(
                                    width: 8.w,
                                  )
                                ],
                              )
                            ],
                          ):Container()
                        : Container(),
                !controller.isArtist
                    ? (controller.companyProfileID != 0||controller.isArtist)?Padding(
                        padding: EdgeInsets.all(12.h),
                        child: Divider(
                          height: 10.h,
                          color: Colors.green.shade900,
                          thickness: 1.0,
                        ),
                      ):Container()
                    : Container(),
                SizedBox(
                  height: 8.h,
                ),
                if(controller.companyProfileID != 0||controller.isArtist  )Column(
                  children: [
                    Center(
                      child: Text(
                        KalakarConstants.newProjects,
                        style: TextStyle(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.bold,
                            color: KalakarColors.orange),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 210.h,
                      padding: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                          color: KalakarColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 5.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(2.r)),
                      child: controller.isProfileLoading
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  // padding: EdgeInsets.all(16.h),
                                  margin: EdgeInsets.only(right: 16.h),
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    // border: Border.all(
                                    //     color: KalakarColors.backgroundGrey)
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: KalakarColors.blue10,
                                        highlightColor: KalakarColors.blue20,
                                        child: Container(
                                          height: 150.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              color: KalakarColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.companyNewProjects.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.openProjectDetails(
                                        controller.companyNewProjects[index]);
                                  },
                                  child: Container(
                                    // padding: EdgeInsets.all(16.h),
                                    margin: EdgeInsets.only(
                                        right:
                                            controller.companyNewProjects.length > 1
                                                ? 16.h
                                                : 0.0),
                                    width: 200.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      // border: Border.all(
                                      //     color: KalakarColors.backgroundGrey)
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 200.h,
                                          width: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .companyNewProjects[index]
                                                      .projectCoverDoc!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        /*SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      controller
                                          .companyNewProjects[index].projectTitle!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      controller.companyNewProjects[index]
                                          .projectDescription!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),*/
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Center(
                      child: Text(
                        KalakarConstants.upcomingProject,
                        style: TextStyle(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.bold,
                            color: KalakarColors.orange),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 210.h,
                      padding: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                          color: KalakarColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 5.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(2.r)),
                      child: controller.isProfileLoading
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  // padding: EdgeInsets.all(16.h),
                                  margin: EdgeInsets.only(right: 16.h),
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    // border: Border.all(
                                    //     color: KalakarColors.backgroundGrey)
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: KalakarColors.blue10,
                                        highlightColor: KalakarColors.blue20,
                                        child: Container(
                                          height: 150.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              color: KalakarColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.companyUpcomingProjects.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.openProjectDetails(
                                        controller.companyUpcomingProjects[index]);
                                  },
                                  child: Container(
                                    // padding: EdgeInsets.all(16.h),
                                    margin: EdgeInsets.only(
                                        right: controller.companyUpcomingProjects
                                                    .length >
                                                1
                                            ? 16.h
                                            : 0.0),
                                    width: 200.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 200.h,
                                          width: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .companyUpcomingProjects[
                                                          index]
                                                      .projectCoverDoc!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        /*SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      controller.companyUpcomingProjects[index]
                                          .projectTitle!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      controller.companyUpcomingProjects[index]
                                          .projectDescription!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),*/
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),

                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  textSpanToShow(
      BuildContext context, String title, String titleData, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: KalakarColors.orange,
            ),
            SizedBox(
              width: 4.h,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: titleData,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
      ],
    );
  }

  appBarMobileView() {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return AppBar(
        backgroundColor: KalakarColors.appBarBackground,
        surfaceTintColor: KalakarColors.appBarBackground,
        title: Text(
          KalakarConstants.profile1,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          if (!profileController.isArtist)
            InkWell(
              onTap: () {
                profileController.setProfileFormData();
                Get.toNamed(RouteHelper.companyProfileFormPage);
              },
              child: Icon(
                Icons.edit,
                size: 25.h,
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
    return GetBuilder<ProfileController>(builder: (profileController) {
      return AppBar(
        backgroundColor: KalakarColors.appBarBackground,
        surfaceTintColor: KalakarColors.appBarBackground,
        title: Text(
          KalakarConstants.profile1,
          style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          if (!profileController.isArtist)
            InkWell(
              onTap: () {
                profileController.setProfileFormData();
                Get.toNamed(RouteHelper.companyProfileFormPage);
              },
              child: Icon(
                Icons.edit,
                size: 25.h,
              ),
            ),
          SizedBox(
            width: 16.h,
          )
        ],
      );
    });
  }
}
