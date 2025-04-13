import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/artist_profile_controller.dart';
import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/date_picker_helper.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/textfield_validators.dart';
import '../../../utils/kalakar_constants.dart';
import 'package:kalakar/data/models/company/company_applied_details_class.dart'as artist_profile;


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
      centerTitle: false,
      title: Text(
        KalakarConstants.experience1,
        style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
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
      if (controller.isArtist) {
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
                          controller.pickOrShowDocument(
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
      } else {
        return GetBuilder<RequirementController>(builder: (requirementController){
          artist_profile.ExperienceList experienceData =
          requirementController.selectedExperienceData;
          DateTime expEndDate = DateTime.parse(
              experienceData.endDate.toString());
          DateTime expStartDate = DateTime.parse(
              experienceData.startDate.toString());
          DateFormat formatter =
          DateFormat('dd-MM-yyyy');
          return Container(
            padding: EdgeInsets.all(12.h),
            margin: EdgeInsets.all(12.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: KalakarColors.white,
              border:
              Border.all(color: KalakarColors.backgroundGrey),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                textSpanToShow(
                    context,
                    "${KalakarConstants.roleName} : ",
                    experienceData.roleName.toString()),
                textSpanToShow(
                    context,
                    "${KalakarConstants.companyName} : ",
                    experienceData.companyName
                        .toString()),
                textSpanToShow(
                    context,
                    "${KalakarConstants.roleProfile} : ",
                    experienceData.roleProfile
                        .toString()),
                textSpanToShow(
                    context,
                    "${KalakarConstants.startDate} : ",
                    formatter.format(expStartDate)),
                textSpanToShow(
                    context,
                    "${KalakarConstants.endDate} : ",
                    formatter.format(expEndDate)),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        requirementController.showDocument1(
                            experienceData.roleImage!,
                            KalakarConstants.roleImage,
                            "IMAGE");
                      },
                      child: Container(
                        height: 155.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(8.r),
                          border: Border.all(
                              color: KalakarColors
                                  .backgroundGrey),
                          image: DecorationImage(
                              image: experienceData
                                  .roleImage!
                                  .startsWith("http")
                                  ? NetworkImage(
                                  experienceData
                                      .roleImage!)
                                  : FileImage(File(
                                  experienceData
                                      .roleImage!))
                              as ImageProvider,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        requirementController.showDocument1(
                            experienceData.roleVideo!,
                            KalakarConstants.roleVideo,
                            "VIDEO");
                      },
                      child: Container(
                        height: 155.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(8.r),
                          border: Border.all(
                              color: KalakarColors
                                  .backgroundGrey),
                          image: DecorationImage(
                              image: experienceData
                                  .roleVideo!
                                  .startsWith("http")
                                  ? NetworkImage(
                                  experienceData
                                      .roleVideo!)
                                  : FileImage(File(
                                  experienceData
                                      .roleVideo!))
                              as ImageProvider,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          );
        });
      }


    }));
  }

  experienceFormWebView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
          if (controller.isArtist) {
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
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
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
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Expanded(
                                    child: InkWell(
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
                                  ),
                                ],
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
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
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
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Expanded(
                                    child: InkWell(
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
                                  ),
                                ],
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
          } else {
            return GetBuilder<RequirementController>(builder: (requirementController) {
              artist_profile.ExperienceList experienceData =
              requirementController.selectedExperienceData;
              DateTime expEndDate = DateTime.parse(
                  experienceData.endDate.toString());
              DateTime expStartDate = DateTime.parse(
                  experienceData.startDate.toString());
              DateFormat formatter = DateFormat('dd-MM-yyyy');
              return Container(
                padding: EdgeInsets.all(16.h),
                margin: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),

                  color: KalakarColors.white,
                  border: Border.all(color: KalakarColors.backgroundGrey),

                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: KalakarColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              requirementController.showDocument1(
                                  experienceData.roleImage!,
                                  KalakarConstants.roleImage,
                                  "IMAGE");
                            },
                            child: Container(
                              height: 200.h,
                              width: 155.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: KalakarColors
                                        .backgroundGrey),
                                image: DecorationImage(
                                    image: experienceData.roleImage!
                                        .startsWith("http")
                                        ? NetworkImage(
                                        experienceData
                                            .roleImage!)
                                        : FileImage(File(
                                        experienceData
                                            .roleImage!))
                                    as ImageProvider,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                textSpanToShow1(
                                    context,
                                    "${KalakarConstants.roleName} : ",
                                    experienceData.roleName
                                        .toString()),
                                textSpanToShow1(
                                    context,
                                    "${KalakarConstants.companyName} : ",
                                    experienceData.companyName
                                        .toString()),
                                textSpanToShow1(
                                    context,
                                    "${KalakarConstants.roleProfile} : ",
                                    experienceData.roleProfile
                                        .toString()),
                                textSpanToShow1(
                                    context,
                                    "${KalakarConstants.startDate} : ",
                                    formatter.format(expStartDate)),
                                textSpanToShow1(
                                    context,
                                    "${KalakarConstants.endDate} : ",
                                    formatter.format(expEndDate)),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              requirementController.showDocument1(
                                  experienceData.roleVideo!,
                                  KalakarConstants.roleVideo,
                                  "VIDEO");
                            },
                            child: Container(
                              height: 200.h,
                              width: 155.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: KalakarColors
                                        .backgroundGrey),
                                image: DecorationImage(
                                    image: experienceData.roleVideo!
                                        .startsWith("http")
                                        ? NetworkImage(
                                        experienceData
                                            .roleVideo!)
                                        : FileImage(File(
                                        experienceData
                                            .roleVideo!))
                                    as ImageProvider,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            });

          }

        }));
  }

  textSpanToShow1(BuildContext context, String title, String titleData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.sp),
              ),
              TextSpan(
                text: titleData,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 5.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
          width: double.infinity,
        ),
      ],
    );
  }

  textSpanToShow(BuildContext context, String title, String titleData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              ),
              TextSpan(
                text: titleData,
                style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
      ],
    );
  }
}
