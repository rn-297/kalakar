import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: AppBar(
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
                      Text("Kalakaar ID : MHS001"),
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
                            "Age ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(": data"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Height ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(": data"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Weight ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(": data"),
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
                            "City ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(": Thane"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "District ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(": Thane"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "State ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(": Maharashtra"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
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
                        "Bio :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: KalakarColors.headerText),
                      ),
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
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
                        text: "Experience Level",
                        horizontalPadding: 24.w,
                        verticalPadding: 8.h,
                      ),
                    ),
                    InkWell(
                      child: CustomMobileButtonWidget(
                        onTap: () {},
                        borderRadius: 50.r,
                        fontSize: 12.sp,
                        text: "More Info",
                        horizontalPadding: 24.w,
                        verticalPadding: 8.h,
                      ),
                    ),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }

  profileWebView() {}
}
