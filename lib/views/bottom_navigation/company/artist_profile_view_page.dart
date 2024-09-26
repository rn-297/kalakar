import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/data/models/company/company_applied_details_class.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistProfileViewPage extends StatelessWidget {
  const ArtistProfileViewPage({super.key});

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
        mobile: (BuildContext context) => notificationsMobileView(context),
        tablet: (BuildContext context) => notificationsWebView(context),
      ),
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
            KalakarConstants.artistProfile,
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
            KalakarConstants.artistProfile,
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

  notificationsMobileView(BuildContext context) {
    return GetBuilder<RequirementController>(builder: (controller) {
      GetArtistProfileModelForRequirememt artistData = controller
          .selectedArtistProfileData.getArtistProfileModelForRequirememt!;
      List<EducationList> artistEducationData =
          controller.selectedArtistProfileData.educationList!;
      List<HobbiesList> artistHobbiesData =
          controller.selectedArtistProfileData.hobbiesList!;
      List<InterestList> artistInterestInData =
          controller.selectedArtistProfileData.interestList!;
      List<ComfortableInList> artistComfortableInData =
          controller.selectedArtistProfileData.comfortableInList!;
      List<ExperienceList> artistExperienceData =
          controller.selectedArtistProfileData.experienceList!;
      List<PortfolioList> artistPortfolioData =
          controller.selectedArtistProfileData.portfolioList!;
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
                  artistData.profilePic!,
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
                "${artistData.firstName} ${artistData.middleName}",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSpanToShow(context, "Bio : ", artistData.bio!),
                    textSpanToShow(
                        context, "Eye Color : ", artistData.eyeColor!),
                    textSpanToShow(
                        context, "Hair Color : ", artistData.hairColor!),
                    textSpanToShow(
                        context, "Body Type : ", artistData.bodyType!),
                    textSpanToShow(context, "Marital Status : ",
                        artistData.maritalStatus!),
                    Row(
                      children: [
                        Expanded(
                          child: textSpanToShow(
                              context,
                              "Age : ",
                              artistData.age!.toString().contains(".")
                                  ? artistData.age!
                                          .toString()
                                          .split(".")
                                          .first +
                                      " Years"
                                  : artistData.age!.toString() + "Years"),
                        ),
                        Expanded(
                          child: textSpanToShow(
                              context, "Gender : ", artistData.gender!),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: textSpanToShow(context, "Height : ",
                              artistData.height.toString() + " ft"),
                        ),
                        Expanded(
                          child: textSpanToShow(context, "Weight : ",
                              artistData.weight!.toString() + " kg"),
                        )
                      ],
                    ),
                    textSpanToShow(context, "Address : ",
                        "${artistData.address1!.toString()}, ${artistData.address2!.toString()}, ${artistData.district!.toString()}, ${artistData.state!.toString()},  ${artistData.postalcode!.toString()}, "),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KalakarConstants.education,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: artistEducationData.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          EducationList educationData =
                              artistEducationData[index];
                          DateTime courseEndDate = DateTime.parse(
                              educationData.courseEndDate.toString());
                          DateTime courseStartDate = DateTime.parse(
                              educationData.courseStartDate.toString());
                          DateFormat formatter = DateFormat('dd-MM-yyyy');
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSpanToShow(context, "Course Name : ",
                                  educationData.course.toString()),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.universityOrInstitute} : ",
                                  educationData.universityOrInstitute
                                      .toString()),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.specialization} : ",
                                  educationData.specialization.toString()),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.courseType} : ",
                                  educationData.coursetype.toString()),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.score} : ",
                                  educationData.score.toString()),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.startDate} : ",
                                  formatter.format(courseStartDate)),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.endDate} : ",
                                  formatter.format(courseEndDate)),
                              if (index != artistEducationData.length - 1)
                                Divider(
                                  thickness: 0.5,
                                  height: 10.h,
                                ),
                              if (index != artistEducationData.length - 1)
                                SizedBox(
                                  height: 8.h,
                                )
                            ],
                          );
                        })
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KalakarConstants.hobbies,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: artistHobbiesData.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artistHobbiesData[index].hobbyName!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              )
                            ],
                          );
                        })
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KalakarConstants.interestIn,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: artistInterestInData.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artistInterestInData[index].interestedName!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              )
                            ],
                          );
                        })
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KalakarConstants.comfortableIn,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: artistComfortableInData.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artistComfortableInData[index].comfortableName!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              )
                            ],
                          );
                        })
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KalakarConstants.experiences,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: artistExperienceData.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          ExperienceList experienceData =
                              artistExperienceData[index];
                          DateTime expEndDate =
                              DateTime.parse(experienceData.endDate.toString());
                          DateTime expStartDate = DateTime.parse(
                              experienceData.startDate.toString());
                          DateFormat formatter = DateFormat('dd-MM-yyyy');
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.roleName} : ",
                                  experienceData.roleName.toString()),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.companyName} : ",
                                  experienceData.companyName.toString()),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.roleProfile} : ",
                                  experienceData.roleProfile.toString()),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.startDate} : ",
                                  formatter.format(expStartDate)),
                              textSpanToShow(
                                  context,
                                  "${KalakarConstants.endDate} : ",
                                  formatter.format(expEndDate)),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.showDocument(
                                          experienceData.roleImage!,
                                          KalakarConstants.roleImage);
                                    },
                                    child: Container(
                                      height: 155.h,
                                      width: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color:
                                                KalakarColors.backgroundGrey),
                                        image: DecorationImage(
                                            image: experienceData.roleImage!
                                                    .startsWith("http")
                                                ? NetworkImage(
                                                    experienceData.roleImage!)
                                                : FileImage(File(experienceData
                                                        .roleImage!))
                                                    as ImageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.showDocument(
                                          experienceData.roleVideo!,
                                          KalakarConstants.roleVideo);
                                    },
                                    child: Container(
                                      height: 155.h,
                                      width: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color:
                                                KalakarColors.backgroundGrey),
                                        image: DecorationImage(
                                            image: experienceData.roleVideo!
                                                    .startsWith("http")
                                                ? NetworkImage(
                                                    experienceData.roleVideo!)
                                                : FileImage(File(experienceData
                                                        .roleVideo!))
                                                    as ImageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (index != artistExperienceData.length - 1)
                                Divider(
                                  thickness: 0.5,
                                  height: 10.h,
                                ),
                              if (index != artistExperienceData.length - 1)
                                SizedBox(
                                  height: 8.h,
                                )
                            ],
                          );
                        })
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KalakarConstants.portfolio1,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 140.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: artistPortfolioData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.showDocument(
                                    artistPortfolioData[index].filePath!,
                                    KalakarConstants.portfolio1);
                              },
                              child: Container(
                                height: 155.h,
                                width: 100.h,
                                margin: EdgeInsets.only(right: 8.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                      color: KalakarColors.backgroundGrey),
                                  image: DecorationImage(
                                      image: artistPortfolioData[index]
                                              .filePath!
                                              .startsWith("http")
                                          ? NetworkImage(
                                              artistPortfolioData[index]
                                                  .filePath!)
                                          : FileImage(File(
                                              artistPortfolioData[index]
                                                  .filePath!)) as ImageProvider,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomMobileButtonWidget(
                      text: controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  1 ||
                              controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  2
                          ? KalakarConstants.selected
                          : KalakarConstants.select,
                      onTap: () {
                        /*if (controller.selectedArtistProfileData
                                    .fKApplyStatusMasterID ==
                                1 ||
                            controller.selectedArtistProfileData
                                    .fKApplyStatusMasterID ==
                                2) */
                        controller.saveChangesAppliedRequirementStatus(2);
                      },
                      backgroundColor: controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  1 ||
                              controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  2
                          ? KalakarColors.appBarBackground
                          : KalakarColors.backgroundGrey,
                      horizontalPadding: 4.h,
                      verticalPadding: 8.h,
                      fontSize: 16.sp,
                      width: 100.w,
                      borderRadius: 40.r),
                  CustomMobileButtonWidget(
                      text: controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  1 ||
                              controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  2
                          ? KalakarConstants.rejected
                          : KalakarConstants.reject,
                      onTap: () {
                        controller.saveChangesAppliedRequirementStatus(3);
                      },
                      horizontalPadding: 4.h,
                      verticalPadding: 8.h,
                      backgroundColor: controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  1 ||
                              controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  3
                          ? KalakarColors.appBarBackground
                          : KalakarColors.backgroundGrey,
                      width: 100.w,
                      fontSize: 16.sp,
                      borderRadius: 40.r),
                  CustomMobileButtonWidget(
                      text: controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  1 ||
                              controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  2
                          ? KalakarConstants.onHold
                          : KalakarConstants.hold,
                      onTap: () {
                        controller.saveChangesAppliedRequirementStatus(4);
                      },
                      backgroundColor: controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  1 ||
                              controller.selectedArtistProfileData
                                      .fKApplyStatusMasterID ==
                                  4
                          ? KalakarColors.appBarBackground
                          : KalakarColors.backgroundGrey,
                      horizontalPadding: 4.h,
                      verticalPadding: 8.h,
                      width: 100.w,
                      fontSize: 16.sp,
                      borderRadius: 40.r),
                ],
              )
            ],
          ),
        ),
      );
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              ),
              TextSpan(
                text: titleData,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
      ],
    );
  }

  notificationsWebView(BuildContext context) {}
}
