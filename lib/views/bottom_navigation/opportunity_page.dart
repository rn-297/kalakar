import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OpportunityPage extends StatelessWidget {
  const OpportunityPage({Key? key}) : super(key: key);

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
        mobile: (BuildContext context) => opportunitiesMobileView(),
        tablet: (BuildContext context) => opportunitiesWebView(),
      ),
    );
  }

  opportunitiesMobileView() {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(KalakarConstants.opportunitiesText),
            SizedBox(
              height: 16.h,
            ),
            ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
                    decoration: BoxDecoration(
                      color: KalakarColors.lightAppBarBackground,
                      borderRadius: BorderRadius.circular(
                        8.h,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                              "assets/images/app_bar_logo.png",
                              fit: BoxFit.cover,
                            )),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.all(8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Oppotunity Name",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: KalakarColors.headerText,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                  Text("Opportunity Post"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Location"),
                                      Text("Time"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Gender"),
                                      Text("Age"),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  opportunitiesWebView() {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(KalakarConstants.opportunitiesText),
            SizedBox(
              height: 16.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
                  decoration: BoxDecoration(
                    color: KalakarColors.lightAppBarBackground,
                    borderRadius: BorderRadius.circular(
                      8.h,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/images/app_bar_logo.png",
                            fit: BoxFit.cover,
                          )),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Oppotunity Name",
                                  style: TextStyle(
                                      fontSize: 8.sp,
                                      color: KalakarColors.headerText,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Opportunity Post",
                                    style: TextStyle(
                                      fontSize: 5.sp,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Location",
                                        style: TextStyle(
                                          fontSize: 5.sp,
                                        )),
                                    Text("Time",
                                        style: TextStyle(
                                          fontSize: 5.sp,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Gender",
                                        style: TextStyle(
                                          fontSize: 5.sp,
                                        )),
                                    Text("Age",
                                        style: TextStyle(
                                          fontSize: 5.sp,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 4.0),
            )
          ],
        ),
      ),
    );
  }

  appBarMobileView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.opportunities1,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.filter_alt,
            size: 30.h,
          ),
        ),
        SizedBox(
          width: 16.h,
        )
      ],
    );
  }

  appBarWebView() {
    return AppBar(
      backgroundColor: KalakarColors.appBarBackground,
      surfaceTintColor: KalakarColors.appBarBackground,
      title: Text(
        KalakarConstants.opportunities1,
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.filter_alt,
            size: 30.h,
          ),
        ),
        SizedBox(
          width: 16.h,
        )
      ],
    );
  }
}
