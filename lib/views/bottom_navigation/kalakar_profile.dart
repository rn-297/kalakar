import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/custom_widgets/custom_divider/custom_dashed_divider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class KalakarProfilePage extends StatelessWidget {
  const KalakarProfilePage({super.key});

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
        mobile: (BuildContext context) => profileMobileView(),
        tablet: (BuildContext context) => profileWebView(),
      ),
    );
  }

  profileMobileView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: ClipOval(
                        child: Image.asset(
                  "assets/images/app_bar_logo.png",
                  height: 100.h,
                  width: 100.h,
                  fit: BoxFit.cover,
                ))),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          "${KalakarConstants.kalakarId} : MHS001",
                          style: TextStyle(color: KalakarColors.headerText),
                        ),
                        Text(
                          "Rohan Warang",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: KalakarColors.buttonText,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              KalakarConstants.age,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(" : data"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              KalakarConstants.height,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(" : data"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              KalakarConstants.weight,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(" : data"),
                          ],
                        ),
                      ],
                    ),
                    DashedDottedDivider(
                      isHorizontal: false,
                      color: Colors.blue,
                      dashWidth: 5.0,
                      dotDiameter: 3.0,
                      space: 3.0,
                      thickness: 2.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              KalakarConstants.city,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(" : Thane"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              KalakarConstants.district,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(" : Thane"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              KalakarConstants.state,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(" : Maharashtra"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          KalakarConstants.bio,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KalakarColors.headerText),
                        ),
                        ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15.h,
                                  ),
                                  Text("Hobbie $index")
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: IntrinsicWidth(
                  child: Column(
                    children: [
                      InkWell(
                        child: CustomMobileButtonWidget(
                          onTap: () {},
                          borderRadius: 50.r,
                          fontSize: 12.sp,
                          text: KalakarConstants.experienceLevel,
                          horizontalPadding: 24.w,
                          verticalPadding: 8.h,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      InkWell(
                        child: CustomMobileButtonWidget(
                          onTap: () {},
                          borderRadius: 50.r,
                          fontSize: 12.sp,
                          text: KalakarConstants.moreInfo,
                          horizontalPadding: 24.w,
                          verticalPadding: 8.h,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Divider(
              thickness: 3.0,
              height: 10.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(KalakarConstants.portfolio),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w),
              child: Divider(
                height: 10.h,
                thickness: 1.0,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              height: 10.h,
              thickness: 3.0,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(KalakarConstants.experience),
          ],
        ),
      ),
    );
  }

  profileWebView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                      children: [
                        ClipOval(
                            child: Image.asset(
                                          "assets/images/app_bar_logo.png",
                                          height: 100.h,
                                          width: 100.h,
                                          fit: BoxFit.cover,
                                        )),
                        Text(
                          "${KalakarConstants.kalakarId} : MHS001",
                          style: TextStyle(color: KalakarColors.headerText),
                        ),
                        Text(
                          "Rohan Warang",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: KalakarColors.buttonText,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Expanded(
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.age,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : data"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.height,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : data"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.weight,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : data"),
                                ],
                              ),
                            ],
                          ),
                          DashedDottedDivider(
                            isHorizontal: false,
                            color: Colors.blue,
                            dashWidth: 5.0,
                            dotDiameter: 3.0,
                            space: 3.0,
                            thickness: 2.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.city,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : Thane"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.district,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : Thane"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    KalakarConstants.state,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(" : Maharashtra"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),

            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          KalakarConstants.bio,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KalakarColors.headerText),
                        ),
                        ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15.h,
                                  ),
                                  Text("Hobbie $index")
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: IntrinsicWidth(
                  child: Column(
                    children: [
                      InkWell(
                        child: CustomMobileButtonWidget(
                          onTap: () {},
                          borderRadius: 50.r,
                          fontSize: 8.sp,
                          text: KalakarConstants.experienceLevel,
                          horizontalPadding: 8.w,
                          verticalPadding: 8.h,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      InkWell(
                        child: CustomMobileButtonWidget(
                          onTap: () {},
                          borderRadius: 50.r,
                          fontSize: 8.sp,
                          text: KalakarConstants.moreInfo,
                          horizontalPadding: 8.w,
                          verticalPadding: 8.h,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
                Icon(Icons.whatshot),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Divider(
              thickness: 3.0,
              height: 10.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(KalakarConstants.portfolio),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              height: 10.h,
              thickness: 3.0,
            ),
          ],
        ),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.profile1,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.settings,
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
        KalakarConstants.profile1,
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.settings,
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
