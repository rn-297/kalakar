import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/helper/textfield_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search.dart';
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
                            image: DecorationImage(
                                image: controller.artistProfileImage
                                        .startsWith("http")
                                    ? NetworkImage(
                                        controller.artistProfileImage)
                                    : FileImage(
                                        File(controller.artistProfileImage),
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
                CommonWidgets.commonMobileTextField(
                    controller: controller.firstNameTEController,
                    labelText: KalakarConstants.firstName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateFirstName),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.middleNameTEController,
                    labelText: KalakarConstants.middleName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateMiddleName),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.lastNameTEController,
                    labelText: KalakarConstants.lastName,
                    obscureText: false,
                    textInputType: TextInputType.text,
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
                      controller.setDate(KalakarConstants.startDate, date);
                    }
                  },
                  child: CommonWidgets.commonMobileTextField(
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
                    controller: controller.emailTEController,
                    labelText: KalakarConstants.email,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateEmail),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.mobileNumberTEController,
                    labelText: KalakarConstants.mobileNumber,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateMobileNumber),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.alternateMobileNumberTEController,
                    labelText: KalakarConstants.alternateMobileNumber,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAlternateMobileNumber),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.ageTEController,
                    labelText: KalakarConstants.age,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAge),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
                  validator: Validator.validateRoleAge,
                  items: controller.ageRangeList,
                  titleText: KalakarConstants.roleAge,
                  selectedItem: controller.roleAgeTEController.text.isEmpty
                      ? null
                      : controller.roleAgeTEController.text,
                  labelText: KalakarConstants.roleAge,
                  onItemSelected: (selectedItem) {
                    controller.setRoleAgeRangeValue(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.heightTEController,
                    labelText: KalakarConstants.height,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    hintText: "in foot",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateHeight),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.weightTEController,
                    labelText: KalakarConstants.weight,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    passwordVisibility: false,
                    hintText: "in kg",
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateWeight),
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
                CustomDropdownSearch(
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
                CommonWidgets.commonMobileTextField(
                    controller: controller.languageKnownTEController,
                    labelText: KalakarConstants.languageKnown,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateLanguageKnown),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
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
                CustomDropdownSearch(
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
                CommonWidgets.commonMobileTextField(
                    controller: controller.address1TEController,
                    labelText: KalakarConstants.address1,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAddressLine1),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.address2TEController,
                    labelText: KalakarConstants.address2,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAddressLine2),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
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
                CustomDropdownSearch(
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
                CustomDropdownSearch(
                  validator: Validator.validatePostalCode,
                  items: controller.pinCodeList,
                  titleText: KalakarConstants.selectPinCode,
                  selectedItem: controller.postalCodeTEController.text.isEmpty
                      ? null
                      : controller.postalCodeTEController.text,
                  labelText: KalakarConstants.pinCode,
                  onItemSelected: (selectedItem) {
                    controller.setPinCodeData(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.bioTEController,
                    labelText: KalakarConstants.bio,
                    obscureText: false,
                    maxLines: 3,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateBio),
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
                    controller: controller.instaTEController,
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
                            image: DecorationImage(
                                image: controller.artistProfileImage
                                        .startsWith("http")
                                    ? NetworkImage(
                                        controller.artistProfileImage)
                                    : FileImage(
                                        File(controller.artistProfileImage),
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
                                controller.documentType =
                                    KalakarConstants.companyLogo;
                                PickerHelper.showImageBottomSheet(
                                    context, controller);
                              },
                              child: Icon(Icons.camera_alt_outlined)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.firstNameTEController,
                    labelText: KalakarConstants.firstName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateFirstName),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.middleNameTEController,
                    labelText: KalakarConstants.middleName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateMiddleName),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.lastNameTEController,
                    labelText: KalakarConstants.lastName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateLastName),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.dobTEController,
                    labelText: KalakarConstants.dob,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateDob),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.emailTEController,
                    labelText: KalakarConstants.email,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateEmail),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.mobileNumberTEController,
                    labelText: KalakarConstants.mobileNumber,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateMobileNumber),
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
                    controller: controller.roleAgeTEController,
                    labelText: KalakarConstants.roleAge,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateRoleAge),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.heightTEController,
                    labelText: KalakarConstants.height,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateHeight),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.weightTEController,
                    labelText: KalakarConstants.weight,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateWeight),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.address1TEController,
                    labelText: KalakarConstants.address1,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAddressLine1),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.address2TEController,
                    labelText: KalakarConstants.address2,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAddressLine2),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
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
                CustomDropdownSearch(
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
                CustomDropdownSearch(
                  validator: Validator.validatePostalCode,
                  items: controller.pinCodeList,
                  titleText: KalakarConstants.selectPinCode,
                  selectedItem: controller.postalCodeTEController.text.isEmpty
                      ? null
                      : controller.postalCodeTEController.text,
                  labelText: KalakarConstants.pinCode,
                  onItemSelected: (selectedItem) {
                    controller.setPinCodeData(selectedItem);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.bioTEController,
                    labelText: KalakarConstants.bio,
                    obscureText: false,
                    maxLines: 3,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateBio),
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
                    controller: controller.instaTEController,
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
}
