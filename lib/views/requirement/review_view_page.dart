import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../data/models/artist/review_details_class.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class ReviewViewPage extends StatelessWidget {
  const ReviewViewPage({super.key});

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
        mobile: (BuildContext context) => reviewViewMobileView(),
        tablet: (BuildContext context) => reviewViewWebView(context),
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
            KalakarConstants.review,
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
            KalakarConstants.review,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 8.sp),
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

  reviewViewMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      GetApplicationReviewList reviewData = controller.selectedReviewData;
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: KalakarColors.appBarBackground1,
              border: Border.all(color: KalakarColors.backgroundGrey),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(children: [
              Center(
                child: ClipOval(
                  // Image radius
                  child: Image.network(
                    reviewData.reviewByProfilePic!,
                    fit: BoxFit.cover,
                    height: 120.h,
                    width: 120.h,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      // Return a dummy or placeholder image when an error occurs
                      return Image.asset(
                        "assets/images/NA.jpg",
                        height: 120.h,
                        width: 120.h,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 16.h,),
              Row(
                children: [

                  Text("Rating : ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp,color: KalakarColors.headerText),),
                  Text(reviewData.reviewStar!.toString()),
                  SizedBox(
                    width: 16.w,
                  ),
                  SizedBox(
                    height: 20.h,
                    width: 150.w,
                    child: ListView.builder(
                      itemCount:
                      reviewData.reviewStar!.toInt(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          size: 15,
                          color: CupertinoColors
                              .systemYellow,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              rowDataToShow("Review By : ", reviewData.reviewBy.toString()),
              rowDataToShow("Reviewer Work : ", reviewData.reviewerWork.toString()),
              rowDataToShow("Review : ", reviewData.review.toString()),
            ]),
          ),
        ),
      );
    });
  }

  rowDataToShow(String title, String titleData) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp,color: KalakarColors.headerText),
            ),
            Expanded(
              child: Text(
                titleData,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  rowDataToShow1(String title, String titleData) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.sp,color: KalakarColors.headerText),
            ),
            Expanded(
              child: Text(
                titleData,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 5.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  reviewViewWebView(BuildContext context) {
    return GetBuilder<RequirementController>(builder: (controller) {
      GetApplicationReviewList reviewData = controller.selectedReviewData;
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical:16.w,horizontal: 48.w),
          child: Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: KalakarColors.appBarBackground1,
              border: Border.all(color: KalakarColors.backgroundGrey),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(children: [
              Center(
                child: ClipOval(
                  // Image radius
                  child: Image.network(
                    reviewData.reviewByProfilePic!,
                    fit: BoxFit.cover,
                    height: 120.h,
                    width: 120.h,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      // Return a dummy or placeholder image when an error occurs
                      return Image.asset(
                        "assets/images/NA.jpg",
                        height: 120.h,
                        width: 120.h,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 16.h,),
              Row(
                children: [

                  Text("Rating : ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.sp,color: KalakarColors.headerText),),
                  Text(reviewData.reviewStar!.toString(),style: TextStyle(fontSize: 5.sp),),
                  SizedBox(
                    width: 16.w,
                  ),
                  SizedBox(
                    height: 20.h,
                    width: 150.w,
                    child: ListView.builder(
                      itemCount:
                      reviewData.reviewStar!.toInt(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          size: 25,
                          color: CupertinoColors
                              .systemYellow,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              rowDataToShow1("Review By : ", reviewData.reviewBy.toString()),
              rowDataToShow1("Reviewer Work : ", reviewData.reviewerWork.toString()),
              rowDataToShow1("Review : ", reviewData.review.toString()),
            ]),
          ),
        ),
      );
    });
  }
}
