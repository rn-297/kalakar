import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/artist_profile_controller.dart';
import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/textfield_validators.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistHobbiesFormPage extends StatelessWidget {
  const ArtistHobbiesFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appBarMobileView(),
          tablet: (BuildContext context) => appBarWebView(),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => hobbiesFormMobileView(context),
        tablet: (BuildContext context) => hobbiesFormWebView(context),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.hobby,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      /* actions: [
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.artistProfileForm);
          },
          child: Icon(
            Icons.settings,
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
        KalakarConstants.hobby,
        style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      /*actions: [
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
      ],*/
    );
  }

  hobbiesFormMobileView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
      return Padding(
          padding: EdgeInsets.all(24.h),
          child: Form(
            key: controller.formHobbiesKey,
            child: Column(children: [
              CommonWidgets.commonMobileTextField1(
                  controller: controller.hobbyTEController,
                  labelText: KalakarConstants.hobby,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  hintText: "Enter Hobby",
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateHobby),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (controller.artistHobbiesId != "0")
                    CustomMobileButtonWidget(
                      onTap: () {
                        controller.deleteHobbies();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      width: 125.w,
                      text: KalakarConstants.delete,
                      backgroundColor: Colors.red,
                      showIcon: true,
                      icon: Icons.delete,
                      iconColor: KalakarColors.white,
                      textColor: KalakarColors.white,
                      horizontalPadding: 20.w,
                      verticalPadding: 8.h,
                    ),
                  CustomMobileButtonWidget(
                    onTap: () {
                      controller.validateHobbiesForm();
                    },
                    borderRadius: 50.r,
                    fontSize: 14.sp,
                    width: 125.w,
                    showIcon: true,
                    icon: Icons.save,
                    iconColor: KalakarColors.headerText,
                    text: KalakarConstants.save,
                    horizontalPadding: 20.w,
                    verticalPadding: 8.h,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
            ]),
          ));
    }));
  }

  hobbiesFormWebView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical:24.h,horizontal: 32.w),
              child: Form(
                key: controller.formHobbiesKey,
                child: Column(children: [
                  CommonWidgets.commonMobileTextField2(
                      controller: controller.hobbyTEController,
                      labelText: KalakarConstants.hobby,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      passwordVisibility: false,
                      hintText: "Enter Hobby",
                      borderRadius: 12.r,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateHobby),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (controller.artistHobbiesId != "0")
                        CustomMobileButtonWidget(
                          onTap: () {
                            controller.deleteHobbies();
                          },
                          borderRadius: 50.r,
                          fontSize: 6.sp,
                          width: 125.w,
                          text: KalakarConstants.delete,
                          backgroundColor: Colors.red,
                          showIcon: true,
                          icon: Icons.delete,
                          iconColor: KalakarColors.white,
                          textColor: KalakarColors.white,
                          horizontalPadding: 2.w,
                          verticalPadding: 8.h,
                        ),
                      CustomMobileButtonWidget(
                        onTap: () {
                          controller.validateHobbiesForm();
                        },
                        borderRadius: 50.r,
                        fontSize: 5.sp,
                        width: 125.w,
                        showIcon: true,
                        icon: Icons.save,
                        iconColor: KalakarColors.headerText,
                        text: KalakarConstants.save,
                        horizontalPadding: 2.w,
                        verticalPadding: 8.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ]),
              ));
        }));
  }
}
