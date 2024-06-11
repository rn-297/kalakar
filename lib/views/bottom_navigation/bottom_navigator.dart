import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/navigation_controller.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

class BottomNavigatorPage extends StatelessWidget {
  const BottomNavigatorPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationController());
    return GetBuilder<BottomNavigationController>(
      builder: (navigationController) {
        return SafeArea(child: Scaffold(bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationController.getSelectedIndex(),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            bottomNavigatorIcon(KalakarConstants.home, Icons.home_sharp),
            bottomNavigatorIcon(KalakarConstants.opportunities, Icons.camera),
            bottomNavigatorIcon(KalakarConstants.profile, Icons.person_outlined),
            bottomNavigatorIcon(KalakarConstants.settings, Icons.settings)
          ],
          onTap: (index) {
            navigationController.setSelectedIndex(index);
          },
        ),body: navigationController.getSelectedPage(),));
      }
    );
  }

  BottomNavigationBarItem bottomNavigatorIcon(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: Colors.grey,
          ),
          SizedBox(height: 4.h,),
          Text(label,)
        ],
      ),
      label: label,
      activeIcon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: Colors.blue,
          ),
          SizedBox(height: 4.h,),
          Text(label,)
        ],
      ),
    );
  }

}
