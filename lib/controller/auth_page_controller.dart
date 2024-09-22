import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';
import 'package:kalakar/data/models/login_data_model.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/helper/write_log.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:kalakar/views/dialogs/kalakar_dialogs.dart';

import '../data/api/api_client.dart';

enum PasswordType { createPass, createCnfmPass, signInPass }

enum OTPType { createAccount, forgotPassword }

class AuthPageController extends GetxController {
  //tabbar
  RxInt tabIndex = 0.obs;

//create account
  TextEditingController createFirstName = TextEditingController();
  TextEditingController createLastName = TextEditingController();
  TextEditingController createWhatsappNumber = TextEditingController();
  TextEditingController createPassword = TextEditingController();
  TextEditingController createEmail = TextEditingController();
  TextEditingController createCnfmPassword = TextEditingController();
  int userType = 0;
  bool createPasswordValue = true;
  bool createShowCnfmPassword = true;
  bool signInPasswordValue = true;
  bool isOtpSent = false;
  String oTP = "";

  bool createMobileNumberEditable = true;
  bool createEmailEditable = true;

  bool createFirstNameError = false;
  bool createLastNameError = false;
  bool createWhatsappNumberError = false;
  bool createEmailError = false;
  bool createPasswordError = false;
  bool createCnfmPasswordError = false;
  bool signInEmailOrMobileError = false;
  bool signInPasswordError = false;
  bool otpError = false;

  //sign In
  TextEditingController signInEmailOrMobile = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  //sign In
  TextEditingController forgotPassEmail = TextEditingController();
  TextEditingController forgotPassMobile = TextEditingController();

  //Timer
  late Timer timer;
  int startTime = 90;

  final _formGetOtpKey = GlobalKey<FormState>();
  final _formGetForgotOtpKey = GlobalKey<FormState>();
  final _formSetForgotPassKey = GlobalKey<FormState>();
  final _formSignInKey = GlobalKey<FormState>();

  String accountType = "Artist";

  get formSignInKey => _formSignInKey;
  final _formCreateAccountKey = GlobalKey<FormState>();

  get formGetOtpKey => _formGetOtpKey;

  get formGetForgotOtpKey => _formGetForgotOtpKey;

  get formSetForgotPassKey => _formSetForgotPassKey;

  get formCreateAccountKey => _formCreateAccountKey;

  void getStartedCall() {
    if (_formGetOtpKey.currentState!.validate() &&
        validateOtp() &&
        _formCreateAccountKey.currentState!.validate()) {
      createAccount();
    }
  }

  void setUserType(int index) {
    userType = index;
    update();
  }

  void setOtpValue(String value) {
    oTP = value;
  }

  void setPasswordVisibility(PasswordType passwordType) {
    switch (passwordType) {
      case PasswordType.createPass:
        createPasswordValue = !createPasswordValue;
      case PasswordType.createCnfmPass:
        createShowCnfmPassword = !createShowCnfmPassword;
      case PasswordType.signInPass:
        signInPasswordValue = !signInPasswordValue;
    }
    update();
  }

  void getOTP(OTPType otpType) {
    oTP = "";
    if (otpType == OTPType.createAccount) {
      if (_formGetOtpKey.currentState!.validate()) {
        // Process the form data
        getOtpApi(OTPType.createAccount);
      }
    } else if (otpType == OTPType.forgotPassword) {
      if (_formGetForgotOtpKey.currentState!.validate()) {
        // Process the form data
        getOtpApi(OTPType.forgotPassword);
        // isOtpSent = true;
      }
    }

    update();
  }

  void signInCall() {
    if (_formSignInKey.currentState!.validate()) {
      accountLogin();
    }
  }

  void signInWithGoogle() {}

