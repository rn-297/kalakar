import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/button_mobile_widget.dart';
import '../../custom_widgets/toggle_button.dart';
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
        mobile: (BuildContext context) => googleNewUserMobileView(),
        tablet: (BuildContext context) => googleNewUserWebView(context),
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
            KalakarConstants.createAccount,
            style: TextStyle(
                color: KalakarColors.textColor,
                fontSize: 6.sp,
                fontWeight: FontWeight.bold),
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

  googleNewUserMobileView() {
    return SingleChildScrollView(
        child: GetBuilder<AuthPageController>(builder: (authPageController) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: authPageController.formGoogleSignInKey,
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
                      editable: false,
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
                    height: 32.h,
                  ),
                  Center(
                    child: CustomMobileButtonWidget(
                      text: KalakarConstants.saveAndSignIn,
                      onTap: () {
                        authPageController.createGoogleAccount();
                      },
                      horizontalPadding: 30.0,
                      verticalPadding: 8.0,
                      fontSize: 20.0,
                      width: 250.w,
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
          ],
        ),
      );
    }));
  }

  googleNewUserWebView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<AuthPageController>(builder: (authPageController) {
      return Row(
        children: [
          Expanded(
            flex: 2,
              child: Image.asset(
            "assets/images/google_sign_in.png",
            height: 150.h,
          )),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: KalakarColors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: authPageController.formGoogleSignInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          KalakarConstants.newKalakaarAccount,
                          style: TextStyle(
                              color: KalakarColors.headerText, fontSize: 5.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          KalakarConstants.signupText,
                          style: TextStyle(
                              color: KalakarColors.textColor, fontSize: 4.sp),
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
                          height: 16.h,
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
                          height: 16.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: authPageController.createEmail,
                            labelText: KalakarConstants.email,
                            obscureText: false,
                            editable: false,
                            textInputType: TextInputType.emailAddress,
                            passwordVisibility: false,
                            togglePasswordVisibility: () {},
                            validator: Validator.validateEmail),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: authPageController.createWhatsappNumber,
                            labelText: KalakarConstants.whatsappNumber,
                            obscureText: false,
                            editable:
                                authPageController.createMobileNumberEditable,
                            passwordVisibility: false,
                            textInputType: TextInputType.number,
                            togglePasswordVisibility: () {},
                            validator: Validator.validateMobileNumber),
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
                          height: 32.h,
                        ),
                        Center(
                          child: CustomMobileButtonWidget(
                            text: KalakarConstants.saveAndSignIn,
                            onTap: () {
                              authPageController.createGoogleAccount();
                            },
                            horizontalPadding: 2.w,
                            verticalPadding: 8.0,
                            fontSize: 4.sp,
                            width: 80.w,
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
                ],
              ),
            ),
          ),
        ],
      );
    }));
  }
}
