import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/data/models/artist/applied_requirement_list_class.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/models/company/company_requirement_list_class.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class MyApplicationsPage extends StatelessWidget {
  const MyApplicationsPage({super.key});

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
        mobile: (BuildContext context) => myApplicationsMobileView(),
        tablet: (BuildContext context) => myApplicationsWebView(context),
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
            KalakarConstants.myApplications,
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
            KalakarConstants.myApplications,
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

  myApplicationsMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: ()async{
          controller.getAppliedForRequirementArtist();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
            child: Column(
          children: [
            controller.isArtistAppliedRequirementsLoading?ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 80.h,
                                  width: 80.h,
                                  color: KalakarColors.white,
                                ),
                              ),),
                          Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.all(8.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 28.h,
                                        width: 80.h,
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 18.h,
                                        width: 80.h,
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: KalakarColors.blue10,
                                          highlightColor: KalakarColors.blue20,
                                          child: Container(
                                            height: 18.h,
                                            width: 50.h,
                                            color: KalakarColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: KalakarColors.blue10,
                                          highlightColor: KalakarColors.blue20,
                                          child: Container(
                                            height: 20.h,
                                            width: 50.h,
                                            color: KalakarColors.white,
                                          ),
                                        ),Shimmer.fromColors(
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
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                }):
           controller.artistAppliedRequirementDetailsList.isNotEmpty? ListView.builder(
                itemCount: controller.artistAppliedRequirementDetailsList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  ArtistAppliedRequirementDetailsList requirementData =
                      controller.artistAppliedRequirementDetailsList[index];
                  final DateFormat formatter = DateFormat('dd-MM-yyyy');
                  DateTime shootingDate =
                      DateTime.parse(requirementData!.shootingStartDate!);
                  String date = formatter.format(shootingDate);
                  print(requirementData.requirementDetailsID);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.setAppliedRequirementViewData(requirementData,true);
                      },
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: requirementData.refPhotoName == null
                                    ? Container(
                                        margin: EdgeInsets.all(2.h),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.r),
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/movie.png",
                                              ),
                                              fit: BoxFit.fill,
                                            )),
                                      ) //requirementData.companyLogo ?? "",
                                    : Container(
                                        margin: EdgeInsets.all(2.h),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.r),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                requirementData.refPhotoName ??
                                                    "",
                                              ),
                                              fit: BoxFit.fill,
                                            )),
                                      )),
                            Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        requirementData.requirementTitle!,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: KalakarColors.headerText,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        requirementData.requirementDescription! ??
                                            "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(requirementData.shootingLocation!),
                                          Text(date),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(requirementData.gender!),
                                          Text(
                                              requirementData.age!.split(".")[0]),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                }):Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Text("Unable To Get Applications Data"),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      controller.getAppliedForRequirementArtist();
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
        )),
      );
    });
  }

  myApplicationsWebView(BuildContext context) {}
}
