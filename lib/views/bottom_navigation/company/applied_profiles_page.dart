import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/data/models/company/company_applied_details_class.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../data/models/artist/review_details_class.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class AppliedProfilesPage extends StatelessWidget {
  const AppliedProfilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KalakarColors.appBarBackground1,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100.h),
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
    RequirementController controller=Get.put(RequirementController());
    return AppBar(
      toolbarHeight: 40.h,
      backgroundColor: KalakarColors.appBarBackground1,
      surfaceTintColor: KalakarColors.appBarBackground1,
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
            KalakarConstants.opportunityApplicants,
            style: TextStyle(
                color: KalakarColors.textColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 40.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: controller.searchKalakarTEController,
                decoration: InputDecoration(
                  hintText: KalakarConstants.searchKalakar,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    // Apply border radius
                    borderSide: BorderSide.none,
                  ),

                  filled: true, // Enables the background color
                  fillColor: KalakarColors.white,
                ),
              )),
              InkWell(
                onTap: (){
                  controller.filterAppliedRequirementDetailsListData();
                },
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Icon(
                    Icons.search,
                    color: KalakarColors.black,
                  ),
                ),
              )
            ],
          ),
        ),
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
            KalakarConstants.appliedProfiles,
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
      DateTime completedDate = DateTime.parse(
          controller.selectedRequirement.shootingEndDate.toString());

      DateTime createdDate = DateTime.parse(
          controller.selectedRequirement.createdDate.toString());
      DateFormat formatter = DateFormat('dd MMM yyyy');
      return RefreshIndicator(
        onRefresh: () async {
          controller.getAppliedForRequirementCompany();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(KalakarConstants.opportunity),
                SizedBox(
                  height: 8.h,
                ),
                controller.selectedRequirement.fKRequirementStatusMasterID!=3?Container(
                  margin: EdgeInsets.only(
                    bottom:8.h,
                  ),
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                controller.selectedRequirement.defineRole!,

                                style: TextStyle(
                                    fontSize: 20.sp, fontWeight: FontWeight.bold),
                              )),
                          Text(
                              "OP NO. ${controller.selectedRequirement.requirementDetailsID} "),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${controller.selectedRequirement.age}"),
                          Text("${controller.selectedRequirement.shootingLocation}"),
                          Text("${controller.selectedRequirement.gender}"),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "${controller.selectedRequirement.requirementDescription}",

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
                          // CustomMobileButtonWidget(
                          //   text: "Edit",
                          //   onTap: () {
                          //     controller
                          //         .setOpportunityData(controller.selectedRequirement);
                          //   },
                          //   horizontalPadding: 10.w,
                          //   verticalPadding: 6.h,
                          //   fontSize: 12.sp,
                          //   borderRadius: 50.r,
                          //   boxShadow: [],
                          //   width: 70.w,
                          //   textColor: KalakarColors.white,
                          //   fontWeight: FontWeight.normal,
                          // )
                        ],
                      )
                    ],
                  ),
                ):Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 8.h,
                  ),
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            controller.selectedRequirement.defineRole!,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          )),
                          Text(
                              "OP NO. ${controller.selectedRequirement.requirementDetailsID} "),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "${controller.selectedRequirement.requirementDescription}",
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
                controller.isAppliedProfileLoading
                    ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {

                      return Container(
                        margin: EdgeInsets.only(bottom: 8.h),
                        padding: EdgeInsets.all(8.h),
                        // width: Get.size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: KalakarColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 3,
                                offset: Offset(0, 2))
                          ],
                          border: Border.all(
                              color: KalakarColors.backgroundGrey),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(color: KalakarColors.white,borderRadius: BorderRadius.circular(20.r)),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 8.h),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 20.h,
                                        width: 120.h,
                                        color: KalakarColors.white,
                                      ),
                                    ),SizedBox(height: 2.h,),Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 20.h,
                                        width: 120.h,
                                        color: KalakarColors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: KalakarColors.blue10,
                              highlightColor: KalakarColors.blue20,
                              child: Container(
                                height: 40.h,
                                width: 60.h,
                                decoration: BoxDecoration(color: KalakarColors.white,borderRadius: BorderRadius.circular(4.r)),
                              ),
                            )
                          ],
                        ),
                      );
                    })
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller
                            .filterAppliedRequirementDetailsList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          AppliedArtistDetailsList appliedProfileDetail =
                              controller
                                  .filterAppliedRequirementDetailsList[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 8.h),
                            padding: EdgeInsets.all(8.h),
                            // width: Get.size.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: KalakarColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 3,
                                    offset: Offset(0, 2))
                              ],
                              border: Border.all(
                                  color: KalakarColors.backgroundGrey),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image.network(
                                    appliedProfileDetail.profilePic!,
                                    fit: BoxFit.cover,
                                    height: 40.h,
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      // Return a dummy or placeholder image when an error occurs
                                      return Image.asset(
                                        "assets/images/app_logo2.PNG.png",
                                        height: 40.h,
                                        width: 40.h,
                                      );
                                    },
                                    width: 40.h,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${appliedProfileDetail.firstName!} ${appliedProfileDetail.middleName!} "),
                                        Text(appliedProfileDetail.email
                                            .toString()),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomMobileButtonWidget(
                                  text: "View",
                                  onTap: () {
                                    controller.setArtistProfileDataToView(
                                        appliedProfileDetail);
                                  },
                                  horizontalPadding: 10.w,
                                  verticalPadding: 10.h,
                                  fontSize: 12.sp,
                                  borderRadius: 8.r,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 2,
                                        offset: Offset(0, 2))
                                  ],
                                  width: 60.w,
                                  textColor: KalakarColors.white,
                                  fontWeight: FontWeight.normal,
                                )
                              ],
                            ),
                          );
                        }),
              ],
            ),
          ),
        ),
      );
    });
  }

  notificationsWebView(BuildContext context) {}
}
