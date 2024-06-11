import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

enum PasswordType { createPass, createCnfmPass, signInPass }

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

  //sign In
  TextEditingController signInEmailOrMobile = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  void getStartedCall() {}

  void setUserType(int index) {
    userType = index;
    update();
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
    isOtpSent = true;
    update();
  }

  void signInCall() {
    Get.offNamed(RouteHelper.bottomNavigationPage);
  }

  void signInWithGoogle() {}
}
