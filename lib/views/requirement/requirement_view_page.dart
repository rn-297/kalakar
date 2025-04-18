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
        if (!controller.isArtistAppliedRequirementsLoading) {
          ArtistAppliedRequirementDetailsList requirement =
              controller.selectedAppliedRequirement;
          print(requirement.shootingStartDate.toString());
          DateTime shootingStartDate =
              DateTime.parse(requirement.shootingStartDate.toString());

          DateTime shootingEndDate =
              DateTime.parse(requirement.shootingEndDate.toString());
          DateTime requirementEndDate =
              DateTime.parse(requirement.requirementEndDate.toString());
          DateFormat formatter = DateFormat('dd-MM-yyyy');
          print("previous ${Get.routing.previous.length}");
          print("previous ${Get.routing.previous.runtimeType}");
          print("previous ${Get.routing.previous.toString() == "/"}");
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (Get.routing.previous.toString() != "/")
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
                                        controller.setOpportunityData(
                                            controller.selectedRequirement);
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
                              onTap: () {
                                controller.getCompanyProfileData();
                              },
                              child: Image.network(
                                requirement.companyLogo!,
                                fit: BoxFit.cover,
                                height: 70.h,
                                width: 70.h,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  // Return a dummy or placeholder image when an error occurs
                                  return Image.asset(
                                    "assets/images/NA.jpg",
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
                          InkWell(
                            onTap: () {
                              controller.getCompanyProfileData();
                            },
                            child: Text(
                              requirement.companyNameProductionhouse ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: KalakarColors.headerText),
                            ),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(formatter.format(shootingStartDate)),
                              Text(requirement.salary.toString() +
                                  requirement.salaryType.toString()),
                            ],
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
                      decoration:
                          BoxDecoration(color: KalakarColors.appBarBackground1),
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
                    padding:
                        EdgeInsets.only(left: 8.h, right: 8.h, bottom: 8.h),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          child: Image.network(
                                            requirement.refPhotoName!,
                                            fit: BoxFit.cover,
                                            errorBuilder: (BuildContext context,
                                                Object error,
                                                StackTrace? stackTrace) {
                                              // Return a dummy or placeholder image when an error occurs
                                              return Image.asset(
                                                "assets/images/NA.jpg",
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
                                        Text(
                                          KalakarConstants.script,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
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
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: textSpanToShow(
                                    context,
                                    "${KalakarConstants.height} : ",
                                    requirement.height.toString()),
                              ),
                              SizedBox(
                                width: 8.h,
                              ),
                              Expanded(
                                child: textSpanToShow(
                                    context,
                                    "${KalakarConstants.weight} : ",
                                    requirement.weight.toString()),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.hairColor} : ",
                              requirement.hairColor.toString()),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.bodyType} : ",
                              requirement.bodyType.toString()),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.language} : ",
                              requirement.language.toString()),
                          SizedBox(
                            height: 8.h,
                          ),
                          textSpanToShow(
                              context,
                              "${KalakarConstants.noOfOpenings} : ",
                              requirement.nUmberOfOpenings.toString()),
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
                          // if (controller.isArtist)
                          textSpanToShow(context, "Application Status : ",
                              requirement.applyStatus.toString()),
                          if (requirement.auditionVideoPath != null &&
                              requirement.auditionVideoPath!.isNotEmpty)
                            CustomMobileButtonWidget(
                                text: "View Audition Video",
                                onTap: () {
                                  controller.showAuditionVideo(
                                      requirement.auditionVideoPath);
                                },
                                horizontalPadding: 16.h,
                                width: 250.w,
                                verticalPadding: 8.h,
                                backgroundColor: KalakarColors.appBarBackground,
                                fontSize: 16.sp,
                                borderRadius: 40.r),
                          SizedBox(
                            height: 24.h,
                          ),
                          if (!controller.showStatus)
                            CustomMobileButtonWidget(
                                text: requirement
                                            .artistAppliedForRequirementTransID ==
                                        0
                                    ? "Apply"
                                    : "Applied",
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
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      } else {
        RequirementDetailsData requirement = controller.selectedRequirement;
        print(requirement.shootingStartDate.toString());
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
                                Get.routing.previous.toString() != "/"
                                    ? InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: KalakarColors.white,
                                        ),
                                      )
                                    : Container(),
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
                                      controller.setOpportunityData(
                                          controller.selectedRequirement);
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
                            onTap: () {
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
                                  "assets/images/NA.jpg",
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
                        InkWell(
                          onTap: () {
                            controller.getCompanyProfileData();
                          },
                          child: Text(
                            requirement.companyNameProductionhouse ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: KalakarColors.headerText),
                          ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(formatter.format(shootingStartDate)),
                            Text(requirement.salary.toString() +
                                "/" +
                                requirement.salaryType.toString()),
                          ],
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
                    decoration:
                        BoxDecoration(color: KalakarColors.appBarBackground1),
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
              Expanded
                (
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        child: Image.network(
                                          requirement.refPhotoName!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (BuildContext context,
                                              Object error,
                                              StackTrace? stackTrace) {
                                            // Return a dummy or placeholder image when an error occurs
                                            return Image.asset(
                                              "assets/images/NA.jpg",
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      Text(
                                        KalakarConstants.script,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
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
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.height} : ",
                                  requirement.height.toString()),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.weight} : ",
                                  requirement.weight.toString()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.hairColor} : ",
                            requirement.hairColor.toString()),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.bodyType} : ",
                            requirement.bodyType.toString()),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.language} : ",
                            requirement.language.toString()),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.noOfOpenings} : ",
                            requirement.nUmberOfOpenings.toString()),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.opportunityEndDate} : ",
                            formatter.format(requirementEndDate)),
                        SizedBox(
                          height: 8.h,
                        ),
                        if (controller.isArtist)
                          textSpanToShow(context, "Application Status : ",
                              requirement.applyStatus.toString()),
                        SizedBox(
                          height: 24.h,
                        ),
                        if (!controller.showStatus &&
                            controller.isArtist &&
                            requirement.auditionVideoPath != null &&
                            requirement.auditionVideoPath!.isNotEmpty)
                          CustomMobileButtonWidget(
                              text: "View Audition Video",
                              onTap: () {
                                controller.showAuditionVideo(
                                    requirement.auditionVideoPath);
                              },
                              horizontalPadding: 16.h,
                              width: 250.w,
                              verticalPadding: 8.h,
                              backgroundColor: KalakarColors.appBarBackground,
                              fontSize: 16.sp,
                              borderRadius: 40.r),
                        SizedBox(
                          height: 24.h,
                        ),
                        if (controller.auditionVideo.isNotEmpty)
                          Column(
                            children: [
                              CustomMobileButtonWidget(
                                  text: "View Audition Video",
                                  onTap: () {
                                    controller.showAuditionVideo(controller.auditionVideo);
                                  },
                                  horizontalPadding: 16.h,
                                  width: 200.w,
                                  verticalPadding: 8.h,
                                  backgroundColor:
                                      KalakarColors.appBarBackground,
                                  fontSize: 12.sp,
                                  borderRadius: 40.r),
                              SizedBox(height: 8.h,),
                              CustomMobileButtonWidget(
                                  text: "Delete Audition Video",
                                  onTap: () {
                                    controller.deleteAuditionVideo();
                                  },
                                  horizontalPadding: 16.h,
                                  width: 200.w,
                                  verticalPadding: 8.h,
                                  backgroundColor:
                                      KalakarColors.appBarBackground,
                                  fontSize: 12.sp,
                                  borderRadius: 40.r),
                            ],
                          ),
                        if (!controller.showStatus &&
                            controller.isArtist &&controller.auditionVideo.isEmpty&&
                            requirement
                                .artistAppliedForRequirementTransID ==
                                0)
                          CustomMobileButtonWidget(
                              text: KalakarConstants.addVideo,
                              onTap: () {
                                controller.pickOrShowDocument(
                                    context, controller);
                              },
                              horizontalPadding: 16.h,
                              width: 200.w,
                              verticalPadding: 8.h,
                              backgroundColor:
                              KalakarColors.appBarBackground,
                              fontSize: 12.sp,
                              borderRadius: 40.r),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

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
                                  width: 150.w,
                                  backgroundColor: requirement
                                              .artistAppliedForRequirementTransID ==
                                          0
                                      ? KalakarColors.appBarBackground
                                      : KalakarColors.backgroundGrey,
                                  fontSize: 16.sp,
                                  borderRadius: 40.r),
                          ],
                        ),
                        if (!controller.isArtist)
                          CustomMobileButtonWidget(
                              text: KalakarConstants.appliedProfiles,
                              onTap: () {
                                controller.getAppliedData(requirement);
                              },
                              horizontalPadding: 16.h,
                              verticalPadding: 8.h,
                              fontSize: 16.sp,
                              borderRadius: 40.r),
                        SizedBox(
                          height: 20.h,
                        )
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

  RequirementViewWebView(BuildContext context) {
    Get.put(RequirementController());
    return GetBuilder<RequirementController>(builder: (controller) {
      if (controller.showStatus) {
        print("object");
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
          color: KalakarColors.white,
          child: SingleChildScrollView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        controller.setOpportunityData(
                                            controller.selectedRequirement);
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
                              onTap: () {
                                controller.getCompanyProfileData();
                              },
                              child: Image.network(
                                requirement.companyLogo!,
                                fit: BoxFit.cover,
                                height: 70.h,
                                width: 70.h,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  // Return a dummy or placeholder image when an error occurs
                                  return Image.asset(
                                    "assets/images/NA.jpg",
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
                          InkWell(
                            onTap: () {
                              controller.getCompanyProfileData();
                            },
                            child: Text(
                              requirement.companyNameProductionhouse ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8.sp,
                                  color: KalakarColors.headerText),
                            ),
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
                                fontSize: 6.sp,
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(40.r),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(40.r),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(40.r),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(formatter.format(shootingStartDate)),
                              Text(requirement.salary.toString() +
                                  "/" +
                                  requirement.salaryType.toString()),
                            ],
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
                      decoration:
                          BoxDecoration(color: KalakarColors.appBarBackground1),
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
                Padding(
                  padding: EdgeInsets.only(left: 8.h, right: 8.h, bottom: 8.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        child: Image.network(
                                          requirement.refPhotoName!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (BuildContext context,
                                              Object error,
                                              StackTrace? stackTrace) {
                                            // Return a dummy or placeholder image when an error occurs
                                            return Image.asset(
                                              "assets/images/NA.jpg",
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      Text(
                                        KalakarConstants.script,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
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
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.height} : ",
                                  requirement.height.toString()),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.weight} : ",
                                  requirement.weight.toString()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.hairColor} : ",
                            requirement.hairColor.toString()),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.bodyType} : ",
                            requirement.bodyType.toString()),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.language} : ",
                            requirement.language.toString()),
                        SizedBox(
                          height: 8.h,
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.noOfOpenings} : ",
                            requirement.nUmberOfOpenings.toString()),
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
                        // if (controller.isArtist)
                        textSpanToShow(context, "Application Status : ",
                            requirement.applyStatus.toString()),
                        SizedBox(
                          height: 24.h,
                        ),
                        if (requirement.auditionVideoPath != null &&
                            requirement.auditionVideoPath!.isNotEmpty)
                          CustomMobileButtonWidget(
                              text: "View Audition Video",
                              onTap: () {
                                controller.showAuditionVideo(
                                    requirement.auditionVideoPath);
                              },
                              horizontalPadding: 16.h,
                              width: 150.w,
                              verticalPadding: 8.h,
                              backgroundColor: KalakarColors.appBarBackground,
                              fontSize: 5.sp,
                              borderRadius: 40.r),
                        SizedBox(
                          height: 24.h,
                        ),
                        if (!controller.showStatus)
                          CustomMobileButtonWidget(
                              text: requirement
                                          .artistAppliedForRequirementTransID ==
                                      0
                                  ? "Apply"
                                  : "Applied",
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
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        RequirementDetailsData requirement = controller.selectedRequirement;
        print(requirement.salary);

        DateTime shootingStartDate =
            DateTime.parse(requirement.shootingStartDate.toString());

        DateTime shootingEndDate =
            DateTime.parse(requirement.shootingEndDate.toString());
        DateTime requirementEndDate =
            DateTime.parse(requirement.requirementEndDate.toString());
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        return Container(
          color: KalakarColors.white,
          child: SingleChildScrollView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        controller.setOpportunityData(
                                            controller.selectedRequirement);
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipOval(
                                // Image radius
                                child: InkWell(
                                  onTap: () {
                                    controller.getCompanyProfileData();
                                  },
                                  child: Image.network(
                                    requirement.companyLogo!,
                                    fit: BoxFit.cover,
                                    height: 70.h,
                                    width: 70.h,
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      // Return a dummy or placeholder image when an error occurs
                                      return Image.asset(
                                        "assets/images/NA.jpg",
                                        height: 70.h,
                                        width: 70.h,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.getCompanyProfileData();
                                    },
                                    child: Text(
                                      requirement.companyNameProductionhouse ??
                                          "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8.sp,
                                          color: KalakarColors.headerText),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: Text(
                                      requirement.lookingFor ?? "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.h, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(40.r),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.h, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(40.r),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.h, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius: BorderRadius.circular(40.r),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(formatter.format(shootingStartDate)),
                              Text(requirement.salary.toString() +
                                  "/" +
                                  requirement.salaryType.toString()),
                            ],
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
                      decoration:
                          BoxDecoration(color: KalakarColors.appBarBackground1),
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
                Padding(
                  padding:
                      EdgeInsets.only(left: 16.w, right: 16.w, bottom: 0.h),
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
                      textSpanToShow(context, "${KalakarConstants.experience} ",
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
                            Column(
                              children: [
                                Text(
                                  KalakarConstants.referenceLook,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: Image.network(
                                    requirement.refPhotoName!,
                                    fit: BoxFit.cover,
                                    height: 100.h,
                                    width: 100.h,
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      // Return a dummy or placeholder image when an error occurs
                                      return Image.asset(
                                        "assets/images/NA.jpg",
                                        height: 100.h,
                                        width: 100.h,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Text(
                                      KalakarConstants.script,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
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
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: textSpanToShow(
                                context,
                                "${KalakarConstants.height} : ",
                                requirement.height.toString()),
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          Expanded(
                            child: textSpanToShow(
                                context,
                                "${KalakarConstants.weight} : ",
                                requirement.weight.toString()),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      textSpanToShow(
                          context,
                          "${KalakarConstants.hairColor} : ",
                          requirement.hairColor.toString()),
                      SizedBox(
                        height: 8.h,
                      ),
                      textSpanToShow(context, "${KalakarConstants.bodyType} : ",
                          requirement.bodyType.toString()),
                      SizedBox(
                        height: 8.h,
                      ),
                      textSpanToShow(context, "${KalakarConstants.language} : ",
                          requirement.language.toString()),
                      SizedBox(
                        height: 8.h,
                      ),
                      textSpanToShow(
                          context,
                          "${KalakarConstants.noOfOpenings} : ",
                          requirement.nUmberOfOpenings.toString()),
                      SizedBox(
                        height: 8.h,
                      ),
                      textSpanToShow(
                          context,
                          "${KalakarConstants.opportunityEndDate} : ",
                          formatter.format(requirementEndDate)),
                      SizedBox(
                        height: 8.h,
                      ),
                      if (controller.isArtist)
                        textSpanToShow(context, "Application Status : ",
                            requirement.applyStatus.toString()),
                      SizedBox(
                        height: 24.h,
                      ),
                      if (!controller.showStatus &&
                          controller.isArtist &&
                          requirement.auditionVideoPath != null &&
                          requirement.auditionVideoPath!.isNotEmpty)
                        CustomMobileButtonWidget(
                            text: "View Audition Video",
                            onTap: () {
                              controller.showAuditionVideo(
                                  requirement.auditionVideoPath);
                            },
                            horizontalPadding: 16.h,
                            width: 150.w,
                            verticalPadding: 8.h,
                            backgroundColor: KalakarColors.appBarBackground,
                            fontSize: 5.sp,
                            borderRadius: 40.r),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (controller.auditionVideo.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomMobileButtonWidget(
                                    text: "Show Audition Video",
                                    onTap: () {
                                      controller.showLocalAuditionVideo();
                                    },
                                    horizontalPadding: 6.h,
                                    verticalPadding: 8.h,
                                    width: 100.w,
                                    backgroundColor:
                                        KalakarColors.appBarBackground,
                                    fontSize: 5.sp,
                                    borderRadius: 40.r),

                                SizedBox(width: 5.w,),

                                CustomMobileButtonWidget(
                                    text: "Delete Audition Video",
                                    onTap: () {
                                      controller.deleteAuditionVideo();
                                    },
                                    horizontalPadding: 6.h,
                                    verticalPadding: 8.h,
                                    width: 100.w,
                                    backgroundColor:
                                        KalakarColors.appBarBackground,
                                    fontSize: 5.sp,
                                    borderRadius: 40.r),
                              ],
                            ),
                          if (!controller.showStatus &&
                              controller.isArtist &&
                              controller.auditionVideo.isEmpty &&
                              requirement.artistAppliedForRequirementTransID ==
                                  0)
                            CustomMobileButtonWidget(
                                text: KalakarConstants.addVideo,
                                onTap: () {
                                  controller.pickOrShowDocumentWeb(
                                      context, controller);
                                },
                                horizontalPadding: 6.h,
                                verticalPadding: 8.h,
                                width: 100.w,
                                backgroundColor: KalakarColors.appBarBackground,
                                fontSize: 5.sp,
                                borderRadius: 40.r),
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
                                horizontalPadding: 6.h,
                                verticalPadding: 8.h,
                                backgroundColor: requirement
                                            .artistAppliedForRequirementTransID ==
                                        0
                                    ? KalakarColors.appBarBackground
                                    : KalakarColors.backgroundGrey,
                                fontSize: 5.sp,
                                borderRadius: 40.r),
                        ],
                      ),
                      if (!controller.isArtist)
                        CustomMobileButtonWidget(
                            text: KalakarConstants.appliedProfiles,
                            onTap: () {
                              controller.getAppliedData(requirement);
                            },
                            horizontalPadding: 16.h,
                            verticalPadding: 8.h,
                            width: 90.w,
                            fontSize: 5.sp,
                            borderRadius: 40.r),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    });
  }

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
