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
import '../../../helper/route_helper.dart';
import '../../../helper/textfield_validators.dart';
import '../../../utils/kalakar_constants.dart';
import 'package:kalakar/data/models/company/company_applied_details_class.dart'as artist_profile;

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
        tablet: (BuildContext context) => educationFormWebView(context),
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
        style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
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

  educationFormMobileView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
      if (controller.isArtist) {
        return Padding(
                  padding: EdgeInsets.all(24.h),
                  child: Form(
                    key: controller.formEducationKey,
                    child: Column(children: [
                      CommonWidgets.commonMobileTextField1(
                          controller: controller.educationTypeTEController,
                          labelText: KalakarConstants.educationType,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Education Type",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateEducationType),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField1(
                          controller: controller.universityOrInstituteTEController,
                          labelText: KalakarConstants.universityOrInstitute,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter University or Institute",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateUniversityOrInstitute),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField1(
                          controller: controller.courseTEController,
                          labelText: KalakarConstants.course,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Course",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateCourse),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField1(
                          controller: controller.specializationTEController,
                          labelText: KalakarConstants.specialization,
                          obscureText: false,
                          hintText: "Enter Specialization",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateSpecialization),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField1(
                          controller: controller.courseTypeTEController,
                          labelText: KalakarConstants.courseType,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Course Type",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateCourseType),
                      SizedBox(
                        height: 16.h,
                      ),
                      InkWell(
                        onTap: () async {
                          final date = await DatePickerHelper.selectDate(context,
                              isOld: true);
                          if (date != null) {
                            controller.setDate(KalakarConstants.courseStartDate, date);
                          }
                        },
                        child: CommonWidgets.commonMobileTextField1(
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
                          final date = await DatePickerHelper.selectDate(context,
                              isOld: true, startDate: controller.courseStartDate);
                          if (date != null) {
                            controller.setDate(KalakarConstants.courseEndDate, date);
                          }
                        },
                        child: CommonWidgets.commonMobileTextField1(
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
                      CommonWidgets.commonMobileTextField1(
                          controller: controller.scoreTEController,
                          labelText: KalakarConstants.score,
                          obscureText: false,
                          hintText: "Enter Score",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateScore),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (controller.artistEducationId != "0")
                            CustomMobileButtonWidget(
                              onTap: () {
                                controller.deleteEducationData();
                              },
                              borderRadius: 50.r,
                              fontSize: 14.sp,
                              width: 125.w,
                              text: KalakarConstants.delete,
                              horizontalPadding: 20.w,
                              showIcon: true,
                              icon: Icons.delete,
                              iconColor: KalakarColors.white,
                              verticalPadding: 8.h,
                              textColor: KalakarColors.white,
                              backgroundColor: Colors.red,
                            ),
                          CustomMobileButtonWidget(
                            onTap: () {
                              controller.validateEducationForm();
                            },
                            borderRadius: 50.r,
                            fontSize: 14.sp,
                            text: KalakarConstants.save,
                            showIcon: true,
                            icon: Icons.save,
                            width: 125.w,
                            iconColor: KalakarColors.headerText,
                            horizontalPadding: 20.w,
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
  artist_profile.EducationList educationData =
  requirementController.selectedEducationData;
  DateTime courseEndDate = DateTime.parse(
      educationData.courseEndDate.toString());
  DateTime courseStartDate = DateTime.parse(
      educationData.courseStartDate.toString());
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
        textSpanToShow(context, "Course Name : ",
            educationData.course.toString()),
        textSpanToShow(
            context,
            "${KalakarConstants.universityOrInstitute} : ",
            educationData.universityOrInstitute
                .toString()),
        textSpanToShow(
            context,
            "${KalakarConstants.specialization} : ",
            educationData.specialization
                .toString()),
        textSpanToShow(
            context,
            "${KalakarConstants.courseType} : ",
            educationData.coursetype.toString()),
        textSpanToShow(
            context,
            "${KalakarConstants.score} : ",
            educationData.score.toString()),
        textSpanToShow(
            context,
            "${KalakarConstants.startDate} : ",
            formatter.format(courseStartDate)),
        textSpanToShow(
            context,
            "${KalakarConstants.endDate} : ",
            formatter.format(courseEndDate)),

      ],
    ),
  );
});
      }

    }));
  }

  educationFormWebView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
      if (controller.isArtist) {
        return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 32.w),
                  child: Form(
                    key: controller.formEducationKey,
                    child: Column(children: [
                      CommonWidgets.commonMobileTextField2(
                          controller: controller.educationTypeTEController,
                          labelText: KalakarConstants.educationType,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Education Type",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateEducationType),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField2(
                          controller: controller.universityOrInstituteTEController,
                          labelText: KalakarConstants.universityOrInstitute,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter University or Institute",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateUniversityOrInstitute),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField2(
                          controller: controller.courseTEController,
                          labelText: KalakarConstants.course,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Course",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateCourse),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField2(
                          controller: controller.specializationTEController,
                          labelText: KalakarConstants.specialization,
                          obscureText: false,
                          hintText: "Enter Specialization",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateSpecialization),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField2(
                          controller: controller.courseTypeTEController,
                          labelText: KalakarConstants.courseType,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          hintText: "Enter Course Type",
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateCourseType),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final date = await DatePickerHelper.selectDate(context,
                                    isOld: true);
                                if (date != null) {
                                  controller.setDate(
                                      KalakarConstants.courseStartDate, date);
                                }
                              },
                              child: CommonWidgets.commonMobileTextField2(
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
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final date = await DatePickerHelper.selectDate(context,
                                    isOld: true,startDate: controller.courseStartDate);
                                if (date != null) {
                                  controller.setDate(
                                      KalakarConstants.courseEndDate, date);
                                }
                              },
                              child: CommonWidgets.commonMobileTextField2(
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgets.commonMobileTextField2(
                          controller: controller.scoreTEController,
                          labelText: KalakarConstants.score,
                          obscureText: false,
                          hintText: "Enter Score",
                          textInputType: TextInputType.text,
                          passwordVisibility: false,
                          borderRadius: 12.r,
                          togglePasswordVisibility: () {},
                          validator: Validator.validateScore),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (controller.artistEducationId != "0")
                            CustomMobileButtonWidget(
                              onTap: () {
                                controller.deleteEducationData();
                              },
                              borderRadius: 50.r,
                              fontSize: 6.sp,
                              width: 125.w,
                              text: KalakarConstants.delete,
                              horizontalPadding: 2.w,
                              showIcon: true,
                              icon: Icons.delete,
                              iconColor: KalakarColors.white,
                              verticalPadding: 8.h,
                              textColor: KalakarColors.white,
                              backgroundColor: Colors.red,
                            ),
                          CustomMobileButtonWidget(
                            onTap: () {
                              controller.validateEducationForm();
                            },
                            borderRadius: 50.r,
                            fontSize: 6.sp,
                            text: KalakarConstants.save,
                            showIcon: true,
                            icon: Icons.save,
                            width: 125.w,
                            iconColor: KalakarColors.headerText,
                            horizontalPadding: 2.w,
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
          artist_profile.EducationList educationData =
              requirementController.selectedEducationData;
          DateTime courseEndDate = DateTime.parse(
              educationData.courseEndDate.toString());
          DateTime courseStartDate = DateTime.parse(
              educationData.courseStartDate.toString());
          DateFormat formatter =
          DateFormat('dd-MM-yyyy');
          return Container(
            padding: EdgeInsets.all(16.h),
            margin: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),

              color: KalakarColors.white,
              border: Border.all(color: KalakarColors.backgroundGrey),
              // boxShadow: [
              //   BoxShadow(
              //     color: KalakarColors.backgroundGrey,
              //     spreadRadius: 1,
              //     blurRadius: 1,
              //   ),
              // ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  textSpanToShow1(context, "Course Name : ",
                      educationData.course.toString()),
                  textSpanToShow1(
                      context,
                      "${KalakarConstants.universityOrInstitute} : ",
                      educationData.universityOrInstitute
                          .toString()),
                  textSpanToShow1(
                      context,
                      "${KalakarConstants.specialization} : ",
                      educationData.specialization
                          .toString()),
                  textSpanToShow1(
                      context,
                      "${KalakarConstants.courseType} : ",
                      educationData.coursetype.toString()),
                  textSpanToShow1(
                      context,
                      "${KalakarConstants.score} : ",
                      educationData.score.toString()),
                  textSpanToShow1(
                      context,
                      "${KalakarConstants.startDate} : ",
                      formatter.format(courseStartDate)),
                  textSpanToShow1(
                      context,
                      "${KalakarConstants.endDate} : ",
                      formatter.format(courseEndDate)),

                ],
              ),
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
