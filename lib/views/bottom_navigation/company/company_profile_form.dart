import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/route_helper.dart';

class CompanyProfileFormPage extends StatelessWidget {
  const CompanyProfileFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60.h),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => appBarMobileView(),
            tablet: (BuildContext context) => appBarWebView(),
          )),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => companyProfileFormMobileView(),
        tablet: (BuildContext context) => companyProfileWebView(),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.profile,
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
      title: Text(KalakarConstants.profile),
    );
  }

  companyProfileFormMobileView() {
    return SingleChildScrollView(
      child: GetBuilder<ProfileController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: KalakarColors.textColor),
                      borderRadius: BorderRadius.circular(50.r)),
                    ),
                    Positioned(
                        bottom: 0,right: 0,
                        child: Icon(Icons.camera_alt_outlined))
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.companyNameTEController,
                  labelText: KalakarConstants.companyName,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: controller.companyNameValidator),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.adminNameTEController,
                  labelText: KalakarConstants.authoriseAdminName,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: controller.authorizeAdminNameValidator),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.addressTEController,
                  labelText: KalakarConstants.address,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  maxLines: 3,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: controller.addressValidator),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.pinCodeTEController,
                  labelText: KalakarConstants.pinCode,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: controller.postalCodeValidator),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.districtTEController,
                  labelText: KalakarConstants.district,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: controller.districtValidator),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.stateTEController,
                  labelText: KalakarConstants.state,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: controller.stateValidator),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.bioTEController,
                  labelText: KalakarConstants.bio,
                  obscureText: false,
                  maxLines: 3,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: controller.bioValidator),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.fbLinkTEController,
                  labelText: KalakarConstants.fbLink,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: null),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.instaLinkTEController,
                  labelText: KalakarConstants.instaLink,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: null),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.wpLinkTEController,
                  labelText: KalakarConstants.wpLink,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: null),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.ytLinkTEController,
                  labelText: KalakarConstants.ytLink,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: null),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.emailTEController,
                  labelText: KalakarConstants.emailLink,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: null),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.commonMobileTextField(
                  controller: controller.websiteTEController,
                  labelText: KalakarConstants.websiteLink,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  passwordVisibility: false,
                  borderRadius: 12.r,
                  togglePasswordVisibility: () {},
                  validator: null),
              SizedBox(height: 24.h,),
              CustomMobileButtonWidget(
                onTap: () {},
                borderRadius: 50.r,
                fontSize: 14.sp,
                text: KalakarConstants.saveProfile,
                horizontalPadding: 20.w,
                verticalPadding: 8.h,
              ),
            ],
          ),
        );
      }),
    );
  }

  companyProfileWebView() {}
}
