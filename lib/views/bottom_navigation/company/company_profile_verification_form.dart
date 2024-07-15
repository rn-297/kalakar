import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class CompanyProfileVerificationFormPage extends StatelessWidget {
  const CompanyProfileVerificationFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60.h),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => appBarMobileView(),
            tablet: (BuildContext context) => appBarWebView(),
          )),
      body: Center(
        child: Text("Company Profile Verification Form Page"),
      ),
    );
  }

  appBarMobileView() { return AppBar(
    backgroundColor: KalakarColors.appBarBackground,
    surfaceTintColor: KalakarColors.appBarBackground,
    title: Text(
      KalakarConstants.profileVerification,
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
  );}

  appBarWebView() { return AppBar(
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
  );}
}
