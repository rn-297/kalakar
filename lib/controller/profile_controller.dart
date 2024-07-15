import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/api/api_client.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/data/models/get_profile_data_class.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

class ProfileController extends GetxController {
  TextEditingController companyNameTEController = TextEditingController();
  TextEditingController adminNameTEController = TextEditingController();
  TextEditingController addressTEController = TextEditingController();
  TextEditingController pinCodeTEController = TextEditingController();
  TextEditingController districtTEController = TextEditingController();
  TextEditingController stateTEController = TextEditingController();
  TextEditingController bioTEController = TextEditingController();
  TextEditingController fbLinkTEController = TextEditingController();
  TextEditingController instaLinkTEController = TextEditingController();
  TextEditingController wpLinkTEController = TextEditingController();
  TextEditingController ytLinkTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController websiteTEController = TextEditingController();

  ProfileGetDataClass? profileData = ProfileGetDataClass();
  bool isProfileLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
  }

  void getProfileData() async {
    print("here");
    isProfileLoading = false;
    update();
    LoginTable? loginTable = await HiveService.getLoginData();
    print(loginTable?.userID);
    if (loginTable != null) {
      var body = {"fK_AccountID": loginTable.accountID};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getCompanyProfileDetailsApi,
          jsonEncode(body),
          loginTable.token);

      if (response.statusCode == 200) {
        ProfileGetDataClass profileGetDataClass =
            ProfileGetDataClass.fromJson(jsonDecode(response.body));
        if (profileGetDataClass.replayStatus ?? false) {
          profileData = profileGetDataClass;
        } else {}
      }
    } else {}
    isProfileLoading = true;
    update();
  }
}
