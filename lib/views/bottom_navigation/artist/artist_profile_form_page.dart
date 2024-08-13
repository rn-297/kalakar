import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search.dart';
import '../../../helper/common_widgets.dart';
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
                    validator: controller.firstNameValidator),
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
                    validator: controller.middleNameValidator),
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
                    validator: controller.lastNameValidator),
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
                    validator: controller.dobValidator),
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
                    validator: controller.emailValidator),
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
                    validator: controller.mobileNumberValidator),
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
                    controller: controller.roleAgeTEController,
                    labelText: KalakarConstants.roleAge,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.roleAgeValidator),
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
                    validator: controller.heightValidator),
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
                    validator: controller.weightValidator),
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
                    validator: controller.weightValidator),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
                  validator: controller.stateValidator,
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
                  validator: controller.districtValidator,
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
                  validator: controller.postalCodeValidator,
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
                    validator: controller.bioValidator),
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
                    validator: controller.firstNameValidator),
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
                    validator: controller.middleNameValidator),
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
                    validator: controller.lastNameValidator),
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
                    validator: controller.dobValidator),
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
                    validator: controller.emailValidator),
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
                    validator: controller.mobileNumberValidator),
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
                    controller: controller.roleAgeTEController,
                    labelText: KalakarConstants.roleAge,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.roleAgeValidator),
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
                    validator: controller.heightValidator),
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
                    validator: controller.weightValidator),
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
                    validator: controller.address1Validator),
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
                    validator: controller.address2Validator),
                SizedBox(
                  height: 16.h,
                ),
                CustomDropdownSearch(
                  validator: controller.stateValidator,
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
                  validator: controller.districtValidator,
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
                  validator: controller.postalCodeValidator,
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
                    validator: controller.bioValidator),
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
