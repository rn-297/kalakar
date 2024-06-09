
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/toggle_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthPageController());
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: Get.size.height / 1.4,
              child: ScreenTypeLayout.builder(
                mobile: (BuildContext context) => tabBarMobileView(),
                tablet: (BuildContext context) => tabBarWebView(),
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    ));
  }

  tabBarMobileView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
          color: KalakarColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(12.r)),
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              titleSpacing: 0.0,
              backgroundColor: Colors.transparent,
              toolbarHeight: 10.h,
              bottom: TabBar(
                  dividerHeight: 0.0,
                  labelStyle: TextStyle(
                      color: KalakarColors.textColor,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(
                      color: KalakarColors.textColor, fontSize: 8.sp),
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 16.w),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: KalakarColors.selectedBorder,
                  tabs: [
                    Text(KalakarConstants.createAccount),
                    Text(KalakarConstants.signIn),
                  ]),
            ),
            body: TabBarView(
              children: [
                ScreenTypeLayout.builder(
                  mobile: (BuildContext context) => mobileSignUpPage(),
                  tablet: (BuildContext context) => webSignUpPage(),
                ),
                ScreenTypeLayout.builder(
                  mobile: (BuildContext context) => mobileSignInPage(),
                  tablet: (BuildContext context) => webSignUpPage(),
                )
              ],
            ),
          )),
    );
  }
  tabBarWebView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 64.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
          color: KalakarColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(12.r)),
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              titleSpacing: 0.0,
              backgroundColor: Colors.transparent,
              toolbarHeight: 10.h,
              bottom: TabBar(
                  dividerHeight: 0.0,
                  labelStyle: TextStyle(
                      color: KalakarColors.textColor,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(
                      color: KalakarColors.textColor, fontSize: 8.sp),
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: KalakarColors.selectedBorder,
                  tabs: [
                    Text(KalakarConstants.createAccount),
                    Text(KalakarConstants.signIn),
                  ]),
            ),
            body: TabBarView(
              children: [
                ScreenTypeLayout.builder(
                  mobile: (BuildContext context) => mobileSignUpPage(),
                  tablet: (BuildContext context) => webSignUpPage(),
                ),
                ScreenTypeLayout.builder(
                  mobile: (BuildContext context) => mobileSignInPage(),
                  tablet: (BuildContext context) => webSignUpPage(),
                )
              ],
            ),
          )),
    );
  }

  mobileSignUpPage() {

    return GetBuilder<AuthPageController>(builder: (authPageController) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Text(
              KalakarConstants.newKalakaarAccount,
              style:
                  TextStyle(color: KalakarColors.headerText, fontSize: 18.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              KalakarConstants.signupText,
              style: TextStyle(color: KalakarColors.textColor, fontSize: 12.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            TextField(
              controller: authPageController.createFirstName,
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
                  borderSide: BorderSide(color: KalakarColors.border, width: 1),
                  borderRadius: BorderRadius.circular(
                    50.r,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: KalakarColors.selectedBorder, width: 1),
                  borderRadius: BorderRadius.circular(
                    50.r,
                  ),
                ),
                contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 24.w, vertical: 12.h),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextField(
              controller: authPageController.createLastName,
              style: TextStyle(color: KalakarColors.textColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                  ),
                  labelText: KalakarConstants.lastName,
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
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 12.h)),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextField(
              controller: authPageController.createEmail,
              style: TextStyle(color: KalakarColors.textColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                  ),
                  labelText: KalakarConstants.email,
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
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 12.h)),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextField(
              controller: authPageController.createWhatsappNumber,
              style: TextStyle(color: KalakarColors.textColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                  ),
                  labelText: KalakarConstants.whatsappNumber,
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
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 12.h)),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextField(
              controller: authPageController.createPassword,
              style: TextStyle(color: KalakarColors.textColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                  ),
                  labelText: KalakarConstants.password,
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
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 12.h),
                  suffixIcon: InkWell(
                    onTap: () {
                      authPageController
                          .setPasswordVisibility(PasswordType.createPass);
                    },
                    child: Icon(authPageController.createPasswordValue
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  ) //Icons.visibility_rounded
                  ),
              obscureText: authPageController.createPasswordValue,
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.h),
                child: Text(
                  "User Type",
                  style: TextStyle(
                      color: KalakarColors.textColor, fontSize: 14.sp),
                )),
            SizedBox(
              height: 8.h,
            ),
            /*Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      authPageController.setUserType(KalakarConstants.artist);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: authPageController.userType ==
                              KalakarConstants.artist
                              ? KalakarColors.buttonBackground:Colors.white,
                          border: Border.all(
                              color: authPageController.userType ==
                                      KalakarConstants.artist
                                  ? KalakarColors.selectedBorder
                                  : KalakarColors.textColor)),
                      child: Center(
                          child: Text(
                        KalakarConstants.artist,
                        style: TextStyle(
                            color: authPageController.userType ==
                                    KalakarConstants.artist
                                ? KalakarColors.headerText
                                : KalakarColors.textColor),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      authPageController.setUserType(KalakarConstants.company);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color:authPageController.userType ==
                              KalakarConstants.company
                              ? KalakarColors.buttonBackground:Colors.white,
                          border: Border.all(
                              color: authPageController.userType ==
                                      KalakarConstants.company
                                  ? KalakarColors.selectedBorder
                                  : KalakarColors.textColor)),
                      child: Center(
                          child: Text(
                        KalakarConstants.company,
                        style: TextStyle(
                            color: authPageController.userType ==
                                    KalakarConstants.company
                                ? KalakarColors.headerText
                                : KalakarColors.textColor),
                      )),
                    ),
                  ),
                ),
              ],
            ),*/
            SlidingButton(
              //Custom Slide animation Button
              active: authPageController.userType,
              selectedColor: KalakarColors.headerText,
              unSelectedColor: KalakarColors.textColor,
              // buttonBackgroundColor: Colors.green,
              // buttonBorderColor: Colors.lightGreen,
              // buttonBackgroundColor: Colors.purple,
              // buttonBorderColor: Colors.purpleAccent,
              // buttonBackgroundColor: Colors.orange,
              // buttonBorderColor: Colors.orangeAccent,
              buttonBackgroundColor: KalakarColors.buttonBackground,
              buttonBorderColor: KalakarColors.buttonBackground,

              onChanged: (int index) {
                print(index);
                authPageController.setUserType(index);
              },

              list: [KalakarConstants.artist, KalakarConstants.company],

              buttonBorderRadius: BorderRadius.circular(50.r),
            ),
            SizedBox(
              height: 16.h,
            ),
            Center(
                child: InkWell(
              onTap: () {
                authPageController.getStartedCall();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color: KalakarColors.buttonBackground,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  KalakarConstants.getStarted,
                  style: TextStyle(
                      color: KalakarColors.headerText,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: Text(
              KalakarConstants.orSignupWith,
              style: TextStyle(color: KalakarColors.textColor, fontSize: 16.h),
            )),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
                decoration: BoxDecoration(
                    // color: KalakarColors.background,
                    border: Border.all(color: KalakarColors.border),
                    borderRadius: BorderRadius.circular(50.r)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "G",
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: KalakarColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    KalakarConstants.continueWithGoogle,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: KalakarColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      );
    });
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

  mobileSignInPage() {
    return GetBuilder<AuthPageController>(
      builder: (authPageController) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                KalakarConstants.welcomeBack,
                style: TextStyle(color: KalakarColors.headerText, fontSize: 18.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                KalakarConstants.sigInText,
                style: TextStyle(color: KalakarColors.textColor, fontSize: 12.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: authPageController.signInEmailOrMobile,
                style: TextStyle(color: KalakarColors.textColor),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    labelText: KalakarConstants.email,
                    labelStyle: TextStyle(color: KalakarColors.textColor),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: KalakarColors.border,
                      ),
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: KalakarColors.selectedBorder,
                      ),
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    contentPadding: EdgeInsetsDirectional.symmetric(
                        horizontal: 24.w, vertical: 12.h)),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: authPageController.signInPassword,
                style: TextStyle(color: KalakarColors.textColor),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    labelText: KalakarConstants.password,
                    labelStyle: TextStyle(color: KalakarColors.textColor),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: KalakarColors.border, width: 1),
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: KalakarColors.selectedBorder, width: 1),
                      borderRadius: BorderRadius.circular(
                        50.r,
                      ),
                    ),
                    contentPadding: EdgeInsetsDirectional.symmetric(
                        horizontal: 24.w, vertical: 12.h),
                    suffixIcon: InkWell(
                      onTap: (){
                        authPageController.setPasswordVisibility(PasswordType.signInPass);
                      },
                      child: Icon(authPageController.signInPasswordValue
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                    ), //Icons.visibility_rounded

                    ),
                obscureText: authPageController.signInPasswordValue,
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 75.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color: KalakarColors.buttonBackground,boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ],
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  KalakarConstants.signIn,
                  style: TextStyle(
                      color: KalakarColors.headerText,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              )),
              SizedBox(
                height: 20.h,
              ),
              Center(
                  child: Text(
                KalakarConstants.orSignInWith,
                style: TextStyle(color: KalakarColors.textColor, fontSize: 16.h),
              )),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      // color: KalakarColors.background,
                      border: Border.all(color: KalakarColors.border),
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      "G",
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: KalakarColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      KalakarConstants.continueWithGoogle,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: KalakarColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  KalakarConstants.forgotPassword,
                  style: TextStyle(
                      color: KalakarColors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        );
      }
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

  webSignUpPage() {
    return GetBuilder<AuthPageController>(builder: (authPageController) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Text(
              KalakarConstants.newKalakaarAccount,
              style:
              TextStyle(color: KalakarColors.headerText, fontSize: 8.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              KalakarConstants.signupText,
              style: TextStyle(color: KalakarColors.textColor, fontSize: 12.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            TextField(
              controller: authPageController.createFirstName,
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
                  borderSide: BorderSide(color: KalakarColors.border, width: 1),
                  borderRadius: BorderRadius.circular(
                    50.r,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: KalakarColors.selectedBorder, width: 1),
                  borderRadius: BorderRadius.circular(
                    50.r,
                  ),
                ),
                contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 24.w, vertical: 12.h),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextField(
              controller: authPageController.createLastName,
              style: TextStyle(color: KalakarColors.textColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                  ),
                  labelText: KalakarConstants.lastName,
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
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 12.h)),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextField(
              controller: authPageController.createEmail,
              style: TextStyle(color: KalakarColors.textColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                  ),
                  labelText: KalakarConstants.email,
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
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 12.h)),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextField(
              controller: authPageController.createWhatsappNumber,
              style: TextStyle(color: KalakarColors.textColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                  ),
                  labelText: KalakarConstants.whatsappNumber,
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
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 12.h)),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextField(
              controller: authPageController.createPassword,
              style: TextStyle(color: KalakarColors.textColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                  ),
                  labelText: KalakarConstants.password,
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
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 12.h),
                  suffixIcon: InkWell(
                    onTap: () {
                      authPageController
                          .setPasswordVisibility(PasswordType.createPass);
                    },
                    child: Icon(authPageController.createPasswordValue
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  ) //Icons.visibility_rounded
              ),
              obscureText: authPageController.createPasswordValue,
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.h),
                child: Text(
                  "User Type",
                  style: TextStyle(
                      color: KalakarColors.textColor, fontSize: 14.sp),
                )),
            SizedBox(
              height: 8.h,
            ),
            /*Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      authPageController.setUserType(KalakarConstants.artist);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: authPageController.userType ==
                              KalakarConstants.artist
                              ? KalakarColors.buttonBackground:Colors.white,
                          border: Border.all(
                              color: authPageController.userType ==
                                      KalakarConstants.artist
                                  ? KalakarColors.selectedBorder
                                  : KalakarColors.textColor)),
                      child: Center(
                          child: Text(
                        KalakarConstants.artist,
                        style: TextStyle(
                            color: authPageController.userType ==
                                    KalakarConstants.artist
                                ? KalakarColors.headerText
                                : KalakarColors.textColor),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      authPageController.setUserType(KalakarConstants.company);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color:authPageController.userType ==
                              KalakarConstants.company
                              ? KalakarColors.buttonBackground:Colors.white,
                          border: Border.all(
                              color: authPageController.userType ==
                                      KalakarConstants.company
                                  ? KalakarColors.selectedBorder
                                  : KalakarColors.textColor)),
                      child: Center(
                          child: Text(
                        KalakarConstants.company,
                        style: TextStyle(
                            color: authPageController.userType ==
                                    KalakarConstants.company
                                ? KalakarColors.headerText
                                : KalakarColors.textColor),
                      )),
                    ),
                  ),
                ),
              ],
            ),*/
            SlidingButton(
              //Custom Slide animation Button
              active: authPageController.userType,
              selectedColor: KalakarColors.headerText,
              unSelectedColor: KalakarColors.textColor,
              // buttonBackgroundColor: Colors.green,
              // buttonBorderColor: Colors.lightGreen,
              // buttonBackgroundColor: Colors.purple,
              // buttonBorderColor: Colors.purpleAccent,
              // buttonBackgroundColor: Colors.orange,
              // buttonBorderColor: Colors.orangeAccent,
              buttonBackgroundColor: KalakarColors.buttonBackground,
              buttonBorderColor: KalakarColors.buttonBackground,

              onChanged: (int index) {
                print(index);
                authPageController.setUserType(index);
              },

              list: [KalakarConstants.artist, KalakarConstants.company],

              buttonBorderRadius: BorderRadius.circular(50.r),
            ),
            SizedBox(
              height: 16.h,
            ),
            Center(
                child: InkWell(
                  onTap: () {
                    authPageController.getStartedCall();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
                    decoration: BoxDecoration(
                        color: KalakarColors.buttonBackground,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50.r)),
                    child: Text(
                      KalakarConstants.getStarted,
                      style: TextStyle(
                          color: KalakarColors.headerText,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: Text(
                  KalakarConstants.orSignupWith,
                  style: TextStyle(color: KalakarColors.textColor, fontSize: 16.h),
                )),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
                decoration: BoxDecoration(
                  // color: KalakarColors.background,
                    border: Border.all(color: KalakarColors.border),
                    borderRadius: BorderRadius.circular(50.r)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "G",
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: KalakarColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    KalakarConstants.continueWithGoogle,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: KalakarColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      );
    });

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
