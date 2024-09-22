import 'package:get/get.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';

class SettingsController extends GetxController {
  List<String> settingsList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setSettingsList();
  }

  void setSettingsList() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      print(loginTable!.accountType!);
      if (loginTable!.accountType == KalakarConstants.artist) {
        settingsList = [
          KalakarConstants.myProfile,
          KalakarConstants.myApplications,
          KalakarConstants.myFavourites,
          KalakarConstants.aboutUs,
          KalakarConstants.help,
          KalakarConstants.privacyPolicy,
          KalakarConstants.termsNConditions,
          KalakarConstants.referralCode1
        ];
      } else {
        settingsList = [
          KalakarConstants.myProfile,
          KalakarConstants.myApplications,
          KalakarConstants.myFavourites,
          KalakarConstants.aboutUs,
          KalakarConstants.help,
          KalakarConstants.privacyPolicy,
          KalakarConstants.termsNConditions,
          KalakarConstants.referralCode1
        ];
      }
    }
    update();
  }

  void gotoNextPage(String settingsName) {
    switch (settingsName) {
      case KalakarConstants.aboutUs:
        Get.toNamed(RouteHelper.aboutUsPage);
        break;
      case KalakarConstants.help:
        Get.toNamed(RouteHelper.helpPage);

        break;
      case KalakarConstants.privacyPolicy:
        Get.toNamed(RouteHelper.privacyPolicyPage);

        break;
      case KalakarConstants.termsNConditions:
        Get.toNamed(RouteHelper.termsAndConditionsPage);

        break;
      case KalakarConstants.referralCode1:
        Get.toNamed(RouteHelper.referralCodePage);

        break;
    }
  }
}
