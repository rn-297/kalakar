import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/custom_widgets/custom_dropdown_search4.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search.dart';
import '../../../custom_widgets/custom_dropdown_search1.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/picker_helper.dart';
import '../../../helper/textfield_validators.dart';
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
        tablet: ((BuildContext context) => newProjectFormWebView(context)),
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
                            image: controller.projectCoverPath
                                    .startsWith("http")
                                ? NetworkImage(controller.projectCoverPath)
                                : FileImage(File(controller.projectCoverPath))
                                    as ImageProvider),
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
                    CommonWidgets.commonMobileTextField1(
                        controller: controller.projectTitleTEController,
                        labelText: KalakarConstants.projectTitle,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        hintText: "Enter Project Title",
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateProjectTitle),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonWidgets.commonMobileTextField1(
                        controller: controller.projectDescriptionTEController,
                        labelText: KalakarConstants.projectDescription,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        maxLines: 3,
                        hintText: "Enter Project Description",
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateProjectDescription),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonWidgets.commonMobileTextField1(
                        controller: controller.projectTypeTEController,
                        labelText: KalakarConstants.projectType,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        hintText: "Hindi Movie/ Television Series",
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateProjectType),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomDropdownSearch1(
                      validator: Validator.validateProjectStatus,
                      items: controller.projectStatusStringList,
                      titleText: KalakarConstants.projectStatus,
                      // selectedItem: controller.stateTEController.text.isEmpty
                      //     ? null
                      //     : controller.stateTEController.text,
                      labelText: KalakarConstants.projectStatus,
                      selectedItem: controller.selectedProjectStatus,
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
                      height: 140.h,
                      width: double.infinity,
                      child: controller.isProjectDocumentLoading
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return  Container(
                                        margin: EdgeInsets.only(right: 15.w),
                                        child: Shimmer.fromColors(
                                          baseColor: KalakarColors.blue10,
                                          highlightColor: KalakarColors.blue20,
                                          child: Container(
                                            height: 125.h,
                                            width: 80.h,
                                            decoration: BoxDecoration(
                                                color: KalakarColors.white,
                                                borderRadius:
                                                BorderRadius.circular(8.r)),
                                          ),
                                        ),
                                      ); //Container();
                              })
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.projectDocuments.length,
                              itemBuilder: (context, index) {
                                return controller
                                            .projectDocuments[index].type ==
                                        "Add"
                                    ? InkWell(
                                        onTap: () {
                                          controller.addPhotosAndVideos(
                                              context, controller);
                                        },
                                        child: Center(
                                          child: Container(
                                            height: 125.h,
                                            width: 80.h,
                                            margin:
                                                EdgeInsets.only(right: 15.w),
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
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(right: 15.w),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 125.h,
                                              width: 80.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                image: DecorationImage(
                                                    image: controller
                                                            .projectDocuments[
                                                                index]
                                                            .path
                                                            .startsWith("http")
                                                        ? NetworkImage(controller
                                                            .projectDocuments[
                                                                index]
                                                            .path)
                                                        : FileImage(File(controller
                                                                .projectDocuments[
                                                                    index]
                                                                .path))
                                                            as ImageProvider,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Positioned(
                                              right: 2,
                                              top: 2,
                                              child: InkWell(
                                                onTap: () {
                                                  controller.deleteProjectDocuments(
                                                      controller
                                                          .selectedCompanyProject!
                                                          .companyProjectID!,
                                                      controller
                                                          .projectDocuments[
                                                              index]
                                                          .documentId);
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.all(4.h),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.r),
                                                        color: KalakarColors
                                                            .white
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (controller.selectedCompanyProject != null)
                    CustomMobileButtonWidget(
                      onTap: () {
                        controller.deleteProject();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      backgroundColor: Colors.red,
                      textColor: KalakarColors.white,
                      text: KalakarConstants.delete,
                      horizontalPadding: 20.w,
                      showIcon: true,
                      icon: Icons.delete,
                      width: 125.w,
                      iconColor: KalakarColors.white,
                      verticalPadding: 8.h,
                    ),
                  CustomMobileButtonWidget(
                    onTap: () {
                      controller.saveNewProject();
                    },
                    borderRadius: 50.r,
                    fontSize: 14.sp,
                    text: KalakarConstants.save,
                    showIcon: true,
                    icon: Icons.save,
                    iconColor: KalakarColors.headerText,
                    horizontalPadding: 20.w,
                    verticalPadding: 8.h,
                    width: 125.w,
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  newProjectFormWebView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 32.w),
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
                            image:  NetworkImage(controller.projectCoverPath)

                            as ImageProvider),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            controller.documentType =
                                KalakarConstants.projectCover;
                            controller.getImageFromCamera(context,KalakarConstants.gallery);
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
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 5.sp),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Form(
                key: controller.formNewProjectKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CommonWidgets.commonMobileTextField2(
                              controller: controller.projectTitleTEController,
                              labelText: KalakarConstants.projectTitle,
                              obscureText: false,
                              textInputType: TextInputType.text,
                              passwordVisibility: false,
                              hintText: "Enter Project Title",
                              borderRadius: 12.r,
                              togglePasswordVisibility: () {},
                              validator: Validator.validateProjectTitle),
                        ),

                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: CommonWidgets.commonMobileTextField2(
                              controller: controller.projectTypeTEController,
                              labelText: KalakarConstants.projectType,
                              obscureText: false,
                              textInputType: TextInputType.text,
                              passwordVisibility: false,
                              hintText: "Hindi Movie/ Television Series",
                              borderRadius: 12.r,
                              togglePasswordVisibility: () {},
                              validator: Validator.validateProjectType),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonWidgets.commonMobileTextField2(
                        controller: controller.projectDescriptionTEController,
                        labelText: KalakarConstants.projectDescription,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        maxLines: 3,
                        hintText: "Enter Project Description",
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateProjectDescription),
                    
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomDropdownSearch4(
                      validator: Validator.validateProjectStatus,
                      items: controller.projectStatusStringList,
                      titleText: KalakarConstants.projectStatus,
                      // selectedItem: controller.stateTEController.text.isEmpty
                      //     ? null
                      //     : controller.stateTEController.text,
                      labelText: KalakarConstants.projectStatus,
                      selectedItem: controller.selectedProjectStatus,
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
                          style: TextStyle(fontSize: 6.sp),
                        )),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.h),
                      height: 240.h,
                      width: double.infinity,
                      child: controller.isProjectDocumentLoading
                          ? ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return  Container(
                              margin: EdgeInsets.only(right: 15.w),
                              child: Shimmer.fromColors(
                                baseColor: KalakarColors.blue10,
                                highlightColor: KalakarColors.blue20,
                                child: Container(
                                  height: 225.h,
                                  width: 280.h,
                                  decoration: BoxDecoration(
                                      color: KalakarColors.white,
                                      borderRadius:
                                      BorderRadius.circular(8.r)),
                                ),
                              ),
                            ); //Container();
                          })
                          : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.projectDocuments1.length,
                          itemBuilder: (context, index) {
                            return controller
                                .projectDocuments1[index].type ==
                                "Add"
                                ? InkWell(
                              onTap: () {
                                controller.addPhotosAndVideos(
                                    context, controller);
                              },
                              child: Center(
                                child: Container(
                                  height: 225.h,
                                  width: 180.h,
                                  margin:
                                  EdgeInsets.only(right: 15.w),
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
                              ),
                            )
                                : Container(
                              margin: EdgeInsets.only(right: 15.w),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 225.h,
                                    width: 180.h,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8.r),
                                      image: DecorationImage(
                                          image:  NetworkImage(controller
                                              .projectDocuments1[
                                          index]
                                              .path)

                                          as ImageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    right: 2,
                                    top: 2,
                                    child: InkWell(
                                      onTap: () {
                                        controller.deleteProjectDocuments(
                                            controller
                                                .selectedCompanyProject!
                                                .companyProjectID!,
                                            controller
                                                .projectDocuments1[
                                            index]
                                                .documentId);
                                      },
                                      child: Container(
                                          padding:
                                          EdgeInsets.all(4.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(50.r),
                                              color: KalakarColors
                                                  .white
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (controller.selectedCompanyProject != null)
                    CustomMobileButtonWidget(
                      onTap: () {
                        controller.deleteProject();
                      },
                      borderRadius: 50.r,
                      fontSize: 5.sp,
                      backgroundColor: Colors.red,
                      textColor: KalakarColors.white,
                      text: KalakarConstants.delete,
                      horizontalPadding: 2.w,
                      showIcon: true,
                      icon: Icons.delete,
                      width: 80.w,
                      iconColor: KalakarColors.white,
                      verticalPadding: 8.h,
                    ),
                  CustomMobileButtonWidget(
                    onTap: () {
                      controller.saveNewProjectWeb();
                    },
                    borderRadius: 50.r,
                    fontSize: 5.sp,
                    text: KalakarConstants.save,
                    showIcon: true,
                    icon: Icons.save,
                    iconColor: KalakarColors.headerText,
                    horizontalPadding: 2.w,
                    verticalPadding: 8.h,
                    width: 80.w,
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

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

  appBarWebView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.createProject,
        style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
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
}
