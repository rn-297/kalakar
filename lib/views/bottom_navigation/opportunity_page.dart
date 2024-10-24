import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/data/models/company/company_requirement_list_class.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

class OpportunityPage extends StatelessWidget {
  const OpportunityPage({Key? key}) : super(key: key);

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
        mobile: (BuildContext context) => opportunitiesMobileView(),
        tablet: (BuildContext context) => opportunitiesWebView(),
      ),
    );
  }

  opportunitiesMobileView() {
    Get.put(RequirementController());
    return Container(color: KalakarColors.appBarBackground1,
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: GetBuilder<RequirementController>(builder: (controller) {
          return RefreshIndicator(


            onRefresh: ()async{
              if(controller.isArtist){
                controller.getArtistHomeRequirementDetails(true);
              }else{
                controller.getRequirementDetailsCompany(0);
              }
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(controller.isArtist)Text(KalakarConstants.opportunitiesText),
                  SizedBox(height: 8.h,),
                  !controller.isArtist && controller.requirementDetailsList.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Column(
                              children: [
                                CustomMobileButtonWidget(
                                    text: KalakarConstants.createRequirement,
                                    onTap: () {
                                      // controller.selectedRequirementId = 0;
                                      // Get.toNamed(RouteHelper.requirementFormPage);
                                      controller.emptyOpportunityData();
                                    },
                                    horizontalPadding: 10.w,
                                    verticalPadding: 8.h,
                                    fontSize: 15.sp,
                                    borderRadius: 50.r),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        )
                      : Container(),
                  controller.isRequirementsLoading
                      ? ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 4.h),
                              decoration: BoxDecoration(
                                color: KalakarColors.white,
                                borderRadius: BorderRadius.circular(
                                  8.r,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
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
                                        )),
                                    Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Shimmer.fromColors(
                                                baseColor: KalakarColors.blue10,
                                                highlightColor:
                                                    KalakarColors.blue20,
                                                child: Container(
                                                  height: 20.h,
                                                  width: 80.h,
                                                  color: KalakarColors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Shimmer.fromColors(
                                                baseColor: KalakarColors.blue10,
                                                highlightColor:
                                                    KalakarColors.blue20,
                                                child: Container(
                                                  height: 20.h,
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
                                                    highlightColor:
                                                        KalakarColors.blue20,
                                                    child: Container(
                                                      height: 20.h,
                                                      width: 80.h,
                                                      color: KalakarColors.white,
                                                    ),
                                                  ),
                                                  Shimmer.fromColors(
                                                    baseColor: KalakarColors.blue10,
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Shimmer.fromColors(
                                                    baseColor: KalakarColors.blue10,
                                                    highlightColor:
                                                        KalakarColors.blue20,
                                                    child: Container(
                                                      height: 20.h,
                                                      width: 80.h,
                                                      color: KalakarColors.white,
                                                    ),
                                                  ),
                                                  Shimmer.fromColors(
                                                    baseColor: KalakarColors.blue10,
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
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          })
                      : controller.requirementDetailsList.isNotEmpty
                          ? ListView.builder(
                              itemCount: controller.requirementDetailsList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                RequirementDetailsData requirementData =
                                    controller.requirementDetailsList[index];
                                final DateFormat formatter =
                                    DateFormat('dd-MM-yyyy');
                                DateTime shootingDate = DateTime.parse(
                                    requirementData!.shootingStartDate!);
                                String date = formatter.format(shootingDate);
                                print(requirementData.requirementDetailsID);
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 4.h),
                                  decoration: BoxDecoration(
                                    color: KalakarColors.backgroundTurquoise,
                                    border: Border.all(
                                        color: KalakarColors.backgroundGrey),
                                    borderRadius: BorderRadius.circular(8.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        blurRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      controller
                                          .checkArtistAndSetData(requirementData);
                                    },
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: requirementData.refPhotoName ==
                                                      null
                                                  ? Container(
                                                      margin: EdgeInsets.all(2.h),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
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
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(8.r),
                                                          ),
                                                          image: DecorationImage(
                                                            image: NetworkImage(
                                                              requirementData
                                                                      .refPhotoName ??
                                                                  "",
                                                            ),
                                                            fit: BoxFit.cover,
                                                          )),
                                                    )),
                                          Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.h),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      requirementData
                                                          .requirementTitle!,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          color: KalakarColors
                                                              .headerText,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Text(
                                                      requirementData
                                                              .requirementDescription! ??
                                                          "",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(requirementData
                                                            .shootingLocation!),
                                                        Text(date),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(requirementData
                                                            .gender!),
                                                        Text(requirementData.age!
                                                            .split(".")[0]),
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
                              })
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("No New Opportunities Found"),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if(controller.isArtist){
                                        controller.getArtistHomeRequirementDetails(true);
                                      }else{
                                        controller.getRequirementDetailsCompany(0);
                                      }
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
          );
        }),
      ),
    );
  }

  opportunitiesWebView() {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(KalakarConstants.opportunitiesText),
            SizedBox(
              height: 16.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.h),
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.lightAppBarBackground,
                    borderRadius: BorderRadius.circular(
                      8.h,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/images/app_bar_logo.png",
                            fit: BoxFit.cover,
                          )),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Oppotunity Name",
                                  style: TextStyle(
                                      fontSize: 8.sp,
                                      color: KalakarColors.headerText,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Opportunity Post",
                                    style: TextStyle(
                                      fontSize: 5.sp,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Location",
                                        style: TextStyle(
                                          fontSize: 5.sp,
                                        )),
                                    Text("Time",
                                        style: TextStyle(
                                          fontSize: 5.sp,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Gender",
                                        style: TextStyle(
                                          fontSize: 5.sp,
                                        )),
                                    Text("Age",
                                        style: TextStyle(
                                          fontSize: 5.sp,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 4.0),
            )
          ],
        ),
      ),
    );
  }

  appBarMobileView() {
    RequirementController controller = Get.put(RequirementController());
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground1,
      surfaceTintColor: KalakarColors.appBarBackground1,
      title: Text(
        KalakarConstants.opportunities1,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        if (!controller.isArtist)
          InkWell(
            onTap: () {
              controller.emptyOpportunityData();
            },
            child: Icon(
              Icons.add,
              size: 30.h,
            ),
          ),
        SizedBox(
          width: 16.h,
        )
      ],
    );
  }

  appBarWebView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.opportunities1,
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.filter_alt,
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
