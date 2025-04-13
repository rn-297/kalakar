import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/navigation_controller.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BottomNavigatorPage extends StatelessWidget {
  const BottomNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationController());
    return SafeArea(
        child: ScreenTypeLayout.builder(
      mobile: (BuildContext context) => mobileView(),
      tablet: (BuildContext context) => webView(),
    ));
  }

  Widget customNavItem(String label, int index,
      BottomNavigationController navigationController) {
    bool isSelected = navigationController.getSelectedArtistIndex() == index;
    return Material(
      child: InkWell(
        onTap: () => navigationController.setSelectedArtistIndex(index),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.white,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 4.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigatorIcon(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: Colors.grey),
          SizedBox(height: 4.h),
          Text(label),
        ],
      ),
      label: label,
      activeIcon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: Colors.blue),
          SizedBox(height: 4.h),
          Text(label),
        ],
      ),
    );
  }

  webView() {
    return GetBuilder<BottomNavigationController>(
        builder: (navigationController) {
      return Row(
        children: [
          Container(
            width: 50.w,
            // color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 110.h,
                  child: Center(
                      child: Image.asset(
                    "assets/images/app_logo2.PNG",
                    fit: BoxFit.cover,
                  )),
                ),
                // Empty space above first item
                customNavItem(KalakarConstants.home, 0, navigationController),
                customNavItem(
                    KalakarConstants.opportunities, 1, navigationController),
                customNavItem(
                    KalakarConstants.profile, 2, navigationController),
                customNavItem(
                    KalakarConstants.settings, 3, navigationController),
              ],
            ),
          ),
          Expanded(child: navigationController.getSelectedArtistPage()),
        ],
      );
    });
  }

  mobileView() {
    return GetBuilder<BottomNavigationController>(
        builder: (navigationController) {
      return Column(
        children: [
          Expanded(child: navigationController.getSelectedArtistPage()),
          BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: navigationController.getSelectedArtistIndex(),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              bottomNavigatorIcon(KalakarConstants.home, Icons.home_sharp),
              bottomNavigatorIcon(KalakarConstants.opportunities, Icons.camera),
              bottomNavigatorIcon(
                  KalakarConstants.profile, Icons.person_outlined),
              bottomNavigatorIcon(KalakarConstants.settings, Icons.settings),
            ],
            onTap: (index) {
              navigationController.setSelectedArtistIndex(index);
            },
          ),
        ],
      );
    });
  }
}
