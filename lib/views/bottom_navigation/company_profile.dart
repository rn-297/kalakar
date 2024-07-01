import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 150.h),
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
                image: DecorationImage(image: NetworkImage("")),
                border: Border.all(color: KalakarColors.headerText),
                borderRadius: BorderRadius.circular(50.r)),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            "RN FILM INDUSTRY",
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
  }

  appbarWebView() {}

  companyHomeMobileView() {
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
    );
  }

  companyHomeWebView() {}
}
