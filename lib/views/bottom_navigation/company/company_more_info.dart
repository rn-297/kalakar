import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/helper/textfield_validators.dart';
import 'package:otp_input_editor/otp_input_editor.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class CompanyMoreInfoFormPage extends StatelessWidget {
  const CompanyMoreInfoFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60.h),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => appBarMobileView(),
            tablet: (BuildContext context) => appBarWebView(),
          )),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => companyMoreInfoMobileView(context),
        tablet: (BuildContext context) => companyMoreInfoWebView(context),
      ),
    );
  }

  companyMoreInfoMobileView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: GetBuilder<ProfileController>(builder: (controller) {
          return Column(
            children: [
              Form(
                key: controller.formCompanyProfileMoreInfoOtpKey,
                child: Column(
                  children: [
                    CommonWidgets.commonMobileTextField1(
                        controller: controller.emailTEController,
                        labelText: KalakarConstants.email,
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                        passwordVisibility: false,
                        editable: controller.emailEditable,
                        hintText: "Enter Email Id",
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateEmail),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonWidgets.commonMobileTextField1(
                        controller: controller.mobileNumberTEController,
                        labelText: KalakarConstants.mobileNumber,
                        obscureText: false,
                        editable: controller.mobileNumberEditable,
                        textInputType: TextInputType.number,
                        hintText: "Enter Mobile Number",
                        passwordVisibility: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateMobileNumber),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
              controller.isOtpSent
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(KalakarConstants.otp),
                          _getOtpEditor(controller),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              controller.startTime <= 0
                                  ? InkWell(
                                      onTap: () {
                                        controller.getContactVerificationOTP();
                                      },
                                      child: Text(
                                        "Resend OTP",
                                        style: TextStyle(
                                            color: KalakarColors.headerText),
                                      ),
                                    )
                                  : Text(
                                      "Resend OTP in ${controller.startTime} seconds")
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomMobileButtonWidget(
                            onTap: () {
                              controller.verifyContact();
                            },
                            borderRadius: 50.r,
                            fontSize: 14.sp,
                            text: KalakarConstants.verifyContact,
                            horizontalPadding: 20.w,
                            verticalPadding: 8.h,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      ),
                    )
                  : controller.isContactVerified
                      ? Container()
                      : Column(
                          children: [
                            CustomMobileButtonWidget(
                              onTap: () {
                                controller.getContactVerificationOTP();
                              },
                              borderRadius: 50.r,
                              fontSize: 14.sp,
                              text: KalakarConstants.getOtp,
                              horizontalPadding: 20.w,
                              verticalPadding: 8.h,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
              Form(
                key: controller.formCompanyProfileMoreInfoDocumentsKey,
                child: Column(
                  children: [
                    CommonWidgets.commonMobileTextField1(
                        controller: controller.nameTEController,
                        labelText: KalakarConstants.name,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        hintText: "Enter First Name",
                        // isSuffixIcon: true,
                        // editable: true,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateName),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonWidgets.commonMobileTextField1(
                        controller: controller.ownerCeoNameTEController,
                        labelText: KalakarConstants.adminCeo,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        hintText: "Enter Admin / CEO ",
                        passwordVisibility: false,
                        // isSuffixIcon: true,
                        editable: true,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateOwnerCeoName),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.pickOrShowDocument(
                            KalakarConstants.filmCorporationCard,
                            context,
                            controller);
                      },
                      child: CommonWidgets.commonMobileTextField1(
                          controller:
                              controller.filmCorporationCardTEController,
                          labelText: KalakarConstants.filmCorporationCard,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          isSuffixIcon: true,
                          editable: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateFilmCorporationCard),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.pickOrShowDocument(
                            KalakarConstants.adminAadharCard,
                            context,
                            controller);
                      },
                      child: CommonWidgets.commonMobileTextField1(
                          controller: controller.adminAadharCardTEController,
                          labelText: KalakarConstants.adminAadharCard,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          isSuffixIcon: true,
                          editable: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateAdminAdharCard),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.pickOrShowDocument(
                            KalakarConstants.addressProofOfCompany,
                            context,
                            controller);
                      },
                      child: CommonWidgets.commonMobileTextField1(
                          controller:
                              controller.addressProofOfCompanyTEController,
                          labelText: KalakarConstants.addressProofOfCompany,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          isSuffixIcon: true,
                          editable: false,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateAddressProofOfCompany),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.pickOrShowDocument(
                            KalakarConstants.selfieUpload, context, controller);
                      },
                      child: CommonWidgets.commonMobileTextField1(
                          controller: controller.selfieUploadTEController,
                          labelText: KalakarConstants.selfieUpload,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          editable: false,
                          isSuffixIcon: true,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateUploadSelfie),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.saveCompanyMoreInfo();
                },
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.saveChanges,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
            ],
          );
        }),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.moreInfo,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      /*actions: [
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.companyProfileFormPage);
          },
          child: Icon(
            Icons.edit,
            size: 30.h,
          ),
        ),
        SizedBox(
          width: 16.h,
        )
      ],*/
    );
  }

  appBarWebView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.moreInfo,
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
      /*actions: [
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.companyProfileFormPage);
          },
          child: Icon(
            Icons.edit,
            size: 30.h,
          ),
        ),
        SizedBox(
          width: 16.h,
        )
      ],*/
    );
  }

  Widget _getOtpEditor(ProfileController profileController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OtpInputEditor(
          key: const Key("otp-field"),
          obscureText: false,
          otpLength: 4,
          onOtpChanged: (value) {
            profileController.setOtpValue(value);
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
              color: profileController.otpError ? Colors.red : Colors.grey,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        profileController.otpError
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

  companyMoreInfoWebView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 32.w),
        child: GetBuilder<ProfileController>(builder: (controller) {
          return Column(
            children: [
              Form(
                key: controller.formCompanyProfileMoreInfoOtpKey,
                child: Column(
                  children: [
                    CommonWidgets.commonMobileTextField2(
                        controller: controller.emailTEController,
                        labelText: KalakarConstants.email,
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                        passwordVisibility: false,
                        editable: controller.emailEditable,
                        hintText: "Enter Email Id",
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateEmail),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonWidgets.commonMobileTextField2(
                        controller: controller.mobileNumberTEController,
                        labelText: KalakarConstants.mobileNumber,
                        obscureText: false,
                        editable: controller.mobileNumberEditable,
                        textInputType: TextInputType.number,
                        hintText: "Enter Mobile Number",
                        passwordVisibility: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateMobileNumber),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
              controller.isOtpSent
                  ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(KalakarConstants.otp),
                    _getOtpEditor(controller),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        controller.startTime <= 0
                            ? InkWell(
                          onTap: () {
                            controller.getContactVerificationOTP();
                          },
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                                color: KalakarColors.headerText),
                          ),
                        )
                            : Text(
                            "Resend OTP in ${controller.startTime} seconds")
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomMobileButtonWidget(
                      onTap: () {
                        controller.verifyContact();
                      },
                      borderRadius: 50.r,
                      fontSize: 5.sp,
                      text: KalakarConstants.verifyContact,
                      horizontalPadding: 2.w,
                      verticalPadding: 8.h,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              )
                  : controller.isContactVerified
                  ? Container()
                  : Column(
                children: [
                  CustomMobileButtonWidget(
                    onTap: () {
                      controller.getContactVerificationOTP();
                    },
                    borderRadius: 50.r,
                    fontSize: 5.sp,
                    text: KalakarConstants.getOtp,
                    horizontalPadding: 2.w,
                    verticalPadding: 8.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
              Form(
                key: controller.formCompanyProfileMoreInfoDocumentsKey,
                child: Column(
                  children: [
                    CommonWidgets.commonMobileTextField2(
                        controller: controller.nameTEController,
                        labelText: KalakarConstants.name,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        hintText: "Enter First Name",
                        // isSuffixIcon: true,
                        // editable: true,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateName),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonWidgets.commonMobileTextField2(
                        controller: controller.ownerCeoNameTEController,
                        labelText: KalakarConstants.adminCeo,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        hintText: "Enter Admin / CEO ",
                        passwordVisibility: false,
                        // isSuffixIcon: true,
                        editable: true,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateOwnerCeoName),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.pickOrShowDocumentWeb(
                            KalakarConstants.filmCorporationCard,
                            context,
                            controller);
                      },
                      child: CommonWidgets.commonMobileTextField2(
                          controller:
                          controller.filmCorporationCardTEController,
                          labelText: KalakarConstants.filmCorporationCard,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          isSuffixIcon: true,
                          editable: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateFilmCorporationCard),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.pickOrShowDocumentWeb(
                            KalakarConstants.adminAadharCard,
                            context,
                            controller);
                      },
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.adminAadharCardTEController,
                          labelText: KalakarConstants.adminAadharCard,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          isSuffixIcon: true,
                          editable: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateAdminAdharCard),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.pickOrShowDocumentWeb(
                            KalakarConstants.addressProofOfCompany,
                            context,
                            controller);
                      },
                      child: CommonWidgets.commonMobileTextField2(
                          controller:
                          controller.addressProofOfCompanyTEController,
                          labelText: KalakarConstants.addressProofOfCompany,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          isSuffixIcon: true,
                          editable: false,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateAddressProofOfCompany),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.pickOrShowDocumentWeb(
                            KalakarConstants.selfieUpload, context, controller);
                      },
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.selfieUploadTEController,
                          labelText: KalakarConstants.selfieUpload,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          editable: false,
                          isSuffixIcon: true,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateUploadSelfie),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.saveCompanyMoreInfoWeb();
                },
                borderRadius: 50.r,
                fontSize: 5.sp,
                text: KalakarConstants.saveChanges,
                horizontalPadding: 2.w,
                verticalPadding: 8.h,
              ),
            ],
          );
        }),
      ),
    );
  }
}