  ///API CALLS
  Future<void> getOtpApi(OTPType otpType) async {
    isOtpSent = false;
    KalakarDialogs.loadingDialog("Get OTP", "Sending OTP ...");
    var body = otpType == OTPType.createAccount
        ? {
            "vcrMobileNumber": createWhatsappNumber.text,
            "vcrEmail": createEmail.text
          }
        : {
            "vcrMobileNumber": forgotPassMobile.text,
            "vcrEmail": forgotPassEmail.text
          };
    String url = otpType == OTPType.createAccount
        ? KalakarConstants.getCreateAccountOtp
        : otpType == OTPType.forgotPassword
            ? KalakarConstants.getForgotPasswordOtpApi
            : KalakarConstants.getCreateAccountOtp;

    var response = await ApiClient.postData(url, jsonEncode(body));
    print(response.statusCode);
    if (Get.isDialogOpen!) {
      Get.back();
    }

    if (response.statusCode == 200) {
      final String responseBody = await response.body;
      print(responseBody);
      final Map<String, dynamic> responseJSON = jsonDecode(responseBody);
      ResponseModel generateOtpClass = ResponseModel.fromJson(responseJSON);

      isOtpSent = generateOtpClass.replayStatus ?? false;
      if (isOtpSent) {
        KalakarDialogs.successDialog("OTP Success", generateOtpClass.message!);
        createMobileNumberEditable = false;
        createEmailEditable = false;
      } else {
        KalakarDialogs.successDialog("OTP Failed", generateOtpClass.message!);
      }
      startTimer();
    } else {
      await WriteLogFile.writeLog("URL : ${KalakarConstants.baseURL + url}");
      await WriteLogFile.writeLog("body : ${body}");
      await WriteLogFile.writeLog("statusCode : ${response.statusCode}");
      await WriteLogFile.writeLog("responseBody : ${response.body}");
      await WriteLogFile.writeLog(
          "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n\n");
      KalakarDialogs.successDialog("OTP Sent Failed", response.statusText);
    }

    update();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void animateToTab(int index, BuildContext context) {
    tabIndex.value = index;
    DefaultTabController.of(context).animateTo(index);
  }

  Future<void> createAccount() async {
    KalakarDialogs.loadingDialog("Reset Password", "Creating Account");

    var body = {
      "vcrMobileNumber": createWhatsappNumber.text,
      "vcrEmail": createEmail.text,
      "fistName": createFirstName.text,
      "lastName": createLastName.text,
      "otp": oTP,
      "password": createPassword.text,
      "confirmPassword": createCnfmPassword.text,
      "accountType":
          userType == 0 ? KalakarConstants.artist : KalakarConstants.company,
      "userName": "userName"
    };

    var response = await ApiClient.postData(
        KalakarConstants.createAccountApi, jsonEncode(body));
    print(response.statusCode);
    // print(response);
    if (Get.isDialogOpen!) {
      Get.back();
    }

    if (response.statusCode == 200) {
      ResponseModel responseModel =
          ResponseModel.fromJson(jsonDecode(response.body));
      if (responseModel.replayStatus!) {
        KalakarDialogs.successDialog("Account Created", responseModel.message!);
        clearCreateAccountPage();
      } else {
        KalakarDialogs.successDialog(
            "Account Creation Failed", responseModel.message!);
      }
    } else {
      await WriteLogFile.writeLog(
          "URL : ${KalakarConstants.baseURL + KalakarConstants.createAccountApi}");
      await WriteLogFile.writeLog("body : ${body}");
      await WriteLogFile.writeLog("statusCode : ${response.statusCode}");
      await WriteLogFile.writeLog("responseBody : ${response.body}");
      await WriteLogFile.writeLog(
          "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n\n");

      KalakarDialogs.successDialog(
          "Account Creation Failed", "Something Went Wrong");
    }
  }

  Future<void> setForgotPassword() async {
    if (_formGetForgotOtpKey.currentState!.validate() &&
        validateOtp() &&
        _formSetForgotPassKey.currentState!.validate()) {
      KalakarDialogs.loadingDialog("Reset Password", "Resetting Password");

      var body = {
        "vcrMobileNumber": forgotPassMobile.text,
        "vcrEmail": forgotPassEmail.text,
        "otp": oTP,
        "password": createPassword.text,
        "confirmPassword": createCnfmPassword.text,
        "userName": "userName"
      };

      var response = await ApiClient.postData(
          KalakarConstants.setNewPasswordApi, jsonEncode(body));
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus!) {
          KalakarDialogs.successGoLoginDialog(
              "Password Reset Success", responseModel.message!);
        } else {
          KalakarDialogs.successDialog(
              "Password Reset Failed", responseModel.message!);
        }
      } else {
        await WriteLogFile.writeLog(
            "URL : ${KalakarConstants.baseURL + KalakarConstants.createAccountApi}");
        await WriteLogFile.writeLog("body : ${body}");
        await WriteLogFile.writeLog("statusCode : ${response.statusCode}");
        await WriteLogFile.writeLog("responseBody : ${response.body}");
        await WriteLogFile.writeLog(
            "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n\n");

        KalakarDialogs.successDialog(
            "Password Reset Failed", "Something Went Wrong");
      }
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

  Future<void> changePassword() async {
    var body = {
      "accountID": "string",
      "password": "string",
      "confirmPassword": "string",
      "vcrEmail": "string"
    };

    var response =
        await ApiClient.postData(KalakarConstants.createAccountApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );
    }
  }

