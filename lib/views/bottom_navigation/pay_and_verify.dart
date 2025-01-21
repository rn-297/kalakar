import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/payment_controller.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../custom_widgets/button_mobile_widget.dart';
import '../../helper/kalakar_colors.dart';
import '../../utils/kalakar_constants.dart';

class PayAndVerifyPage extends StatelessWidget {
  const PayAndVerifyPage({super.key});

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
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  payAndVerifyMobileView() {
    return GetBuilder<PaymentController>(builder: (paymentController) {
      return SingleChildScrollView(
        child: Column(
          children: [
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
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                            : paymentController
                                        .profileStatusData.verificationStatusID ==
                                    3
                                ? Icons.check_circle_outline
                                : Icons.check_circle_outline,
                        color: paymentController
                                    .profileStatusData.verificationStatusID ==
                                1
                            ? Colors.red
                            : paymentController
                                        .profileStatusData.verificationStatusID ==
                                    3
                                ? Colors.green
                                : Colors.yellow,
                        size: 20,
                      ),
                    ],
                  ),
                  if (paymentController.profileStatusData.verificationStatusID ==
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
                        "Registration Charges : ",
                        style:
                            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),Text(
                        paymentController.profileStatusData.appPrice.toString() ,
                        style:
                            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Registration Status : ",
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
                            paymentController.profileStatusData.registrationStatus.toString(),
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
                  if(paymentController.profileStatusData
                      .registrationStatusID ==
                      1 ||
                      paymentController.profileStatusData
                          .registrationStatusID ==
                          4)GetBuilder<PaymentController>(builder: (controller) {
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
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
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.grey,
                          ))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Transaction Id : ${paymentController.paymentDetailsList[index].transactionId}"),
                              Text("Date: ${paymentController.paymentDetailsList[index].paymentDate}"),
                              Text("Amount : ${paymentController.paymentDetailsList[index].amount}"),Text("Payment Type : ${paymentController.paymentDetailsList[index].paymentType}"),
                              Text("Status : ${paymentController.paymentDetailsList[index].responseCode}"),
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
      return Column(
        children: [
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
                          fontSize: 7.sp, fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontSize: 7.sp),
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
                          size: 30,
                        ),
                      ],
                    )
                  ],
                ),
                if (paymentController.profileStatusData.verificationStatusID ==
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
                          fontSize: 6.sp,
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
                if (paymentController.profileStatusData.registrationStatusID ==
                        1 ||
                    paymentController.profileStatusData.registrationStatusID ==
                        4)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Registration Charges : ",
                        style: TextStyle(
                            fontSize: 7.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        paymentController.profileStatusData.appPrice.toString(),
                        style: TextStyle(
                            fontSize: 7.sp, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Registration Status : ",
                      style: TextStyle(
                          fontSize: 7.sp, fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontSize: 8.sp),
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
                if (paymentController.profileStatusData.registrationStatusID ==
                        1 ||
                    paymentController.profileStatusData.registrationStatusID ==
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
                          fontSize: 6.sp,
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
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
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Center(child: Text("Transaction Id"))),
                    Expanded(child: Center(child: Text("Date"))),
                    Expanded(child: Center(child: Text("Payment Type"))),
                    Expanded(child: Center(child: Text("Amount"))),
                    Expanded(child: Center(child: Text("Status")))
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: paymentController.paymentDetailsList.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.grey,
                        ))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: Center(
                                    child: Text(
                                        "${paymentController.paymentDetailsList[index].transactionId}"))),
                            Expanded(
                                child: Center(
                                    child: Text(
                                        "${paymentController.paymentDetailsList[index].paymentDate}"))),
                            Expanded(
                                child: Center(
                                    child: Text(
                                        "${paymentController.paymentDetailsList[index].paymentType}"))),
                            Expanded(
                                child: Center(
                                    child: Text(
                                        "${paymentController.paymentDetailsList[index].amount}"))),
                            Expanded(
                                child: Center(
                                    child: Text(
                                        "${paymentController.paymentDetailsList[index].responseCode}")))
                          ],
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      );
    });
  }
}
