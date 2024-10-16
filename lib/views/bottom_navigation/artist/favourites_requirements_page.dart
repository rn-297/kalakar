import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/models/company/company_requirement_list_class.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class FavouritesRequirementsPage extends StatelessWidget {
  const FavouritesRequirementsPage({super.key});

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
        mobile: (BuildContext context) => notificationsMobileView(),
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
            KalakarConstants.myFavourites,
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
            KalakarConstants.myFavourites,
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

  notificationsMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: ()async{
          controller.getArtistRequirementInFavorites(0);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.all(16.h),
            child: Column(
              children: [
                controller.isArtistRequirementsInFavouritesLoading
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
                                              highlightColor: KalakarColors.blue20,
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
                                              highlightColor: KalakarColors.blue20,
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
                    : controller.artistRequirementsFavouritesList.isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                controller.artistRequirementsFavouritesList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              RequirementDetailsData requirementData =
                                  controller
                                      .artistRequirementsFavouritesList[index];
                              final DateFormat formatter = DateFormat('dd-MM-yyyy');
                              DateTime shootingDate = DateTime.parse(
                                  requirementData!.shootingStartDate!);
                              String date = formatter.format(shootingDate);
                              print(requirementData.requirementDetailsID);
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 4.h),
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
                                                          fit: BoxFit.cover,
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
                                                    overflow: TextOverflow.ellipsis,
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
                                                      Text(requirementData.gender!),
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
                                SizedBox(
                                  height: 32.h,
                                ),
                                Text("No Favourites Opportunities Found"),
                                SizedBox(
                                  height: 16.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.getArtistRequirementInFavorites(0);
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
                          )
              ],
            ),
          ),
        ),
      );
    });
  }

  notificationsWebView(BuildContext context) {}
}
