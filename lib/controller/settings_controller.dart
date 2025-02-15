import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/navigation_controller.dart';
import 'package:kalakar/data/models/notification_settings_class.dart';
import 'package:kalakar/data/models/referral_details_class.dart';
import 'package:kalakar/data/models/settings_data_class.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/push_notification/PushNotificationService.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:kalakar/views/dialogs/kalakar_dialogs.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../data/models/generate_otp_model.dart';
import '../data/models/login_data_model.dart';

class SettingsController extends GetxController {
  List<String> settingsList = [];
  String referralCode = "";
  String referredBy = "";
  String totalReferralAmount = "";
  ReferralDetailsClass referralDetails = ReferralDetailsClass();
  TextEditingController referralCodeTEController = TextEditingController();
  bool detailsLoaded = false;
  bool isNotification = false;
  SettingsDataClass settingsData = SettingsDataClass();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // setSettingsList();
    // getSettingsData();
    // getNotificationData();
  }

  void setSettingsList() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      print(loginTable!.accountType??""!);

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
      case KalakarConstants.myProfile:
        BottomNavigationController bottomNavigationController =
            Get.put(BottomNavigationController());
        bottomNavigationController.selectedIndex = 2;
        bottomNavigationController.update();
        break;
      case KalakarConstants.myApplications:
        Get.toNamed(RouteHelper.myApplicationsPage);
        break;
      case KalakarConstants.myFavourites:
        Get.toNamed(RouteHelper.myFavouritesPage);
        break;
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

  void logOutMessage() {
    if (kIsWeb) {
      KalakarDialogs.logOutDialog1();
    } else {
      KalakarDialogs.logOutDialog();
    }
  }

  getReferralDetail() async {
    KalakarDialogs.loadingDialog(
        "Getting Referral Code Data", "Getting Referral Code Data");
    final body = {
      "referralCode": referralCodeTEController.text,
    };
    var response = await ApiClient.postData(
      KalakarConstants.getReferralCodeDetailsApi,
      jsonEncode(body),
    );
    // print(response.statusCode);
    // print(response);

    if (Get.isDialogOpen!) {
      Get.back();
    }
    if (response.statusCode == 200) {
      ReferralDetailsClass referralDetailsClass =
          ReferralDetailsClass.fromJson(jsonDecode(response.body));
      referralDetails = referralDetailsClass;
      detailsLoaded = true;
    }
    update();
  }

  Future<void> applyReferralCode() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Applying Referral Code Data", "Applying Referral Code Data");
      final body = {
        "referralCode": referralCodeTEController.text,
        "accountID": loginTable.accountID??"",
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.useReferralCodeApi,
          jsonEncode(body),
          loginTable.token??"");
      print(response.statusCode);
      print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Applying Referral Code Data Success", responseModel.message!);
          setSettingsList();
        } else {
          KalakarDialogs.successDialog(
              "Applying Referral Code Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> getSettingsData() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "fK_UserTypeID":
            loginTable.accountType == KalakarConstants.artist ? "2" : "1",
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getSettingsDataApi,
          jsonEncode(body),
          loginTable.token??"");
      print(response.statusCode);
      print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        SettingsDataClass settingsDataClass =
            SettingsDataClass.fromJson(jsonDecode(response.body));
        if (settingsDataClass.replayStatus ?? false) {
          settingsData = settingsDataClass;
          update();
        } else {}
      }
    }
  }


  Future<void> getReferralData() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "accountID": loginTable.accountID??""
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAccountData,
          jsonEncode(body),
          loginTable.token??"");
      print(response.statusCode);
      print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        LoginDataClass loginDataClass =
        LoginDataClass.fromJson(jsonDecode(response.body));
        if (loginDataClass.replayStatus ?? false) {
          totalReferralAmount = loginDataClass.totalReferralAmount!.toString();
          referralCode = loginDataClass.referralCode.toString();
          referredBy = loginDataClass.usedReferralCode.toString();
          update();
        } else {}
      }
    }
  }

  void openSocialMedia(String url) {}

  void setNotificationValue(bool val) {
    PushNotificationService.getNotificationToken();
    setNotificationData(val);
  }

  Future<void> getNotificationData() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {"accountID": loginTable.accountID??""};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getNotificationDataApi,
          jsonEncode(body),
          loginTable.token??"");
      print(response.statusCode);
      print(response);


      if (response.statusCode == 200) {
        NotificationSettingsClass notificationSettingsClass =
            NotificationSettingsClass.fromJson(jsonDecode(response.body));
        if (notificationSettingsClass.replayStatus!) {
          isNotification = notificationSettingsClass.isNotificationOn??true;
          update();
        }
      }
    }
  }

  Future<void> setNotificationData(bool val) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Setting Notification Data", "Setting Notification Data");
      final body = {"isNotificationOn": val,
        "accountID": loginTable.accountID??""};
      var response = await ApiClient.postDataToken(
          KalakarConstants.setNotificationDataApi,
          jsonEncode(body),
          loginTable.token??"");
      print(response.statusCode);
      print(response);

      if(Get.isDialogOpen!){
        Get.back();
      }


      if (response.statusCode == 200) {
        ResponseModel responseModel=ResponseModel.fromJson(jsonDecode(response.body));
        if(responseModel.replayStatus??false){
          getNotificationData();
        }
      }
    }
  }
}
