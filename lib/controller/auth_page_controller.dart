import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:kalakar/views/dialogs/kalakar_dialogs.dart';

import '../data/api/api_client.dart';

enum PasswordType { createPass, createCnfmPass, signInPass }

enum OTPType { createAccount, forgotPassword }

class AuthPageController extends GetxController {
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

  final _formGetOtpKey = GlobalKey<FormState>();
  final _formGetForgotOtpKey = GlobalKey<FormState>();
  final _formSetForgotPassKey = GlobalKey<FormState>();
  final _formSignInKey = GlobalKey<FormState>();

  get formSignInKey => _formSignInKey;
  final _formCreateAccountKey = GlobalKey<FormState>();

  get formGetOtpKey => _formGetOtpKey;

  get formGetForgotOtpKey => _formGetForgotOtpKey;

  get formSetForgotPassKey => _formSetForgotPassKey;

  get formCreateAccountKey => _formCreateAccountKey;

  String? createFirstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }

  String? createLastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? createEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Email';
    }
    // Regular expression for email validation
    String pattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a Valid Email';
    }
    return null;
  }

  String? createMobileNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Mobile Number';
    }
    // Regular expression for 10-digit number validation
    String pattern = r'^\d{10}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  String? createPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Password';
    }
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigits = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = value.length >= 8;

    if (!hasUppercase) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!hasLowercase) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!hasDigits) {
      return 'Password must contain at least one digit';
    }
    if (!hasSpecialCharacters) {
      return 'Password must contain at least one special character';
    }
    if (!hasMinLength) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? createConfirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Confirm Password';
    }
    return null;
  }

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
        isOtpSent = true;
      }
    }

    // update();
  }

  void signInCall() {
    if (_formSignInKey.currentState!.validate()) {
      Get.offNamed(RouteHelper.bottomNavigationPage);
    }
  }

  void signInWithGoogle() {}

  ///API CALLS
  Future<void> getOtpApi(OTPType otpType) async {
    KalakarDialogs.loadingDialog("Get OTP", "Sending OTP ...");
    var body = {
      "vcrMobileNumber": createWhatsappNumber.text,
      "vcrEmail": createEmail.text
    };
    String url = otpType == OTPType.createAccount
        ? KalakarConstants.getCreateAccountOtp
        : otpType == OTPType.forgotPassword
            ? KalakarConstants.getForgotPasswordOtpApi
            : KalakarConstants.getCreateAccountOtp;

    var response = await ApiClient.postData(url, jsonEncode(body));
    print(response);
    Get.back();

    if (response.statusCode == 200) {
      final String responseBody = await response.body;
      print(responseBody);
      final Map<String, dynamic> responseJSON = jsonDecode(responseBody);
      ResponseModel generateOtpClass = ResponseModel.fromJson(responseJSON);

      isOtpSent = generateOtpClass.replayStatus ?? false;
    }

    update();
  }

  Future<void> createAccount() async {
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

    if (response.statusCode == 200) {
      ResponseModel responseModel =
          ResponseModel.fromJson(jsonDecode(response.body));
      if (responseModel.replayStatus!) {
        KalakarDialogs.successDialog("Account Created", responseModel.message!);
      } else {
        KalakarDialogs.successDialog(
            "Account Creation Failed", responseModel.message!);
      }
    }
  }

  Future<void> setForgotPassword() async {
    if (_formGetForgotOtpKey.currentState!.validate() &&
        validateOtp() &&
        _formSetForgotPassKey.currentState!.validate()) {
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

      if (response.statusCode == 200) {}
    }
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
    var body = {"password": "Rohan@123", "emailOrMobileNumber": "9405099756"};

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

  bool validateOtp() {
    if (oTP.isEmpty || oTP.length < 4) {
      otpError = true;
    } else {
      otpError = false;
    }
    update();
    return oTP.isNotEmpty;
  }
}
