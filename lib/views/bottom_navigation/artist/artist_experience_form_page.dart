import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/artist_profile_controller.dart';
import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/date_picker_helper.dart';
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
        mobile: (BuildContext context) => experienceFormMobileView(context),
        tablet: (BuildContext context) => experienceFormWebView(context),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.experience1,
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
        KalakarConstants.experience,
        style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
      ),
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

  experienceFormMobileView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
      return Padding(
          padding: EdgeInsets.all(24.h),
          child: Form(
            key: controller.formExperienceKey,
            child: Column(children: [
              CommonWidgets.commonMobileTextField1(
                  controller: controller.companyNameTEController,
                  labelText: KalakarConstants.companyName,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  hintText: "Enter Company Name",
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateCompanyName),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField1(
                  controller: controller.roleNameTEController,
                  labelText: KalakarConstants.roleName,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  hintText: "Enter Role Name",
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateRoleName),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () async {
                  final date = await DatePickerHelper.selectDate(context,isOld:true);
                  if (date != null) {
                    controller.setDate(KalakarConstants.expStartDate, date);
                  }
                },
                child: CommonWidgets.commonMobileTextField1(
                    controller: controller.expStartDateTEController,
                    labelText: KalakarConstants.startDate,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateStartDate),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () async {
                  final date = await DatePickerHelper.selectDate(context,isOld:true);
                  if (date != null) {
                    controller.setDate(KalakarConstants.expEndDate, date);
                  }
                },
                child: CommonWidgets.commonMobileTextField1(
                    controller: controller.expEndDateTEController,
                    labelText: KalakarConstants.endDate,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateEndDate),
              ),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField1(
                  controller: controller.skillsUsedTEController,
                  labelText: KalakarConstants.skillsUsed,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  hintText: "Enter Skills Used",
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateSkillsUsed),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField1(
                  controller: controller.roleProfileTEController,
                  labelText: KalakarConstants.roleProfile,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  hintText: "Enter Role Profile",

                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateRoleProfile),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  controller.pickOrShowDocument(
                      KalakarConstants.roleImage, context, controller);
                },
                child: CommonWidgets.commonMobileTextField1(
                    controller: controller.roleImageTEController,
                    labelText: KalakarConstants.roleImage,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    isSuffixIcon: true,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  controller.pickOrShowDocumentWeb(
                      KalakarConstants.roleVideo, context, controller);
                },
                child: CommonWidgets.commonMobileTextField1(
                    controller: controller.roleVideoTEController,
                    labelText: KalakarConstants.roleVideo,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    isSuffixIcon: true,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: null),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(controller.artistExperienceId != "0")
                    CustomMobileButtonWidget(
                      onTap: () {
                        controller.deleteExperienceForm();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      backgroundColor: Colors.red,
                      textColor: KalakarColors.white,
                      text: KalakarConstants.delete,
                      horizontalPadding: 20.w,
                      verticalPadding: 8.h,
                      showIcon: true,
                      icon: Icons.delete,
                      iconColor: KalakarColors.white,
                      width: 125.w,
                    ),
                  CustomMobileButtonWidget(
                    onTap: () {
                      controller.validateExperienceForm();
                    },
                    borderRadius: 50.r,
                    fontSize: 14.sp,
                    text: KalakarConstants.save,
                    horizontalPadding: 20.w,
                    showIcon: true,
                    icon: Icons.save,
                    iconColor: KalakarColors.headerText,
                    width: 125.w,
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

  experienceFormWebView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal:24.w,vertical: 24.h),
              child: Form(
                key: controller.formExperienceKey,
                child: Column(children: [
                  CommonWidgets.commonMobileTextField2(
                      controller: controller.companyNameTEController,
                      labelText: KalakarConstants.companyName,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      hintText: "Enter Company Name",
                      passwordVisibility: false,
                      borderRadius: 12.r,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateCompanyName),
                  SizedBox(
                    height: 16.h,
                  ),
                  CommonWidgets.commonMobileTextField2(
                      controller: controller.roleNameTEController,
                      labelText: KalakarConstants.roleName,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      hintText: "Enter Role Name",
                      passwordVisibility: false,
                      borderRadius: 12.r,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateRoleName),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () async {
                      final date = await DatePickerHelper.selectDate(context,isOld:true);
                      if (date != null) {
                        controller.setDate(KalakarConstants.expStartDate, date);
                      }
                    },
                    child: CommonWidgets.commonMobileTextField2(
                        controller: controller.expStartDateTEController,
                        labelText: KalakarConstants.startDate,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        editable: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateStartDate),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () async {
                      final date = await DatePickerHelper.selectDate(context,isOld:true);
                      if (date != null) {
                        controller.setDate(KalakarConstants.expEndDate, date);
                      }
                    },
                    child: CommonWidgets.commonMobileTextField2(
                        controller: controller.expEndDateTEController,
                        labelText: KalakarConstants.endDate,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        editable: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateEndDate),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CommonWidgets.commonMobileTextField2(
                      controller: controller.skillsUsedTEController,
                      labelText: KalakarConstants.skillsUsed,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      hintText: "Enter Skills Used",
                      passwordVisibility: false,
                      borderRadius: 12.r,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateSkillsUsed),
                  SizedBox(
                    height: 16.h,
                  ),
                  CommonWidgets.commonMobileTextField2(
                      controller: controller.roleProfileTEController,
                      labelText: KalakarConstants.roleProfile,
                      obscureText: false,
                      textInputType: TextInputType.text,
                      hintText: "Enter Role Profile",

                      passwordVisibility: false,
                      borderRadius: 12.r,
                      togglePasswordVisibility: () {},
                      validator: Validator.validateRoleProfile),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      controller.pickOrShowDocumentWeb(
                          KalakarConstants.roleImage, context, controller);
                    },
                    child: CommonWidgets.commonMobileTextField2(
                        controller: controller.roleImageTEController,
                        labelText: KalakarConstants.roleImage,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        editable: false,
                        isSuffixIcon: true,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: null),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      controller.pickOrShowDocumentWeb(
                          KalakarConstants.roleVideo, context, controller);
                    },
                    child: CommonWidgets.commonMobileTextField2(
                        controller: controller.roleVideoTEController,
                        labelText: KalakarConstants.roleVideo,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        editable: false,
                        isSuffixIcon: true,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: null),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if(controller.artistExperienceId != "0")
                        CustomMobileButtonWidget(
                          onTap: () {
                            controller.deleteExperienceForm();
                          },
                          borderRadius: 50.r,
                          fontSize: 6.sp,
                          backgroundColor: Colors.red,
                          textColor: KalakarColors.white,
                          text: KalakarConstants.delete,
                          horizontalPadding: 2.w,
                          verticalPadding: 8.h,
                          showIcon: true,
                          icon: Icons.delete,
                          iconColor: KalakarColors.white,
                          width: 125.w,
                        ),
                      CustomMobileButtonWidget(
                        onTap: () {
                          controller.validateExperienceForm();
                        },
                        borderRadius: 50.r,
                        fontSize: 6.sp,
                        text: KalakarConstants.save,
                        horizontalPadding: 2.w,
                        showIcon: true,
                        icon: Icons.save,
                        iconColor: KalakarColors.headerText,
                        width: 125.w,
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
