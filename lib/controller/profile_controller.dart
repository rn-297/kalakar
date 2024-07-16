import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/api/api_client.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/data/models/get_profile_data_class.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
  TextEditingController emailLinkTEController = TextEditingController();
  TextEditingController websiteTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController mobileNumberTEController = TextEditingController();
  TextEditingController filmCorporationCardTEController =
      TextEditingController();
  TextEditingController adminAadharCardTEController = TextEditingController();
  TextEditingController addressProofOfCompanyTEController =
      TextEditingController();
  TextEditingController selfieUploadTEController = TextEditingController();
  TextEditingController projectTitleTEController = TextEditingController();
  TextEditingController projectDescriptionTEController =
      TextEditingController();
  TextEditingController projectStatusTEController = TextEditingController();

  ProfileGetDataClass? profileData = ProfileGetDataClass();
  bool isProfileLoading = false;
  String oTP = "";
  bool otpError = false;
  bool isOtpSent = false;
  int startTime = 90;

  void setOtpValue(String value) {
    oTP = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
  }

  void getProfileData() async {
    print("here");
    isProfileLoading = true;
    update();
    LoginTable? loginTable = await HiveService.getLoginData();
    print("userId ${loginTable?.userID}");
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
    isProfileLoading = false;
    update();
  }

  String? companyNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Company Name/Production House';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Valid Email';
    }
    return null;
  }

  String? authorizeAdminNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Authorize Admin Name';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Address';
    }
    return null;
  }

  String? postalCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Postal Code';
    }
    return null;
  }

  String? districtValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select District';
    }
    return null;
  }

  String? stateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select State';
    }
    return null;
  }

  String? bioValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Bio';
    }
    return null;
  }

  String? projectTitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Project Title';
    }
    return null;
  }

  String? projectDescriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Project Description';
    }
    return null;
  }

  String? projectStatusValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Bio';
    }
    return null;
  }

  Future<void> openSocialMedia(int index) async {
    switch (index) {
      case 0:
        if (await canLaunchUrl(Uri.parse(profileData!.fbLink!))) {
          launchUrl(Uri.parse(profileData!.fbLink!));
        } else {
          print("url not available");
        }
        break;
      case 1:
        if (await canLaunchUrl(Uri.parse(profileData!.instalink!))) {
          launchUrl(Uri.parse(profileData!.instalink!));
        } else {
          print("url not available");
        }
        break;
      case 2:
        if (await canLaunchUrl(Uri.parse(profileData!.wpLink!))) {
          launchUrl(Uri.parse(profileData!.wpLink!));
        } else {
          print("url not available");
        }
        break;
      case 3:
        if (await canLaunchUrl(Uri.parse(profileData!.ytLink!))) {
          launchUrl(Uri.parse(profileData!.ytLink!));
        } else {
          print("url not available");
        }
        break;
      case 4:
        if (await canLaunchUrl(Uri.parse(profileData!.emailLink!))) {
          launchUrl(Uri.parse(profileData!.emailLink!));
        } else {
          print("url not available");
        }
        break;
      case 5:
        if (await canLaunchUrl(Uri.parse(profileData!.websiteLink!))) {
          launchUrl(Uri.parse(profileData!.websiteLink!));
        } else {
          print("url not available");
        }
        break;
    }
  }

  startTimer() {
    startTime = 90;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (startTime <= 0) {
        timer.cancel();
      } else {
        startTime--;
      }
      update();
    });
  }

  void getOTP() {
    isOtpSent = true;
    startTimer();
    update();
  }

  void verifyContact() {}

  void saveCompanyMoreInfo() {}

  void addPhotosAndVideos() {}
}
