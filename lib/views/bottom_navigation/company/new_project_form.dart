import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            PickerHelper.showImageBottomSheet(
                                context, controller);
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
              Center(
                child: Text(
                  KalakarConstants.projectCover,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
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
              /*CustomMobileButtonWidget(
                onTap: () {
                  controller.addPhotosAndVideos(context, controller);
                },
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.addPhotosAndVideos,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),*/

              Container(
                decoration: BoxDecoration(
                    color: KalakarColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 18.w),
                        child: Text(
                          KalakarConstants.addPhotosAndVideos,
                          style: TextStyle(fontSize: 14.sp),
                        )),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.h),
                      height: 190.h,
                      width: double.infinity,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.projectDocuments.length,
                          itemBuilder: (context, index) {
                            return controller.projectDocuments[index].type ==
                                    "Add"
                                ? InkWell(
                                    onTap: () {
                                      controller.addPhotosAndVideos(
                                          context, controller);
                                    },
                                    child: Container(
                                      height: 180.h,
                                      width: 125.h,
                                      margin: EdgeInsets.only(right: 15.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(),
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 35,
                                      )),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(right: 15.w),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 180.h,
                                          width: 125.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            image: DecorationImage(
                                                image: MemoryImage(
                                                  controller
                                                      .projectDocuments[index]
                                                      .imageData!,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                                padding: EdgeInsets.all(4.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r),
                                                    color: KalakarColors.white
                                                        .withOpacity(.5)),
                                                child: Icon(Icons.delete)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ); //Container();
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.saveNewProject();
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
