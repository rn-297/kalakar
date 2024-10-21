import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/custom_widgets/custom_dropdown_search1.dart';
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
      /*actions: [
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
      ],*/
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
                CommonWidgets.commonMobileTextField1(
                    controller: controller.requirementTitleTEController,
                    labelText: KalakarConstants.requirementTitle,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter Requirement Title",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateRequirementTitle),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch1(
                  validator: Validator.validateRequirementStatus,
                  items: controller.requirementStatusList,
                  titleText: KalakarConstants.requirementStatus,
                  selectedItem:
                      controller.requirementStatusTEController.text.isEmpty
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
                CommonWidgets.commonMobileTextField1(
                    controller: controller.descriptionTEController,
                    labelText: KalakarConstants.description,
                    obscureText: false,
                    hintText: "Enter Description",

                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    maxLines: 3,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateDescription),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.lookingForTEController,
                    labelText: KalakarConstants.lookingFor,
                    obscureText: false,
                    hintText: "Enter Looking For",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateLookingFor),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.noOfOpeningsTEController,
                    labelText: KalakarConstants.noOfOpenings,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter Number Of Openings",
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
                CustomDropdownSearch1(
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
                CustomDropdownSearch1(
                  validator: Validator.validateAge,
                  items: controller.ageRangeList,
                  titleText: KalakarConstants.age,
                  selectedItem: controller.ageTEController.text.isEmpty
                      ? null
                      : controller.ageTEController.text,
                  labelText: KalakarConstants.age,
                  onItemSelected: (selectedItem) {
                    controller.setAgeRangeValue(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.languageTEController,
                    labelText: KalakarConstants.language,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter Language",

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
                      child: CustomDropdownSearch1(
                        validator: Validator.validateHeight,
                        items: controller.heightRangeList,
                        titleText: KalakarConstants.height,
                        selectedItem: controller.heightTEController.text.isEmpty
                            ? null
                            : controller.heightTEController.text,
                        labelText: KalakarConstants.height,
                        onItemSelected: (selectedItem) {
                          controller.setHeightRangeValue(selectedItem);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: CustomDropdownSearch1(
                        validator: Validator.validateWeight,
                        items: controller.weightRangeList,
                        titleText: KalakarConstants.weight,
                        selectedItem: controller.weightTEController.text.isEmpty
                            ? null
                            : controller.weightTEController.text,
                        labelText: KalakarConstants.weight,
                        onItemSelected: (selectedItem) {
                          controller.setWeightRangeValue(selectedItem);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch1(
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
                CustomDropdownSearch1(
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
                CommonWidgets.commonMobileTextField1(
                    controller: controller.experienceTEController,
                    labelText: KalakarConstants.experiences,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter Experience",
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
                        child: CommonWidgets.commonMobileTextField1(
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
                        child: CommonWidgets.commonMobileTextField1(
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
                CommonWidgets.commonMobileTextField1(
                    controller: controller.shootingLocationTEController,
                    labelText: KalakarConstants.shootingLocation,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    hintText: "Enter Shooting Location",

                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateShootingLocation),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.defineRoleTEController,
                    labelText: KalakarConstants.defineRole,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter Define Role",

                    passwordVisibility: false,
                    borderRadius: 12.r,
                    maxLines: 3,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateDefineRole),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.splSkillRequiredTEController,
                    labelText: KalakarConstants.specialSkillRequired,
                    obscureText: false,
                    hintText: "Enter Special Kills Required",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateSplSkillsRequired),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch1(
                  validator: Validator.validateComfortableIn,
                  items: controller.comfortableInList,
                  titleText: KalakarConstants.comfortableIn,
                  selectedItem:
                      controller.comfortableInTEController.text.isEmpty
                          ? null
                          : controller.comfortableInTEController.text,
                  labelText: KalakarConstants.comfortableIn,
                  onItemSelected: (selectedItem) {
                    controller.setComfortableInValue(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.scriptForAuditionTEController,
                    labelText: KalakarConstants.scriptForAudition,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    hintText: "Enter Script For Audition",
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
                  child: CommonWidgets.commonMobileTextField1(
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
                CommonWidgets.commonMobileTextField1(
                    controller: controller.fbLinkTEController,
                    labelText: KalakarConstants.fbLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter Facebook Link",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.wpLinkTEController,
                    labelText: KalakarConstants.wpLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter WhatsApp Link",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.ytLinkTEController,
                    labelText: KalakarConstants.ytLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    hintText: "Enter YouTube Link",
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.instaLinkTEController,
                    labelText: KalakarConstants.instaLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    hintText: "Enter Instagram Link",
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.emailLinkTEController,
                    labelText: KalakarConstants.emailLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    hintText: "Enter Email Link",
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.websiteLinkTEController,
                    labelText: KalakarConstants.websiteLink,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    hintText: "Enter Web Site Link",
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 24.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.salaryTEController,
                    labelText: KalakarConstants.salary,
                    obscureText: false,
                    hintText: "Enter Salary",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 24.h,
                ),
                CustomDropdownSearch1(
                  validator: null,
                  items: controller.salaryTypeList,
                  titleText: KalakarConstants.salaryType,
                  selectedItem:
                  controller.salaryTypeTEController.text.isEmpty
                      ? null
                      : controller.salaryTypeTEController.text,
                  labelText: KalakarConstants.salaryType,
                  onItemSelected: (selectedItem) {
                    controller.setSalaryTypeValue(selectedItem);
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if(controller.selectedRequirementId != 0)
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
                          width: 125.w,
                          showIcon: true,
                          icon: Icons.delete,
                          iconColor: KalakarColors.white,
                          borderRadius: 50.r),
                    CustomMobileButtonWidget(
                        text: KalakarConstants.saveRequirement,
                        onTap: () {
                          controller.saveRequirementsDetails();
                        },
                        horizontalPadding: 20.w,
                        verticalPadding: 8.h,
                        fontSize: 16.sp,
                        width: 125.w,
                        showIcon: true,
                        icon: Icons.save,
                        iconColor: KalakarColors.headerText,
                        borderRadius: 50.r),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),

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
