import 'package:flutter/cupertino.dart';
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
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: KalakarColors.appBarBackground,
        appBar: PreferredSize(
          preferredSize: Size(0, 0), child: Container(),
          //   child: ScreenTypeLayout.builder(
          //     mobile: (BuildContext context) => appbarMobileView(),
          //     tablet: (BuildContext context) => appbarWebView(),
          //   ),
        ),
        body: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => requirementViewMobileView(context),
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
      ),
    );
  }

  appbarMobileView() {
    RequirementController controller = Get.put(RequirementController());
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
      actions: [
        if (!controller.isArtist)
          InkWell(
            onTap: () {
              controller.setOpportunityData(controller.selectedRequirement);
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

  requirementViewMobileView(BuildContext context) {
    Get.put(RequirementController());
    return GetBuilder<RequirementController>(builder: (controller) {
      if (controller.showStatus) {
        ArtistAppliedRequirementDetailsList requirement =
            controller.selectedAppliedRequirement;
        DateTime shootingStartDate =
            DateTime.parse(requirement.shootingStartDate.toString());

        DateTime shootingEndDate =
            DateTime.parse(requirement.shootingEndDate.toString());
        DateTime requirementEndDate =
            DateTime.parse(requirement.requirementEndDate.toString());
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        return /*SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.h),
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: KalakarColors.appBarBackground),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: textSpanToShow(context, "Application Status : ",
                      requirement.applyStatus.toString()),
                ),
                SizedBox(
                  height: 16.h,
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
                      textSpanToShow(context, "Description : ",
                          requirement.requirementDescription!),
                      textSpanToShow(
                          context, "Looking For : ", requirement.lookingFor!),
                      textSpanToShow(
                          context, "Role : ", requirement.defineRole!),
                      textSpanToShow(context, "Number Of Openings : ",
                          requirement.nUmberOfOpenings!.toString()),
                      if (controller.showStatus)
                        textSpanToShow(context, "Project Status : ",
                            requirement.requirementStatus!.toString()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
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
                      textSpanToShow(context, "Shooting Location : ",
                          requirement.shootingLocation!),
                      textSpanToShow(context, "Shooting Start Date : ",
                          formatter.format(shootingStartDate)),
                      textSpanToShow(context, "Shooting End Date : ",
                          formatter.format(shootingEndDate)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
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
                      Row(
                        children: [
                          Expanded(
                            child: textSpanToShow(
                                context,
                                "Age : ",
                                requirement.age!.contains(".")
                                    ? requirement.age!.split(".").first +
                                        " Years"
                                    : requirement.age! + "Years"),
                          ),
                          Expanded(
                            child: textSpanToShow(
                                context, "Gender : ", requirement.gender!),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: textSpanToShow(context, "Height : ",
                                requirement.height!.toString()),
                          ),
                          Expanded(
                            child: textSpanToShow(context, "Weight : ",
                                requirement.weight!.toString()),
                          )
                        ],
                      ),
                      textSpanToShow(context, "Experience : ",
                          "${requirement.experiences!.toString()} Years"),
                      textSpanToShow(
                          context, "Language : ", requirement.language!),
                      textSpanToShow(
                          context, "Hair Color : ", requirement.hairColor!),
                      textSpanToShow(
                          context, "Body Type  : ", requirement.bodyType!),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
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
                          textSpanToShow(context, "Special Skills Required  : ",
                              requirement.specialSkillRequired!),
                          textSpanToShow(context, "Comfortable In : ",
                              requirement.comfortableIn!),
                          textSpanToShow(context, "Script For Audition : ",
                              requirement.scriptForAuditions!),
                          textSpanToShow(context, "Requirement End Date : ",
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
                      text: requirement.artistAppliedForRequirementTransID == 0
                          ? "Apply"
                          : "Applied",
                      onTap: () {
                        if (requirement.artistAppliedForRequirementTransID == 0)
                          controller.saveAppliedToRequirement(
                              requirement.requirementDetailsID!);
                      },
                      horizontalPadding: 16.h,
                      verticalPadding: 8.h,
                      backgroundColor:
                          requirement.artistAppliedForRequirementTransID == 0
                              ? KalakarColors.appBarBackground
                              : KalakarColors.backgroundGrey,
                      fontSize: 16.sp,
                      borderRadius: 40.r),
              ],
            ),
          ),
        )*/
          Container(
            color: KalakarColors.appBarBackground1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: KalakarColors.appBarBackground,
                          border: Border(
                            left: BorderSide(color: Colors.green, width: 2),
                            // Left border
                            right: BorderSide(color: Colors.green, width: 2),
                            // Right border
                            bottom: BorderSide(
                                color: Colors.green, width: 2), // Bottom border
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(-5, 0)),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(70.r))),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, top: 16.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: KalakarColors.white,
                                    ),
                                  ),
                                  controller.isArtist
                                      ? InkWell(
                                      onTap: () {
                                        if (requirement
                                            .artistFavoritesRequirementTransID ==
                                            0) {
                                          controller
                                              .addRequirementInFavorites(
                                              requirement
                                                  .requirementDetailsID!,
                                              true);
                                        } else {
                                          controller.removeFromFavourites(
                                              requirement
                                                  .artistFavoritesRequirementTransID!,
                                              true);
                                        }
                                      },
                                      child: Icon(
                                        requirement.artistFavoritesRequirementTransID ==
                                            0
                                            ? CupertinoIcons.suit_heart
                                            : CupertinoIcons.heart_fill,
                                        color: requirement
                                            .artistFavoritesRequirementTransID ==
                                            0
                                            ? Colors.black
                                            : Colors.red,
                                      ))
                                      : Container(),
                                  if (!controller.isArtist)
                                    InkWell(
                                      onTap: () {
                                        controller.setOpportunityData(controller.selectedRequirement);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        size: 30.h,
                                      ),
                                    ),
                                ]),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          ClipOval(
                            child: InkWell(
                              onTap: (){
                                controller.getCompanyProfileData();
                              },
                              child: Image.network(
                                requirement.companyLogo!,
                                fit: BoxFit.cover,
                                height: 70.h,
                                width: 70.h,
                                errorBuilder: (BuildContext context, Object error,
                                    StackTrace? stackTrace) {
                                  // Return a dummy or placeholder image when an error occurs
                                  return Image.asset(
                                    "assets/images/app_bar_logo.png",
                                    height: 70.h,
                                    width: 70.h,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            requirement.companyNameProductionhouse ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: KalakarColors.headerText),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              requirement.lookingFor ?? "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 8.w),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Age ${requirement.age}",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.w),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${requirement.gender}",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 8.w),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${requirement.shootingLocation}",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(formatter.format(shootingStartDate))],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: KalakarColors.appBarBackground1),
                      child: Center(
                        child: Text(
                          KalakarConstants.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Divider(
                      color: Colors.green,
                      thickness: 2,
                      height: 2,
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.h, right: 8.h, bottom: 8.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*if (controller.isArtist)
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                  border: Border.all(
                                      color: KalakarColors.backgroundGrey),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: textSpanToShow(
                                    context,
                                    "Application Status : ",
                                    requirement.applyStatus.toString()),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                        Container(
                          padding: EdgeInsets.all(12.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            border:
                                Border.all(color: KalakarColors.backgroundGrey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSpanToShow(context, "Description : ",
                                  requirement.requirementDescription!),
                              textSpanToShow(context, "Looking For : ",
                                  requirement.lookingFor!),
                              textSpanToShow(
                                  context, "Role : ", requirement.defineRole!),
                              textSpanToShow(context, "Number Of Openings : ",
                                  requirement.nUmberOfOpenings!.toString()),
                              if (controller.showStatus)
                                textSpanToShow(context, "Project Status : ",
                                    requirement.requirementStatus!.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(12.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            border:
                                Border.all(color: KalakarColors.backgroundGrey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSpanToShow(context, "Shooting Location : ",
                                  requirement.shootingLocation!),
                              textSpanToShow(context, "Shooting Start Date : ",
                                  formatter.format(shootingStartDate)),
                              textSpanToShow(context, "Shooting End Date : ",
                                  formatter.format(shootingEndDate)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(12.h),
                          width: double.infinity,
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
                                children: [
                                  Expanded(
                                    child: textSpanToShow(
                                        context,
                                        "Age : ",
                                        requirement.age!.contains(".")
                                            ? requirement.age!
                                                    .split(".")
                                                    .first +
                                                " Years"
                                            : requirement.age! + "Years"),
                                  ),
                                  Expanded(
                                    child: textSpanToShow(context, "Gender : ",
                                        requirement.gender!),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: textSpanToShow(context, "Height : ",
                                        requirement.height!),
                                  ),
                                  Expanded(
                                    child: textSpanToShow(context, "Weight : ",
                                        requirement.weight!),
                                  )
                                ],
                              ),
                              textSpanToShow(context, "Experience : ",
                                  "${requirement.experiences!.toString()} Years"),
                              textSpanToShow(context, "Language : ",
                                  requirement.language!),
                              textSpanToShow(context, "Hair Color : ",
                                  requirement.hairColor!),
                              textSpanToShow(context, "Body Type  : ",
                                  requirement.bodyType!),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                            padding: EdgeInsets.all(12.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: KalakarColors.white,
                              border: Border.all(
                                  color: KalakarColors.backgroundGrey),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textSpanToShow(
                                      context,
                                      "Special Skills Required  : ",
                                      requirement.specialSkillRequired!),
                                  textSpanToShow(context, "Comfortable In : ",
                                      requirement.comfortableIn!),
                                  textSpanToShow(
                                      context,
                                      "Script For Audition : ",
                                      requirement.scriptForAuditions!),
                                  textSpanToShow(
                                      context,
                                      "Requirement End Date : ",
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
                                controller.openSocialMedia(
                                    0, requirement.fbLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/facebook.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    1, requirement.instalink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/instagram.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    2, requirement.wpLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/whatsapp.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    3, requirement.ytLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/youtube.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    4, requirement.emailLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/email.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    5, requirement.websiteLink!);
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
                        ),*/
                          textSpanToShow(
                              context,
                              "${KalakarConstants.description} : ",
                              requirement.requirementDescription!),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.specialSkills} : ",
                              requirement.specialSkillRequired!),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.shootingLocation} : ",
                              requirement.shootingLocation!),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.comfortableIn} : ",
                              requirement.comfortableIn!),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.shootingStartDate} : ",
                              formatter.format(shootingStartDate)),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.shootingEndDate} : ",
                              formatter.format(shootingEndDate)),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.character} : ",
                              requirement.defineRole!),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.experience} ",
                              requirement.experiences!.toString()),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                                color: KalakarColors.turquoise15,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text(
                                          KalakarConstants.referenceLook,
                                          style:
                                          TextStyle(fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(4.r),
                                          child: Image.network(
                                            requirement.refPhotoName!,
                                            fit: BoxFit.cover,
                                            errorBuilder: (BuildContext context,
                                                Object error,
                                                StackTrace? stackTrace) {
                                              // Return a dummy or placeholder image when an error occurs
                                              return Image.asset(
                                                "assets/images/app_bar_logo.png",
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(width: 12.w,),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
                                        Text(
                                          KalakarConstants.script,
                                          style:
                                          TextStyle(fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(requirement.scriptForAuditions!)
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.opportunityEndDate} : ",
                              formatter.format(shootingEndDate)),
                          SizedBox(
                            height: 8.h,
                          ),
                          if(controller.isArtist)textSpanToShow(
                              context,
                              "Application Status : ",
                              requirement.applyStatus.toString()),
                          if (!controller.showStatus)
                            CustomMobileButtonWidget(
                                text: requirement.artistAppliedForRequirementTransID == 0
                                    ? "Apply"
                                    : "Applied",
                                onTap: () {
                                  if (requirement.artistAppliedForRequirementTransID == 0)
                                    controller.saveAppliedToRequirement(
                                        requirement.requirementDetailsID!);
                                },
                                horizontalPadding: 16.h,
                                verticalPadding: 8.h,
                                backgroundColor:
                                requirement.artistAppliedForRequirementTransID == 0
                                    ? KalakarColors.appBarBackground
                                    : KalakarColors.backgroundGrey,
                                fontSize: 16.sp,
                                borderRadius: 40.r),

                          SizedBox(height: 20.h,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
      } else {
        RequirementDetailsData requirement = controller.selectedRequirement;
        DateTime shootingStartDate =
            DateTime.parse(requirement.shootingStartDate.toString());

        DateTime shootingEndDate =
            DateTime.parse(requirement.shootingEndDate.toString());
        DateTime requirementEndDate =
            DateTime.parse(requirement.requirementEndDate.toString());
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        return Container(
          color: KalakarColors.appBarBackground1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: KalakarColors.appBarBackground,
                        border: Border(
                          left: BorderSide(color: Colors.green, width: 2),
                          // Left border
                          right: BorderSide(color: Colors.green, width: 2),
                          // Right border
                          bottom: BorderSide(
                              color: Colors.green, width: 2), // Bottom border
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              offset: Offset(-3, 0)),
                        ],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70.r))),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 16.h, right: 16.h, top: 16.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: KalakarColors.white,
                                  ),
                                ),
                                controller.isArtist
                                    ? InkWell(
                                        onTap: () {
                                          if (requirement
                                                  .artistFavoritesRequirementTransID ==
                                              0) {
                                            controller
                                                .addRequirementInFavorites(
                                                    requirement
                                                        .requirementDetailsID!,
                                                    true);
                                          } else {
                                            controller.removeFromFavourites(
                                                requirement
                                                    .artistFavoritesRequirementTransID!,
                                                true);
                                          }
                                        },
                                        child: Icon(
                                          requirement.artistFavoritesRequirementTransID ==
                                                  0
                                              ? CupertinoIcons.suit_heart
                                              : CupertinoIcons.heart_fill,
                                          color: requirement
                                                      .artistFavoritesRequirementTransID ==
                                                  0
                                              ? Colors.black
                                              : Colors.red,
                                        ))
                                    : Container(),
                                if (!controller.isArtist)
                                  InkWell(
                                    onTap: () {
                                      controller.setOpportunityData(controller.selectedRequirement);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      size: 22.h,
                                    ),
                                  ),
                              ]),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ClipOval(
                          // Image radius
                          child: InkWell(
                            onTap: (){
                              controller.getCompanyProfileData();
                            },
                            child: Image.network(
                              requirement.companyLogo!,
                              fit: BoxFit.cover,
                              height: 70.h,
                              width: 70.h,
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                // Return a dummy or placeholder image when an error occurs
                                return Image.asset(
                                  "assets/images/app_bar_logo.png",
                                  height: 70.h,
                                  width: 70.h,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          requirement.companyNameProductionhouse ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: KalakarColors.headerText),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text(
                            requirement.lookingFor ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 8.w),
                                  decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Age ${requirement.age}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.w),
                                  decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${requirement.gender}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 8.w),
                                  decoration: BoxDecoration(
                                    color: KalakarColors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${requirement.shootingLocation}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(formatter.format(shootingStartDate))],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(color: KalakarColors.appBarBackground1),
                    child: Center(
                      child: Text(
                        KalakarConstants.description,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 2,
                    height: 2,
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.h, right: 8.h, bottom: 0.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*if (controller.isArtist)
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                  border: Border.all(
                                      color: KalakarColors.backgroundGrey),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: textSpanToShow(
                                    context,
                                    "Application Status : ",
                                    requirement.applyStatus.toString()),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                        Container(
                          padding: EdgeInsets.all(12.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            border:
                                Border.all(color: KalakarColors.backgroundGrey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSpanToShow(context, "Description : ",
                                  requirement.requirementDescription!),
                              textSpanToShow(context, "Looking For : ",
                                  requirement.lookingFor!),
                              textSpanToShow(
                                  context, "Role : ", requirement.defineRole!),
                              textSpanToShow(context, "Number Of Openings : ",
                                  requirement.nUmberOfOpenings!.toString()),
                              if (controller.showStatus)
                                textSpanToShow(context, "Project Status : ",
                                    requirement.requirementStatus!.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(12.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            border:
                                Border.all(color: KalakarColors.backgroundGrey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSpanToShow(context, "Shooting Location : ",
                                  requirement.shootingLocation!),
                              textSpanToShow(context, "Shooting Start Date : ",
                                  formatter.format(shootingStartDate)),
                              textSpanToShow(context, "Shooting End Date : ",
                                  formatter.format(shootingEndDate)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(12.h),
                          width: double.infinity,
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
                                children: [
                                  Expanded(
                                    child: textSpanToShow(
                                        context,
                                        "Age : ",
                                        requirement.age!.contains(".")
                                            ? requirement.age!
                                                    .split(".")
                                                    .first +
                                                " Years"
                                            : requirement.age! + "Years"),
                                  ),
                                  Expanded(
                                    child: textSpanToShow(context, "Gender : ",
                                        requirement.gender!),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: textSpanToShow(context, "Height : ",
                                        requirement.height!),
                                  ),
                                  Expanded(
                                    child: textSpanToShow(context, "Weight : ",
                                        requirement.weight!),
                                  )
                                ],
                              ),
                              textSpanToShow(context, "Experience : ",
                                  "${requirement.experiences!.toString()} Years"),
                              textSpanToShow(context, "Language : ",
                                  requirement.language!),
                              textSpanToShow(context, "Hair Color : ",
                                  requirement.hairColor!),
                              textSpanToShow(context, "Body Type  : ",
                                  requirement.bodyType!),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                            padding: EdgeInsets.all(12.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: KalakarColors.white,
                              border: Border.all(
                                  color: KalakarColors.backgroundGrey),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textSpanToShow(
                                      context,
                                      "Special Skills Required  : ",
                                      requirement.specialSkillRequired!),
                                  textSpanToShow(context, "Comfortable In : ",
                                      requirement.comfortableIn!),
                                  textSpanToShow(
                                      context,
                                      "Script For Audition : ",
                                      requirement.scriptForAuditions!),
                                  textSpanToShow(
                                      context,
                                      "Requirement End Date : ",
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
                                controller.openSocialMedia(
                                    0, requirement.fbLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/facebook.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    1, requirement.instalink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/instagram.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    2, requirement.wpLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/whatsapp.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    3, requirement.ytLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/youtube.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    4, requirement.emailLink!);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/email.svg",
                                height: 30.h,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.openSocialMedia(
                                    5, requirement.websiteLink!);
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
                        ),*/
                        textSpanToShow(
                            context,
                            "${KalakarConstants.description} : ",
                            requirement.requirementDescription!),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.specialSkills} : ",
                            requirement.specialSkillRequired!),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.shootingLocation} : ",
                            requirement.shootingLocation!),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.comfortableIn} : ",
                            requirement.comfortableIn!),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.shootingStartDate} : ",
                            formatter.format(shootingStartDate)),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.shootingEndDate} : ",
                            formatter.format(shootingEndDate)),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.character} : ",
                            requirement.defineRole!),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.experience} ",
                            requirement.experiences!.toString()),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                              color: KalakarColors.turquoise15,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                  child: Column(
                                children: [
                                  Text(
                                    KalakarConstants.referenceLook,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: Image.network(
                                      requirement.refPhotoName!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        // Return a dummy or placeholder image when an error occurs
                                        return Image.asset(
                                          "assets/images/app_bar_logo.png",
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )),
                              SizedBox(width: 12.w,),
                              Expanded(
                                flex: 4,
                                  child: Column(
                                children: [
                                  Text(
                                    KalakarConstants.script,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(requirement.scriptForAuditions!)
                                ],
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.opportunityEndDate} : ",
                            formatter.format(shootingEndDate)),
                        SizedBox(
                          height: 8.h,
                        ),

                        if(controller.isArtist)textSpanToShow(
                            context,
                            "Application Status : ",
                            requirement.applyStatus.toString()),
                        SizedBox(height: 24.h,),

                        if (!controller.showStatus && controller.isArtist)
                          CustomMobileButtonWidget(
                              text: requirement
                                          .artistAppliedForRequirementTransID ==
                                      0
                                  ? KalakarConstants.apply
                                  : KalakarConstants.applied,
                              onTap: () {
                                if (requirement
                                        .artistAppliedForRequirementTransID ==
                                    0)
                                  controller.saveAppliedToRequirement(
                                      requirement.requirementDetailsID!);
                              },
                              horizontalPadding: 16.h,
                              verticalPadding: 8.h,
                              backgroundColor: requirement
                                          .artistAppliedForRequirementTransID ==
                                      0
                                  ? KalakarColors.appBarBackground
                                  : KalakarColors.backgroundGrey,
                              fontSize: 16.sp,
                              borderRadius: 40.r),

                        if (!controller.isArtist)
                          CustomMobileButtonWidget(
                              text: KalakarConstants.appliedProfiles,
                              onTap: () {
                                controller.getAppliedData(
                                    requirement);
                              },
                              horizontalPadding: 16.h,
                              verticalPadding: 8.h,
                              fontSize: 16.sp,
                              borderRadius: 40.r),

                        SizedBox(height: 20.h,)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    });
  }

  RequirementViewWebView(BuildContext context) {}

  textSpanToShow(BuildContext context, String title, String titleData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: KalakarColors.headerText),
              ),
              TextSpan(
                text: titleData,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
