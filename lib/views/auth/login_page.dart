import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:kalakar/custom_widgets/button_mobile_widget.dart';
import 'package:kalakar/custom_widgets/continue_with_google_widget.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/helper/write_log.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:otp_input_editor/otp_input_editor.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/toggle_button.dart';
import '../../helper/common_widgets.dart';

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
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appBarMobileView(),
          tablet: (BuildContext context) => appBarWebView(),
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
                mobile: (BuildContext context) => tabBarMobileView(context),
                tablet: (BuildContext context) => tabBarWebView(context),
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

  tabBarMobileView(BuildContext context) {
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
                  onTap: (index) {},
                  dividerHeight: 0.0,
                  labelStyle: TextStyle(
                      color: KalakarColors.textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(
                      color: KalakarColors.textColor, fontSize: 16.sp),
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: KalakarColors.selectedBorder,
                  tabs: [
                    Text(KalakarConstants.signIn),
                    Text(KalakarConstants.createAccount),
                  ]),
            ),
            body: TabBarView(
              children: [
                mobileSignInPage(),
                mobileSignUpPage(),
              ],
            ),
          )),
    );
  }

  tabBarWebView(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Image.asset("assets/images/app_bar_logo.png")),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
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
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: KalakarColors.selectedBorder,
                        tabs: [
                          Text(KalakarConstants.signIn),
                          Text(KalakarConstants.createAccount),
                        ]),
                  ),
                  body: TabBarView(
                    children: [
                      webSignInPage(),
                      webSignUpPage(),
                    ],
                  ),
                )),
          ),
        ),
      ],
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
            Form(
              key: authPageController.formGetOtpKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    KalakarConstants.newKalakaarAccount,
                    style: TextStyle(
                        color: KalakarColors.headerText, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    KalakarConstants.signupText,
                    style: TextStyle(
                        color: KalakarColors.textColor, fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.createFirstName,
                      labelText: KalakarConstants.firstName,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      passwordVisibility: false,
                      togglePasswordVisibility: () {},
                      validator: authPageController.createFirstNameValidator),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.createLastName,
                      labelText: KalakarConstants.lastName,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      passwordVisibility: false,
                      togglePasswordVisibility: () {},
                      validator: authPageController.createLastNameValidator),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.createEmail,
                      labelText: KalakarConstants.email,
                      obscureText: false,
                      editable: authPageController.createEmailEditable,
                      textInputType: TextInputType.emailAddress,
                      passwordVisibility: false,
                      togglePasswordVisibility: () {},
                      validator: authPageController.createEmailValidator),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.createWhatsappNumber,
                      labelText: KalakarConstants.whatsappNumber,
                      obscureText: false,
                      editable: authPageController.createMobileNumberEditable,
                      passwordVisibility: false,
                      textInputType: TextInputType.number,
                      togglePasswordVisibility: () {},
                      validator:
                          authPageController.createMobileNumberValidator),
                  SizedBox(
                    height: 14.h,
                  ),
                ],
              ),
            ),
            authPageController.isOtpSent
                ? Form(
                    key: authPageController.formCreateAccountKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.h),
                            child: Text(
                              KalakarConstants.enterOtp,
                              style: TextStyle(
                                  color: KalakarColors.textColor,
                                  fontSize: 14.sp),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: _getOtpEditor(authPageController),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            authPageController.startTime <= 0
                                ? InkWell(
                                    onTap: () {
                                      authPageController
                                          .getOTP(OTPType.createAccount);
                                    },
                                    child: Text(
                                      "Resend OTP",
                                      style: TextStyle(
                                          color: KalakarColors.headerText),
                                    ),
                                  )
                                : Text(
                                    "Resend OTP in ${authPageController.startTime} seconds")
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: authPageController.createPassword,
                            labelText: KalakarConstants.password,
                            obscureText: true,
                            textInputType: TextInputType.visiblePassword,
                            passwordVisibility:
                                authPageController.createPasswordValue,
                            togglePasswordVisibility: () {
                              authPageController.setPasswordVisibility(
                                  PasswordType.createPass);
                            },
                            validator:
                                authPageController.createPasswordValidator),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: authPageController.createCnfmPassword,
                            labelText: KalakarConstants.cnfmPassword,
                            textInputType: TextInputType.visiblePassword,
                            obscureText: true,
                            passwordVisibility:
                                authPageController.createShowCnfmPassword,
                            togglePasswordVisibility: () {
                              authPageController.setPasswordVisibility(
                                  PasswordType.createCnfmPass);
                            },
                            validator: authPageController
                                .createConfirmPasswordValidator),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.h),
                            child: Text(
                              "User Type",
                              style: TextStyle(
                                  color: KalakarColors.textColor,
                                  fontSize: 14.sp),
                            )),
                        SizedBox(
                          height: 8.h,
                        ),
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

                          list: [
                            KalakarConstants.artist,
                            KalakarConstants.company
                          ],

                          buttonBorderRadius: BorderRadius.circular(50.r),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Center(
                          child: CustomMobileButtonWidget(
                            text: KalakarConstants.getStarted,
                            onTap: () {
                              authPageController.getStartedCall();
                            },
                            horizontalPadding: 50.0,
                            verticalPadding: 8.0,
                            fontSize: 20.0,
                            backgroundColor: KalakarColors.buttonBackground,
                            textColor: KalakarColors.headerText,
                            borderRadius: 50.0,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CustomMobileButtonWidget(
                      text: KalakarConstants.getOtp,
                      onTap: () {
                        authPageController.getOTP(OTPType.createAccount);
                      },
                      horizontalPadding: 50.0,
                      verticalPadding: 8.0,
                      fontSize: 20.0,
                      backgroundColor: KalakarColors.buttonBackground,
                      textColor: KalakarColors.headerText,
                      borderRadius: 50.0,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                  ),
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
  }

  Widget _getOtpEditor(AuthPageController authPageController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OtpInputEditor(
          key: const Key("otp-field"),
          obscureText: false,
          otpLength: 4,
          onOtpChanged: (value) {
            authPageController.setOtpValue(value);
          },
          onInitialization: (OtpInputController otpInputController) {},
          invalid: true,
          otpTextFieldBackgroundColor: Colors.white,
          cursorHeight: 25,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              spreadRadius: 1.0,
            ),
          ],
          fieldWidth: 20.w,
          fieldHeight: 45.h,
          cursorWidth: 1.5.w,
          textInputStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          boxDecoration: BoxDecoration(
            border: Border.all(
              color: authPageController.otpError ? Colors.red : Colors.grey,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        authPageController.otpError
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Please Enter Valid OTP",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              )
            : Container(),
      ],
    );
  }

  mobileSignInPage() {
    return GetBuilder<AuthPageController>(builder: (authPageController) {
      return GestureDetector(
        child: SingleChildScrollView(
          child: Form(
            key: authPageController.formSignInKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  KalakarConstants.welcomeBack,
                  style: TextStyle(
                      color: KalakarColors.headerText, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  KalakarConstants.sigInText,
                  style: TextStyle(
                      color: KalakarColors.textColor, fontSize: 12.sp),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: authPageController.signInEmailOrMobile,
                    labelText: KalakarConstants.email,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    passwordVisibility: false,
                    togglePasswordVisibility: () {},
                    validator: authPageController.createEmailValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: authPageController.signInPassword,
                    labelText: KalakarConstants.password,
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    passwordVisibility: authPageController.signInPasswordValue,
                    togglePasswordVisibility: () {
                      authPageController
                          .setPasswordVisibility(PasswordType.signInPass);
                    },
                    validator: authPageController.createPasswordValidator),

                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: CustomMobileButtonWidget(
                    text: KalakarConstants.signIn,
                    onTap: () {
                      authPageController.signInCall();
                    },

                    horizontalPadding: 50.0,
                    verticalPadding: 8.0,
                    fontSize: 20.0,
                    backgroundColor: KalakarColors.buttonBackground,
                    textColor: KalakarColors.headerText,
                    borderRadius: 50.0,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: Text(
                  KalakarConstants.orSignInWith,
                  style:
                      TextStyle(color: KalakarColors.textColor, fontSize: 16.h),
                )),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
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
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(RouteHelper.forgotPassword);
                    },
                    onDoubleTap: (){
                      WriteLogFile.shareLogFile();
                    },
                    child: Text(
                      KalakarConstants.forgotPassword,
                      style: TextStyle(
                          color: KalakarColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  webSignUpPage() {
    return GetBuilder<AuthPageController>(builder: (authPageController) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: authPageController.formGetOtpKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    KalakarConstants.newKalakaarAccount,
                    style: TextStyle(
                        color: KalakarColors.headerText, fontSize: 8.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    KalakarConstants.signupText,
                    style: TextStyle(
                        color: KalakarColors.textColor, fontSize: 7.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.createFirstName,
                      labelText: KalakarConstants.firstName,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      passwordVisibility: false,
                      togglePasswordVisibility: () {},
                      validator: authPageController.createFirstNameValidator),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.createLastName,
                      labelText: KalakarConstants.lastName,
                      obscureText: false,
                      passwordVisibility: false,
                      textInputType: TextInputType.text,
                      togglePasswordVisibility: () {},
                      validator: authPageController.createLastNameValidator),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.createEmail,
                      labelText: KalakarConstants.email,
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      passwordVisibility: false,
                      togglePasswordVisibility: () {},
                      validator: authPageController.createEmailValidator),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.createWhatsappNumber,
                      labelText: KalakarConstants.whatsappNumber,
                      obscureText: false,
                      textInputType: TextInputType.number,
                      passwordVisibility: false,
                      togglePasswordVisibility: () {},
                      validator:
                          authPageController.createMobileNumberValidator),
                  SizedBox(
                    height: 14.h,
                  ),
                ],
              ),
            ),
            authPageController.isOtpSent
                ? Form(
                    key: authPageController.formCreateAccountKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.h),
                            child: Text(
                              KalakarConstants.enterOtp,
                              style: TextStyle(
                                  color: KalakarColors.textColor,
                                  fontSize: 4.sp),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: _getOtpEditor(authPageController),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: authPageController.createPassword,
                            labelText: KalakarConstants.password,
                            obscureText: true,
                            textInputType: TextInputType.visiblePassword,
                            passwordVisibility:
                                authPageController.createPasswordValue,
                            togglePasswordVisibility: () {
                              authPageController.setPasswordVisibility(
                                  PasswordType.createPass);
                            },
                            validator:
                                authPageController.createPasswordValidator),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: authPageController.createCnfmPassword,
                            labelText: KalakarConstants.cnfmPassword,
                            obscureText: true,
                            textInputType: TextInputType.visiblePassword,
                            passwordVisibility:
                                authPageController.createShowCnfmPassword,
                            togglePasswordVisibility: () {
                              authPageController.setPasswordVisibility(
                                  PasswordType.createCnfmPass);
                            },
                            validator: authPageController
                                .createConfirmPasswordValidator),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.h),
                            child: Text(
                              "User Type",
                              style: TextStyle(
                                  color: KalakarColors.textColor,
                                  fontSize: 4.sp),
                            )),
                        SizedBox(
                          height: 8.h,
                        ),
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

                          list: [
                            KalakarConstants.artist,
                            KalakarConstants.company
                          ],

                          buttonBorderRadius: BorderRadius.circular(50.r),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Center(
                          child: CustomMobileButtonWidget(
                            text: KalakarConstants.getStarted,
                            onTap: () {
                              authPageController.getStartedCall();
                            },
                            horizontalPadding: 50.0,
                            verticalPadding: 8.0,
                            fontSize: 8.sp,
                            backgroundColor: KalakarColors.buttonBackground,
                            textColor: KalakarColors.headerText,
                            borderRadius: 50.0,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CustomMobileButtonWidget(
                      text: KalakarConstants.getOtp,
                      onTap: () {
                        authPageController.getOTP(OTPType.createAccount);
                      },
                      horizontalPadding: 10.w,
                      verticalPadding: 4.h,
                      fontSize: 8.sp,
                      backgroundColor: KalakarColors.buttonBackground,
                      textColor: KalakarColors.headerText,
                      borderRadius: 50.0,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                  ),
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
              child: CustomSignInButtonWidget(
                onTap: () {
                  authPageController.signInWithGoogle();
                },
                text: KalakarConstants.continueWithGoogle,
                icon: Text(
                  "G",
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: KalakarColors.textColor,
                      fontWeight: FontWeight.bold),
                ),
                paddingHorizontal: 10.w,
                paddingVertical: 2.h,
                borderRadius: 50.r,
                textSize: 6.sp,
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      );
    });
  }

  webSignInPage() {
    return GetBuilder<AuthPageController>(builder: (authPageController) {
      return SingleChildScrollView(
        child: Form(
          key: authPageController.formSignInKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                KalakarConstants.welcomeBack,
                style:
                    TextStyle(color: KalakarColors.headerText, fontSize: 8.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                KalakarConstants.sigInText,
                style:
                    TextStyle(color: KalakarColors.textColor, fontSize: 7.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: authPageController.signInEmailOrMobile,
                  labelText: KalakarConstants.email,
                  obscureText: false,

                  textInputType: TextInputType.emailAddress,
                  passwordVisibility: false,
                  togglePasswordVisibility: () {},
                  validator: authPageController.createEmailValidator),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: authPageController.signInPassword,
                  labelText: KalakarConstants.password,
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                  passwordVisibility: authPageController.signInPasswordValue,
                  togglePasswordVisibility: () {
                    authPageController
                        .setPasswordVisibility(PasswordType.signInPass);
                  },
                  validator: authPageController.createPasswordValidator),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: CustomMobileButtonWidget(
                  text: KalakarConstants.signIn,
                  onTap: () {
                    authPageController.signInCall();
                  },
                  horizontalPadding: 50.0,
                  verticalPadding: 8.0,
                  fontSize: 20.0,
                  backgroundColor: KalakarColors.buttonBackground,
                  textColor: KalakarColors.headerText,
                  borderRadius: 50.0,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                  child: Text(
                KalakarConstants.orSignInWith,
                style:
                    TextStyle(color: KalakarColors.textColor, fontSize: 16.h),
              )),
              SizedBox(
                height: 20.h,
              ),
              CustomSignInButtonWidget(
                onTap: () {
                  authPageController.signInWithGoogle();
                },
                text: KalakarConstants.continueWithGoogle,
                icon: Text(
                  "G",
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: KalakarColors.textColor,
                      fontWeight: FontWeight.bold),
                ),
                paddingHorizontal: 10.w,
                paddingVertical: 2.h,
                borderRadius: 50.r,
                textSize: 6.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: InkWell(
                  onTap: (){
                    Get.toNamed(RouteHelper.forgotPassword);
                  },
                  child: Text(
                    KalakarConstants.forgotPassword,
                    style: TextStyle(
                        color: KalakarColors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ),
      );
    });
  }

  appBarMobileView() {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 16.h),
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
      decoration: BoxDecoration(
          // color: KalakarColors.appBarBackground,
          borderRadius: BorderRadius.circular(16.r)),
      child: Center(child: Image.asset("assets/images/app_bar_logo.png")),
    );
  }

  appBarWebView() {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 16.h),
        // margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
        // decoration: BoxDecoration(
        // color: KalakarColors.appBarBackground,
        // borderRadius: BorderRadius.circular(16.r)),
        // child: Center(child: Image.asset("assets/images/app_bar_logo.png")),
        );
  }

  Widget commonWebTextField({
    required TextEditingController controller,
    required String labelText,
    required bool obscureText,
    required bool passwordVisibility,
    required VoidCallback? togglePasswordVisibility,
    Color textColor = KalakarColors.textColor,
    Color borderColor = KalakarColors.border,
    Color focusedBorderColor = KalakarColors.selectedBorder,
    Color labelColor = KalakarColors.textColor,
    double borderRadius = 50.0,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 12),
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(color: textColor),
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 1),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        contentPadding: contentPadding,
        suffixIcon: obscureText
            ? InkWell(
                onTap: togglePasswordVisibility,
                child: Icon(passwordVisibility
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
              )
            : null,
      ),
    );
  }
}
