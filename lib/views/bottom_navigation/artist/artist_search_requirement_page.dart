import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/helper/common_widgets.dart';
import 'package:kalakar/helper/textfield_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../../custom_widgets/button_mobile_widget.dart';
import '../../../data/models/company/company_requirement_list_class.dart';
import '../../../helper/date_picker_helper.dart';
import '../../../helper/kalakar_colors.dart';
import '../../../utils/kalakar_constants.dart';

class ArtistSearchRequirementPage extends StatelessWidget {
  const ArtistSearchRequirementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => appbarMobileView(context),
          tablet: (BuildContext context) => appbarWebView(),
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

          Text(
            KalakarConstants.searchRequirement,
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
                                  controller.searchRequirementDetailsArtist();
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
                        CommonWidgets.commonMobileTextField(
                            controller: controller.searchLocationTEController,
                            labelText: "Location",
                            obscureText: false,
                            hintText: "Search Location",
                            passwordVisibility: false,
                            contentPadding: EdgeInsetsDirectional.symmetric(
                                horizontal: 24, vertical: 8.h),
                            togglePasswordVisibility: () {},
                            textInputType: TextInputType.text,
                            validator: Validator.validateLocation),
                        SizedBox(
                          height: 12.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: controller.searchLanguageTEController,
                            labelText: "Language",
                            obscureText: false,
                            hintText: "Search Language",
                            passwordVisibility: false,
                            togglePasswordVisibility: () {},
                            textInputType: TextInputType.text,
                            validator: Validator.validateLanguage),
                        SizedBox(
                          height: 12.h,
                        ),
                        InkWell(
                          onTap: () async {
                            final date = await DatePickerHelper.selectDate(
                                context,
                                isOld: true);
                            if (date != null) {
                              controller.setDate(
                                  KalakarConstants.searchShootingStartDate,
                                  date);
                            }
                          },
                          child: CommonWidgets.commonMobileTextField(
                              controller: controller
                                  .searchShootingStartDateTEController,
                              labelText: "Shooting Start Date",
                              obscureText: false,
                              hintText: "Search Shooting Start Date",
                              passwordVisibility: false,
                              togglePasswordVisibility: () {},
                              editable: false,
                              textInputType: TextInputType.text,
                              validator: Validator.validateShootingStartDate),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        InkWell(
                          onTap: () async {
                            final date = await DatePickerHelper.selectDate(
                                context,
                                isOld: true);
                            if (date != null) {
                              controller.setDate(
                                  KalakarConstants.searchShootingEndDate, date);
                            }
                          },
                          child: CommonWidgets.commonMobileTextField(
                              controller:
                                  controller.searchShootingEndDateTEController,
                              labelText: "Shooting End Date",
                              obscureText: false,
                              hintText: "Search Shooting End Date",
                              passwordVisibility: false,
                              editable: false,
                              togglePasswordVisibility: () {},
                              textInputType: TextInputType.text,
                              validator: Validator.validateShootingEndDate),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: controller.searchStartAgeTEController,
                            labelText: "Start Age",
                            obscureText: false,
                            hintText: "Search Start Age",
                            passwordVisibility: false,
                            togglePasswordVisibility: () {},
                            textInputType: TextInputType.number,
                            validator: Validator.validateStartAge),
                        SizedBox(
                          height: 12.h,
                        ),
                        CommonWidgets.commonMobileTextField(
                            controller: controller.searchEndAgeTEController,
                            labelText: "End Age",
                            obscureText: false,
                            hintText: "Search End Age",
                            passwordVisibility: false,
                            togglePasswordVisibility: () {},
                            textInputType: TextInputType.number,
                            validator: Validator.validateEndAge),
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

          Text(
            KalakarConstants.searchRequirement,
            style: TextStyle(color: KalakarColors.textColor, fontSize: 20.sp),
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

  artistSearchOpportunitiesMobileView() {
    return GetBuilder<RequirementController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            children: [
              CommonWidgets.commonMobileTextField(
                  controller: controller.searchTitleTEController,
                  labelText: "Title",
                  obscureText: false,
                  hintText: "Search Title",
                  passwordVisibility: false,
                  togglePasswordVisibility: () {},
                  textInputType: TextInputType.text,
                  validator: Validator.validateTitle),
              SizedBox(
                height: 12.h,
              ),
              CustomMobileButtonWidget(
                  text: "Search",
                  onTap: () {
                    controller.searchRequirementDetailsArtist();
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
              controller.isSearching
                  ? ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 4.h),
                          decoration: BoxDecoration(
                            color: KalakarColors.white,
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Shimmer.fromColors(
                                      baseColor: KalakarColors.blue10,
                                      highlightColor: KalakarColors.blue20,
                                      child: Container(
                                        height: 80.h,
                                        width: 80.h,
                                        color: KalakarColors.white,
                                      ),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: KalakarColors.blue10,
                                            highlightColor:
                                                KalakarColors.blue20,
                                            child: Container(
                                              height: 20.h,
                                              width: 80.h,
                                              color: KalakarColors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Shimmer.fromColors(
                                            baseColor: KalakarColors.blue10,
                                            highlightColor:
                                                KalakarColors.blue20,
                                            child: Container(
                                              height: 20.h,
                                              width: 80.h,
                                              color: KalakarColors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Shimmer.fromColors(
                                                baseColor: KalakarColors.blue10,
                                                highlightColor:
                                                    KalakarColors.blue20,
                                                child: Container(
                                                  height: 20.h,
                                                  width: 80.h,
                                                  color: KalakarColors.white,
                                                ),
                                              ),
                                              Shimmer.fromColors(
                                                baseColor: KalakarColors.blue10,
                                                highlightColor:
                                                    KalakarColors.blue20,
                                                child: Container(
                                                  height: 20.h,
                                                  width: 80.h,
                                                  color: KalakarColors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Shimmer.fromColors(
                                                baseColor: KalakarColors.blue10,
                                                highlightColor:
                                                    KalakarColors.blue20,
                                                child: Container(
                                                  height: 20.h,
                                                  width: 80.h,
                                                  color: KalakarColors.white,
                                                ),
                                              ),
                                              Shimmer.fromColors(
                                                baseColor: KalakarColors.blue10,
                                                highlightColor:
                                                    KalakarColors.blue20,
                                                child: Container(
                                                  height: 20.h,
                                                  width: 80.h,
                                                  color: KalakarColors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      })
                  : controller.requirementDetailsSearchList.isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              controller.requirementDetailsSearchList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            RequirementDetailsData requirementData =
                                controller.requirementDetailsSearchList[index];
                            final DateFormat formatter =
                                DateFormat('dd-MM-yyyy');
                            DateTime shootingDate = DateTime.parse(
                                requirementData!.shootingStartDate!);
                            String date = formatter.format(shootingDate);
                            print(requirementData.requirementDetailsID);
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 4.h),
                              decoration: BoxDecoration(
                                color: KalakarColors.backgroundTurquoise,
                                border: Border.all(
                                    color: KalakarColors.backgroundGrey),
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  controller
                                      .checkArtistAndSetData(requirementData);
                                },
                                child: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: requirementData.refPhotoName ==
                                                  null
                                              ? Container(
                                                  margin: EdgeInsets.all(1.h),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8.r),
                                                      ),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          "assets/images/movie.png",
                                                        ),
                                                        fit: BoxFit.cover,
                                                      )),
                                                ) //requirementData.companyLogo ?? "",
                                              : Container(
                                                  margin: EdgeInsets.all(1.h),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8.r),
                                                      ),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          requirementData
                                                                  .refPhotoName ??
                                                              "",
                                                        ),
                                                        fit: BoxFit.cover,
                                                      )),
                                                )),
                                      Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  requirementData
                                                      .requirementTitle!,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: KalakarColors
                                                          .headerText,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  requirementData
                                                          .requirementDescription! ??
                                                      "",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(requirementData
                                                        .shootingLocation!),
                                                    Text(date),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(requirementData
                                                        .gender!),
                                                    Text(requirementData.age!
                                                        .split(".")[0]),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : Text("No Opportunities Found"),
            ],
          ),
        ),
      );
    });
  }

  artistSearchOpportunitiesWebView(BuildContext context) {}
}
