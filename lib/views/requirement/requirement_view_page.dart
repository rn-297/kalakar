import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/data/models/artist/applied_requirement_list_class.dart';
import 'package:kalakar/data/models/company/company_requirement_list_class.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class RequirementViewPage extends StatelessWidget {
  const RequirementViewPage({super.key});

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
        mobile: (BuildContext context) => RequirementViewMobileView(),
        tablet: (BuildContext context) => RequirementViewWebView(context),
      ),
      /*bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 16.h),
        child: CustomMobileButtonWidget(
            text: "Apply",
            onTap: () {},
            horizontalPadding: 16.h,
            verticalPadding: 8.h,
            fontSize: 16.sp,
            borderRadius: 40.r),
      ),*/
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
            KalakarConstants.opportunity,
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
            KalakarConstants.opportunities1,
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

  RequirementViewMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      if (controller.showStatus) {
        AppliedRequirementDetailsList requirement =
                  controller.selectedAppliedRequirement;
        DateTime shootingStartDate =
                  DateTime.parse(requirement.shootingStartDate.toString());

        DateTime shootingEndDate =
                  DateTime.parse(requirement.shootingEndDate.toString());
        DateTime requirementEndDate =
                  DateTime.parse(requirement.requirementEndDate.toString());
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.h),
                  padding: EdgeInsets.all(8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          errorBuilder: (BuildContext context, Object error,
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
                      Text(
                        requirement.companyNameProductionhouse!,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),Container(
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          border: Border.all(color: KalakarColors.backgroundGrey),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: rowDataToShow("Application Status : ", requirement.applyStatus.toString()),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          border: Border.all(color: KalakarColors.backgroundGrey),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            rowDataToShow(
                                "Description : ", requirement.requirementDescription!),
                            rowDataToShow("Looking For : ", requirement.lookingFor!),
                            rowDataToShow("Role : ", requirement.defineRole!),
                            rowDataToShow("Number Of Openings : ",
                                requirement.nUmberOfOpenings!.toString()),
                            if (controller.showStatus)
                              rowDataToShow("Project Status : ",
                                  requirement.requirementStatus!.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),


                      Container(
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          border: Border.all(color: KalakarColors.backgroundGrey),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            rowDataToShow(
                                "Shooting Location : ", requirement.shootingLocation!),
                            rowDataToShow("Shooting Start Date : ",
                                formatter.format(shootingStartDate)),
                            rowDataToShow("Shooting End Date : ",
                                formatter.format(shootingEndDate)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      Container(
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          border: Border.all(color: KalakarColors.backgroundGrey),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: rowDataToShow(
                                      "Age : ",
                                      requirement.age!.contains(".")
                                          ? requirement.age!.split(".").first + " Years"
                                          : requirement.age! + "Years"),
                                ),
                                Expanded(
                                  child:
                                      rowDataToShow("Gender : ", requirement.gender!),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child:
                                      rowDataToShow("Height : ", requirement.height!.toString()),
                                ),
                                Expanded(
                                  child:
                                      rowDataToShow("Weight : ", requirement.weight!.toString()),
                                )
                              ],
                            ),
                            rowDataToShow("Experience : ",
                                "${requirement.experiences!.toString()} Years"),
                            rowDataToShow("Language : ", requirement.language!),
                            rowDataToShow("Hair Color : ", requirement.hairColor!),
                            rowDataToShow("Body Type  : ", requirement.bodyType!),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16.h,
                      ),

                      Container(
                          padding: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            border: Border.all(color: KalakarColors.backgroundGrey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(children: [
                            rowDataToShow("Special Skills Required  : ",
                                requirement.specialSkillRequired!),
                            rowDataToShow(
                                "Comfortable In : ", requirement.comfortableIn!),
                            rowDataToShow("Script For Audition : ",
                                requirement.scriptForAuditions!),
                            rowDataToShow("Requirement End Date : ",
                                formatter.format(requirementEndDate)),
                          ])),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(0, requirement.fbLink!);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/facebook.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(1, requirement.instalink!);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/instagram.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(2, requirement.wpLink!);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/whatsapp.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(3, requirement.ytLink!);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/youtube.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(4, requirement.emailLink!);
                            },
                            child: SvgPicture.asset(
                              "assets/svg/email.svg",
                              height: 30.h,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.openSocialMedia(5, requirement.websiteLink!);
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
                      if (!controller.showStatus)
                        CustomMobileButtonWidget(
                            text: "Apply",
                            onTap: () {
                              controller.saveAppliedToRequirement(
                                  requirement.requirementDetailsID!);
                            },
                            horizontalPadding: 16.h,
                            verticalPadding: 8.h,
                            fontSize: 16.sp,
                            borderRadius: 40.r),
                    ],
                  ),
                ),
              );
      } else {

        ObjResponesRequirementDetailsList requirement =
            controller.selectedRequirement;
        DateTime shootingStartDate =
        DateTime.parse(requirement.shootingStartDate.toString());

        DateTime shootingEndDate =
        DateTime.parse(requirement.shootingEndDate.toString());
        DateTime requirementEndDate =
        DateTime.parse(requirement.requirementEndDate.toString());
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.h),
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    errorBuilder: (BuildContext context, Object error,
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
                Text(
                  requirement.companyNameProductionhouse!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      rowDataToShow(
                          "Description : ", requirement.requirementDescription!),
                      rowDataToShow("Looking For : ", requirement.lookingFor!),
                      rowDataToShow("Role : ", requirement.defineRole!),
                      rowDataToShow("Number Of Openings : ",
                          requirement.nUmberOfOpenings!.toString()),
                      if (controller.showStatus)
                        rowDataToShow("Project Status : ",
                            requirement.requirementStatus!.toString()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      rowDataToShow(
                          "Shooting Location : ", requirement.shootingLocation!),
                      rowDataToShow("Shooting Start Date : ",
                          formatter.format(shootingStartDate)),
                      rowDataToShow("Shooting End Date : ",
                          formatter.format(shootingEndDate)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),

                Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: rowDataToShow(
                                "Age : ",
                                requirement.age!.contains(".")
                                    ? requirement.age!.split(".").first + " Years"
                                    : requirement.age! + "Years"),
                          ),
                          Expanded(
                            child:
                            rowDataToShow("Gender : ", requirement.gender!),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child:
                            rowDataToShow("Height : ", requirement.height!),
                          ),
                          Expanded(
                            child:
                            rowDataToShow("Weight : ", requirement.weight!),
                          )
                        ],
                      ),
                      rowDataToShow("Experience : ",
                          "${requirement.experiences!.toString()} Years"),
                      rowDataToShow("Language : ", requirement.language!),
                      rowDataToShow("Hair Color : ", requirement.hairColor!),
                      rowDataToShow("Body Type  : ", requirement.bodyType!),
                    ],
                  ),
                ),

                SizedBox(
                  height: 16.h,
                ),

                Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(children: [
                      rowDataToShow("Special Skills Required  : ",
                          requirement.specialSkillRequired!),
                      rowDataToShow(
                          "Comfortable In : ", requirement.comfortableIn!),
                      rowDataToShow("Script For Audition : ",
                          requirement.scriptForAuditions!),
                      rowDataToShow("Requirement End Date : ",
                          formatter.format(requirementEndDate)),
                    ])),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(0, requirement.fbLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/facebook.svg",
                        height: 30.h,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(1, requirement.instalink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/instagram.svg",
                        height: 30.h,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(2, requirement.wpLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/whatsapp.svg",
                        height: 30.h,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(3, requirement.ytLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/youtube.svg",
                        height: 30.h,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(4, requirement.emailLink!);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/email.svg",
                        height: 30.h,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.openSocialMedia(5, requirement.websiteLink!);
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
                if (!controller.showStatus)
                  CustomMobileButtonWidget(
                      text: "Apply",
                      onTap: () {
                        controller.saveAppliedToRequirement(
                            requirement.requirementDetailsID!);
                      },
                      horizontalPadding: 16.h,
                      verticalPadding: 8.h,
                      fontSize: 16.sp,
                      borderRadius: 40.r),
              ],
            ),
          ),
        );
      }
    });

  }

  RequirementViewWebView(BuildContext context) {}

  rowDataToShow(String title, String titleData) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
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
}
