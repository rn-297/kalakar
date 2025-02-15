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
import '../../../helper/route_helper.dart';
import '../../../helper/textfield_validators.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistComfortableInFormPage extends StatelessWidget {
  const ArtistComfortableInFormPage({super.key});

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
        mobile: (BuildContext context) => comfortableInFormMobileView(context),
        tablet: (BuildContext context) => comfortableInFormWebView(context),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.comfortableIn,
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
        KalakarConstants.comfortableIn,
        style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      // actions: [
      //   InkWell(
      //     onTap: () {},
      //     child: Icon(
      //       Icons.settings,
      //       size: 30.h,
      //     ),
      //   ),
      //   SizedBox(
      //     width: 16.h,
      //   )
      // ],
    );
  }

  comfortableInFormMobileView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
      return Padding(
          padding: EdgeInsets.all(24.h),
          child: Form(
            key: controller.formComfortableInKey,
            child: Column(children: [
              CustomDropdownSearch2(
                validator: Validator.validateComfortableIn1,
                items: controller.comfortableInList,
                titleText: KalakarConstants.comfortableIn,
                selectedItems: controller.selectedComfortableInList,
                labelText: KalakarConstants.comfortableIn,
                onItemsSelected: (selectedItem) {
                  controller.setComfortableInValue1(selectedItem);
                },
              ),


              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /* if (controller.comfortableInMasterId != "0")
                    CustomMobileButtonWidget(
                      width: 125.w,
                      onTap: () {
                        controller.deleteComfortableIn();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      backgroundColor: Colors.red,
                      textColor: KalakarColors.white,
                      text: KalakarConstants.delete,
                      showIcon: true,
                      icon: Icons.delete,
                      iconColor: KalakarColors.white,
                      horizontalPadding: 20.w,
                      verticalPadding: 8.h,
                    ),*/
                  CustomMobileButtonWidget(
                    width: 125.w,
                    onTap: () {
                      controller.validateComfortableInForm();
                    },
                    borderRadius: 50.r,
                    fontSize: 14.sp,
                    text: KalakarConstants.save,
                    showIcon: true,
                    icon: Icons.save,
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
    }));
  }

  comfortableInFormWebView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical:24.h,horizontal: 32.w),
              child: Form(
                key: controller.formComfortableInKey,
                child: Column(children: [
                  CustomDropdownSearch3(
                    validator: Validator.validateComfortableIn1,
                    items: controller.comfortableInList,
                    titleText: KalakarConstants.comfortableIn,
                    selectedItems: controller.selectedComfortableInList,
                    labelText: KalakarConstants.comfortableIn,
                    onItemsSelected: (selectedItem) {
                      controller.setComfortableInValue1(selectedItem);
                    },
                  ),


                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /* if (controller.comfortableInMasterId != "0")
                    CustomMobileButtonWidget(
                      width: 125.w,
                      onTap: () {
                        controller.deleteComfortableIn();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      backgroundColor: Colors.red,
                      textColor: KalakarColors.white,
                      text: KalakarConstants.delete,
                      showIcon: true,
                      icon: Icons.delete,
                      iconColor: KalakarColors.white,
                      horizontalPadding: 20.w,
                      verticalPadding: 8.h,
                    ),*/
                      CustomMobileButtonWidget(
                        width: 80.w,
                        onTap: () {
                          controller.validateComfortableInForm();
                        },
                        borderRadius: 50.r,
                        fontSize: 5.sp,
                        text: KalakarConstants.save,
                        showIcon: true,
                        icon: Icons.save,
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
        }));
  }
}
