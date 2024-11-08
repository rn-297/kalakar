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

class ArtistDocumentsFormPage extends StatelessWidget {
  const ArtistDocumentsFormPage({super.key});

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
        mobile: (BuildContext context) => documentsFormMobileView(context),
        tablet: (BuildContext context) => documentsFormWebView(context),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.artistDocuments,
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
        KalakarConstants.artistDocuments,
        style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
      ),

    );
  }

  documentsFormMobileView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
      return Padding(
          padding: EdgeInsets.all(24.h),
          child: Form(
            key: controller.formDocumentKey,
            child: Column(children: [
              InkWell(
                onTap: () {
                  controller.documentType = KalakarConstants.passport;
                  controller.pickOrShowDocument(
                      KalakarConstants.passport, context, controller);
                },
                child: CommonWidgets.commonMobileTextField1(
                    controller: controller.passportTEController,
                    labelText: KalakarConstants.passport,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validatePassport),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  controller.documentType =
                      KalakarConstants.filmCorporationCard;
                  controller.pickOrShowDocument(
                      KalakarConstants.filmCorporationCard, context, controller);
                },
                child: CommonWidgets.commonMobileTextField1(
                    controller: controller.filmCorporationCrdTEController,
                    labelText: KalakarConstants.filmCorporationCard,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateFilmCorporationCard),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  controller.documentType = KalakarConstants.aadharCard;
                  controller.pickOrShowDocument(
                      KalakarConstants.aadharCard, context, controller);
                },
                child: CommonWidgets.commonMobileTextField1(
                    controller: controller.adharCardTEController,
                    labelText: KalakarConstants.aadharCard,
                    obscureText: false,
                    textInputType: TextInputType.text,
                    passwordVisibility: false,
                    editable: false,
                    borderRadius: 12.r,
                    togglePasswordVisibility: () {},
                    validator: Validator.validateAdharCard),
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

                text: KalakarConstants.saveDocuments,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
            ]),
          ));
    }));
  }

  documentsFormWebView(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ArtistProfileController>(builder: (controller) {
          return Padding(
              padding: EdgeInsets.all(24.h),
              child: Form(
                key: controller.formDocumentKey,
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      controller.documentType = KalakarConstants.passport;
                      controller.pickOrShowDocument(
                          KalakarConstants.passport, context, controller);
                    },
                    child: CommonWidgets.commonMobileTextField2(
                        controller: controller.passportTEController,
                        labelText: KalakarConstants.passport,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        editable: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validatePassport),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      controller.documentType =
                          KalakarConstants.filmCorporationCard;
                      controller.pickOrShowDocument(
                          KalakarConstants.filmCorporationCard, context, controller);
                    },
                    child: CommonWidgets.commonMobileTextField2(
                        controller: controller.filmCorporationCrdTEController,
                        labelText: KalakarConstants.filmCorporationCard,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        editable: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateFilmCorporationCard),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      controller.documentType = KalakarConstants.aadharCard;
                      controller.pickOrShowDocument(
                          KalakarConstants.aadharCard, context, controller);
                    },
                    child: CommonWidgets.commonMobileTextField2(
                        controller: controller.adharCardTEController,
                        labelText: KalakarConstants.aadharCard,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        passwordVisibility: false,
                        editable: false,
                        borderRadius: 12.r,
                        togglePasswordVisibility: () {},
                        validator: Validator.validateAdharCard),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomMobileButtonWidget(
                    onTap: () {
                      controller.validateDocumentsForm();
                    },
                    borderRadius: 50.r,
                    fontSize: 5.sp,
width: 100.w,
                    text: KalakarConstants.saveDocuments,
                    horizontalPadding: 2.w,
                    verticalPadding: 8.h,
                  ),
                ]),
              ));
        }));
  }
}
