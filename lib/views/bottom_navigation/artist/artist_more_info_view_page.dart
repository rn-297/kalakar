import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:kalakar/data/models/company/company_applied_details_class.dart'as artist_profile;

import '../../../data/models/artist/artist_apply_for_class.dart';
import '../../../data/models/artist/artist_comfortable_in_class.dart';
import '../../../data/models/artist/artist_education_list_class.dart';
import '../../../data/models/artist/artist_hobbies_list_class.dart';
import '../../../data/models/artist/artist_interested_in_class.dart';
import '../../../data/models/artist/artist_profile_class.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/route_helper.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistMoreInfoViewPage extends StatelessWidget {
  const ArtistMoreInfoViewPage({super.key});

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
        mobile: (BuildContext context) => companyMoreInfoMobileView(context),
        tablet: (BuildContext context) => companyMoreInfoWebView(context),
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
            KalakarConstants.moreInfo,
            style: TextStyle(
                color: KalakarColors.textColor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w500),
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
            KalakarConstants.moreInfo,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 6.sp),
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

  companyMoreInfoMobileView(BuildContext context) {
    return GetBuilder<ArtistProfileController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: DefaultTabController(
            length: 3, // Number of tabs
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center the content vertically
              children: [
                TabBar(
                  tabs: [
                    Text(KalakarConstants.personal),
                    Text(KalakarConstants.interest),
                    Text(KalakarConstants.qualificationNSkills),
                  ],
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  tabAlignment: TabAlignment.center,
                  labelColor: KalakarColors.purple,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: KalakarColors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat',
                  ),
                  dividerHeight: 0.0,
                ),
                Container(
                  height: Get.size.height - 150.h,
                  child: TabBarView(
                    children: [
                      mobilePersonalDetails(controller, context),
                      mobileInterestDetails(controller, context),
                      mobileQualificationNSkillsDetails(controller, context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  educationLoadingMobile() {
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
                      height: 15.h,
                      width: 80.h,
                      color: KalakarColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Shimmer.fromColors(
                    baseColor: KalakarColors.blue10,
                    highlightColor: KalakarColors.blue20,
                    child: Container(
                      height: 15.h,
                      width: 20.h,
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
                  height: 15.h,
                  width: 80.h,
                  color: KalakarColors.white,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Shimmer.fromColors(
                baseColor: KalakarColors.blue10,
                highlightColor: KalakarColors.blue20,
                child: Container(
                  height: 15.h,
                  width: 80.h,
                  color: KalakarColors.white,
                ),
              ),
              SizedBox(
                height: 4.h,
              )
            ],
          );
        });
  }

  companyMoreInfoWebView(BuildContext context) {
    return GetBuilder<ArtistProfileController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:16.h,horizontal: 48.w
          ),
          child: DefaultTabController(
            length: 3, // Number of tabs
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center the content vertically
              children: [
                TabBar(
                  tabs: [
                    Text(KalakarConstants.personal),
                    Text(KalakarConstants.interest),
                    Text(KalakarConstants.qualificationNSkills),
                  ],
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  tabAlignment: TabAlignment.center,
                  labelColor: KalakarColors.purple,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: KalakarColors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat',
                  ),
                  dividerHeight: 0.0,
                ),
                Container(
                  height: Get.size.height - 150.h,
                  child: TabBarView(
                    children: [
                      webPersonalDetails(controller, context),
                      webInterestDetails(controller, context),
                      webQualificationNSkillsDetails(controller, context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  textSpanToShow(BuildContext context, String title, String titleData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          height: 8.h,
          width: double.infinity,
        ),
      ],
    );
  }

  textSpanToShow1(BuildContext context, String title, String titleData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.sp),
              ),
              TextSpan(
                text: titleData,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 5.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
          width: double.infinity,
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

  mobilePersonalDetails(
      ArtistProfileController controller, BuildContext context) {
    if(controller.isArtist){
      ArtistProfileDetailsClass profileDetails = controller
          .artistProfileDetails;
      DateTime dob = DateTime.parse(profileDetails.dateOfBirth.toString());
      DateFormat formatter = DateFormat('dd MMM, yyyy');
      return RefreshIndicator(
        onRefresh: () async {
          controller.getArtistPersonalData();
        },
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),

                  color: KalakarColors.white,
                  border: Border.all(color: KalakarColors.backgroundGrey),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: KalakarColors.backgroundGrey,
                  //     spreadRadius: 1,
                  //     blurRadius: 1,
                  //   ),
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSpanToShow(context, "${KalakarConstants.name} : ",
                        "${profileDetails.firstName} ${profileDetails
                            .middleName} ${profileDetails.lastName}"),
                    textSpanToShow(context, "${KalakarConstants.dob} : ",
                        "${formatter.format(dob)} "),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: textSpanToShow(
                              context,
                              "${KalakarConstants.age} : ",
                              "${profileDetails.age
                                  .toString()
                                  .split(".")
                                  .first} "),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: textSpanToShow(
                              context,
                              "${KalakarConstants.height} : ",
                              "${profileDetails.height} ft"),
                        ),
                        Expanded(
                          child: textSpanToShow(
                              context,
                              "${KalakarConstants.weight} : ",
                              "${profileDetails.weight} Kg"),
                        )
                      ],
                    ),
                    textSpanToShow(
                        context,
                        "${KalakarConstants.whatsappNumber} : ",
                        "${profileDetails.mobileNumber}"),
                    textSpanToShow(context, "${KalakarConstants.email} : ",
                        "${profileDetails.email}"),
                    textSpanToShow(context, "${KalakarConstants.address} : ",
                        "${profileDetails.address1}, ${profileDetails
                            .address2}, ${profileDetails
                            .district}, ${profileDetails
                            .state}, ${profileDetails.postalcode}"),
                    textSpanToShow(
                        context,
                        "${KalakarConstants.languageKnown} : ",
                        "${profileDetails.languageKnown}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: textSpanToShow(
                              context,
                              "${KalakarConstants.hairColor} : ",
                              "${profileDetails.hairColor}"),
                        ),
                        Expanded(
                          child: textSpanToShow(
                              context,
                              "${KalakarConstants.bodyType} : ",
                              "${profileDetails.bodyType}"),
                        )
                      ],
                    ),
                    textSpanToShow(
                        context,
                        "${KalakarConstants.maritalStatus} : ",
                        "${profileDetails.maritalStatus}"),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: KalakarColors.white,
                  border: Border.all(color: KalakarColors.backgroundGrey),
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
                                  "Edit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    controller.isArtistProfileComfortableInLoading
                        ? commonLoadingMobile()
                        : controller.artistComfortableInList.isNotEmpty
                        ? ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                        controller.artistComfortableInList.length,
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
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              )
                            ],
                          );
                        })
                        : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Text("Unable To Get Comforatble In Data"),
                          SizedBox(
                            height: 16.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller
                                  .getArtistProfileComfortableIn(0);
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
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),

                  color: KalakarColors.white,
                  border: Border.all(color: KalakarColors.backgroundGrey),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: KalakarColors.backgroundGrey,
                  //     spreadRadius: 1,
                  //     blurRadius: 1,
                  //   ),
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${KalakarConstants.artistDocuments} : ",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              Get.toNamed(RouteHelper.artistDocumentForm);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.h)),
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    controller.isArtistDocumentsLoading
                        ? Container()
                        : controller.artistDocumentsList.isNotEmpty
                        ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 155.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: KalakarColors.backgroundGrey),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                controller.artistDocumentsList[0]
                                    .fileCorporationCard!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/NA.jpg",
                                    // Default fallback image
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          )
                          ,
                          SizedBox(
                            width: 8.h,
                          ),
                          Container(
                            height: 155.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: KalakarColors.backgroundGrey),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                controller.artistDocumentsList[0].passport!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/NA.jpg",
                                    // Default fallback image
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          )
                          ,
                          SizedBox(
                            width: 8.h,
                          ),
                          Container(
                            height: 155.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: KalakarColors.backgroundGrey),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                controller.artistDocumentsList[0].adharCard
                                    .toString(),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/NA.jpg",
                                    // Default fallback image
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          )
                          ,
                        ],
                      ),
                    )
                        : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Text("Unable To Get Personal Documents Data"),
                          SizedBox(
                            height: 16.h,
                          ),
                          InkWell(
                            onTap: () {
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
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      );
    }
    else{



      return GetBuilder<RequirementController>(
        builder: (requirementController) {
          artist_profile.GetArtistProfileModelForRequirememt artistData = requirementController
              .artistData!;
          DateFormat formatter = DateFormat('dd-MM-yyyy');
          DateTime dob = DateTime.parse(artistData.dateOfBirth.toString());
          return RefreshIndicator(
            onRefresh: () async {
              controller.getArtistPersonalData();
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),

                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: KalakarColors.backgroundGrey,
                      //     spreadRadius: 1,
                      //     blurRadius: 1,
                      //   ),
                      // ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textSpanToShow(context, "${KalakarConstants.name} : ",
                            "${artistData.firstName} ${artistData.middleName} ${artistData.lastName}"),
                        textSpanToShow(context, "${KalakarConstants.dob} : ",
                            "${formatter.format(dob)} "),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.age} : ",
                                  "${artistData.age.toString().split(".").first} "),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.height} : ",
                                  "${artistData.height} ft"),
                            ),
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.weight} : ",
                                  "${artistData.weight} Kg"),
                            )
                          ],
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.whatsappNumber} : ",
                            "${artistData.mobileNumber}"),
                        textSpanToShow(context, "${KalakarConstants.email} : ",
                            "${artistData.email}"),
                        textSpanToShow(context, "${KalakarConstants.address} : ",
                            "${artistData.address1}, ${artistData.address2}, ${artistData.district}, ${artistData.state}, ${artistData.postalcode}"),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.languageKnown} : ",
                            "${artistData.languageKnown}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.hairColor} : ",
                                  "${artistData.hairColor}"),
                            ),
                            Expanded(
                              child: textSpanToShow(
                                  context,
                                  "${KalakarConstants.bodyType} : ",
                                  "${artistData.bodyType}"),
                            )
                          ],
                        ),
                        textSpanToShow(
                            context,
                            "${KalakarConstants.maritalStatus} : ",
                            "${artistData.maritalStatus}"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
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

                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        requirementController.artistComfortableInData.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                    requirementController.artistComfortableInData.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      artist_profile.ComfortableInList comfortableInData =
                                      requirementController.artistComfortableInData[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          )
                                        ],
                                      );
                                    })
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("No Comforatble In Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                      ],
                                    ),
                                  ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  /*Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),

                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: KalakarColors.backgroundGrey,
                      //     spreadRadius: 1,
                      //     blurRadius: 1,
                      //   ),
                      // ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${KalakarConstants.artistDocuments} : ",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  Get.toNamed(RouteHelper.artistDocumentForm);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4.h)),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        controller.isArtistDocumentsLoading
                            ? Container()
                            : controller.artistDocumentsList.isNotEmpty
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 155.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            border: Border.all(
                                                color:
                                                    KalakarColors.backgroundGrey),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            child: Image.network(
                                              controller.artistDocumentsList[0]
                                                  .fileCorporationCard!,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg",
                                                  // Default fallback image
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.h,
                                        ),
                                        Container(
                                          height: 155.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            border: Border.all(
                                                color:
                                                    KalakarColors.backgroundGrey),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            child: Image.network(
                                              controller
                                                  .artistDocumentsList[0].passport!,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg",
                                                  // Default fallback image
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.h,
                                        ),
                                        Container(
                                          height: 155.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            border: Border.all(
                                                color:
                                                    KalakarColors.backgroundGrey),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            child: Image.network(
                                              controller
                                                  .artistDocumentsList[0].adharCard
                                                  .toString(),
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/NA.jpg",
                                                  // Default fallback image
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text(
                                            "Unable To Get Personal Documents Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
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
                      ],
                    ),
                  ),*/
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          );
        }
      );
    }
  }

  mobileInterestDetails(
      ArtistProfileController controller, BuildContext context) {
    if (controller.isArtist) {
      return RefreshIndicator(
            onRefresh: () async {
              controller.getArtistInterestData();
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
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
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        controller.isArtistProfileInterestedInLoading
                            ? commonLoadingMobile()
                            : controller.artistInterestedInList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.artistInterestedInList.length,
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
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          )
                                        ],
                                      );
                                    })
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("Unable To Get Interested In Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getArtistProfileInterest(0);
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
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
                        controller.isArtistProfileHobbiesLoading
                            ? commonLoadingMobile()
                            : controller.artistHobbiesList.isNotEmpty
                                ? ListView.builder(
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
                                                    controller.setEditHobbiesData(
                                                        hobbiesData);
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
                                    })
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("Unable To Get Hobbies Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getArtistProfileHobbies(0);
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
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          );
    } else {
      return GetBuilder<RequirementController>(
        builder: (requirementController) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
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
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),

                      requirementController.artistInterestInData.isNotEmpty
                          ? ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                          requirementController.artistInterestInData.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            artist_profile.InterestList interestInData =
                            requirementController.artistInterestInData[index];
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
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                )
                              ],
                            );
                          })
                          : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Text("No Interested In Data"),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
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
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      requirementController.artistHobbiesData.isNotEmpty
                          ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: requirementController.artistHobbiesData.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            artist_profile.HobbiesList hobbiesData =
                            requirementController.artistHobbiesData[index];
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
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                )
                              ],
                            );
                          })
                          : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Text("No Hobbies Data"),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          );
        }
      );
    }


  }

  mobileQualificationNSkillsDetails(
      ArtistProfileController controller, BuildContext context) {
    if (controller.isArtist) {
      return RefreshIndicator(
            onRefresh: () async {
              controller.getArtistQualificationData();
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),

                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: KalakarColors.backgroundGrey,
                      //     spreadRadius: 1,
                      //     blurRadius: 1,
                      //   ),
                      // ],
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
                        controller.isArtistProfileEducationLoading
                            ? educationLoadingMobile()
                            : controller.artistEducationList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.artistEducationList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      EducationList educationData =
                                          controller.artistEducationList[index];
                                      DateTime courseEndDate = DateTime.parse(
                                          educationData.courseEndDate.toString());
                                      DateFormat formatter = DateFormat('dd-MM-yyyy');
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 12.h),
                                        padding: EdgeInsets.all( 8.h),
                                        decoration: BoxDecoration(
                                          color: KalakarColors.white,
                                          borderRadius: BorderRadius.circular(8.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
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
                                                      controller.setEducationData(
                                                          educationData);
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
                                              formatter.format(courseEndDate),
                                              style: TextStyle(fontSize: 14.sp),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("Unable To Get Education Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getArtistProfileEducation(0);
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${KalakarConstants.applyFor} : ",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  controller.setEditApplyForData(null);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4.h)),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        controller.isArtistProfileApplyForLoading
                            ? commonLoadingMobile()
                            : controller.artistApplyForList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.artistApplyForList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      ApplyList applyForData =
                                          controller.artistApplyForList[index];
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            applyForData.applyName!,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          )
                                        ],
                                      );
                                    })
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("Unable To Get Apply For Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getArtistProfileApplyFor(0);
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
              ),
            ),
          );
    } else {
      return GetBuilder<RequirementController>(
        builder: (requirementController) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),

                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: KalakarColors.backgroundGrey,
                    //     spreadRadius: 1,
                    //     blurRadius: 1,
                    //   ),
                    // ],
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
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      requirementController.artistEducationData.isNotEmpty
                          ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: requirementController.artistEducationData.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            artist_profile.EducationList educationData =
                            requirementController.artistEducationData[index];
                            DateTime courseEndDate = DateTime.parse(
                                educationData.courseEndDate.toString());
                            DateFormat formatter = DateFormat('dd-MM-yyyy');
                            return InkWell(
                              onTap: (){
                                requirementController.selectedEducationData=educationData;
                                Get.toNamed(RouteHelper.artistEducationForm);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                padding: EdgeInsets.all( 8.h),
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                                child: Column(
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
                                      ],
                                    ),
                                    Text(
                                      educationData.universityOrInstitute!,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    Text(
                                      formatter.format(courseEndDate),
                                      style: TextStyle(fontSize: 14.sp),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Text("No Education Data"),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${KalakarConstants.applyFor} : ",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                       requirementController.artistApplyData.isNotEmpty
                          ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: requirementController.artistApplyData.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            artist_profile.ApplyList applyForData =
                            requirementController.artistApplyData[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  applyForData.applyName!,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4.h,
                                )
                              ],
                            );
                          })
                          : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Text("No Apply For Data"),
                            SizedBox(
                              height: 16.h,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      );
    }


  }

  webPersonalDetails(ArtistProfileController controller, BuildContext context) {
    if (controller.isArtist) {
      ArtistProfileDetailsClass profileDetails = controller.artistProfileDetails;
      DateTime dob = DateTime.parse(profileDetails.dateOfBirth.toString());
      DateFormat formatter = DateFormat('dd MMM, yyyy');
      return RefreshIndicator(
        onRefresh: () async {
          controller.getArtistPersonalData();
        },
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),

                  color: KalakarColors.white,
                  border: Border.all(color: KalakarColors.backgroundGrey),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: KalakarColors.backgroundGrey,
                  //     spreadRadius: 1,
                  //     blurRadius: 1,
                  //   ),
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSpanToShow1(context, "${KalakarConstants.name} : ",
                        "${profileDetails.firstName} ${profileDetails.middleName} ${profileDetails.lastName}"),
                    textSpanToShow1(context, "${KalakarConstants.dob} : ",
                        "${formatter.format(dob)} "),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: textSpanToShow1(
                              context,
                              "${KalakarConstants.age} : ",
                              "${profileDetails.age.toString().split(".").first} "),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: textSpanToShow1(
                              context,
                              "${KalakarConstants.height} : ",
                              "${profileDetails.height} ft"),
                        ),
                        Expanded(
                          child: textSpanToShow1(
                              context,
                              "${KalakarConstants.weight} : ",
                              "${profileDetails.weight} Kg"),
                        )
                      ],
                    ),
                    textSpanToShow1(
                        context,
                        "${KalakarConstants.whatsappNumber} : ",
                        "${profileDetails.mobileNumber}"),
                    textSpanToShow1(context, "${KalakarConstants.email} : ",
                        "${profileDetails.email}"),
                    textSpanToShow1(context, "${KalakarConstants.address} : ",
                        "${profileDetails.address1}, ${profileDetails.address2}, ${profileDetails.district}, ${profileDetails.state}, ${profileDetails.postalcode}"),
                    textSpanToShow1(
                        context,
                        "${KalakarConstants.languageKnown} : ",
                        "${profileDetails.languageKnown}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: textSpanToShow1(
                              context,
                              "${KalakarConstants.hairColor} : ",
                              "${profileDetails.hairColor}"),
                        ),
                        Expanded(
                          child: textSpanToShow1(
                              context,
                              "${KalakarConstants.bodyType} : ",
                              "${profileDetails.bodyType}"),
                        )
                      ],
                    ),
                    textSpanToShow1(
                        context,
                        "${KalakarConstants.maritalStatus} : ",
                        "${profileDetails.maritalStatus}"),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: KalakarColors.white,
                  border: Border.all(color: KalakarColors.backgroundGrey),
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
                              fontSize: 6.sp, fontWeight: FontWeight.bold),
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
                                  "Edit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 4.sp),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    controller.isArtistProfileComfortableInLoading
                        ? commonLoadingMobile()
                        : controller.artistComfortableInList.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    controller.artistComfortableInList.length,
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
                                                fontSize: 5.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      )
                                    ],
                                  );
                                })
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text("Unable To Get Comforatble In Data"),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller
                                            .getArtistProfileComfortableIn(0);
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
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),

                  color: KalakarColors.white,
                  border: Border.all(color: KalakarColors.backgroundGrey),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: KalakarColors.backgroundGrey,
                  //     spreadRadius: 1,
                  //     blurRadius: 1,
                  //   ),
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${KalakarConstants.artistDocuments} : ",
                          style: TextStyle(
                              fontSize: 6.sp, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              Get.toNamed(RouteHelper.artistDocumentForm);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.h)),
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 4.sp),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    controller.isArtistDocumentsLoading
                        ? Container()
                        : controller.artistDocumentsList.isNotEmpty
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 255.h,
                                      width: 200.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(color: KalakarColors.backgroundGrey),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.r),
                                        child: Image.network(
                                          controller.artistDocumentsList[0].fileCorporationCard!,
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
                                    SizedBox(
                                      width: 8.h,
                                    ),
                                    Container(
                                      height: 255.h,
                                      width: 200.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(color: KalakarColors.backgroundGrey),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.r),
                                        child: Image.network(
                                          controller.artistDocumentsList[0].passport!,
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
                                    SizedBox(
                                      width: 8.h,
                                    ),
                                    Container(
                                      height: 255.h,
                                      width: 200.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(color: KalakarColors.backgroundGrey),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.r),
                                        child: controller.artistDocumentsList[0].adharCard != null &&
                                            controller.artistDocumentsList[0].adharCard!.isNotEmpty
                                            ? Image.network(
                                          controller.artistDocumentsList[0].adharCard!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Image.asset(
                                              "assets/images/NA.jpg", // Default fallback image
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        )
                                            : Image.asset(
                                          "assets/images/NA.jpg", // Default fallback image if URL is null/empty
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                    ,
                                  ],
                                ),
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text("Unable To Get Personal Documents Data"),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    InkWell(
                                      onTap: () {
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
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      );
    }
    else{

      return GetBuilder<RequirementController>(

        builder: (requirementController) {
          artist_profile.GetArtistProfileModelForRequirememt artistData = requirementController
              .artistData!;
          DateFormat formatter = DateFormat('dd-MM-yyyy');
          DateTime dob = DateTime.parse(artistData.dateOfBirth.toString());
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),

                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: KalakarColors.backgroundGrey,
                    //     spreadRadius: 1,
                    //     blurRadius: 1,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSpanToShow1(context, "${KalakarConstants.name} : ",
                          "${artistData.firstName} ${artistData.middleName} ${artistData.lastName}"),
                      textSpanToShow1(context, "${KalakarConstants.dob} : ",
                          "${formatter.format(dob)} "),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: textSpanToShow1(
                                context,
                                "${KalakarConstants.age} : ",
                                "${artistData.age.toString().split(".").first} "),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: textSpanToShow1(
                                context,
                                "${KalakarConstants.height} : ",
                                "${artistData.height} ft"),
                          ),
                          Expanded(
                            child: textSpanToShow1(
                                context,
                                "${KalakarConstants.weight} : ",
                                "${artistData.weight} Kg"),
                          )
                        ],
                      ),
                      textSpanToShow1(
                          context,
                          "${KalakarConstants.whatsappNumber} : ",
                          "${artistData.mobileNumber}"),
                      textSpanToShow1(context, "${KalakarConstants.email} : ",
                          "${artistData.email}"),
                      textSpanToShow1(context, "${KalakarConstants.address} : ",
                          "${artistData.address1}, ${artistData.address2}, ${artistData.district}, ${artistData.state}, ${artistData.postalcode}"),
                      textSpanToShow1(
                          context,
                          "${KalakarConstants.languageKnown} : ",
                          "${artistData.languageKnown}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: textSpanToShow1(
                                context,
                                "${KalakarConstants.hairColor} : ",
                                "${artistData.hairColor}"),
                          ),
                          Expanded(
                            child: textSpanToShow1(
                                context,
                                "${KalakarConstants.bodyType} : ",
                                "${artistData.bodyType}"),
                          )
                        ],
                      ),
                      textSpanToShow1(
                          context,
                          "${KalakarConstants.maritalStatus} : ",
                          "${artistData.maritalStatus}"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
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
                                fontSize: 6.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                       requirementController.artistComfortableInData.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                  requirementController.artistComfortableInData.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    artist_profile.ComfortableInList comfortableInData =
                                    requirementController.artistComfortableInData[index];
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
                                                  fontSize: 5.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        )
                                      ],
                                    );
                                  })
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text("No Comforatble In Data"),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                    ],
                                  ),
                                ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                /*Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),

                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: KalakarColors.backgroundGrey,
                    //     spreadRadius: 1,
                    //     blurRadius: 1,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${KalakarConstants.artistDocuments} : ",
                            style: TextStyle(
                                fontSize: 6.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      controller.isArtistDocumentsLoading
                          ? Container()
                          : controller.artistDocumentsList.isNotEmpty
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 255.h,
                                        width: 200.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.r),
                                          border: Border.all(color: KalakarColors.backgroundGrey),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.network(
                                            controller.artistDocumentsList[0].fileCorporationCard!,
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
                                      SizedBox(
                                        width: 8.h,
                                      ),
                                      Container(
                                        height: 255.h,
                                        width: 200.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.r),
                                          border: Border.all(color: KalakarColors.backgroundGrey),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.network(
                                            controller.artistDocumentsList[0].passport!,
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
                                      SizedBox(
                                        width: 8.h,
                                      ),
                                      Container(
                                        height: 255.h,
                                        width: 200.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.r),
                                          border: Border.all(color: KalakarColors.backgroundGrey),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: controller.artistDocumentsList[0].adharCard != null &&
                                              controller.artistDocumentsList[0].adharCard!.isNotEmpty
                                              ? Image.network(
                                            controller.artistDocumentsList[0].adharCard!,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Image.asset(
                                                "assets/images/NA.jpg", // Default fallback image
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          )
                                              : Image.asset(
                                            "assets/images/NA.jpg", // Default fallback image if URL is null/empty
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                      ,
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text("Unable To Get Personal Documents Data"),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      InkWell(
                                        onTap: () {
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
                    ],
                  ),
                ),*/
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          );
        }
      );
    }
  }

  webInterestDetails(ArtistProfileController controller, BuildContext context) {
    if (controller.isArtist) {
      return RefreshIndicator(
            onRefresh: () async {
              controller.getArtistInterestData();
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
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
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
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
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 4.sp),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        controller.isArtistProfileInterestedInLoading
                            ? commonLoadingMobile()
                            : controller.artistInterestedInList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.artistInterestedInList.length,
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
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          )
                                        ],
                                      );
                                    })
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("Unable To Get Interested In Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getArtistProfileInterest(0);
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
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
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
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
                                          fontSize: 4.sp),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        controller.isArtistProfileHobbiesLoading
                            ? commonLoadingMobile()
                            : controller.artistHobbiesList.isNotEmpty
                                ? ListView.builder(
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
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    controller.setEditHobbiesData(
                                                        hobbiesData);
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
                                      );
                                    })
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("Unable To Get Hobbies Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getArtistProfileHobbies(0);
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
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          );
    } else {
      return GetBuilder<RequirementController>(
        builder: (requirementController) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
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
                                fontSize: 6.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      requirementController.artistInterestInData.isNotEmpty
                          ? ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                          requirementController.artistInterestInData.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            artist_profile.InterestList interestInData =
                            requirementController.artistInterestInData[index];
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
                                          fontSize: 5.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                )
                              ],
                            );
                          })
                          : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Text("No Interested In Data"),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
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
                                fontSize: 6.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      requirementController.artistHobbiesData.isNotEmpty
                          ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: requirementController.artistHobbiesData.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            artist_profile.HobbiesList hobbiesData =
                            requirementController.artistHobbiesData[index];
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
                                          fontSize: 5.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                )
                              ],
                            );
                          })
                          : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Text("No Hobbies Data"),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          );
        }
      );
    }

  }

  webQualificationNSkillsDetails(
      ArtistProfileController controller, BuildContext context) {
    if (controller.isArtist) {
      return RefreshIndicator(
            onRefresh: () async {
              controller.getArtistQualificationData();
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),

                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: KalakarColors.backgroundGrey,
                      //     spreadRadius: 1,
                      //     blurRadius: 1,
                      //   ),
                      // ],
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
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
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
                                          fontSize: 4.sp),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        controller.isArtistProfileEducationLoading
                            ? educationLoadingMobile()
                            : controller.artistEducationList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.artistEducationList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      EducationList educationData =
                                          controller.artistEducationList[index];
                                      DateTime courseEndDate = DateTime.parse(
                                          educationData.courseEndDate.toString());
                                      DateFormat formatter = DateFormat('dd-MM-yyyy');
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 12.h),
                                        padding: EdgeInsets.all( 8.h),
                                        decoration: BoxDecoration(
                                          color: KalakarColors.white,
                                          borderRadius: BorderRadius.circular(8.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  educationData.course!,
                                                  style: TextStyle(
                                                      fontSize: 5.sp,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      controller.setEducationData(
                                                          educationData);
                                                    },
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 8.sp,
                                                    )),
                                              ],
                                            ),
                                            Text(
                                              educationData.universityOrInstitute!,
                                              style: TextStyle(fontSize: 6.sp),
                                            ),
                                            Text(
                                              formatter.format(courseEndDate),
                                              style: TextStyle(fontSize: 6.sp),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("Unable To Get Education Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getArtistProfileEducation(0);
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${KalakarConstants.applyFor} : ",
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  controller.setEditApplyForData(null);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4.h)),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 4.sp),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        controller.isArtistProfileApplyForLoading
                            ? commonLoadingMobile()
                            : controller.artistApplyForList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.artistApplyForList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      ApplyList applyForData =
                                          controller.artistApplyForList[index];
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            applyForData.applyName!,
                                            style: TextStyle(
                                                fontSize: 5.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          )
                                        ],
                                      );
                                    })
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text("Unable To Get Apply For Data"),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getArtistProfileApplyFor(0);
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
              ),
            ),
          );
    } else {
      return GetBuilder<RequirementController>(
        builder: (requirementController) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),

                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: KalakarColors.backgroundGrey,
                    //     spreadRadius: 1,
                    //     blurRadius: 1,
                    //   ),
                    // ],
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
                                fontSize: 6.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      requirementController.artistEducationData.isNotEmpty
                          ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: requirementController.artistEducationData.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            artist_profile.EducationList educationData =
                            requirementController.artistEducationData[index];
                            DateTime courseEndDate = DateTime.parse(
                                educationData.courseEndDate.toString());
                            DateFormat formatter = DateFormat('dd-MM-yyyy');
                            return InkWell(
                              onTap: (){
                                requirementController.selectedEducationData=educationData;
                                Get.toNamed(RouteHelper.artistEducationForm);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                padding: EdgeInsets.all( 8.h),
                                decoration: BoxDecoration(
                                  color: KalakarColors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          educationData.course!,
                                          style: TextStyle(
                                              fontSize: 5.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      educationData.universityOrInstitute!,
                                      style: TextStyle(fontSize: 6.sp),
                                    ),
                                    Text(
                                      formatter.format(courseEndDate),
                                      style: TextStyle(fontSize: 6.sp),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Text("No Education Data"),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${KalakarConstants.applyFor} : ",
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        requirementController.artistApplyData.isNotEmpty
                            ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: requirementController.artistApplyData.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              artist_profile.ApplyList applyForData =
                              requirementController.artistApplyData[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    applyForData.applyName!,
                                    style: TextStyle(
                                        fontSize: 5.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  )
                                ],
                              );
                            })
                            : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Text("No Apply Data"),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        }
      );

    }

  }
}
