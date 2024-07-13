import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helper/common_widgets.dart';
import '../../helper/kalakar_colors.dart';

class RequirementFormPage extends StatelessWidget {
  const RequirementFormPage({super.key});

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
        mobile: (BuildContext context) => requirementFormMobileView(),
        tablet: (BuildContext context) => requirementFormWebView(),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.requirement,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.filter_alt,
            size: 30.h,
          ),
        ),
        SizedBox(
          width: 16.h,
        )
      ],
    );
  }

  appBarWebView() {}

  requirementFormMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Form(
            key: controller.formRequirementKey,
            child: Column(
              children: [
                CommonWidgets.commonMobileTextField(
                    controller: controller.requirementTitleTEController,
                    labelText: KalakarConstants.requirementTitle,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.requirementTitleValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.descriptionTEController,
                    labelText: KalakarConstants.description,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    maxLines: 3,
                    togglePasswordVisibility: () {},
                    validator: controller.descriptionValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.lookingForTEController,
                    labelText: KalakarConstants.lookingFor,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.lookingForValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.noOfOpeningsTEController,
                    labelText: KalakarConstants.noOfOpenings,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.noOfOpeningValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.ageTEController,
                    labelText: KalakarConstants.age,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.ageValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.languageTEController,
                    labelText: KalakarConstants.language,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.languageValidator),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.heightTEController,
                          labelText: KalakarConstants.height,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: controller.heightValidator),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.weightTEController,
                          labelText: KalakarConstants.weight,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: controller.weightValidator),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.hairColorTEController,
                    labelText: KalakarConstants.hairColor,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.hairColorValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.bodyTypeTEController,
                    labelText: KalakarConstants.bodyType,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.bodyTypeValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.experienceTEController,
                    labelText: KalakarConstants.experiences,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.experienceValidator),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.startDateTEController,
                          labelText: KalakarConstants.startDate,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: controller.startDateValidator),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.endDateTEController,
                          labelText: KalakarConstants.endDate,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: controller.endDateValidator),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.shootingLocationTEController,
                    labelText: KalakarConstants.shootingLocation,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.shootingLocationValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.defineRoleTEController,
                    labelText: KalakarConstants.defineRole,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    maxLines: 3,
                    togglePasswordVisibility: () {},
                    validator: controller.defineRoleValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.splSkillRequiredTEController,
                    labelText: KalakarConstants.specialSkillRequired,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.splSkillsRequiredValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.scriptForAuditionTEController,
                    labelText: KalakarConstants.scriptForAudition,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.scriptForAuditionValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.fbLinkTEController,
                    labelText: KalakarConstants.fbLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.fbLinkValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.wpLinkTEController,
                    labelText: KalakarConstants.wpLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.wpLinkTitleValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.ytLinkTEController,
                    labelText: KalakarConstants.ytLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.ytLinkValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.instaLinkTEController,
                    labelText: KalakarConstants.instaLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.instaLinkValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.emailLinkTEController,
                    labelText: KalakarConstants.emailLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.emailLinkValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.websiteLinkTEController,
                    labelText: KalakarConstants.websiteLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.websiteLinkValidator),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  requirementFormWebView() {}
}
