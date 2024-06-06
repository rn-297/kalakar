import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: KalakarColors.background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 90.h),
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 16.h),
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
          decoration: BoxDecoration(
              color: KalakarColors.appBarBackground,
              borderRadius: BorderRadius.circular(16.r)),
          child: Center(
              child: Text(
            KalakarConstants.kalakaar,
            style: TextStyle(
                color: KalakarColors.appBarText,
                fontWeight: FontWeight.w500,
                fontSize: 35.sp),
          )),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => mobileLoginPage(),
        tablet: (BuildContext context) => webLoginPage(),
      ),
    ));
  }

  mobileLoginPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
                color: KalakarColors.background2,
                borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.h,),
                Text(KalakarConstants.newKalakaarAccount,style: TextStyle(color: KalakarColors.headerText,fontSize: 18.sp),),
                SizedBox(height: 4.h,),
                Text(KalakarConstants.signupText,style: TextStyle(color: KalakarColors.textColor,fontSize: 12.sp),),
                SizedBox(height: 16.h,),
                TextField(
                  style: TextStyle(color: KalakarColors.textColor),
                  decoration: InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    labelText: KalakarConstants.firstName,
                    labelStyle: TextStyle(color: KalakarColors.textColor),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: KalakarColors.border, width: 1),
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: KalakarColors.selectedBorder, width: 1),
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 24.w,vertical: 24.h)
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        )
      ],
    );
    /* return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          KalakarColors.purple,
          KalakarColors.blue,
          KalakarColors.turquoise,
          KalakarColors.blue,
          KalakarColors.purple,
        ],
      )),
      child: Column(
        children: [
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 36.w),
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: KalakarColors.purple,
                    offset: Offset(2, 2),
                    blurRadius: 4.r,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: KalakarColors.purple,
                    offset: Offset(-2, -2),
                    blurRadius: 4.r,
                    spreadRadius: 0,
                  ),
                ],
                color: KalakarColors.purple),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: KalakarColors.white.withOpacity(0.5),
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: KalakarColors.white,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(isDense:true,
                                border: InputBorder.none,
                                // labelText: 'Your password',
                                hintText: KalakarConstants.usernameHint,
                                hintStyle:
                                    TextStyle(color: KalakarColors.white))))),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: KalakarColors.white.withOpacity(0.5),
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: KalakarColors.white,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              isDense:true,
                                border: InputBorder.none,
                                // labelText: 'Your password',
                                hintText: "Password",
                                hintStyle:
                                    TextStyle(color: KalakarColors.white))))),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        KalakarConstants.forgotPassword,
                        style: TextStyle(
                            color: KalakarColors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: KalakarColors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                InkWell(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 36.w, vertical: 12.h),
                    decoration: BoxDecoration(
                        color: KalakarColors.turquoise.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(50.r)),
                    child: Text(KalakarConstants.login,
                        style: TextStyle(
                          color: KalakarColors.white,
                        )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: InkWell(
              onTap: () {
                Get.toNamed(RouteHelper.createAccount);
              },
              child: Text(
                KalakarConstants.createAccount,
                style: TextStyle(color: KalakarColors.white, fontSize: 18.sp),
              ),
            ),
          )),
        ],
      ),
    );*/
  }

  webLoginPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: KalakarColors.background2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [TextField()],
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        )
      ],
    );

    /*return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          KalakarColors.purple,
          KalakarColors.blue,
          KalakarColors.turquoise,
          KalakarColors.blue,
          KalakarColors.purple,
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 36.w),
                        padding: EdgeInsets.all(24.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: KalakarColors.purple,
                                offset: Offset(2, 2),
                                blurRadius: 4.r,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: KalakarColors.purple,
                                offset: Offset(-2, -2),
                                blurRadius: 4.r,
                                spreadRadius: 0,
                              ),
                            ],
                            color: KalakarColors.purple),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: KalakarColors.white.withOpacity(0.5),
                                  borderRadius: new BorderRadius.circular(50.r),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w, right: 15.w),
                                    child: TextFormField(
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 4.sp,
                                            color: KalakarColors.white,
                                            decoration: TextDecoration.none),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            // labelText: 'Your password',
                                            isDense: true,
                                            hintText:
                                                KalakarConstants.usernameHint,
                                            hintStyle: TextStyle(
                                                color: KalakarColors.white))))),
                            SizedBox(
                              height: 24.h,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: KalakarColors.white.withOpacity(0.5),
                                  borderRadius: new BorderRadius.circular(50.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w, right: 15.w),
                                    child: TextFormField(
                                        obscureText: true,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 4.sp,
                                            color: KalakarColors.white,
                                            decoration: TextDecoration.none),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            // labelText: 'Your password',
                                            isDense: true,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: KalakarColors.white))))),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    KalakarConstants.forgotPassword,
                                    style: TextStyle(
                                        color: KalakarColors.white,
                                        fontSize: 3.sp,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: KalakarColors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 36.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                    color: KalakarColors.turquoise
                                        .withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(50.r)),
                                child: Text(KalakarConstants.login,
                                    style: TextStyle(
                                      fontSize: 4.sp,
                                      color: KalakarColors.white,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      */ /**/ /*
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.createAccount);
                },
                child: Text(
                  KalakarConstants.createAccount,
                  style: TextStyle(color: KalakarColors.white, fontSize: 4.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );*/
  }
}
