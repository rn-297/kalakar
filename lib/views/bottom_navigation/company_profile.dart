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
                          height: 80.h,
                          width: 80.h,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: KalakarColors.headerText),
                            borderRadius: BorderRadius.circular(50),
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
                            "${profileDta.address}, ${profileDta.district}, ${profileDta.state}, ${profileDta.postalcode}."),
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
                                  fontSize: 14.sp,
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
                            Get.toNamed(RouteHelper.newProjectFormPage);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(KalakarConstants.viewAll),
                            Icon(Icons.double_arrow_rounded)
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,

                          height: 250.h,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.companyAllProjects.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(16.h),
                                  width: 200.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
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
                                      SizedBox(height: 16.h,),
                                      Text(
                                        controller.companyAllProjects[index]
                                            .projectTitle!,
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
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
                      InkWell(
                        child: CustomMobileButtonWidget(
                          onTap: () {},
                          borderRadius: 50.r,
                          fontSize: 8.sp,
                          text: KalakarConstants.moreInfo,
                          horizontalPadding: 8.w,
                          verticalPadding: 8.h,
                        ),
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
