import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/picker_helper.dart';
import '../../../utils/kalakar_constants.dart';

class NewProjectFormPage extends StatelessWidget {
  const NewProjectFormPage({super.key});

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
        mobile: ((BuildContext context) => newProjectFormMobileView(context)),
        tablet: ((BuildContext context) => newProjectFormWebView()),
      ),
    );
  }

  newProjectFormMobileView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: GetBuilder<ProfileController>(builder: (controller) {
          return Column(
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
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                FileImage(File(controller.projectCoverPath))),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            controller.documentType =
                                KalakarConstants.projectCover;
                            PickerHelper.showImageBottomSheet(context, controller);
                          },
                          child: Icon(
                            Icons.camera_alt_outlined,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                KalakarConstants.projectCover,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Form(
                key: controller.formNewProjectKey,
                child: Column(
                  children: [
                    CommonWidgets.commonMobileTextField(
                        controller: controller.projectTitleTEController,
                        labelText: KalakarConstants.projectTitle,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: controller.projectTitleValidator),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonWidgets.commonMobileTextField(
                        controller: controller.projectDescriptionTEController,
                        labelText: KalakarConstants.projectDescription,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: controller.projectDescriptionValidator),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomDropdownSearch(
                      validator: controller.projectStatusValidator,
                      items: controller.projectStatusStringList,
                      titleText: KalakarConstants.projectStatus,
                      // selectedItem: controller.stateTEController.text.isEmpty
                      //     ? null
                      //     : controller.stateTEController.text,
                      labelText: KalakarConstants.projectStatus,
                      onItemSelected: (selectedItem) {
                        controller.setProjectStatus(selectedItem);
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.addPhotosAndVideos();
                },
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.addPhotosAndVideos,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.addPhotosAndVideos();
                },
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.saveNewProject,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
            ],
          );
        }),
      ),
    );
  }

  newProjectFormWebView() {}

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.createProject,
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

  appBarWebView() {}
}
