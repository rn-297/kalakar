import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/artist_profile_controller.dart';
import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/date_picker_helper.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/route_helper.dart';
import '../../../helper/textfield_validators.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistEducationFormPage extends StatelessWidget {
  const ArtistEducationFormPage({super.key});

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
        KalakarConstants.education,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      /*actions: [
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
            key: controller.formEducationKey,
            child: Column(children: [
              CommonWidgets.commonMobileTextField(
                  controller: controller.educationTypeTEController,
                  labelText: KalakarConstants.educationType,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateEducationType),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.universityOrInstituteTEController,
                  labelText: KalakarConstants.universityOrInstitute,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateUniversityOrInstitute),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.courseTEController,
                  labelText: KalakarConstants.course,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateCourse),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.specializationTEController,
                  labelText: KalakarConstants.specialization,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateSpecialization),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.courseTypeTEController,
                  labelText: KalakarConstants.courseType,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateCourseType),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () async {
                  final date = await DatePickerHelper.selectDate(context);
                  if (date != null) {
                    controller.setDate(KalakarConstants.courseStartDate, date);
                  }
                },
                child: CommonWidgets.commonMobileTextField(
                    controller: controller.courseStartDateTEController,
                    labelText: KalakarConstants.courseStartDate,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateCourseStartDate),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () async {
                  final date = await DatePickerHelper.selectDate(context);
                  if (date != null) {
                    controller.setDate(KalakarConstants.courseEndDate, date);
                  }
                },
                child: CommonWidgets.commonMobileTextField(
                    controller: controller.courseEndDateTEController,
                    labelText: KalakarConstants.courseEndDate,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateCourseEndDate),
              ),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.scoreTEController,
                  labelText: KalakarConstants.score,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: Validator.validateScore),
              SizedBox(
                height: 24.h,
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.validateEducationForm();
                },
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.saveEducation,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
              SizedBox(
                height: 24.h,
              ),
              controller.artistEducationId == "0"
                  ? Container()
                  : CustomMobileButtonWidget(
                      onTap: () {
                        controller
                            .deleteEducationData();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      text: KalakarConstants.deleteEducation,
                      horizontalPadding: 20.w,
                      verticalPadding: 8.h,
                      textColor: KalakarColors.white,
                      backgroundColor: Colors.red,
                    ),
            ]),
          ));
    }));
  }

  educationFormWebView() {}
}
