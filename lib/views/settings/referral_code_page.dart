import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/settings_controller.dart';
import 'package:kalakar/helper/common_widgets.dart';
import 'package:kalakar/helper/textfield_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/button_mobile_widget.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class ReferralCodePage extends StatelessWidget {
  const ReferralCodePage({super.key});

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
        mobile: (BuildContext context) => referralCodeMobileView(context),
        tablet: (BuildContext context) => referralCodeWebView(context),
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
            KalakarConstants.referralCode,
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
            KalakarConstants.referralCode,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 6.sp),
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

  referralCodeMobileView(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: ()async{controller.getReferralData();},
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: controller.referredBy.isNotEmpty
                        ? textSpanToShow(
                            context,
                        "Referred By : ", controller.referredBy)
                        : Column(
                            children: [
                              CommonWidgets.commonMobileTextField1(
                                  controller: controller.referralCodeTEController,
                                  labelText: "Use Referral Code",
                                  obscureText: false,
                                  passwordVisibility: false,
                                  hintText: "Enter Referral Code",
                                  borderRadius: 12.r,
                                  togglePasswordVisibility: () {},
                                  textInputType: TextInputType.text,
                                  validator: Validator.validateReferralCode),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomMobileButtonWidget(
                                  text: "Get Details",
                                  onTap: () {
                                    controller.getReferralDetail();
                                  },
                                  horizontalPadding: 4.h,
                                  verticalPadding: 8.h,
                                  width: 100.w,
                                  fontSize: 16.sp,
                                  borderRadius: 40.r),
                              if (controller.detailsLoaded)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      color: KalakarColors.backgroundGrey,
                                      height: 30,
                                    ),
                                    Text(
                                      "Referral Code Details :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    textSpanToShow(
                                        context,
                                        "Referral Code : ",
                                        controller.referralDetails.referralCode
                                            .toString()),
                                    textSpanToShow(
                                        context,
                                        "First Name : ",
                                        controller.referralDetails.fistName
                                            .toString()),
                                    textSpanToShow(
                                        context,
                                        "Last Name : ",
                                        controller.referralDetails.lastName
                                            .toString()),
                                    textSpanToShow(
                                        context,
                                        "Artist Price : ",
                                        controller.referralDetails.artistPrice
                                            .toString()),
                                    textSpanToShow(
                                        context,
                                        "Company Price : ",
                                        controller.referralDetails.companyPrice
                                            .toString()),
                                    CustomMobileButtonWidget(
                                        text: "Use Referral Code",
                                        onTap: () {
                                          controller.applyReferralCode();
                                        },
                                        horizontalPadding: 4.h,
                                        verticalPadding: 8.h,
                                        fontSize: 16.sp,
                                        borderRadius: 40.r),
                                  ],
                                )
                            ],
                          )),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: textSpanToShow1(
                      context, "Your Referral Code : ", controller.referralCode),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: textSpanToShow(
                      context,
                      "Referral Points : ",
                      controller.totalReferralAmount
                          .toString()),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  textSpanToShow1(BuildContext context, String title, String titleData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              ),
              TextSpan(
                text: titleData,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp),
              ),
            ],
          ),
        ),
        InkWell(
            onTap: () async {
              await Clipboard.setData(ClipboardData(
                text: titleData,
              ));
              // copied successfully
            },
            child: Icon(
              Icons.copy,
              color: KalakarColors.headerText,
            ))
      ],
    );
  }

  textSpanToShow(BuildContext context, String title, String titleData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              ),
              TextSpan(
                text: titleData,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
          width: double.infinity,
        ),
      ],
    );
  }


  textSpanToShow1Web(BuildContext context, String title, String titleData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.sp),
              ),
              TextSpan(
                text: titleData,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 5.sp),
              ),
            ],
          ),
        ),
        InkWell(
            onTap: () async {
              await Clipboard.setData(ClipboardData(
                text: titleData,
              ));
              // copied successfully
            },
            child: Icon(
              Icons.copy,
              color: KalakarColors.headerText,
            ))
      ],
    );
  }

  textSpanToShowWeb(BuildContext context, String title, String titleData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.sp),
              ),
              TextSpan(
                text: titleData,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 5.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
          width: double.infinity,
        ),
      ],
    );
  }

  referralCodeWebView(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: ()async{controller.getReferralData();},
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:32.w,vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.white,
                      border: Border.all(color: KalakarColors.backgroundGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: controller.referredBy.isNotEmpty
                        ? textSpanToShow(
                        context,
                        "Referred By : ", controller.referredBy)
                        : Column(
                      children: [
                        CommonWidgets.commonMobileTextField2(
                            controller: controller.referralCodeTEController,
                            labelText: "Use Referral Code",
                            obscureText: false,
                            passwordVisibility: false,
                            hintText: "Enter Referral Code",
                            borderRadius: 12.r,
                            togglePasswordVisibility: () {},
                            textInputType: TextInputType.text,
                            validator: Validator.validateReferralCode),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomMobileButtonWidget(
                            text: "Get Details",
                            onTap: () {
                              controller.getReferralDetail();
                            },
                            horizontalPadding: 4.h,
                            verticalPadding: 8.h,
                            width: 100.w,
                            fontSize: 6.sp,
                            borderRadius: 40.r),
                        if (controller.detailsLoaded)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                color: KalakarColors.backgroundGrey,
                                height: 30,
                              ),
                              Text(
                                "Referral Code Details :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 6.sp),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              textSpanToShowWeb(
                                  context,
                                  "Referral Code : ",
                                  controller.referralDetails.referralCode
                                      .toString()),
                              textSpanToShowWeb(
                                  context,
                                  "First Name : ",
                                  controller.referralDetails.fistName
                                      .toString()),
                              textSpanToShowWeb(
                                  context,
                                  "Last Name : ",
                                  controller.referralDetails.lastName
                                      .toString()),
                              textSpanToShowWeb(
                                  context,
                                  "Artist Price : ",
                                  controller.referralDetails.artistPrice
                                      .toString()),
                              textSpanToShowWeb(
                                  context,
                                  "Company Price : ",
                                  controller.referralDetails.companyPrice
                                      .toString()),
                              CustomMobileButtonWidget(
                                  text: "Use Referral Code",
                                  onTap: () {
                                    controller.applyReferralCode();
                                  },
                                  horizontalPadding: 4.h,
                                  verticalPadding: 8.h,
                                  fontSize: 6.sp,
                                  width: 120.w,
                                  borderRadius: 40.r),
                            ],
                          )
                      ],
                    )),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: textSpanToShow1Web(
                      context, "Your Referral Code : ", controller.referralCode),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KalakarColors.white,
                    border: Border.all(color: KalakarColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: textSpanToShowWeb(
                      context,
                      "Referral Points : ",
                      controller.totalReferralAmount
                          .toString()),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
