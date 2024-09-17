import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/artist_profile_controller.dart';
import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../helper/textfield_validators.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistPortfolioFormPage extends StatelessWidget {
  const ArtistPortfolioFormPage({super.key});

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
        KalakarConstants.portfolio,
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
        KalakarConstants.portfolio,
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
            key: controller.formPortFolioKey,
            child: Column(children: [
              CustomDropdownSearch(
                validator: Validator.validateInterestedIn,
                items: controller.fileTypeList,
                titleText: KalakarConstants.fileType,
                selectedItem: controller.fileTypeTEController.text.isEmpty
                    ? null
                    : controller.fileTypeTEController.text,
                labelText: KalakarConstants.fileType,
                onItemSelected: (selectedItem) {
                  controller.setFileTypeValue(selectedItem);
                },
              ),
              SizedBox(height: 16.h,),

              InkWell(
                onTap: (){
                  controller.addPhotosAndVideos(
                      context, controller);
                },
                child: CommonWidgets.commonMobileTextField(
                    controller: controller.filePathTEController,
                    labelText: KalakarConstants.filePath,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    borderRadius: 12.r,
                    editable: false,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateFilePath),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomMobileButtonWidget(
                onTap: () {
                  controller.validatePortfolioForm();
                },
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.savePortfolio,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
            ]),
          ));
    }));
  }

  educationFormWebView() {}
}
