import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:kalakar/helper/common_widgets.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/helper/textfield_validators.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:otp_input_editor/otp_input_editor.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/button_mobile_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthPageController>(builder: (authPageController) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: kIsWeb?KalakarColors.white:KalakarColors.background,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, kIsWeb?0.0:55.h),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => appBarMobileView(),
            tablet: (BuildContext context) => Container(),
          ),
        ),
        body: ScreenTypeLayout.builder(
          mobile: (BuildContext context) =>
              mobileForgotPassPage(authPageController),
          tablet: (BuildContext context) =>
              webForgotPassPage(authPageController),
        ),
      ));
    });
  }

  mobileForgotPassPage(AuthPageController authPageController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(

          children: [
            Form(
              key: authPageController.formGetForgotOtpKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.forgotPassMobile,
                      labelText: KalakarConstants.whatsappNumber,
                      obscureText: false,
                      textInputType: TextInputType.number,
                      passwordVisibility: false,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateMobileNumber),
                  SizedBox(
                    height: 24.h,
                  ),
                  CommonWidgets.commonMobileTextField(
                      controller: authPageController.forgotPassEmail,
                      labelText: KalakarConstants.email,
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      passwordVisibility: false,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateEmail),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
            authPageController.isOtpSent
                ? Form(
                    key: authPageController.formSetForgotPassKey,
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
                                    "Resend OTP in ${authPageController.formatDuration(authPageController.startTime)}")
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
                            validator: Validator.validatePassword),
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
                            validator: (val) {
                              return Validator.validateConfirmPassword(
                                  val, authPageController.createPassword.text);
                            }),
                        SizedBox(
                          height: 16.h,
                        ),
                        Center(
                          child: CustomMobileButtonWidget(
                            text: KalakarConstants.resetPass,
                            onTap: () {
                              authPageController.setForgotPassword();
                            },
                            horizontalPadding: 2.w,
                            verticalPadding: 8.0,
                            fontSize: 16.sp,
                            width: 225.w,
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
                : CustomMobileButtonWidget(
                    text: KalakarConstants.getOtp,
                    onTap: () {
                      authPageController.getOTP(OTPType.forgotPassword);
                    },
                    horizontalPadding: 2.w,
                    verticalPadding: 8.0,
                    fontSize: 16.sp,
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
          ],
        ),
      ),
    );
  }

  webForgotPassPage(AuthPageController authPageController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Image.asset("assets/images/forgot-passwor.png"),
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 6.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Form(
                        key: authPageController.formGetForgotOtpKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            CommonWidgets.commonMobileTextField(
                                controller: authPageController.forgotPassMobile,
                                labelText: KalakarConstants.whatsappNumber,
                                obscureText: false,
                                textInputType: TextInputType.number,
                                passwordVisibility: false,
                                togglePasswordVisibility: () {},
                                validator: Validator.validateMobileNumber),
                            SizedBox(
                              height: 24.h,
                            ),
                            CommonWidgets.commonMobileTextField(
                                controller: authPageController.forgotPassEmail,
                                labelText: KalakarConstants.email,
                                obscureText: false,
                                textInputType: TextInputType.emailAddress,
                                passwordVisibility: false,
                                togglePasswordVisibility: () {},
                                validator: Validator.validateEmail),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        ),
                      ),
                      authPageController.isOtpSent
                          ? Form(
                              key: authPageController.formSetForgotPassKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 28.h),
                                      child: Text(
                                        KalakarConstants.enterOtp,
                                        style: TextStyle(
                                            color: KalakarColors.textColor,
                                            fontSize: 4.sp),
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: _getOtpEditorWeb(authPageController),
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
                                                authPageController.getOTP(
                                                    OTPType.createAccount);
                                              },
                                              child: Text(
                                                "Resend OTP",
                                                style: TextStyle(
                                                    color:
                                                        KalakarColors.headerText,fontSize: 3.sp),
                                              ),
                                            )
                                          : Text(
                                              "Resend OTP in ${authPageController.formatDuration(authPageController.startTime)}",style: TextStyle(fontSize: 3.sp),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CommonWidgets.commonMobileTextField(
                                      controller:
                                          authPageController.createPassword,
                                      labelText: KalakarConstants.password,
                                      obscureText: true,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      passwordVisibility:
                                          authPageController.createPasswordValue,
                                      togglePasswordVisibility: () {
                                        authPageController.setPasswordVisibility(
                                            PasswordType.createPass);
                                      },
                                      validator: Validator.validatePassword),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CommonWidgets.commonMobileTextField(
                                      controller:
                                          authPageController.createCnfmPassword,
                                      labelText: KalakarConstants.cnfmPassword,
                                      obscureText: true,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      passwordVisibility: authPageController
                                          .createShowCnfmPassword,
                                      togglePasswordVisibility: () {
                                        authPageController.setPasswordVisibility(
                                            PasswordType.createCnfmPass);
                                      },
                                      validator: (val) {
                                        return Validator.validateConfirmPassword(
                                            val,
                                            authPageController
                                                .createPassword.text);
                                      }),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Center(
                                    child: CustomMobileButtonWidget(
                                      text: KalakarConstants.resetPass,
                                      onTap: () {
                                        authPageController.setForgotPassword();
                                      },
                                      horizontalPadding: 2.w,
                                      verticalPadding: 8.0,
                                      fontSize: 4.sp,
                                      width: 75.w,
                                      backgroundColor:
                                          KalakarColors.buttonBackground,
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
                          : CustomMobileButtonWidget(
                              text: KalakarConstants.getOtp,
                              onTap: () {
                                authPageController.getOTP(OTPType.forgotPassword);
                              },
                              horizontalPadding: 2.w,
                              verticalPadding: 8.h,
                              fontSize: 4.sp,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
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

  Widget _getOtpEditorWeb(AuthPageController authPageController) {
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
          cursorHeight: 18.h,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              spreadRadius: 1.0,
            ),
          ],
          fieldWidth: 20.w,
          fieldHeight: 33.h,
          cursorWidth: .5.w,
          textInputStyle: TextStyle(
            fontSize: 8.sp,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          boxDecoration: BoxDecoration(
            border: Border.all(
              color: authPageController.otpError ? Colors.red : Colors.grey,
              width: .5.w,
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

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.resetPass,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
