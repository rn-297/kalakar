import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/button_mobile_widget.dart';
import '../../helper/common_widgets.dart';
import '../../helper/kalakar_colors.dart';
import '../../helper/textfield_validators.dart';
import '../../utils/kalakar_constants.dart';

class GoogleNewUserPage extends StatelessWidget {
  const GoogleNewUserPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appbarMobileView(),
          tablet: (BuildContext context) => appbarWebView(),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => privacyPolicyMobileView(),
        tablet: (BuildContext context) => privacyPolicyWebView(context),
      ),
    );
  }

  appbarMobileView() {
    return AppBar(
      toolbarHeight: 60.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   height: 60.h,
          //   width: 60.h,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(image: NetworkImage("")),
          //       border: Border.all(color: KalakarColors.headerText),
          //       borderRadius: BorderRadius.circular(50.r)),
          // ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            KalakarConstants.createAccount,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
          ),
        ],
      ),
/*
      actions: [
        InkWell(
          onTap: (){
            Get.toNamed(RouteHelper.notificationPage);

          },
          child: Icon(
            Icons.notifications,
            size: 35,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
*/
    );
  }

  appbarWebView() {
    return AppBar(
      toolbarHeight: 60.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   height: 60.h,
          //   width: 60.h,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(image: NetworkImage("")),
          //       border: Border.all(color: KalakarColors.headerText),
          //       borderRadius: BorderRadius.circular(50.r)),
          // ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            KalakarConstants.privacyPolicy,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
          ),
        ],
      ),
/*
      actions: [
        InkWell(
          onTap: (){
            Get.toNamed(RouteHelper.notificationPage);

          },
          child: Icon(
            Icons.notifications,
            size: 35,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
*/
    );
  }

  privacyPolicyMobileView() {
    return SingleChildScrollView(
      child:GetBuilder<AuthPageController>(builder: (authPageController){
        return Padding(
          padding:  EdgeInsets.all(32.h),
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
                        validator: Validator.validateFirstName),
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
                        validator: Validator.validateLastName),
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
                        validator: Validator.validateEmail),
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
                        validator: Validator.validateMobileNumber),
                    SizedBox(
                      height: 14.h,
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
                height: 40.h,
              )
            ],
          ),
        );
      })
    );
  }

  privacyPolicyWebView(BuildContext context) {}
}
