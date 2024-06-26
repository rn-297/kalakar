import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: KalakarColors.background,
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0.0,
        backgroundColor: KalakarColors.purple,
        title: Text(
          KalakarConstants.createAccount,
          style: TextStyle(color: KalakarColors.white),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => mobileCreateAccountPage(),
        tablet: (BuildContext context) => webCreateAccountPage(),
      ),
    ));
  }

  mobileCreateAccountPage() {
    return Container();
  }

  webCreateAccountPage() {
    return Container();
  }

/*  mobileCreateAccountPage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          KalakarColors.turquoise,
          KalakarColors.blue,
          KalakarColors.purple,
        ],
      )),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: new BorderRadius.circular(8.r),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                      style: TextStyle(
                          color: KalakarColors.black,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          // labelText: 'Your password',
                          hintText: KalakarConstants.fieldName,
                          hintStyle: TextStyle(color: KalakarColors.black))))),
          SizedBox(
            height: 16.h,
          ),
          Container(
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: new BorderRadius.circular(8.r),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                      style: TextStyle(
                          color: KalakarColors.black,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          // labelText: 'Your password',
                          hintText: KalakarConstants.firstName,
                          hintStyle: TextStyle(color: KalakarColors.black))))),
          SizedBox(
            height: 16.h,
          ),
          Container(
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: new BorderRadius.circular(8.r),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                      style: TextStyle(
                          color: KalakarColors.black,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          // labelText: 'Your password',
                          hintText: KalakarConstants.lastName,
                          hintStyle: TextStyle(color: KalakarColors.black))))),
          SizedBox(
            height: 16.h,
          ),
          Container(
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: new BorderRadius.circular(8.r),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                      style: TextStyle(
                          color: KalakarColors.black,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          // labelText: 'Your password',
                          hintText: KalakarConstants.mobileNumber,
                          hintStyle: TextStyle(color: KalakarColors.black))))),
          SizedBox(
            height: 16.h,
          ),
          Container(
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: new BorderRadius.circular(8.r),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                      style: TextStyle(
                          color: KalakarColors.black,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          // labelText: 'Your password',
                          hintText: KalakarConstants.email,
                          hintStyle: TextStyle(color: KalakarColors.black))))),
          SizedBox(
            height: 16.h,
          ),
          Container(
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: new BorderRadius.circular(8.r),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                      style: TextStyle(
                          color: KalakarColors.black,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          // labelText: 'Your password',
                          hintText: KalakarConstants.password,
                          hintStyle: TextStyle(color: KalakarColors.black))))),
          SizedBox(
            height: 16.h,
          ),
          Container(
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: new BorderRadius.circular(8.r),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                      style: TextStyle(
                          color: KalakarColors.black,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          // labelText: 'Your password',
                          hintText: KalakarConstants.userName,
                          hintStyle: TextStyle(color: KalakarColors.black))))),
          SizedBox(
            height: 16.h,
          ),
          Container(
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: new BorderRadius.circular(8.r),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                      style: TextStyle(
                          color: KalakarColors.black,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          // labelText: 'Your password',
                          hintText: KalakarConstants.referralCode,
                          hintStyle: TextStyle(color: KalakarColors.black))))),
          SizedBox(
            height: 24.h,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 12.h),
              decoration: BoxDecoration(
                  color: KalakarColors.turquoise,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Text(KalakarConstants.createAccount,
                  style: TextStyle(
                    color: KalakarColors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }

  webCreateAccountPage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          KalakarColors.turquoise,
          KalakarColors.blue,
          KalakarColors.purple,
        ],
      )),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: new BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                                style: TextStyle(
                                    color: KalakarColors.black,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    // labelText: 'Your password',
                                    hintText: KalakarConstants.fieldName,
                                    hintStyle: TextStyle(
                                        color: KalakarColors.black))))),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: new BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                                style: TextStyle(
                                    color: KalakarColors.black,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    // labelText: 'Your password',
                                    hintText: KalakarConstants.firstName,
                                    hintStyle: TextStyle(
                                        color: KalakarColors.black))))),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: new BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                                style: TextStyle(
                                    color: KalakarColors.black,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    // labelText: 'Your password',
                                    hintText: KalakarConstants.lastName,
                                    hintStyle: TextStyle(
                                        color: KalakarColors.black))))),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: new BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                                style: TextStyle(
                                    color: KalakarColors.black,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    // labelText: 'Your password',
                                    hintText: KalakarConstants.mobileNumber,
                                    hintStyle: TextStyle(
                                        color: KalakarColors.black))))),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: new BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                                style: TextStyle(
                                    color: KalakarColors.black,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    // labelText: 'Your password',
                                    hintText: KalakarConstants.email,
                                    hintStyle: TextStyle(
                                        color: KalakarColors.black))))),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: new BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                                style: TextStyle(
                                    color: KalakarColors.black,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    // labelText: 'Your password',
                                    hintText: KalakarConstants.password,
                                    hintStyle: TextStyle(
                                        color: KalakarColors.black))))),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: new BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                                style: TextStyle(
                                    color: KalakarColors.black,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    // labelText: 'Your password',
                                    hintText: KalakarConstants.userName,
                                    hintStyle: TextStyle(
                                        color: KalakarColors.black))))),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: KalakarColors.white,
                          borderRadius: new BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                                style: TextStyle(
                                    color: KalakarColors.black,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    // labelText: 'Your password',
                                    hintText: KalakarConstants.referralCode,
                                    hintStyle: TextStyle(
                                        color: KalakarColors.black))))),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 12.h),
              decoration: BoxDecoration(
                  color: KalakarColors.turquoise,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Text(KalakarConstants.createAccount,
                  style: TextStyle(
                    color: KalakarColors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }*/
}
