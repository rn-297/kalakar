import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/artist_profile_controller.dart';
import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search.dart';
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
            key: controller.formComfortableInKey,
            child: Column(children: [
              CustomDropdownSearch(
                validator: Validator.validateComfortableIn,
                items: controller.comfortableInList,
                titleText: KalakarConstants.comfortableIn,
                selectedItem: controller.comfortableInTEController.text.isEmpty
                    ? null
                    : controller.comfortableInTEController.text,
                labelText: KalakarConstants.comfortableIn,
                onItemSelected: (selectedItem) {
                  controller.setComfortableInValue(selectedItem);
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.validateDocumentsForm();
                },
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.saveComfortableIn,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
              SizedBox(
                height: 24.h,
              ),
              controller.comfortableInMasterId == "0"
                  ? Container()
                  : CustomMobileButtonWidget(
                      onTap: () {
                        controller.deleteComfortableIn();
                      },
                      borderRadius: 50.r,
                      fontSize: 14.sp,
                      backgroundColor: Colors.red,
                      textColor: KalakarColors.white,
                      text: KalakarConstants.deleteComfortableIn,
                      horizontalPadding: 20.w,
                      verticalPadding: 8.h,
                    ),
            ]),
          ));
    }));
  }

  educationFormWebView() {}
}
