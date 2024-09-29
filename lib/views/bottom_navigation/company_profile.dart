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
        mobile: (BuildContext context) => profileMobileView(),
        tablet: (BuildContext context) => profileWebView(),
      ),
    );
  }

  profileMobileView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<ProfileController>(builder: (controller) {
        var profileDta = controller.profileData;
        // print(profileDta!.verificationStatus);
        return RefreshIndicator(
          onRefresh: ()async{
            controller.onInit();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                controller.isProfileLoading ? Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 80.h,
                        width: 80.h,
                        margin: EdgeInsets.all(20.h),
                        color: KalakarColors.white,
                      ),
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
                    SizedBox(height: 2.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 40.h,
                            width: 150.h,
                            color: KalakarColors.white,
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 40.h,
                            width: 40.h,
                            color: KalakarColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 20.h,
                        width: 120.h,
                        color: KalakarColors.white,
                      ),
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
                            height: 30.h,
                            width: 80.h,
                            color: KalakarColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        )
                      ],
                    )
                    ,
                  ],
                ) :
                controller.companyProfileID!=0?profileDta != null ? Column(
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.h,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: KalakarColors.headerText),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image:
                            NetworkImage(profileDta!.companyLogo ?? "")),
                      ),
                    ),
                    Text(
                      "${KalakarConstants.kalakarId} ${profileDta.userID}",
                      style: TextStyle(
                          color: KalakarColors.headerText,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.transparent,
                          size: 35,
                        ),
                        Text(
                          controller.profileData!
                              .companyNameProductionhouse ??
                              "NA",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: KalakarColors.buttonText,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              controller.setProfileFormData();
                              Get.toNamed(
                                  RouteHelper.companyProfileFormPage);
                            },
                            child: Icon(
                              Icons.edit,
                              size: 25,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                        "${profileDta.address}, ${profileDta
                            .district}, ${profileDta.state}, ${profileDta
                            .postalcode}."),

                    profileDta.verificationStatus == "Not verified"
                        ? Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomMobileButtonWidget(
                          text: KalakarConstants
                              .sendProfileForVerification,
                          onTap: () {
                            controller.sendProfileForVerification();
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
                        SizedBox(
                          height: 16.h,
                        )
                      ],
                    )
                        : Container(),
                  ],
                ):Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 32.h,),
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
                      ),SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ):Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 32.h,),
                      Text("Profile Data Not Addde"),
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
                      ),SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Divider(
                    height: 10.h,
                    thickness: 1.0,
                  ),
                ),

               controller.isProfileLoading? Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 30.h,
                        width: 40.h,
                        color: KalakarColors.white,
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    Shimmer.fromColors(
                      baseColor: KalakarColors.blue10,
                      highlightColor: KalakarColors.blue20,
                      child: Container(
                        height: 20.h,
                        width: 100.h,
                        color: KalakarColors.white,
                      ),
                    )
                  ],
                ):profileDta!=null?Column(
                  children: [
                    Text(
                      KalakarConstants.bio,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: KalakarColors.headerText),
                    ),
                    Text(profileDta.bio.toString() ?? "NA"),
                  ],
                ):Container(),
                // SizedBox(
                //   height: 32.h,
                //   width: Get.size.width / 2,
                //   child: DashedDottedDivider(
                //     isHorizontal: true,
                //   ),
                // ),
               controller.isProfileLoading? Container(
                  padding: EdgeInsets.all(16.h),
                  margin: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(8.r),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     blurRadius: 4.0,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
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
                          Shimmer.fromColors(
                            baseColor: KalakarColors.blue10,
                            highlightColor: KalakarColors.blue20,
                            child: Container(
                              height: 20.h,
                              width: 20.h,
                              color: KalakarColors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
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
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
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
                        ],
                      ),
                    ],
                  ),
                ):
               profileDta!=null?Container(
                  padding: EdgeInsets.all(16.h),
                  margin: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(8.r),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     blurRadius: 4.0,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${KalakarConstants.moreInfo} :",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: KalakarColors.headerText),
                            ),
                          ),
                          InkWell(
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
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                "${KalakarConstants.mobileNumber}"),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(": ${profileDta.mobileNumber}"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text("${KalakarConstants.email}"),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(": ${profileDta.email}"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ):Container(),

                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Divider(
                    height: 10.h,
                    thickness: 1.0,
                  ),
                ),

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
                        backgroundColor: KalakarColors.buttonBackground,
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
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 250.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.companyAllProjects.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.openProjectDetails(
                                controller.companyAllProjects[index]);
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.h),
                            margin: EdgeInsets.only(right: 16.h),
                            width: 200.h,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: KalakarColors.backgroundGrey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 118.h,
                                  width: 120.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(60.h),
                                      image: DecorationImage(
                                          image: NetworkImage(controller
                                              .companyAllProjects[index]
                                              .projectCoverDoc!))),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  controller.companyAllProjects[index]
                                      .projectTitle!,
                                  overflow: TextOverflow.ellipsis, maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  controller.companyAllProjects[index]
                                      .projectDescription!,
                                  overflow: TextOverflow.ellipsis, maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
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
                Divider(
                  height: 10.h,
                  thickness: 3.0,
                ),
                SizedBox(
                  height: 16.h,
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
              ],
            ),
          ),
        );
      }),
    );
  }

  profileWebView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<ProfileController>(builder: (controller) {
        var profileDta = controller.profileData;
        // print(profileDta!.verificationStatus);
        return controller.isProfileLoading
            ? Center(child: CircularProgressIndicator())
            : profileDta == null
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Unable To Load Data"),
              InkWell(
                onTap: () {
                  controller.getProfileData();
                },
                child: Text("Refresh Data"),
              )
            ],
          ),
        )
            : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150.h,
                width: 150.h,
                margin: EdgeInsets.all(20.h),
                decoration: BoxDecoration(
                  border: Border.all(color: KalakarColors.headerText),
                  borderRadius: BorderRadius.circular(75.r),
                  image: DecorationImage(
                      image:
                      NetworkImage(profileDta.companyLogo ?? "")),
                ),
              ),
              Text(
                "${KalakarConstants.kalakarId} ${profileDta!.userID}",
                style: TextStyle(
                    color: KalakarColors.headerText,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.transparent,
                    size: 35,
                  ),
                  Text(
                    controller.profileData!
                        .companyNameProductionhouse ??
                        "NA",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: KalakarColors.buttonText,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        controller.setProfileFormData();
                        Get.toNamed(
                            RouteHelper.companyProfileFormPage);
                      },
                      child: Icon(
                        Icons.edit,
                        size: 25,
                      ))
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                  "${profileDta.address}, ${profileDta.district}, ${profileDta
                      .state}, ${profileDta.postalcode}."),
              SizedBox(
                height: 24.h,
              ),
              profileDta.verificationStatus == "Not verified"
                  ? Column(
                children: [
                  CustomMobileButtonWidget(
                    text: KalakarConstants
                        .sendProfileForVerification,
                    onTap: () {
                      controller.sendProfileForVerification();
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
                  SizedBox(
                    height: 16.h,
                  )
                ],
              )
                  : Container(),
              Divider(
                thickness: 3.0,
                height: 10.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                children: [
                  Text(
                    KalakarConstants.bio,
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: KalakarColors.headerText),
                  ),
                  Text(profileDta.bio ?? "NA"),
                ],
              ),
              // SizedBox(
              //   height: 32.h,
              //   width: Get.size.width / 2,
              //   child: DashedDottedDivider(
              //     isHorizontal: true,
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(16.h),
                margin: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  color: KalakarColors.backgroundGrey,
                  borderRadius: BorderRadius.circular(8.r),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 4.0,
                  //   ),
                  // ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${KalakarConstants.moreInfo} :",
                            style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: KalakarColors.headerText),
                          ),
                        ),
                        InkWell(
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
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              "${KalakarConstants.mobileNumber}"),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(": ${profileDta.mobileNumber}"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text("${KalakarConstants.email}"),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(": ${profileDta.email}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Divider(
                  height: 10.h,
                  thickness: 1.0,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomMobileButtonWidget(
                text: KalakarConstants.createProject,
                onTap: () {
                  controller.createNewProject();
                },
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
                fontSize: 8.sp,
                backgroundColor: KalakarColors.buttonBackground,
                textColor: KalakarColors.headerText,
                borderRadius: 50.0,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed(RouteHelper.allProjects);
                      },
                      child: Text(KalakarConstants.viewAll)),
                  Icon(Icons.double_arrow_rounded)
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 250.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.companyAllProjects.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.openProjectDetails(
                              controller.companyAllProjects[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.h),
                          margin: EdgeInsets.only(right: 16.h),
                          width: 200.h,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(8.r),
                              color: KalakarColors.backgroundGrey),
                          child: Column(
                            children: [
                              Container(
                                height: 120.h,
                                width: 120.h,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(60.h),
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                            .companyAllProjects[index]
                                            .projectCoverDoc!))),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                controller.companyAllProjects[index]
                                    .projectTitle!,
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
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
            ],
          ),
        );
      }),
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
      // actions: [
      //   InkWell(
      //     onTap: () {
      //       ProfileController profileController = Get.put(ProfileController());
      //       profileController.setProfileFormData();
      //       Get.toNamed(RouteHelper.companyProfileFormPage);
      //     },
      //     child: Icon(
      //       Icons.edit,
      //       size: 30.h,
      //     ),
      //   ),
      //   SizedBox(
      //     width: 16.h,
      //   )
      // ],
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
