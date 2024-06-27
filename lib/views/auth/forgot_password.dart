import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:kalakar/helper/common_widgets.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:otp_input_editor/otp_input_editor.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/button_mobile_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthPageController>(
      builder: (authPageController) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: KalakarColors.background,
          appBar: AppBar(
            leading: Container(),
            leadingWidth: 0.0,
            backgroundColor: KalakarColors.appBarBackground,
            title: Text(
              KalakarConstants.forgotPassword,
              style: TextStyle(color: KalakarColors.black),
            ),
          ),
          body: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => mobileCreateAccountPage(authPageController),
            tablet: (BuildContext context) => webCreateAccountPage(authPageController),
          ),
        ));
      }
    );
  }

  mobileCreateAccountPage(AuthPageController authPageController) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w
      ),
      child: Column(
        children: [
          Form(
            key: authPageController.formGetForgotOtpKey,
            child: Column(children: [
              SizedBox(height: 24.h,),
              CommonWidgets.commonMobileTextField(
                  controller: authPageController.forgotPassMobile,
                  labelText: KalakarConstants.whatsappNumber,
                  obscureText: false,
                  passwordVisibility: false,
                  togglePasswordVisibility: () {},
                  validator: authPageController.createMobileNumberValidator),
              SizedBox(height: 24.h,),

              CommonWidgets.commonMobileTextField(
                  controller: authPageController.forgotPassEmail,
                  labelText: KalakarConstants.email,
                  obscureText: false,
                  passwordVisibility: false,
                  togglePasswordVisibility: () {},
                  validator: authPageController.createEmailValidator),
              SizedBox(height: 24.h,),

            ],),
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
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: authPageController.createPassword,
                    labelText: KalakarConstants.password,
                    obscureText: true,
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
                Center(
                  child: CustomMobileButtonWidget(
                    text: KalakarConstants.getStarted,
                    onTap: () {
                      authPageController.setForgotPassword();
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
          ):CustomMobileButtonWidget(
            text: KalakarConstants.getOtp,
            onTap: () {
              authPageController.getOTP(OTPType.forgotPassword);
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
        ],
      ),
    );
  }

  webCreateAccountPage(AuthPageController authPageController) {
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

  OtpInputEditor _getOtpEditor(AuthPageController authPageController) {
    return OtpInputEditor(
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
          color: Colors.grey,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }

}
