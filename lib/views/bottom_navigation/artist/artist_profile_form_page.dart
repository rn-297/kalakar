import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/helper/textfield_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search.dart';
import '../../../custom_widgets/custom_dropdown_search1.dart';
import '../../../custom_widgets/custom_dropdown_search4.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/date_picker_helper.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/picker_helper.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistProfileFormPage extends StatelessWidget {
  const ArtistProfileFormPage({super.key});

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
        mobile: (BuildContext context) => artistProfileFormMobileView(context),
        tablet: (BuildContext context) => artistProfileWebView(context),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.profile,
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
      title: Text(KalakarConstants.profile),
    );
  }

  artistProfileFormMobileView(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ArtistProfileController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(24.h),
          child: Form(
            key: controller.formProfileKey,
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: KalakarColors.textColor),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: controller.artistProfileImage.isNotEmpty
                              ? (controller.artistProfileImage.startsWith("http")
                              ? Image.network(
                            controller.artistProfileImage,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/NA.jpg", // Fallback image
                                fit: BoxFit.fill,
                              );
                            },
                          )
                              : Image.file(
                            File(controller.artistProfileImage),
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/NA.jpg", // Fallback image
                                fit: BoxFit.fill,
                              );
                            },
                          ))
                              : Image.asset(
                            "assets/images/NA.jpg", // Fallback if empty string
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                      ,
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                              onTap: () {
                                controller.documentType =
                                    KalakarConstants.profilePhoto;
                                controller.pickOrShowDocument(
                                    KalakarConstants.profilePhoto,
                                    context,
                                    controller);
                              },
                              child: Icon(Icons.camera_alt_outlined)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.firstNameTEController,
                    labelText: KalakarConstants.firstName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    hintText: "Enter First Name",
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateFirstName),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.middleNameTEController,
                    labelText: KalakarConstants.middleName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    hintText: "Enter Middle Name",
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateMiddleName),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.lastNameTEController,
                    labelText: KalakarConstants.lastName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter Last Name",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateLastName),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () async {
                    final date =
                        await DatePickerHelper.selectDate(context, isOld: true);
                    if (date != null) {
                      controller.setDate(KalakarConstants.dob, date);
                    }
                  },
                  child: CommonWidgets.commonMobileTextField1(
                      controller: controller.dobTEController,
                      labelText: KalakarConstants.dob,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      passwordVisibility: false,
                      editable: false,
                      borderRadius: 12.r,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateDob),
                ),
                SizedBox(
                  height: 16.h,
                ),
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
                CommonWidgets.commonMobileTextField1(
                    controller: controller.emailTEController,
                    labelText: KalakarConstants.email,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    passwordVisibility: false,
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
                    textInputType: TextInputType.number,
                    hintText: "Enter Mobile Number",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateMobileNumber),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.alternateMobileNumberTEController,
                    labelText: KalakarConstants.alternateMobileNumber,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    hintText: "Enter Alternate Mobile Number",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAlternateMobileNumber),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.ageTEController,
                    labelText: KalakarConstants.age,
                    obscureText: false,
                    hintText: "Enter Age",
                    textInputType: TextInputType.number,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAge),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.roleAgeTEController,
                    labelText: KalakarConstants.roleAge,
                    obscureText: false,
                    hintText: "Enter Role Age Number",
                    textInputType: TextInputType.number,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateRoleAge),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.heightTEController,
                    labelText: KalakarConstants.height,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    hintText: "Enter Height in foot",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateHeight),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.weightTEController,
                    labelText: KalakarConstants.weight,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    passwordVisibility: false,
                    hintText: "Enter Weight in kg",
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateWeight),
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
                CustomDropdownSearch1(
                  validator: Validator.validateEyeColor,
                  items: controller.eyeColorList,
                  titleText: KalakarConstants.eyeColor,
                  selectedItem: controller.eyeColorTEController.text.isEmpty
                      ? null
                      : controller.eyeColorTEController.text,
                  labelText: KalakarConstants.eyeColor,
                  onItemSelected: (selectedItem) {
                    controller.setEyeColorValue(selectedItem);
                  },
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
                  validator: Validator.validateMaritalStatus,
                  items: controller.maritalStatusList,
                  titleText: KalakarConstants.maritalStatus,
                  selectedItem:
                      controller.maritalStatusTEController.text.isEmpty
                          ? null
                          : controller.maritalStatusTEController.text,
                  labelText: KalakarConstants.maritalStatus,
                  onItemSelected: (selectedItem) {
                    controller.setMaritalStatusValue(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.languageKnownTEController,
                    labelText: KalakarConstants.languageKnown,
                    obscureText: false,
                    hintText: "Enter Language Known",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateLanguageKnown),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch1(
                  validator: Validator.validateVehicle,
                  items: controller.yesNoList,
                  titleText: KalakarConstants.vehicle,
                  selectedItem: controller.vehicleTEController.text.isEmpty
                      ? null
                      : controller.vehicleTEController.text,
                  labelText: KalakarConstants.vehicle,
                  onItemSelected: (selectedItem) {
                    controller.setVehicleValue(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch1(
                  validator: Validator.validateTravelThrIndia,
                  items: controller.yesNoList,
                  titleText: KalakarConstants.travelThrIndia,
                  selectedItem:
                      controller.travelThroughIndiaTEController.text.isEmpty
                          ? null
                          : controller.travelThroughIndiaTEController.text,
                  labelText: KalakarConstants.travelThrIndia,
                  onItemSelected: (selectedItem) {
                    controller.setTravelThrIndiaValue(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.address1TEController,
                    labelText: KalakarConstants.address1,
                    obscureText: false,
                    hintText: "Enter Address Line 1",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAddressLine1),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.address2TEController,
                    labelText: KalakarConstants.address2,
                    obscureText: false,
                    hintText: "Enter Address Line 2",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAddressLine2),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch1(
                  validator: Validator.validateState,
                  items: controller.stateList,
                  titleText: KalakarConstants.selectState,
                  selectedItem: controller.stateTEController.text.isEmpty
                      ? null
                      : controller.stateTEController.text,
                  labelText: KalakarConstants.state,
                  onItemSelected: (selectedItem) {
                    controller.getCitiesData(selectedItem);
                  },
                ),

                /*InkWell(
                  onTap: () {
                    // DropdownSearch<String>(
                    //   popupProps: PopupProps.bottomSheet(),
                    //   asyncItems: (String filter) async => await  controller.stateList,
                    //   itemAsString: (String u) => u.toString(),
                    //   onChanged: (String? data) => print(data),
                    // );
                  },
                  child: CommonWidgets.commonMobileTextField(
                      controller: controller.pinCodeTEController,
                      labelText: KalakarConstants.pinCode,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      passwordVisibility: false,
                      borderRadius: 12.r,
                      editable: false,
                      togglePasswordVisibility: () {},
                      validator: controller.postalCodeValidator),
                ),*/
                SizedBox(
                  height: 16.h,
                ),
                /*
                CommonWidgets.commonMobileTextField(
                    controller: controller.districtTEController,
                    labelText: KalakarConstants.district,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.districtValidator),*/
                CustomDropdownSearch1(
                  validator: Validator.validateDistrict,
                  items: controller.cityList,
                  titleText: KalakarConstants.selectDistrict,
                  selectedItem: controller.districtTEController.text.isEmpty
                      ? null
                      : controller.districtTEController.text,
                  labelText: KalakarConstants.district,
                  onItemSelected: (selectedItem) {
                    controller.getPinCodesData(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                /*
                CommonWidgets.commonMobileTextField(
                    controller: controller.stateTEController,
                    labelText: KalakarConstants.state,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.stateValidator),*/
                CustomDropdownSearch1(
                  validator: Validator.validatePostalCode,
                  items: controller.pinCodeList,
                  titleText: KalakarConstants.selectPinCode,
                  selectedItem: controller.postalCodeTEController.text.isEmpty
                      ? null
                      : controller.postalCodeTEController.text,
                  labelText: KalakarConstants.postalCode,
                  onItemSelected: (selectedItem) {
                    controller.setPinCodeData(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField1(
                    controller: controller.bioTEController,
                    labelText: KalakarConstants.bio,
                    obscureText: false,
                    maxLines: 3,
                    hintText: "Enter Bio",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateBio),
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
                    controller: controller.instaTEController,
                    labelText: KalakarConstants.instaLink,
                    obscureText: false,
                    hintText: "Enter Instagram Link",
                    textInputType: TextInputType.text,
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
                    hintText: "Enter WhatsApp Link",
                    textInputType: TextInputType.text,
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
                    hintText: "Enter YouTube Link",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
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
                    hintText: "Enter Email Link",
                    passwordVisibility: false,
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
                    hintText: "Enter Web Site Link",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
                SizedBox(
                  height: 24.h,
                ),
                CustomMobileButtonWidget(
                  onTap: () {
                    controller.validateProfileFormData();
                  },
                  borderRadius: 50.r,
                  fontSize: 14.sp,
                  text: KalakarConstants.saveProfile,
                  horizontalPadding: 20.w,
                  verticalPadding: 8.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  artistProfileWebView(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ArtistProfileController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Form(
            key: controller.formProfileKey,
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: KalakarColors.textColor),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image.network(
                            controller.artistProfileImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/NA.jpg", // Fallback image
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      )
                      ,
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                              onTap: () {
                                controller.documentType =
                                    KalakarConstants.profilePhoto;
                                controller.getImageFromCamera(
                                    context, KalakarConstants.gallery);
                              },
                              child: Icon(Icons.camera_alt_outlined)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.firstNameTEController,
                          labelText: KalakarConstants.firstName,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          hintText: "Enter First Name",
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateFirstName),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.middleNameTEController,
                          labelText: KalakarConstants.middleName,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          hintText: "Enter Middle Name",
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateMiddleName),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.lastNameTEController,
                          labelText: KalakarConstants.lastName,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Last Name",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateLastName),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final date = await DatePickerHelper.selectDate(
                              context,
                              isOld: true);
                          if (date != null) {
                            controller.setDate(KalakarConstants.dob, date);
                          }
                        },
                        child: CommonWidgets.commonMobileTextField2(
                            controller: controller.dobTEController,
                            labelText: KalakarConstants.dob,
                            obscureText: false,
                            textInputType: TextInputType.text,
                            passwordVisibility: false,
                            editable: false,
                            borderRadius: 12.r,
                            togglePasswordVisibility: () {},
                            validator: Validator.validateDob),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CustomDropdownSearch4(
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.emailTEController,
                          labelText: KalakarConstants.email,
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                          passwordVisibility: false,
                          hintText: "Enter Email Id",
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateEmail),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validateMaritalStatus,
                        items: controller.maritalStatusList,
                        titleText: KalakarConstants.maritalStatus,
                        selectedItem:
                            controller.maritalStatusTEController.text.isEmpty
                                ? null
                                : controller.maritalStatusTEController.text,
                        labelText: KalakarConstants.maritalStatus,
                        onItemSelected: (selectedItem) {
                          controller.setMaritalStatusValue(selectedItem);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.mobileNumberTEController,
                          labelText: KalakarConstants.mobileNumber,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          hintText: "Enter Mobile Number",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateMobileNumber),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller:
                              controller.alternateMobileNumberTEController,
                          labelText: KalakarConstants.alternateMobileNumber,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          hintText: "Enter Alternate Mobile Number",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateAlternateMobileNumber),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.ageTEController,
                          labelText: KalakarConstants.age,
                          obscureText: false,
                          hintText: "Enter Age",
                          textInputType: TextInputType.number,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateAge),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.roleAgeTEController,
                          labelText: KalakarConstants.roleAge,
                          obscureText: false,
                          hintText: "Enter Role Age Number",
                          textInputType: TextInputType.number,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateRoleAge),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.heightTEController,
                          labelText: KalakarConstants.height,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          hintText: "Enter Height in foot",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateHeight),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.weightTEController,
                          labelText: KalakarConstants.weight,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          passwordVisibility: false,
                          hintText: "Enter Weight in kg",
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateWeight),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validateBodyType,
                        items: controller.bodyTypeList,
                        titleText: KalakarConstants.bodyType,
                        selectedItem:
                            controller.bodyTypeTEController.text.isEmpty
                                ? null
                                : controller.bodyTypeTEController.text,
                        labelText: KalakarConstants.bodyType,
                        onItemSelected: (selectedItem) {
                          controller.setBodyTypeValue(selectedItem);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validateEyeColor,
                        items: controller.eyeColorList,
                        titleText: KalakarConstants.eyeColor,
                        selectedItem:
                            controller.eyeColorTEController.text.isEmpty
                                ? null
                                : controller.eyeColorTEController.text,
                        labelText: KalakarConstants.eyeColor,
                        onItemSelected: (selectedItem) {
                          controller.setEyeColorValue(selectedItem);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validateHairColor,
                        items: controller.hairColorList,
                        titleText: KalakarConstants.hairColor,
                        selectedItem:
                            controller.hairColorTEController.text.isEmpty
                                ? null
                                : controller.hairColorTEController.text,
                        labelText: KalakarConstants.hairColor,
                        onItemSelected: (selectedItem) {
                          controller.setHairColorValue(selectedItem);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField2(
                    controller: controller.languageKnownTEController,
                    labelText: KalakarConstants.languageKnown,
                    obscureText: false,
                    hintText: "Enter Language Known",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateLanguageKnown),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validateVehicle,
                        items: controller.yesNoList,
                        titleText: KalakarConstants.vehicle,
                        selectedItem: controller.vehicleTEController.text.isEmpty
                            ? null
                            : controller.vehicleTEController.text,
                        labelText: KalakarConstants.vehicle,
                        onItemSelected: (selectedItem) {
                          controller.setVehicleValue(selectedItem);
                        },
                      ),
                    ),
                    SizedBox(
width: 8.w,                    ),
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validateTravelThrIndia,
                        items: controller.yesNoList,
                        titleText: KalakarConstants.travelThrIndia,
                        selectedItem:
                            controller.travelThroughIndiaTEController.text.isEmpty
                                ? null
                                : controller.travelThroughIndiaTEController.text,
                        labelText: KalakarConstants.travelThrIndia,
                        onItemSelected: (selectedItem) {
                          controller.setTravelThrIndiaValue(selectedItem);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.address1TEController,
                          labelText: KalakarConstants.address1,
                          obscureText: false,
                          hintText: "Enter Address Line 1",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateAddressLine1),
                    ),
                    SizedBox(
width: 8.w,                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.address2TEController,
                          labelText: KalakarConstants.address2,
                          obscureText: false,
                          hintText: "Enter Address Line 2",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateAddressLine2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validateState,
                        items: controller.stateList,
                        titleText: KalakarConstants.selectState,
                        selectedItem: controller.stateTEController.text.isEmpty
                            ? null
                            : controller.stateTEController.text,
                        labelText: KalakarConstants.state,
                        onItemSelected: (selectedItem) {
                          controller.getCitiesData(selectedItem);
                        },
                      ),
                    ),
                    
                    /*InkWell(
                      onTap: () {
                        // DropdownSearch<String>(
                        //   popupProps: PopupProps.bottomSheet(),
                        //   asyncItems: (String filter) async => await  controller.stateList,
                        //   itemAsString: (String u) => u.toString(),
                        //   onChanged: (String? data) => print(data),
                        // );
                      },
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.pinCodeTEController,
                          labelText: KalakarConstants.pinCode,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          editable: false,
                          togglePasswordVisibility: () {},
                          validator: controller.postalCodeValidator),
                    ),*/
                    SizedBox(
width: 8.w,                    ),
                    /*
                    CommonWidgets.commonMobileTextField(
                        controller: controller.districtTEController,
                        labelText: KalakarConstants.district,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: controller.districtValidator),*/
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validateDistrict,
                        items: controller.cityList,
                        titleText: KalakarConstants.selectDistrict,
                        selectedItem: controller.districtTEController.text.isEmpty
                            ? null
                            : controller.districtTEController.text,
                        labelText: KalakarConstants.district,
                        onItemSelected: (selectedItem) {
                          controller.getPinCodesData(selectedItem);
                        },
                      ),
                    ),
                    SizedBox(
width: 8.w,                    ),
                    /*
                    CommonWidgets.commonMobileTextField(
                        controller: controller.stateTEController,
                        labelText: KalakarConstants.state,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: controller.stateValidator),*/
                    Expanded(
                      child: CustomDropdownSearch4(
                        validator: Validator.validatePostalCode,
                        items: controller.pinCodeList,
                        titleText: KalakarConstants.selectPinCode,
                        selectedItem: controller.postalCodeTEController.text.isEmpty
                            ? null
                            : controller.postalCodeTEController.text,
                        labelText: KalakarConstants.postalCode,
                        onItemSelected: (selectedItem) {
                          controller.setPinCodeData(selectedItem);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField2(
                    controller: controller.bioTEController,
                    labelText: KalakarConstants.bio,
                    obscureText: false,
                    maxLines: 3,
                    hintText: "Enter Bio",
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateBio),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.fbLinkTEController,
                          labelText: KalakarConstants.fbLink,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Facebook Link",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                    SizedBox(
width: 8.w,                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.instaTEController,
                          labelText: KalakarConstants.instaLink,
                          obscureText: false,
                          hintText: "Enter Instagram Link",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.wpLinkTEController,
                          labelText: KalakarConstants.wpLink,
                          obscureText: false,
                          hintText: "Enter WhatsApp Link",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                    SizedBox(
width: 8.w,                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.ytLinkTEController,
                          labelText: KalakarConstants.ytLink,
                          obscureText: false,
                          hintText: "Enter YouTube Link",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.emailLinkTEController,
                          labelText: KalakarConstants.emailLink,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Email Link",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                    SizedBox(
width: 8.w,                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField2(
                          controller: controller.websiteLinkTEController,
                          labelText: KalakarConstants.websiteLink,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Web Site Link",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomMobileButtonWidget(
                  onTap: () {
                    controller.validateProfileFormData();
                  },
                  borderRadius: 50.r,
                  fontSize: 6.sp,
                  text: KalakarConstants.saveProfile,
                  horizontalPadding: 2.w,
                  width: 150.w,
                  verticalPadding: 8.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
