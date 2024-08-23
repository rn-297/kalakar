import 'package:get/get.dart';
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
    if (loginTable!=null) {
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
      }else{
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
}
