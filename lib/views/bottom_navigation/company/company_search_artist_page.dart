import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/data/models/company/artist_search_for_company_class.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/requirement_controller.dart';
import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../custom_widgets/custom_dropdown_search4.dart';
import '../../../data/models/company/company_requirement_list_class.dart';
import '../../../helper/common_widgets.dart';
import '../../../helper/date_picker_helper.dart';
import '../../../helper/textfield_validators.dart';
import '../../../utils/kalakar_constants.dart';

class CompanySearchArtistPage extends StatelessWidget {
  const CompanySearchArtistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appbarMobileView(context),
          tablet: (BuildContext context) => appbarWebView(context),
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => artistSearchOpportunitiesMobileView(),
        tablet: (BuildContext context) =>
            artistSearchOpportunitiesWebView(context),
      ),
    );
  }

  appbarMobileView(BuildContext context) {
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
            KalakarConstants.searchArtist,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 20.sp),
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              isDismissible: true,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return GetBuilder<RequirementController>(builder: (controller) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: 24.h,
                        left: 24.h,
                        top: 16.h,
                        bottom:
                            MediaQuery.of(context).viewInsets.bottom + 10.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  "Filters",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                )),
                            CustomMobileButtonWidget(
                                text: "Clear Filters",
                                onTap: () {
                                  controller.clearSearchFilters();
                                },
                                horizontalPadding: 4.h,
                                verticalPadding: 8.h,
                                width: 100.w,
                                fontSize: 13.sp,
                                borderRadius: 40.r),
                            CustomMobileButtonWidget(
                                text: "Apply Filters",
                                onTap: () {
                                  Get.back();
                                  // controller.se();
                                  controller.searchArtistDetailsCompany();
                                },
                                horizontalPadding: 4.h,
                                verticalPadding: 8.h,
                                width: 100.w,
                                fontSize: 13.sp,
                                borderRadius: 40.r),
                          ],
                        ),
                        Divider(
                          color: KalakarColors.backgroundGrey,
                          height: 16.h,
                          thickness: 2,
                        ),
                        CommonWidgets.commonMobileTextField1(
                            controller: controller.searchLocationTEController,
                            labelText: KalakarConstants.applyFor,
                            obscureText: false,
                            borderRadius: 12.r,
                            hintText: "Search Apply For",
                            passwordVisibility: false,

                            togglePasswordVisibility: () {},
                            textInputType: TextInputType.text,
                            validator: Validator.validateApplyFor),
                        SizedBox(
                          height: 12.h,
                        ),
                        CommonWidgets.commonMobileTextField1(
                            controller: controller.searchMobileNumberTEController,
                            labelText: KalakarConstants.mobileNumber,
                            obscureText: false,
                            borderRadius: 12.r,
                            hintText: "Search Mobile Number",
                            passwordVisibility: false,
                            togglePasswordVisibility: () {},
                            textInputType: TextInputType.text,
                            validator: Validator.validateMobileNumber),
                        SizedBox(
                          height: 12.h,
                        ),
                        CommonWidgets.commonMobileTextField1(
                            controller:
                                controller.searchEmailTEController,
                            labelText: KalakarConstants.email,
                            obscureText: false,
                            hintText: "Search Email",
                            borderRadius: 12.r,
                            passwordVisibility: false,
                            togglePasswordVisibility: () {},
                            editable: true,
                            textInputType: TextInputType.text,
                            validator: Validator.validateEmail),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    ),
                  );
                });
              },
            );
          },
          child: Icon(
            Icons.filter_alt,
            size: 35,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
    );
  }

  appbarWebView(BuildContext context) {
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
            KalakarConstants.searchArtist,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 6.sp),
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              isDismissible: true,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return GetBuilder<RequirementController>(builder: (controller) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: 24.h,
                        left: 24.h,
                        top: 16.h,
                        bottom:
                        MediaQuery.of(context).viewInsets.bottom + 10.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  "Filters",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 6.sp),
                                )),
                            CustomMobileButtonWidget(
                                text: "Clear Filters",
                                onTap: () {
                                  controller.clearSearchFilters();
                                },
                                horizontalPadding: 4.h,
                                verticalPadding: 8.h,
                                width: 50.w,
                                fontSize: 5.sp,
                                borderRadius: 40.r),
                            CustomMobileButtonWidget(
                                text: "Apply Filters",
                                onTap: () {
                                  Get.back();
                                  // controller.se();
                                  controller.searchArtistDetailsCompany();
                                },
                                horizontalPadding: 4.h,
                                verticalPadding: 8.h,
                                width: 50.w,
                                fontSize: 5 .sp,
                                borderRadius: 40.r),
                          ],
                        ),
                        Divider(
                          color: KalakarColors.backgroundGrey,
                          height: 16.h,
                          thickness: 2,
                        ),
                        CommonWidgets.commonMobileTextField2(
                            controller: controller.searchApplyForTEController,
                            labelText: KalakarConstants.applyFor,
                            obscureText: false,
                            borderRadius: 12.r,
                            hintText: "Search Apply For",
                            passwordVisibility: false,

                            togglePasswordVisibility: () {},
                            textInputType: TextInputType.text,
                            validator: Validator.validateApplyFor),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CommonWidgets.commonMobileTextField2(
                                  controller: controller.searchMobileNumberTEController,
                                  labelText: KalakarConstants.mobileNumber,
                                  obscureText: false,
                                  borderRadius: 12.r,
                                  hintText: "Search Mobile Number",
                                  passwordVisibility: false,
                                  togglePasswordVisibility: () {},
                                  textInputType: TextInputType.text,
                                  validator: Validator.validateMobileNumber),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                              child: CommonWidgets.commonMobileTextField2(
                                  controller:
                                  controller.searchEmailTEController,
                                  labelText: KalakarConstants.email,
                                  obscureText: false,
                                  hintText: "Search Email",
                                  borderRadius: 12.r,
                                  passwordVisibility: false,
                                  togglePasswordVisibility: () {},
                                  editable: true,
                                  textInputType: TextInputType.text,
                                  validator: Validator.validateEmail),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CommonWidgets.commonMobileTextField2(
                            controller:
                            controller.searchDistrictTEController,
                            labelText: KalakarConstants.district,
                            obscureText: false,
                            hintText: "Search District",
                            borderRadius: 12.r,
                            passwordVisibility: false,
                            togglePasswordVisibility: () {},
                            editable: true,
                            textInputType: TextInputType.text,
                            validator: Validator.validateDistrict),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomDropdownSearch4(
                          validator: null,
                          items: controller.comfortableInList,
                          titleText: KalakarConstants.comfortableIn,
                          selectedItem:
                          controller.comfortableInTEController.text.isEmpty
                              ? null
                              : controller.comfortableInTEController.text,
                          labelText: KalakarConstants.comfortableIn,
                          onItemSelected: (selectedItem) {
                            controller.setComfortableInValue(selectedItem);
                          },
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CommonWidgets.commonMobileTextField2(
                            controller:
                            controller.searchInterestedInTEController,
                            labelText: KalakarConstants.interestIn,
                            obscureText: false,
                            hintText: "Search Interest In",
                            borderRadius: 12.r,
                            passwordVisibility: false,
                            togglePasswordVisibility: () {},
                            editable: true,
                            textInputType: TextInputType.text,
                            validator: Validator.validateInterestedIn),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    ),
                  );
                });
              },
            );
          },
          child: Icon(
            Icons.filter_alt,
            size: 35,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
    );
  }

  artistSearchOpportunitiesMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            children: [
              CommonWidgets.commonMobileTextField1(
                  controller: controller.searchProfileTEController,
                  labelText: KalakarConstants.profile,
                  obscureText: false,
                  hintText: "Search Profile",
                  borderRadius: 12.r,
                  passwordVisibility: false,
                  togglePasswordVisibility: () {},
                  textInputType: TextInputType.text,
                  validator: Validator.validateProfile),
              SizedBox(
                height: 12.h,
              ),
              CustomMobileButtonWidget(
                  text: "Search",
                  onTap: () {
                    controller.searchArtistDetailsCompany();
                  },
                  horizontalPadding: 4.h,
                  verticalPadding: 8.h,
                  width: 120.w,
                  fontSize: 13.sp,
                  borderRadius: 40.r),
              SizedBox(
                height: 16.h,
              ),
              if (!controller.isSearching)
                Divider(
                  color: KalakarColors.backgroundGrey,
                ),
              SizedBox(height: 16.h,),
              controller.isSearching
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          padding: EdgeInsets.all(8.h),
                          // width: Get.size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: KalakarColors.white,
                            border:
                                Border.all(color: KalakarColors.backgroundGrey),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Shimmer.fromColors(
                                  baseColor: KalakarColors.blue10,
                                  highlightColor: KalakarColors.blue20,
                                  child: Container(
                                    height: 40.h,
                                    width: 40.h,
                                    color: KalakarColors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: KalakarColors.blue10,
                                        highlightColor: KalakarColors.blue20,
                                        child: Container(
                                          height: 20.h,
                                          width: 80.h,
                                          color: KalakarColors.white,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: KalakarColors.blue10,
                                            highlightColor:
                                                KalakarColors.blue20,
                                            child: Container(
                                              height: 20.h,
                                              width: 20.h,
                                              color: KalakarColors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16.w,
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                            width: 150.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : controller.searchedArtistProfileList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              controller.searchedArtistProfileList.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            GetArtistProfileModellist appliedProfileDetail =
                                controller.searchedArtistProfileList[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 8.h),
                              padding: EdgeInsets.all(8.h),
                              // width: Get.size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: KalakarColors.white,
                                border: Border.all(
                                    color: KalakarColors.backgroundGrey),
                              ),
                              child: InkWell(
                                onTap: () {
                                  controller.setArtistProfileDataToView1(
                                      appliedProfileDetail);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50.r),
                                      child: Image.network(
                                        appliedProfileDetail.profilePic!,
                                        fit: BoxFit.cover,
                                        height: 50.h,
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                          // Return a dummy or placeholder image when an error occurs
                                          return Image.asset(
                                            "assets/images/NA.jpg",
                                            height: 50.h,
                                            width: 50.h,
                                          );
                                        },
                                        width: 50.h,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "${appliedProfileDetail.firstName!} ${appliedProfileDetail.middleName!} "),
                                            Text(appliedProfileDetail.age!
                                                .toString()),
                                            SizedBox(
                                              width: 16.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : Text("No Artists Found"),
            ],
          ),
        ),
      );
    });
  }

  artistSearchOpportunitiesWebView(BuildContext context) {
    return GetBuilder<RequirementController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            children: [
              CommonWidgets.commonMobileTextField2(
                  controller: controller.searchProfileTEController,
                  labelText: KalakarConstants.profile,
                  obscureText: false,
                  hintText: "Search Profile",
                  borderRadius: 12.r,
                  passwordVisibility: false,
                  togglePasswordVisibility: () {},
                  textInputType: TextInputType.text,
                  validator: Validator.validateProfile),
              SizedBox(
                height: 12.h,
              ),
              CustomMobileButtonWidget(
                  text: "Search",
                  onTap: () {
                    controller.searchArtistDetailsCompany();
                  },
                  horizontalPadding: 4.h,
                  verticalPadding: 8.h,
                  width: 120.w,
                  fontSize: 6.sp,
                  borderRadius: 40.r),
              SizedBox(
                height: 16.h,
              ),
              if (!controller.isSearching)
                Divider(
                  color: KalakarColors.backgroundGrey,
                ),
              SizedBox(height: 16.h,),
             Column(children: [ controller.isSearching
                 ? GridView.builder(
                 shrinkWrap: true,
                 itemCount: 5,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2, childAspectRatio: 8.h),
                 physics: NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index) {
                   return Container(
                     margin: EdgeInsets.only(bottom: 8.h,right: 2.w),
                     padding: EdgeInsets.all(8.h),
                     // width: Get.size.width / 2,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.r),
                       color: KalakarColors.white,
                       border:
                       Border.all(color: KalakarColors.backgroundGrey),
                     ),
                     child: Row(
                       children: [
                         ClipRRect(
                           borderRadius: BorderRadius.circular(50.r),
                           child: Shimmer.fromColors(
                             baseColor: KalakarColors.blue10,
                             highlightColor: KalakarColors.blue20,
                             child: Container(
                               height: 40.h,
                               width: 40.h,
                               color: KalakarColors.white,
                             ),
                           ),
                         ),
                         Expanded(
                           flex: 3,
                           child: Padding(
                             padding:
                             EdgeInsets.symmetric(horizontal: 8.h),
                             child: Column(
                               crossAxisAlignment:
                               CrossAxisAlignment.start,
                               children: [
                                 Shimmer.fromColors(
                                   baseColor: KalakarColors.blue10,
                                   highlightColor: KalakarColors.blue20,
                                   child: Container(
                                     height: 20.h,
                                     width: 80.h,
                                     color: KalakarColors.white,
                                   ),
                                 ),
                                 Row(
                                   children: [
                                     Shimmer.fromColors(
                                       baseColor: KalakarColors.blue10,
                                       highlightColor:
                                       KalakarColors.blue20,
                                       child: Container(
                                         height: 20.h,
                                         width: 20.h,
                                         color: KalakarColors.white,
                                       ),
                                     ),
                                     SizedBox(
                                       width: 16.w,
                                     ),
                                     SizedBox(
                                       height: 20.h,
                                       width: 30.w,
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   );
                 })
                 : controller.searchedArtistProfileList.isNotEmpty
                 ? GridView.builder(
                 shrinkWrap: true,
                 itemCount:
                 controller.searchedArtistProfileList.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2, childAspectRatio: 8.h),
                 physics: NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index) {
                   GetArtistProfileModellist appliedProfileDetail =
                   controller.searchedArtistProfileList[index];
                   return Container(
                     margin: EdgeInsets.only(bottom: 8.h,right: 2.w
                     ),
                     padding: EdgeInsets.all(8.h),
                     // width: Get.size.width / 2,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.r),
                       color: KalakarColors.white,
                       border: Border.all(
                           color: KalakarColors.backgroundGrey),
                     ),
                     child: InkWell(
                       onTap: () {
                         controller.setArtistProfileDataToView1(
                             appliedProfileDetail);
                       },
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(50.r),
                             child: Image.network(
                               appliedProfileDetail.profilePic!,
                               fit: BoxFit.cover,
                               height: 70.h,
                               errorBuilder: (BuildContext context,
                                   Object error,
                                   StackTrace? stackTrace) {
                                 // Return a dummy or placeholder image when an error occurs
                                 return Image.asset(
                                   "assets/images/NA.jpg",
                                   height: 70.h,
                                   width: 70.h,
                                 );
                               },
                               width: 70.h,
                             ),
                           ),
                           Expanded(
                             flex: 3,
                             child: Padding(
                               padding: EdgeInsets.symmetric(
                                   horizontal: 8.h),
                               child: Column(
                                 crossAxisAlignment:
                                 CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                       "${appliedProfileDetail.firstName!} ${appliedProfileDetail.middleName!} ",style: TextStyle(fontWeight: FontWeight.bold),),
                                   Text(appliedProfileDetail.age!
                                       .toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                   SizedBox(
                                     width: 16.w,
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 })
                 : Text("No Artists Found"),],)
            ],
          ),
        ),
      );
    });
  }
}