  Future<void> accountLogin() async {
    KalakarDialogs.loadingDialog("Logging", "Signing In");
    var body = {
      "password": signInPassword.text,
      "emailOrMobileNumber": signInEmailOrMobile.text
    };

    var response = await ApiClient.postData(
        KalakarConstants.getLoginApi, jsonEncode(body));
    print(response.statusCode);
    print(response.body);
    if (Get.isDialogOpen!) {
      Get.back();
    }

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );
      LoginDataClass loginDataClass =
          LoginDataClass.fromJson(jsonDecode(response.body));
      if (loginDataClass.replayStatus!) {
        LoginTable loginTable = LoginTable(
            loginDataClass.accountID ?? "",
            loginDataClass.email ?? "",
            loginDataClass.mobileNumber ?? "",
            loginDataClass.accountType ?? "",
            loginDataClass.fistName ?? "",
            loginDataClass.lastName ?? "",
            loginDataClass.token ?? "",
            loginDataClass.userID ?? "",
            loginDataClass.verificationStatus ?? "",
            loginDataClass.verificationStatusID ?? 0,
            loginDataClass.isverifiedContacts ?? false,
            loginDataClass.profileID ?? 0,
            loginDataClass.referralCode ?? "",
            loginDataClass.usedReferralCode ?? "");
        HiveService.saveLoginData(loginTable);
        signInEmailOrMobile.clear();
        signInPassword.clear();
        KalakarDialogs.goHomePage("Login Success", loginDataClass.message!,
            loginDataClass.accountType!);
      } else {
        KalakarDialogs.successDialog("Login Failed", loginDataClass.message!);
      }
    } else {
      await WriteLogFile.writeLog(
          "URL : ${KalakarConstants.baseURL + KalakarConstants.createAccountApi}");
      await WriteLogFile.writeLog("body : ${body}");
      await WriteLogFile.writeLog("statusCode : ${response.statusCode}");
      await WriteLogFile.writeLog("responseBody : ${response.body}");
      await WriteLogFile.writeLog(
          "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n\n");

      KalakarDialogs.successDialog("Login Failed", "Something Went Wrong !!!");
    }
  }

  bool validateOtp() {
    if (oTP.isEmpty || oTP.length < 4) {
      otpError = true;
    } else {
      otpError = false;
    }
    update();
    return oTP.isNotEmpty;
  }

  void clearCreateAccountPage() {
    createFirstName.clear();
    createLastName.clear();
    createEmail.clear();
    createWhatsappNumber.clear();
    createWhatsappNumber.clear();
    createWhatsappNumber.clear();
    oTP = "";
  }

  Future<void> splashScreenTask(AuthPageController authPageController) async {
    Future.delayed(Duration(seconds: 2), () async {
      LoginTable? loginTable = await HiveService.getLoginData();

      if (loginTable != null) {
        print(loginTable!.userID);
        if (loginTable.accountType == KalakarConstants.artist) {
          Get.offNamed(RouteHelper.bottomNavigationPage);
        } else if (loginTable.accountType == KalakarConstants.company) {
          Get.offNamed(RouteHelper.bottomNavigationPage);
        }
        authPageController.accountType = loginTable.accountType;
      } else {
        Get.offNamed(RouteHelper.login);
      }
    });
  }
}
