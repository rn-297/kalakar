import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/helper/common_widgets.dart';
import 'package:kalakar/helper/textfield_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistSearchRequirementPage extends StatelessWidget {
  const ArtistSearchRequirementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appbarMobileView(),
          tablet: (BuildContext context) => appbarWebView(),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => artistSearchOpportunitiesMobileView(),
        tablet: (BuildContext context) =>
            artistSearchOpportunitiesWebView(context),
      ),
    );
  }

  appbarMobileView() {
    return AppBar(
      toolbarHeight: 60.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   height: 60.h,
          //   width: 60.h,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(image: NetworkImage("")),
          //       border: Border.all(color: KalakarColors.headerText),
          //       borderRadius: BorderRadius.circular(50.r)),
          // ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            KalakarConstants.searchRequirement,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
          ),
        ],
      ),
/*
      actions: [
        InkWell(
          onTap: (){
            Get.toNamed(RouteHelper.notificationPage);

          },
          child: Icon(
            Icons.notifications,
            size: 35,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
*/
    );
  }

  appbarWebView() {
    return AppBar(
      toolbarHeight: 60.h,
      backgroundColor: KalakarColors.appBarBackground,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   height: 60.h,
          //   width: 60.h,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(image: NetworkImage("")),
          //       border: Border.all(color: KalakarColors.headerText),
          //       borderRadius: BorderRadius.circular(50.r)),
          // ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            KalakarConstants.searchRequirement,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 25.sp),
          ),
        ],
      ),
/*
      actions: [
        InkWell(
          onTap: (){
            Get.toNamed(RouteHelper.notificationPage);

          },
          child: Icon(
            Icons.notifications,
            size: 35,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
*/
    );
  }

  artistSearchOpportunitiesMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Column(
            children: [
              CommonWidgets.commonMobileTextField(
                  controller: controller.searchTitleTEController,
                  labelText: "Title",
                  obscureText: false,
                  hintText: "Search Title",
                  passwordVisibility: true,
                  togglePasswordVisibility: () {},
                  textInputType: TextInputType.text,
                  validator: Validator.validateTitle),
              SizedBox(
                height: 24.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.searchLocationTEController,
                  labelText: "Location",
                  obscureText: false,
                  hintText: "Search Location",
                  passwordVisibility: true,
                  togglePasswordVisibility: () {},
                  textInputType: TextInputType.text,
                  validator: Validator.validateLocation),
              SizedBox(
                height: 24.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.searchLanguageTEController,
                  labelText: "Language",
                  obscureText: false,
                  hintText: "Search Language",
                  passwordVisibility: true,
                  togglePasswordVisibility: () {},
                  textInputType: TextInputType.text,
                  validator: Validator.validateLanguage),
              SizedBox(
                height: 24.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.searchShootingStartDateTEController,
                  labelText: "Shooting Start Date",
                  obscureText: false,
                  hintText: "Search Shooting Start Date",
                  passwordVisibility: true,
                  togglePasswordVisibility: () {},
                  textInputType: TextInputType.text,
                  validator: Validator.validateShootingStartDate),
              SizedBox(
                height: 24.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.searchShootingEndDateTEController,
                  labelText: "Shooting End Date",
                  obscureText: false,
                  hintText: "Search Shooting End Date",
                  passwordVisibility: true,
                  togglePasswordVisibility: () {},
                  textInputType: TextInputType.text,
                  validator: Validator.validateShootingEndDate),
            ],
          ),
        ),
      );
    });
  }

  artistSearchOpportunitiesWebView(BuildContext context) {}
}
