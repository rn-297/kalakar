import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/helper/date_picker_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/button_mobile_widget.dart';
import '../../custom_widgets/custom_dropdown_search.dart';
import '../../helper/common_widgets.dart';
import '../../helper/kalakar_colors.dart';
import '../../helper/picker_helper.dart';
import '../../helper/route_helper.dart';
import '../../helper/textfield_validators.dart';

class RequirementFormPage extends StatelessWidget {
  const RequirementFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RequirementController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appBarMobileView(),
          tablet: (BuildContext context) => appBarWebView(),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => requirementFormMobileView(context),
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

  requirementFormMobileView(BuildContext context) {
    return GetBuilder<RequirementController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Form(
            key: controller.formRequirementKey,
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: controller.requirementPhoto
                                        .startsWith("http")
                                    ? NetworkImage(controller.requirementPhoto)
                                    : FileImage(
                                        File(controller.requirementPhoto),
                                      ) as ImageProvider,
                                fit: BoxFit.fill),
                            border: Border.all(color: KalakarColors.textColor),
                            borderRadius: BorderRadius.circular(50.r)),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                              onTap: () {
                                PickerHelper.showImageBottomSheet(
                                    context, controller);
                              },
                              child: Icon(Icons.camera_alt_outlined)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.requirementTitleTEController,
                    labelText: KalakarConstants.requirementTitle,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateRequirementTitle),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
                  validator: Validator.validateProjectStatus,
                  items: controller.requirementStatusList,
                  titleText: KalakarConstants.requirementStatus,
                  selectedItem: controller.requirementStatusTEController.text.isEmpty
                      ? null
                      : controller.requirementStatusTEController.text,
                  labelText: KalakarConstants.requirementStatus,
                  onItemSelected: (selectedItem) {
                    controller.setRequirementStatusValue(selectedItem);
                  },
                ),
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
                    validator: Validator.validateDescription),
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
                    validator: Validator.validateLookingFor),
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
                    validator: Validator.validateNoOfOpening),
                SizedBox(
                  height: 16.h,
                ),
                /*Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(KalakarConstants.gender),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text(KalakarConstants.male),
                            leading: Radio<int>(
                              value: 1,
                              groupValue: controller.genderValue,
                              activeColor: KalakarColors.headerText,
                              // Change the active radio button color here
                              fillColor: MaterialStateProperty.all(
                                  KalakarColors.headerText),
                              // Change the fill color when selected
                              splashRadius: 20,
                              // Change the splash radius when clicked
                              onChanged: (int? value) {
                                controller.setGenderValue(value);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text(KalakarConstants.female),
                            leading: Radio<int>(
                              value: 2,
                              groupValue: controller.genderValue,
                              activeColor: KalakarColors.headerText,
                              // Change the active radio button color here
                              fillColor: MaterialStateProperty.all(
                                  KalakarColors.headerText),
                              // Change the fill color when selected
                              splashRadius: 20,
                              // Change the splash radius when clicked
                              onChanged: (int? value) {
                                controller.setGenderValue(value);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),*/
                CustomDropdownSearch(
                  validator: Validator.validateGender,
                  items: controller.genderList,
                  titleText: KalakarConstants.gender,
                  selectedItem: controller.genderTEController.text.isEmpty
                      ? null
                      : controller.genderTEController.text,
                  labelText: KalakarConstants.gender,
                  onItemSelected: (selectedItem) {
                    controller.setGenderValue(selectedItem);
                  },
                ),
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
                    validator: Validator.validateAge),
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
                    validator: Validator.validateLanguage),
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
                          validator: Validator.validateHeight),
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
                          validator: Validator.validateWeight),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
                  validator: Validator.validateHairColor,
                  items: controller.hairColorList,
                  titleText: KalakarConstants.hairColor,
                  selectedItem: controller.hairColorTEController.text.isEmpty
                      ? null
                      : controller.hairColorTEController.text,
                  labelText: KalakarConstants.hairColor,
                  onItemSelected: (selectedItem) {
                    controller.setHairColorValue(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
                  validator: Validator.validateBodyType,
                  items: controller.bodyTypeList,
                  titleText: KalakarConstants.bodyType,
                  selectedItem: controller.bodyTypeTEController.text.isEmpty
                      ? null
                      : controller.bodyTypeTEController.text,
                  labelText: KalakarConstants.bodyType,
                  onItemSelected: (selectedItem) {
                    controller.setBodyTypeValue(selectedItem);
                  },
                ),
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
                    validator: Validator.validateExperience),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final date =
                              await DatePickerHelper.selectDate(context);
                          if (date != null) {
                            controller.setDate(
                                KalakarConstants.startDate, date);
                          }
                        },
                        child: CommonWidgets.commonMobileTextField(
                            controller: controller.startDateTEController,
                            labelText: KalakarConstants.startDate,
                            obscureText: false,
                            textInputType: TextInputType.text,
                            passwordVisibility: false,
                            editable: false,
                            borderRadius: 12.r,
                            togglePasswordVisibility: () {},
                            validator: Validator.validateStartDate),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final date =
                              await DatePickerHelper.selectDate(context);
                          if (date != null) {
                            controller.setDate(KalakarConstants.endDate, date);
                          }
                        },
                        child: CommonWidgets.commonMobileTextField(
                            controller: controller.endDateTEController,
                            labelText: KalakarConstants.endDate,
                            obscureText: false,
                            textInputType: TextInputType.text,
                            passwordVisibility: false,
                            editable: false,
                            borderRadius: 12.r,
                            togglePasswordVisibility: () {},
                            validator: Validator.validateEndDate),
                      ),
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
                    validator: Validator.validateShootingLocation),
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
                    validator: Validator.validateDefineRole),
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
                    validator: Validator.validateSplSkillsRequired),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.comfortableInTEController,
                    labelText: KalakarConstants.comfortableIn,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateComfortableIn),
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
                    validator: Validator.validateScriptForAudition),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () async {
                    final date = await DatePickerHelper.selectDate(context);
                    if (date != null) {
                      controller.setDate(
                          KalakarConstants.requirementEndDate, date);
                    }
                  },
                  child: CommonWidgets.commonMobileTextField(
                      controller: controller.requirementEndDateTEController,
                      labelText: KalakarConstants.requirementEndDate,
                      obscureText: false,
                      editable: false,
                      textInputType: TextInputType.text,
                      passwordVisibility: false,
                      borderRadius: 12.r,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateRequirementEndDate),
                ),
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
                    validator: null),
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
                    validator: null),
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
                    validator: null),
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
                    validator: null),
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
                    validator: null),
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
                    validator: null),
                SizedBox(
                  height: 24.h,
                ),
                /*CommonWidgets.commonMobileTextField(
                    controller: controller.salaryTEController,
                    labelText: KalakarConstants.salary,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 24.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.salaryTypeTEController,
                    labelText: KalakarConstants.salaryType,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 24.h,
                ),*/
                CustomMobileButtonWidget(
                    text: KalakarConstants.saveRequirement,
                    onTap: () {
                      controller.saveRequirementsDetails();
                    },
                    horizontalPadding: 20.w,
                    verticalPadding: 8.h,
                    fontSize: 16.sp,
                    borderRadius: 50.r),
                SizedBox(
                  height: 24.h,
                ),
                CustomMobileButtonWidget(
                    text: KalakarConstants.deleteRequirement,
                    onTap: () {
                      controller.deleteRequirement();
                    },
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    horizontalPadding: 20.w,
                    verticalPadding: 8.h,
                    fontSize: 16.sp,
                    borderRadius: 50.r),
                SizedBox(
                  height: 24.h,
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
