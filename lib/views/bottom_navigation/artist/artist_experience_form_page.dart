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

class ArtistExperienceFormPage extends StatelessWidget {
  const ArtistExperienceFormPage({super.key});

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
        mobile: (BuildContext context) => educationFormMobileView(context),
        tablet: (BuildContext context) => educationFormWebView(),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.artistDocuments,
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
        KalakarConstants.education,
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
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
      ],
    );
  }

  educationFormMobileView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
      return Padding(
          padding: EdgeInsets.all(24.h),
          child: Form(
            key: controller.formExperienceKey,
            child: Column(children: [
              CommonWidgets.commonMobileTextField(
                  controller: controller.companyNameTEController,
                  labelText: KalakarConstants.companyName,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateCompanyName),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.roleNameTEController,
                  labelText: KalakarConstants.roleName,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateRoleName),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.expStartDateTEController,
                  labelText: KalakarConstants.startDate,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateStartDate),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.expEndDateTEController,
                  labelText: KalakarConstants.endDate,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateEndDate),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.skillsUsedTEController,
                  labelText: KalakarConstants.skillsUsed,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateSkillsUsed),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.roleProfileTEController,
                  labelText: KalakarConstants.roleProfile,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateRoleProfile),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  controller.pickDocument(
                      KalakarConstants.roleImage, context, controller);
                },
                child: CommonWidgets.commonMobileTextField(
                    controller: controller.roleImageTEController,
                    labelText: KalakarConstants.roleImage,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  controller.pickDocument(
                      KalakarConstants.roleVideo, context, controller);
                },
                child: CommonWidgets.commonMobileTextField(
                    controller: controller.roleVideoTEController,
                    labelText: KalakarConstants.roleVideo,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.validateExperienceForm();
                },
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.saveExperience,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
            ]),
          ));
    }));
  }

  educationFormWebView() {}
}
