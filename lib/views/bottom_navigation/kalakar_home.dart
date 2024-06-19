import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

class KalakarHomePage extends StatelessWidget {
  const KalakarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: KalakarColors.appBarBackground,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                KalakarConstants.namskarKalakar,
                style: TextStyle(color: KalakarColors.white, fontSize: 14.sp),
              ),
              Text(
                "Rohan Warang",
                style:
                    TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.notifications,
              size: 35,
            ),
            SizedBox(
              width: 8.h,
            ),
            ClipOval(
              // Image radius
              child: Image.asset(
                "assets/images/app_bar_logo.png",
                fit: BoxFit.cover,
                height: 50.h,
                width: 50.h,
              ),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 70.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                  hintText: KalakarConstants.searchAnything,
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
        ),
        body: SingleChildScrollView(
          child: Container(
            color: KalakarColors.appBarBackground1,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
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
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8.h),
                          padding: EdgeInsets.all(8.h),
                          width: Get.size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: KalakarColors.appBarBackground1,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(CupertinoIcons.suit_heart)),
                                ClipOval(
                                  // Image radius
                                  child: Image.asset(
                                    "assets/images/app_bar_logo.png",
                                    fit: BoxFit.cover,
                                    height: 80.h,
                                    width: 80.h,
                                  ),
                                ),
                                Text("Company Name"),
                                Divider(
                                  color: Colors.grey,
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
                                    child: Text("Good Looking Models"),
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
                                      child: Text("25-30 Years"),
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
                                      child: Text("Male/Female"),
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
                                      child: Text("Mumbai"),
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
                                      child: Text("30-06-2024"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      KalakarConstants.upcomingProjects,
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
                  height: Get.size.height / 4,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8.h),
                          // padding: EdgeInsets.all(8.h),
                          width: Get.size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: KalakarColors.appBarBackground1,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                   child:Image.asset(
                                    "assets/images/movie.webp",
                                    fit: BoxFit.fitWidth,

                                  ),),

                                Text("Movie Name"),
                                Text("Hindi Movie"),


                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 16.h,),
                Text(KalakarConstants.reviews),
              ],
            ),
          ),
        ));
  }
}
