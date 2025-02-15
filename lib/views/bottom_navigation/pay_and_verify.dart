import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/payment_controller.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../custom_widgets/button_mobile_widget.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class PayAndVerifyPage extends StatelessWidget {
  const PayAndVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.put(PaymentController());
    paymentController.setArtist();
    paymentController.getPaymentDetails();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60.h),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => appbarMobileView(),
            tablet: (BuildContext context) => appbarWebView(),
          ),
        ),
        body: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => payAndVerifyMobileView(),
          tablet: (BuildContext context) => payAndVerifyWebView(),
        ));
  }

  appbarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.profileVerification,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  appbarWebView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.profileVerification,
        style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
    );
  }

  payAndVerifyMobileView() {
    return GetBuilder<PaymentController>(builder: (paymentController) {
      return SingleChildScrollView(
        child: Column(
          children: [
            if (paymentController.isPaymentDetailsLoading)
              Shimmer.fromColors(
                baseColor: KalakarColors.blue10,
                highlightColor: KalakarColors.blue20,
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      color: KalakarColors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              ),
            if (!paymentController.isArtist &&
                !paymentController.isPaymentDetailsLoading)
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Admin Verification Status : ",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /*Text(
                          "Not Verified",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                          size: 30,
                        ),*/

                        /*Text(
                          "Verified",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 30,
                        ),*/
                        Text(
                          paymentController.profileStatusData.verificationStatus
                              .toString(),
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        Icon(
                          paymentController
                                      .profileStatusData.verificationStatusID ==
                                  1
                              ? Icons.cancel_outlined
                              : paymentController.profileStatusData
                                          .verificationStatusID ==
                                      3
                                  ? Icons.check_circle_outline
                                  : Icons.check_circle_outline,
                          color: paymentController
                                      .profileStatusData.verificationStatusID ==
                                  1
                              ? Colors.red
                              : paymentController.profileStatusData
                                          .verificationStatusID ==
                                      3
                                  ? Colors.green
                                  : Colors.yellow,
                          size: 20,
                        ),
                      ],
                    ),
                    if (paymentController
                            .profileStatusData.verificationStatusID ==
                        1)
                      GetBuilder<ProfileController>(builder: (controller) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomMobileButtonWidget(
                              text: KalakarConstants.sendProfileForVerification,
                              onTap: () {
                                controller.sendProfileForVerification();
                              },
                              horizontalPadding: 2.w,
                              verticalPadding: 8.h,
                              fontSize: 12.sp,
                              backgroundColor: KalakarColors.buttonBackground,
                              textColor: KalakarColors.headerText,
                              borderRadius: 50.0,
                              width: 240.w,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        );
                      }),
                  ],
                ),
              ),
            SizedBox(
              height: 24.h,
            ),
            if (paymentController.isPaymentDetailsLoading)
              Shimmer.fromColors(
                baseColor: KalakarColors.blue10,
                highlightColor: KalakarColors.blue20,
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      color: KalakarColors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              ),
            if (!paymentController.isPaymentDetailsLoading)
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Subscription Charges : ",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          paymentController.profileStatusData.discountedAmount
                              .toString(),
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),Text(
                          paymentController.profileStatusData.appPrice
                              .toString(),
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.normal,decoration: TextDecoration.lineThrough),
                        ),Text(
                          "(${paymentController.profileStatusData.discount}%)"
                              ,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Subscription Status : ",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /*Text(
                              "Not Verified",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                              size: 30,
                            ),*/

                            /*Text(
                              "Verified",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 30,
                            ),*/
                            /*Text(
                              "Pending",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.yellow,
                              size: 30,
                            ),*/
                            Text(
                              paymentController
                                  .profileStatusData.registrationStatus
                                  .toString(),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Icon(
                              (paymentController.profileStatusData
                                              .registrationStatusID ==
                                          1 ||
                                      paymentController.profileStatusData
                                              .registrationStatusID ==
                                          4)
                                  ? Icons.cancel_outlined
                                  : Icons.check_circle_outline,
                              color: (paymentController.profileStatusData
                                              .registrationStatusID ==
                                          1 ||
                                      paymentController.profileStatusData
                                              .registrationStatusID ==
                                          4)
                                  ? Colors.red
                                  : paymentController.profileStatusData
                                              .registrationStatusID ==
                                          2
                                      ? Colors.green
                                      : Colors.yellow,
                              size: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Subscription Expiry Date : ",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Text(
                              paymentController
                                  .profileStatusData.expiryDate
                                  .toString(),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    if (paymentController
                                .profileStatusData.registrationStatusID ==
                            1 ||
                        paymentController
                                .profileStatusData.registrationStatusID ==
                            4)
                      GetBuilder<PaymentController>(builder: (controller) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomMobileButtonWidget(
                              text: KalakarConstants.makePayment,
                              onTap: () {
                                controller.initiatePayment();
                              },
                              horizontalPadding: 2.w,
                              verticalPadding: 8.h,
                              fontSize: 12.sp,
                              backgroundColor: KalakarColors.buttonBackground,
                              textColor: KalakarColors.headerText,
                              borderRadius: 50.0,
                              width: 240.w,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        );
                      })
                  ],
                ),
              ),
            SizedBox(
              height: 24.h,
            ),
            if (paymentController.isPaymentDetailsLoading)
              Shimmer.fromColors(
                baseColor: KalakarColors.blue10,
                highlightColor: KalakarColors.blue20,
                child: Container(
                  height: 300.h,
                  width: double.infinity,
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      color: KalakarColors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              ),
            if (!paymentController.isPaymentDetailsLoading)
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction Details :",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: paymentController.paymentDetailsList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          DateFormat inputFormat =
                              DateFormat("M/d/yyyy h:mm:ss a");
                          DateTime parsedDate = inputFormat.parse(
                              paymentController
                                  .paymentDetailsList[index].paymentDate!);

                          // Format the date as "21 JAN 2025"
                          String formattedDate = DateFormat("dd MMM yyyy")
                              .format(parsedDate)
                              .toUpperCase();

                          // Format the time as "06:25 AM"
                          String formattedTime =
                              DateFormat("hh:mm a").format(parsedDate);
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            margin: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                              color: KalakarColors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(12.h),
                                  child: paymentController
                                              .paymentDetailsList[index]
                                              .responseCode
                                              .toString()
                                              .toUpperCase() ==
                                          "SUCCESS"
                                      ? Image.asset(
                                          "assets/images/payment/credit-card.png",
                                          height: 50.h,
                                        )
                                      : paymentController
                                                  .paymentDetailsList[index]
                                                  .responseCode
                                                  .toString()
                                                  .toUpperCase() ==
                                              "FAIL"
                                          ? Image.asset(
                                              "assets/images/payment/error.png",
                                              height: 50.h,
                                            )
                                          : Image.asset(
                                              "assets/images/payment/payment.png",
                                              height: 50.h,
                                            ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Merchant Transaction ID : ${paymentController.paymentDetailsList[index].merchantTransactionId!.isNotEmpty ? paymentController.paymentDetailsList[index].merchantTransactionId : "NA"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp),
                                      ),
                                      Text(
                                          "Payment Type : ${paymentController.paymentDetailsList[index].paymentType!.isNotEmpty ? paymentController.paymentDetailsList[index].paymentType : "NA"}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10.sp)),
                                      Text(
                                          "Transaction ID : ${paymentController.paymentDetailsList[index].transactionId!.isNotEmpty ? paymentController.paymentDetailsList[index].transactionId : "NA"}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp)),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                        "₹ ${paymentController.paymentDetailsList[index].amount}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp)),
                                    Text(
                                      "${paymentController.paymentDetailsList[index].responseCode!.isNotEmpty ? paymentController.paymentDetailsList[index].responseCode : "FAIL"}",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: paymentController
                                                      .paymentDetailsList[index]
                                                      .responseCode
                                                      .toString()
                                                      .toUpperCase() ==
                                                  "SUCCESS"
                                              ? Colors.green
                                              : paymentController
                                                          .paymentDetailsList[
                                                              index]
                                                          .responseCode
                                                          .toString()
                                                          .toUpperCase() ==
                                                      "PENDING"
                                                  ? Colors.yellow
                                                  : Colors.red),
                                    ),
                                    Text(
                                      "${formattedDate}",
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Text(
                                      "${formattedTime}",
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                ),
                                SizedBox(
                                  width: 4.w,
                                )
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              )
          ],
        ),
      );
    });
  }

  payAndVerifyWebView() {
    return GetBuilder<PaymentController>(builder: (paymentController) {
      paymentController.setArtist();
      return SingleChildScrollView(
        child: Column(
          children: [
            if (!paymentController.isArtist &&
                paymentController.isPaymentDetailsLoading)
              Shimmer.fromColors(
                baseColor: KalakarColors.blue10,
                highlightColor: KalakarColors.blue20,
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      color: KalakarColors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              ),
            if (!paymentController.isArtist &&
                !paymentController.isPaymentDetailsLoading)
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Admin Verification Status : ",
                          style: TextStyle(
                              fontSize: 5.sp, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /*Text(
                              "Not Verified",
                              style: TextStyle(fontSize: 8.sp),
                            ),
                            Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                              size: 30,
                            ),*/

                            /*Text(
                              "Verified",
                              style: TextStyle(fontSize: 8.sp),
                            ),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 30,
                            ),*/
                            Text(
                              paymentController
                                  .profileStatusData.verificationStatus!,
                              style: TextStyle(fontSize: 4.sp),
                            ),
                            Icon(
                              paymentController.profileStatusData
                                          .verificationStatusID ==
                                      1
                                  ? Icons.cancel_outlined
                                  : paymentController.profileStatusData
                                              .verificationStatusID ==
                                          3
                                      ? Icons.check_circle_outline
                                      : Icons.check_circle_outline,
                              color: paymentController.profileStatusData
                                          .verificationStatusID ==
                                      1
                                  ? Colors.red
                                  : paymentController.profileStatusData
                                              .verificationStatusID ==
                                          3
                                      ? Colors.green
                                      : Colors.yellow,
                              size: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                    if (paymentController
                            .profileStatusData.verificationStatusID ==
                        1)
                      GetBuilder<ProfileController>(builder: (controller) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomMobileButtonWidget(
                              text: KalakarConstants.sendProfileForVerification,
                              onTap: () {
                                controller.sendProfileForVerification();
                              },
                              horizontalPadding: 2.w,
                              verticalPadding: 8.h,
                              fontSize: 5.sp,
                              backgroundColor: KalakarColors.buttonBackground,
                              textColor: KalakarColors.headerText,
                              borderRadius: 50.0,
                              width: 200.w,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        );
                      }),
                  ],
                ),
              ),
            SizedBox(
              height: 24.h,
            ),
            if (paymentController.isPaymentDetailsLoading)
              Shimmer.fromColors(
                baseColor: KalakarColors.blue10,
                highlightColor: KalakarColors.blue20,
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      color: KalakarColors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              ),
            if (!paymentController.isPaymentDetailsLoading)
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (paymentController
                                .profileStatusData.registrationStatusID ==
                            1 ||
                        paymentController
                                .profileStatusData.registrationStatusID ==
                            4)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Subscription Charges : ",
                            style: TextStyle(
                                fontSize: 5.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            paymentController.profileStatusData.discountedAmount
                                .toString(),
                            style: TextStyle(
                                fontSize: 6.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 2.w,),
                          Text(
                            paymentController.profileStatusData.appPrice!
                                .toString(),
                            style: TextStyle(fontSize: 4.sp,decoration: TextDecoration.lineThrough,),
                          ),
                          SizedBox(width: 2.w,),

                          Text(
                            "(${paymentController.profileStatusData.discount!.toString()}%)",
                            style: TextStyle(fontSize: 4.sp),
                          )
                        ],
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Subscription Status : ",
                          style: TextStyle(
                              fontSize: 5.sp, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /*Text(
                              "Not Verified",
                              style: TextStyle(fontSize: 8.sp),
                            ),
                            Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                              size: 30,
                            ),*/

                            /*Text(
                              "Verified",
                              style: TextStyle(fontSize: 8.sp),
                            ),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 30,
                            ),*/
                            /*Text(
                              "Pending",
                              style: TextStyle(fontSize: 8.sp),
                            ),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.yellow,
                              size: 30,
                            ),*/
                            Text(
                              paymentController
                                  .profileStatusData.registrationStatus!,
                              style: TextStyle(fontSize: 4.sp),
                            ),
                            Icon(
                              (paymentController.profileStatusData
                                              .registrationStatusID ==
                                          1 ||
                                      paymentController.profileStatusData
                                              .registrationStatusID ==
                                          4)
                                  ? Icons.cancel_outlined
                                  : Icons.check_circle_outline,
                              color: (paymentController.profileStatusData
                                              .registrationStatusID ==
                                          1 ||
                                      paymentController.profileStatusData
                                              .registrationStatusID ==
                                          4)
                                  ? Colors.red
                                  : paymentController.profileStatusData
                                              .registrationStatusID ==
                                          2
                                      ? Colors.green
                                      : Colors.yellow,
                              size: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Subscription Expiry Date : ",
                          style: TextStyle(
                              fontSize: 5.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          paymentController.profileStatusData.expiryDate!,
                          style: TextStyle(fontSize: 4.sp),
                        )
                      ],
                    ),
                    if (paymentController
                                .profileStatusData.registrationStatusID ==
                            1 ||
                        paymentController
                                .profileStatusData.registrationStatusID ==
                            4)
                      GetBuilder<PaymentController>(builder: (controller) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomMobileButtonWidget(
                              text: KalakarConstants.makePayment,
                              onTap: () {
                                controller.initiatePayment();
                              },
                              horizontalPadding: 2.w,
                              verticalPadding: 8.h,
                              fontSize: 5.sp,
                              backgroundColor: KalakarColors.buttonBackground,
                              textColor: KalakarColors.headerText,
                              borderRadius: 50.0,
                              width: 200.w,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        );
                      })
                  ],
                ),
              ),
            SizedBox(
              height: 24.h,
            ),
            if (paymentController.isPaymentDetailsLoading)
              Shimmer.fromColors(
                baseColor: KalakarColors.blue10,
                highlightColor: KalakarColors.blue20,
                child: Container(
                  height: 300.h,
                  width: double.infinity,
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      color: KalakarColors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              ),
            if (!paymentController.isPaymentDetailsLoading)
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction Details :",
                      style: TextStyle(
                          fontSize: 5.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3.5.h),
                        itemCount: paymentController.paymentDetailsList.length,
                        itemBuilder: (ctx, index) {
                          DateFormat inputFormat =
                              DateFormat("M/d/yyyy h:mm:ss a");
                          DateTime parsedDate = inputFormat.parse(
                              paymentController
                                  .paymentDetailsList[index].paymentDate!);

                          // Format the date as "21 JAN 2025"
                          String formattedDate = DateFormat("dd MMM yyyy")
                              .format(parsedDate)
                              .toUpperCase();

                          // Format the time as "06:25 AM"
                          String formattedTime =
                              DateFormat("hh:mm a").format(parsedDate);
                          return IntrinsicHeight(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 4.w),
                              margin: EdgeInsets.all(8.h),
                              decoration: BoxDecoration(
                                color: KalakarColors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(12.h),
                                      child: paymentController
                                                  .paymentDetailsList[index]
                                                  .responseCode
                                                  .toString()
                                                  .toUpperCase() ==
                                              "SUCCESS"
                                          ? Image.asset(
                                              "assets/images/payment/credit-card.png",
                                              height: 100.h,
                                            )
                                          : paymentController
                                                      .paymentDetailsList[index]
                                                      .responseCode
                                                      .toString()
                                                      .toUpperCase() ==
                                                  "FAIL"
                                              ? Image.asset(
                                                  "assets/images/payment/error.png",
                                                  height: 100.h,
                                                )
                                              : Image.asset(
                                                  "assets/images/payment/payment.png",
                                                  height: 100.h,
                                                ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Merchant Transaction ID : ${paymentController.paymentDetailsList[index].merchantTransactionId!.isNotEmpty ? paymentController.paymentDetailsList[index].merchantTransactionId : "NA"}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 5.sp),
                                        ),
                                        Text(
                                            "Payment Type : ${paymentController.paymentDetailsList[index].paymentType!.isNotEmpty ? paymentController.paymentDetailsList[index].paymentType : "NA"}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 4.sp)),
                                        Text(
                                            "Transaction ID : ${paymentController.paymentDetailsList[index].transactionId!.isNotEmpty ? paymentController.paymentDetailsList[index].transactionId : "NA"}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 4.sp)),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          "₹ ${paymentController.paymentDetailsList[index].amount}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 5.sp)),
                                      Text(
                                        "${paymentController.paymentDetailsList[index].responseCode!.isNotEmpty ? paymentController.paymentDetailsList[index].responseCode : "FAIL"}",
                                        style: TextStyle(
                                            color: paymentController
                                                        .paymentDetailsList[
                                                            index]
                                                        .responseCode
                                                        .toString()
                                                        .toUpperCase() ==
                                                    "SUCCESS"
                                                ? Colors.green
                                                : paymentController
                                                            .paymentDetailsList[
                                                                index]
                                                            .responseCode
                                                            .toString()
                                                            .toUpperCase() ==
                                                        "PENDING"
                                                    ? Colors.yellow
                                                    : Colors.red),
                                      ),
                                      Text("${formattedDate}"),
                                      Text("${formattedTime}"),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                  )),
                                  SizedBox(
                                    width: 4.w,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              )
          ],
        ),
      );
    });
  }
}
