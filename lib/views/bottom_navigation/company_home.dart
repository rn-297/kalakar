import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/requirement_controller.dart';
import '../../data/models/artist/review_details_class.dart';
import '../../data/models/artist/upcoming_company_projects.dart';
import '../../data/models/company/company_requirement_list_class.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 130.h),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => appbarMobileView(),
            tablet: (BuildContext context) => appbarWebView(),
          ),
        ),
        body: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => companyHomeMobileView(),
          tablet: (BuildContext context) => companyHomeWebView(),
        ));
  }

  appbarMobileView() {
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(builder: (controller) {
      return AppBar(
        toolbarHeight: 70.h,
        backgroundColor: KalakarColors.appBarBackground1,
        surfaceTintColor: KalakarColors.appBarBackground1,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<bool>(
                future: controller.checkImageValidity(controller.companyLogo),
                builder: (context, snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Container(
                      width: 60.h,
                      height: 60.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: KalakarColors.headerText),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 50.h,
                      ),
                    );
                  } else {
                    return Container(
                      height: 60.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(controller.profilePic)),
                          border: Border.all(color: KalakarColors.headerText),
                          borderRadius: BorderRadius.circular(50.r)),
                    );
                  }
                }),
            SizedBox(
              width: 8.w,
            ),
            Text(
              controller.companyName ?? "",
              style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
            ),
          ],
        ),
        actions: [
          // Icon(
          //   Icons.notifications,
          //   size: 35,
          // ),
          SizedBox(
            width: 20.w,
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50.h),
          child: InkWell(
            onTap: () {
              Get.toNamed(RouteHelper.companySearchArtistPage);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: TextField(
                //controller: controller,
                style: TextStyle(color: KalakarColors.textColor),
                // obscureText: passwordVisibility,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),

                  // labelText: KalakarConstants.searchAnything,
                  // labelStyle: TextStyle(color: labelColor),
                  hintText: KalakarConstants.searchArtist,
                  fillColor: KalakarColors.white,
                  filled: true,
                  enabled: false,
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: KalakarColors.buttonText,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  appbarWebView() {
    return GetBuilder<ProfileController>(builder: (controller) {
      return AppBar(
        toolbarHeight: 70.h,
        backgroundColor: KalakarColors.lightAppBarBackground,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60.h,
              width: 60.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(controller.companyLogo)),
                  border: Border.all(color: KalakarColors.headerText),
                  borderRadius: BorderRadius.circular(50.r)),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              controller.profileData!.name ?? "",
              style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.notifications,
            size: 35,
          ),
          SizedBox(
            width: 20.w,
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 70.h),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ], borderRadius: BorderRadius.circular(50.r)),
            child: TextField(
              //controller: controller,
              style: TextStyle(color: KalakarColors.textColor),
              // obscureText: passwordVisibility,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.white),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.white),
                ),

                // labelText: KalakarConstants.searchAnything,
                // labelStyle: TextStyle(color: labelColor),
                hintText: KalakarConstants.searchArtist,
                fillColor: KalakarColors.white,
                filled: true,
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: KalakarColors.buttonText,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  companyHomeMobileView() {
    /*return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              KalakarConstants.openOpportunities,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: Get.size.height / 3,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8.h),
                      width: Get.size.width/1.8,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                        color: KalakarColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            width: Get.size.width/1.8,
                            decoration: BoxDecoration(
                                color: KalakarColors.appBarBackground,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      color:
                                      KalakarColors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                    "OP NO. 001",
                                    style:
                                    TextStyle(color: KalakarColors.white,fontSize: 15.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Good Looking Actors",
                                  style: TextStyle(
                                      color: KalakarColors.white,
                                      fontSize: 15.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(color: KalakarColors.white,fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "20-28 Years",
                                  style: TextStyle(color: KalakarColors.white,fontSize: 14.sp),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );*/

    return Container(
      color: KalakarColors.appBarBackground1,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: GetBuilder<RequirementController>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            controller.getRequirementDetailsCompany(0);
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      KalakarConstants.newOpportunities,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        KalakarConstants.seeAll,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    )
                  ],
                ),
                Container(
                  height: Get.size.height / 2.8,
                  child: controller.isArtistHomeRequirementsLoading
                      ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              right: 8.h, top: 8.h, bottom: 8.h),
                          padding: EdgeInsets.all(8.h),
                          width: Get.size.width / 2,
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            border: Border.all(
                                color: KalakarColors.backgroundGrey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Align(
                                //     alignment: Alignment.centerRight,
                                //     child: Icon(CupertinoIcons.suit_heart)),
                                SizedBox(
                                  height: 8.h,
                                ),
                                ClipOval(
                                  // Image radius
                                  child: Shimmer.fromColors(
                                    baseColor: KalakarColors.blue10,
                                    highlightColor: KalakarColors.blue20,
                                    child: Container(
                                      height: 80.h,
                                      width: 80.h,
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
                                    height: 30.h,
                                    width: 100.h,
                                    color: KalakarColors.white,
                                  ),
                                ),
                                Divider(
                                  color: KalakarColors.backgroundGrey,
                                  height: 20,
                                  thickness: 2,
                                  // indent: 20,
                                  // endIndent: 20,
                                ),
                                Container(
                                  color: KalakarColors.white,
                                  padding: EdgeInsets.all(4.h),
                                  child: Container(
                                    margin: EdgeInsets.all(4.h),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 16.w),
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ], color: KalakarColors.white),
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
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.cake),
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
                                    Expanded(child: Container())
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.person),
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
                                    Expanded(child: Container())
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.location_on),
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
                                    Expanded(child: Container())
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.calendar_month),
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
                                    Expanded(child: Container())
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                      : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.newRequirementDetailsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        ObjResponesRequirementDetailsList requirement =
                        controller.newRequirementDetailsList[index];
                        DateTime shootingStartDate = DateTime.parse(
                            requirement.shootingStartDate.toString());
                        DateFormat formatter = DateFormat('dd-MM-yyyy');
                        return InkWell(
                          onTap: () {
                            controller.setRequirementViewData(
                                requirement, false);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                right: 8.h, top: 8.h, bottom: 8.h),
                            padding: EdgeInsets.all(8.h),
                            width: Get.size.width / 2,
                            decoration: BoxDecoration(
                              color: KalakarColors.white,
                              border: Border.all(
                                  color: KalakarColors.backgroundGrey),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
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
                                      errorBuilder: (BuildContext context,
                                          Object error,
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
                                  Text(requirement
                                      .companyNameProductionhouse!),
                                  Divider(
                                    color: KalakarColors.backgroundGrey,
                                    height: 20,
                                    thickness: 2,
                                    // indent: 20,
                                    // endIndent: 20,
                                  ),
                                  Container(
                                    color: KalakarColors.white,
                                    padding: EdgeInsets.all(4.h),
                                    child: InkWell(
                                        child: Container(
                                          margin: EdgeInsets.all(4.h),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.h, horizontal: 16.w),
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                            ),
                                          ], color: KalakarColors.white),
                                          child: Text(requirement.lookingFor!),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Icon(Icons.cake),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(requirement.age!
                                            .contains(".")
                                            ? requirement.age!
                                            .split(".")
                                            .first +
                                            " Years"
                                            : requirement.age! + " Years"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Icon(Icons.person),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(requirement.gender!),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Icon(Icons.location_on),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                            requirement.shootingLocation!),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Icon(Icons.calendar_month),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(formatter
                                            .format(shootingStartDate)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 16.h,
                ),*/
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        KalakarConstants.openOpportunities,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      controller.isRequirementsLoading
                          ? SizedBox(
                              height: Get.size.height / 3.5,
                              child: ListView.builder(
                                  itemCount: 3,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: 2.h, right: 12.h),
                                      width: Get.size.width / 1.8,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                        color: KalakarColors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.h),
                                            width: Get.size.width / 1.8,
                                            decoration: BoxDecoration(
                                                color: index % 2 == 0
                                                    ? KalakarColors
                                                        .appBarBackground
                                                    : Colors.deepOrangeAccent,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(12.r),
                                                  topRight:
                                                      Radius.circular(12.r),
                                                )),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Shimmer.fromColors(
                                                  baseColor:
                                                      KalakarColors.blue10,
                                                  highlightColor:
                                                      KalakarColors.blue20,
                                                  child: Container(
                                                    height: 30.h,
                                                    width: 100.h,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            KalakarColors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.r)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor:
                                                      KalakarColors.blue10,
                                                  highlightColor:
                                                      KalakarColors.blue20,
                                                  child: Container(
                                                    height: 15.h,
                                                    width: 150.h,
                                                    color: KalakarColors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor:
                                                      KalakarColors.blue10,
                                                  highlightColor:
                                                      KalakarColors.blue20,
                                                  child: Container(
                                                    height: 15.h,
                                                    width: 100.h,
                                                    color: KalakarColors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor:
                                                      KalakarColors.blue10,
                                                  highlightColor:
                                                      KalakarColors.blue20,
                                                  child: Container(
                                                    height: 15.h,
                                                    width: 100.h,
                                                    color: KalakarColors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 16.h,
                                                right: 16.h,
                                                top: 16.h,
                                                bottom: 8.h),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                      height: 30.h,
                                                      child: ListView.builder(
                                                          itemCount: 3,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Transform
                                                                .translate(
                                                              offset: Offset(
                                                                  -index * 15.0,
                                                                  0),
                                                              child: Shimmer
                                                                  .fromColors(
                                                                baseColor:
                                                                    KalakarColors
                                                                        .blue10,
                                                                highlightColor:
                                                                    KalakarColors
                                                                        .blue20,
                                                                child:
                                                                    Container(
                                                                  height: 30.h,
                                                                  width: 30.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.r),
                                                                    color: KalakarColors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                            // Image.network();
                                                          })),
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
                                          ),
                                          Shimmer.fromColors(
                                            baseColor: KalakarColors.blue10,
                                            highlightColor:
                                                KalakarColors.blue20,
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(left: 16.w),
                                              height: 20.h,
                                              width: 80.h,
                                              color: KalakarColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          : SizedBox(
                              height: Get.size.height / 3.5,
                              child: ListView.builder(
                                  itemCount: controller
                                      .openRequirementDetailsList.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    RequirementDetailsData requirement =
                                        controller
                                            .openRequirementDetailsList[index];
                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: 2.h, right: 12.h),
                                      width: Get.size.width / 1.8,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                        color: KalakarColors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          controller
                                              .getAppliedData(requirement!);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8.h),
                                              width: Get.size.width / 1.8,
                                              decoration: BoxDecoration(
                                                  color: index % 2 == 0
                                                      ? KalakarColors
                                                          .appBarBackground
                                                      : Colors.deepOrangeAccent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12.r),
                                                    topRight:
                                                        Radius.circular(12.r),
                                                  )),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(8.h),
                                                    decoration: BoxDecoration(
                                                        color: KalakarColors
                                                            .white
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r)),
                                                    child: Text(
                                                      "OP NO. ${requirement.requirementDetailsID}",
                                                      style: TextStyle(
                                                          color: KalakarColors
                                                              .white,
                                                          fontSize: 15.sp),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    "${requirement.defineRole}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color:
                                                            KalakarColors.white,
                                                        fontSize: 15.sp),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    "${requirement.shootingLocation}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color:
                                                            KalakarColors.white,
                                                        fontSize: 14.sp),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    "${requirement.age}",
                                                    style: TextStyle(
                                                        color:
                                                            KalakarColors.white,
                                                        fontSize: 14.sp),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.h,
                                                  right: 16.h,
                                                  top: 16.h,
                                                  bottom: 8.h),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                        height: 30.h,
                                                        child: ListView.builder(
                                                            itemCount: requirement
                                                                .appliedProfilePics!
                                                                .length,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Transform
                                                                  .translate(
                                                                offset: Offset(
                                                                    -index *
                                                                        15.0,
                                                                    0),
                                                                child:
                                                                    Container(
                                                                  height: 30.h,
                                                                  width: 30.h,
                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                        //"http://3.111.135.189/KalakaarDocuments\\COM-MAH-THA-2\\CompanyLogo220802024021910.jpg"
                                                                        requirement
                                                                            .appliedProfilePics![index]
                                                                            .appliedProfilePics!,
                                                                      )),
                                                                      border: Border.all(color: KalakarColors.headerText),
                                                                      borderRadius: BorderRadius.circular(50.r)),
                                                                ),
                                                              );
                                                              // Image.network();
                                                            })),
                                                  ),
                                                  Text(
                                                      requirement.appliedCount!)
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: Text(KalakarConstants
                                                  .appliedArtist),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 5.0,
                                offset: Offset(0, 5)),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              KalakarConstants.createNewOpportunity,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: KalakarColors.orange,
                              ),
                            )),
                            InkWell(
                              onTap: () {
                                controller.emptyOpportunityData();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 20.w),
                                decoration: BoxDecoration(
                                  color: KalakarColors.appBarBackground,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 5.0,
                                        offset: Offset(0, 2)),
                                  ],
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 45,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  KalakarConstants.completedOpportunities,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: DefaultTabController(
                    length: 2, // Number of tabs
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Center the content vertically
                      children: [
                        TabBar(
                          tabs: [
                            Text(KalakarConstants.draft),
                            Text(KalakarConstants.completed),
                          ],
                          labelPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 8.w),
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
                          height: 200, // Fixed height for TabBarView
                          child: TabBarView(
                            children: [
                              mobileDraftOppPage(controller),
                              mobileCompletedOppPage(controller)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  companyHomeWebView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              KalakarConstants.openOpportunities,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: Get.size.height / 3,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8.h),
                      width: Get.size.width / 3,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                        color: KalakarColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            width: Get.size.width / 1.8,
                            decoration: BoxDecoration(
                                color: KalakarColors.appBarBackground,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      color:
                                          KalakarColors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                    "OP NO. 001",
                                    style: TextStyle(
                                        color: KalakarColors.white,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Good Looking Actors",
                                  style: TextStyle(
                                      color: KalakarColors.white,
                                      fontSize: 15.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(
                                      color: KalakarColors.white,
                                      fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "20-28 Years",
                                  style: TextStyle(
                                      color: KalakarColors.white,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  mobileDraftOppPage(RequirementController controller) {
    return controller.isRequirementsLoading
        ? ListView.builder(
            itemCount: 3,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(
                  8.h,
                ),
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                    // color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 35.h,
                            color: KalakarColors.white,
                          ),
                        )),
                        SizedBox(
                          width: 4.h,
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
                      height: 8.h,
                    ),
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
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 15.h,
                            width: 80.h,
                            color: KalakarColors.white,
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 15.h,
                            width: 80.h,
                            color: KalakarColors.white,
                          ),
                        )
                      ],
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
                        color: KalakarColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Shimmer.fromColors(
                            baseColor: KalakarColors.blue10,
                            highlightColor: KalakarColors.blue20,
                            child: Container(
                              height: 18.h,
                              width: 100.h,
                              color: KalakarColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 30.h,
                            width: 70.h,
                            decoration: BoxDecoration(
                              color: KalakarColors.white,
                              borderRadius: BorderRadius.circular(20.r)
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            })
        : ListView.builder(
            itemCount: controller.draftRequirementDetailsList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              RequirementDetailsData requirementDetailsData =
                  controller.openRequirementDetailsList[index];
              DateTime createdDate =
                  DateTime.parse(requirementDetailsData.createdDate.toString());
              DateFormat formatter = DateFormat('dd MMM yyyy');
              return Container(
                margin: EdgeInsets.all(
                  8.h,
                ),
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                    // color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          requirementDetailsData.lookingFor!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        )),
                        Text(
                            "OP NO. ${requirementDetailsData.requirementDetailsID} "),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${requirementDetailsData.age}"),
                        Text("${requirementDetailsData.shootingLocation}"),
                        Text("${requirementDetailsData.gender}"),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "${requirementDetailsData.requirementDescription}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Created ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: formatter.format(createdDate),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: KalakarColors.orange),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomMobileButtonWidget(
                          text: "Edit",
                          onTap: () {
                            controller
                                .setOpportunityData(requirementDetailsData);
                          },
                          horizontalPadding: 10.w,
                          verticalPadding: 6.h,
                          fontSize: 12.sp,
                          borderRadius: 50.r,
                          boxShadow: [],
                          width: 70.w,
                          textColor: KalakarColors.white,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    )
                  ],
                ),
              );
            });
  }

  mobileCompletedOppPage(RequirementController controller) {
    return controller.isRequirementsLoading
        ? ListView.builder(
            itemCount: 3,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(
                  8.h,
                ),
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 35.h,
                            width: 100.h,
                            color: KalakarColors.white,
                          ),
                        )),
                        SizedBox(
                          width: 4.h,
                        ),
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 20.h,
                            width: 50.h,
                            color: KalakarColors.white,
                          ),
                        )
                      ],
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
                        color: KalakarColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Shimmer.fromColors(
                            baseColor: KalakarColors.blue10,
                            highlightColor: KalakarColors.blue20,
                            child: Container(
                              height: 20.h,
                              color: KalakarColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.h,
                        ),
                        Shimmer.fromColors(
                          baseColor: KalakarColors.blue10,
                          highlightColor: KalakarColors.blue20,
                          child: Container(
                            height: 30.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                                color: KalakarColors.white,
                                borderRadius: BorderRadius.circular(30.r
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            })
        : ListView.builder(
            itemCount: controller.closedRequirementDetailsList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              RequirementDetailsData requirementDetailsData =
                  controller.closedRequirementDetailsList[index];
              DateTime completedDate = DateTime.parse(
                  requirementDetailsData.shootingEndDate.toString());
              DateFormat formatter = DateFormat('dd MMM yyyy');
              return InkWell(
                onTap: () {
                  controller.getAppliedData(requirementDetailsData);
                },
                child: Container(
                  margin: EdgeInsets.all(
                    8.h,
                  ),
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            requirementDetailsData.lookingFor!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          )),
                          Text(
                              "OP NO. ${requirementDetailsData.requirementDetailsID} "),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "${requirementDetailsData.requirementDescription}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Completed ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: formatter.format(completedDate),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: KalakarColors.orange),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomMobileButtonWidget(
                            text: "Complete",
                            onTap: () {},
                            horizontalPadding: 10.w,
                            verticalPadding: 6.h,
                            fontSize: 12.sp,
                            borderRadius: 50.r,
                            boxShadow: [],
                            backgroundColor: KalakarColors.white,
                            width: 80.w,
                            textColor: KalakarColors.black,
                            fontWeight: FontWeight.normal,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
  }
}
