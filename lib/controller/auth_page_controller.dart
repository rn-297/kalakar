import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

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

  //sign In
  TextEditingController signInEmailOrMobile = TextEditingController();
  TextEditingController signInPassword = TextEditingController();


  final _formGetOtpKey = GlobalKey<FormState>();

  get formGetOtpKey => _formGetOtpKey;
  final _formCreateAccountKey = GlobalKey<FormState>();

  get formCreateAccountKey => _formCreateAccountKey;

  String? createFirstNameValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }
  String? createLastNameValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }
  String? createEmailValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }
  String? createMobileNumberValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }
  String? createEmailIdValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }
  String? createPasswordValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }
  String? createConfirmPasswordValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }


  void getStartedCall() {}

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

  void getOTP() {
    if (_formGetOtpKey.currentState!.validate()) {
      // Process the form data

    }

    update();
  }

  void signInCall() {
    Get.offNamed(RouteHelper.bottomNavigationPage);
  }

  void signInWithGoogle() {}

  ///API CALLS
  Future<void> getOtp(OTPType otpType) async {
    var body = {
      "vcrMobileNumber": createWhatsappNumber.text,
      "vcrEmail": createEmail.text
    };
    String url = otpType == OTPType.createAccount
        ? KalakarConstants.getCreateAccountOtp
        : otpType == OTPType.forgotPassword
        ? KalakarConstants.getForgotPasswordOtpApi
        : KalakarConstants.getCreateAccountOtp;

    var response = await ApiClient.postData(url, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );
    }
  }

  Future<void> createAccount() async {
    var body = {
      "vcrMobileNumber": createWhatsappNumber.text,
      "vcrEmail": createEmail.text,
      "fistName": createFirstName.text,
      "lastName": createLastName,
      "otp": oTP,
      "password": createPassword.text,
      "confirmPassword": createCnfmPassword.text,
      "accountType": userType,
      "userName": "userName"
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

  Future<void> setForgotPassword() async {
    var body = {
      "vcrMobileNumber": "string",
      "vcrEmail": "string",
      "otp": "string",
      "password": "string",
      "confirmPassword": "string",
      "userName": "string"
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

  bool validateFields(String type) {

    return true;
  }
}
