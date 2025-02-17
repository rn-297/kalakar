import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/custom_widgets/custom_dropdown_search1.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/artist_profile_controller.dart';
import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search.dart';
import '../../../custom_widgets/custom_dropdown_search2.dart';
import '../../../custom_widgets/custom_dropdown_serach3.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/textfield_validators.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistInterestFormPage extends StatelessWidget {
  const ArtistInterestFormPage({super.key});

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
        KalakarConstants.interestIn,
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
        KalakarConstants.interestIn,
        style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: [
        /*InkWell(
          onTap: () {},
          child: Icon(
            Icons.settings,
            size: 30.h,
          ),
        ),*/
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
            key: controller.formInterestedInKey,
            child: Column(children: [
              CustomDropdownSearch2(
                validator: Validator.validateInterestedIn1,
                items: controller.interestInList,
                titleText: KalakarConstants.interestIn,
                selectedItems: controller.selectedInterestedInList,
                labelText: KalakarConstants.interestIn,
                onItemsSelected: (selectedItem) {
                  controller.setInterestedInValue1(selectedItem);
                },
              ),
              if (controller.isInterestedInOther)
                SizedBox(
                  height: 16.h,
                ),
              if (controller.isInterestedInOther)
                CommonWidgets.commonMobileTextField1(
                    controller: controller.interestedInOtherTEController,
                    labelText: KalakarConstants.other,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    hintText: "Enter Other",
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateOther),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /*if(controller.artistInterestInId != "0")
                    CustomMobileButtonWidget(
                      onTap: () {
                        controller.deleteInterestIn();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      text: KalakarConstants.delete,
                      backgroundColor: Colors.red,
                      textColor: KalakarColors.white,
                      horizontalPadding: 20.w,
                      verticalPadding: 8.h,
                      showIcon: true,
                      iconColor: Colors.white,
                      icon: Icons.delete,
                      width: 125.w,
                    ),*/
                  CustomMobileButtonWidget(
                    onTap: () {
                      controller.validateInterestedInForm();
                    },
                    borderRadius: 50.r,
                    fontSize: 14.sp,
                    text: KalakarConstants.save,
                    horizontalPadding: 20.w,
                    verticalPadding: 8.h,

                    showIcon: true,
                    iconColor: KalakarColors.headerText,
                    icon: Icons.save,
                    width: 125.w,
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

  educationFormWebView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical:24.h,horizontal: 32.w),
              child: Form(
                key: controller.formInterestedInKey,
                child: Column(children: [
                  CustomDropdownSearch3(
                    validator: Validator.validateInterestedIn1,
                    items: controller.interestInList,
                    titleText: KalakarConstants.interestIn,
                    selectedItems: controller.selectedInterestedInList,
                    labelText: KalakarConstants.interestIn,
                    onItemsSelected: (selectedItem) {
                      controller.setInterestedInValue1(selectedItem);
                    },
                  ),
                  if (controller.isInterestedInOther)
                    SizedBox(
                      height: 16.h,
                    ),
                  if (controller.isInterestedInOther)
                    CommonWidgets.commonMobileTextField2(
                        controller: controller.interestedInOtherTEController,
                        labelText: KalakarConstants.other,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        hintText: "Enter Other",
                        passwordVisibility: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateOther),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /*if(controller.artistInterestInId != "0")
                    CustomMobileButtonWidget(
                      onTap: () {
                        controller.deleteInterestIn();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      text: KalakarConstants.delete,
                      backgroundColor: Colors.red,
                      textColor: KalakarColors.white,
                      horizontalPadding: 20.w,
                      verticalPadding: 8.h,
                      showIcon: true,
                      iconColor: Colors.white,
                      icon: Icons.delete,
                      width: 125.w,
                    ),*/
                      CustomMobileButtonWidget(
                        onTap: () {
                          controller.validateInterestedInForm();
                        },
                        borderRadius: 50.r,
                        fontSize: 6.sp,
                        text: KalakarConstants.save,
                        horizontalPadding: 2.w,
                        verticalPadding: 8.h,

                        showIcon: true,
                        iconColor: KalakarColors.headerText,
                        icon: Icons.save,
                        width: 125.w,
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
