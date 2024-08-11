import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/custom_widgets/custom_dropdown_search.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/helper/picker_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../helper/common_widgets.dart';

class CompanyProfileFormPage extends StatelessWidget {
  const CompanyProfileFormPage({super.key});

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
        mobile: (BuildContext context) => companyProfileFormMobileView(context),
        tablet: (BuildContext context) => companyProfileWebView(context),
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

  companyProfileFormMobileView(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ProfileController>(builder: (controller) {
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
                                image: getImageProvider(controller),
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
                    controller: controller.companyNameTEController,
                    labelText: KalakarConstants.companyName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.companyNameValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.adminNameTEController,
                    labelText: KalakarConstants.authoriseAdminName,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.authorizeAdminNameValidator),
                SizedBox(
                  height: 16.h,
                ),
                CommonWidgets.commonMobileTextField(
                    controller: controller.addressTEController,
                    labelText: KalakarConstants.address,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    maxLines: 3,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: controller.addressValidator),
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
                  selectedItem: controller.pinCodeTEController.text.isEmpty
                      ? null
                      : controller.pinCodeTEController.text,
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
                    controller: controller.websiteTEController,
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

  companyProfileWebView(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ProfileController>(builder: (controller) {
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
                        height: 150.h,
                        width: 150.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: getImageProvider(controller),
                                fit: BoxFit.fill),
                            border: Border.all(color: KalakarColors.textColor),
                            borderRadius: BorderRadius.circular(75.r)),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.companyNameTEController,
                          labelText: KalakarConstants.companyName,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: controller.companyNameValidator),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.adminNameTEController,
                          labelText: KalakarConstants.authoriseAdminName,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: controller.authorizeAdminNameValidator),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.addressTEController,
                          labelText: KalakarConstants.address,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          maxLines: 6,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: controller.addressValidator),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CustomDropdownSearch(
                            validator: controller.stateValidator,
                            items: controller.stateList,
                            titleText: KalakarConstants.selectState,
                            selectedItem:
                                controller.stateTEController.text.isEmpty
                                    ? null
                                    : controller.stateTEController.text,
                            labelText: KalakarConstants.state,
                            onItemSelected: (selectedItem) {
                              controller.getCitiesData(selectedItem);
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomDropdownSearch(
                            validator: controller.districtValidator,
                            items: controller.cityList,
                            titleText: KalakarConstants.selectDistrict,
                            selectedItem:
                                controller.districtTEController.text.isEmpty
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
                          CustomDropdownSearch(
                            validator: controller.postalCodeValidator,
                            items: controller.pinCodeList,
                            titleText: KalakarConstants.selectPinCode,
                            selectedItem:
                                controller.pinCodeTEController.text.isEmpty
                                    ? null
                                    : controller.pinCodeTEController.text,
                            labelText: KalakarConstants.pinCode,
                            onItemSelected: (selectedItem) {
                              controller.setPinCodeData(selectedItem);
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      ),
                    ),
                  ],
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
                Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.fbLinkTEController,
                          labelText: KalakarConstants.fbLink,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.instaLinkTEController,
                          labelText: KalakarConstants.instaLink,
                          obscureText: false,
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
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.wpLinkTEController,
                          labelText: KalakarConstants.wpLink,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.ytLinkTEController,
                          labelText: KalakarConstants.ytLink,
                          obscureText: false,
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
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.emailLinkTEController,
                          labelText: KalakarConstants.emailLink,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: null),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    Expanded(
                      child: CommonWidgets.commonMobileTextField(
                          controller: controller.websiteTEController,
                          labelText: KalakarConstants.websiteLink,
                          obscureText: false,
                          textInputType: TextInputType.text,
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
                  fontSize: 10.sp,
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

  getImageProvider(ProfileController controller) {
    return controller.isNetworkCompanyLogo
        ? NetworkImage(controller.companyLogo)
        : FileImage(
            File(controller.companyLogo),
          );
  }
}
