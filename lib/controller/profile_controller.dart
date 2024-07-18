import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/api/api_client.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';
import 'package:kalakar/data/models/get_profile_data_class.dart';
import 'package:kalakar/helper/picker_helper.dart';
import 'package:kalakar/helper/state_city_pincode_helper/state_city_pincode_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/models/csv_model_class.dart';
import '../views/dialogs/kalakar_dialogs.dart';

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

  String oTP = "";
  String companyLogo = "";
  String documentType = "";
  String filmCorporationCardPath = "";
  String adminAadharCardPath = "";
  String addressProofCompanyPath = "";
  String selfieUploadedPath = "";

  int startTime = 90;

  bool isNetworkCompanyLogo = true;
  bool isProfileLoading = false;
  bool otpError = false;
  bool isOtpSent = false;
  bool isContactVerified = false;
  bool isLoading = false;
  bool mobileNumberEditable = true;
  bool emailEditable = true;

  List<CSVData> stateCityPinCodeList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  List<String> pinCodeList = [];

  ProfileGetDataClass? profileData = ProfileGetDataClass();

  final _formProfileKey = GlobalKey<FormState>();

  get formProfileKey => _formProfileKey;

  final _formCompanyProfileMoreInfoOtpKey = GlobalKey<FormState>();

  get formCompanyProfileMoreInfoOtpKey => _formCompanyProfileMoreInfoOtpKey;

  final _formCompanyProfileMoreInfoDocumentsKey = GlobalKey<FormState>();

  get formCompanyProfileMoreInfoDocumentsKey =>
      _formCompanyProfileMoreInfoDocumentsKey;

  void setOtpValue(String value) {
    oTP = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
    getStateData();
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
          setProfileFormData();
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

  String? mobileNumberValidator(String? value) {
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
      return 'Please Select Postal Code / Pin Code';
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

  bool validateOtp() {
    if (oTP.isEmpty || oTP.length < 4) {
      otpError = true;
    } else {
      otpError = false;
    }
    update();
    return oTP.isNotEmpty;
  }

  void getContactVerificationOTP() async {
    if (_formCompanyProfileMoreInfoOtpKey.currentState!.validate()) {
      KalakarDialogs.loadingDialog("Get OTP", "Sending OTP ...");
      LoginTable? loginTable = await HiveService.getLoginData();

      if (loginTable != null) {
        var body = {
          "mobileNo": mobileNumberTEController.text,
          "email": emailTEController.text,
          "fK_AccountID": loginTable.accountID
        };

        var response = await ApiClient.postDataToken(
            KalakarConstants.getCompanyProfileContactVerificationOtpApi,
            jsonEncode(body),
            loginTable.token);

        if (Get.isDialogOpen!) {
          Get.back();
        }
        if (response.statusCode == 200) {
          ResponseModel responseModel =
              ResponseModel.fromJson(jsonDecode(response.body));

          if (responseModel.replayStatus ?? false) {
            KalakarDialogs.successDialog(
                "Send OTP Success", responseModel.message!);
            isOtpSent = true;
            startTimer();
          } else {
            KalakarDialogs.successDialog(
                "Send OTP Failed", responseModel.message!);
          }
        }
      } else {
        if (Get.isDialogOpen!) {
          Get.back();
        }
        KalakarDialogs.successDialog(
            "Send Otp Failed", "Unable To Get Logged Details");
      }
    }
    update();
  }

  setProfileFormData() {
    isNetworkCompanyLogo = true;
    companyLogo = profileData!.companyLogo ?? "";
    companyNameTEController.text =
        profileData!.companyNameProductionhouse ?? "";
    adminNameTEController.text = profileData!.authoriseAdminName ?? "";
    addressTEController.text = profileData!.address ?? "";
    pinCodeTEController.text = profileData!.postalcode ?? "";
    districtTEController.text = profileData!.district ?? "";
    stateTEController.text = profileData!.state ?? "";
    bioTEController.text = profileData!.bio ?? "";
    isContactVerified = profileData!.isVerifiedContacts == "True";
    update();
  }

  void verifyContact() async {
    if (_formCompanyProfileMoreInfoOtpKey.currentState!.validate()) {
      KalakarDialogs.loadingDialog(
          "Contact Verification", "Verifying Contact ...");
      LoginTable? loginTable = await HiveService.getLoginData();

      if (loginTable != null) {
        var body = {
          "mobileNo": mobileNumberTEController.text,
          "email": emailTEController.text,
          "fK_AccountID": loginTable.accountID,
          "vcrOTP": oTP
        };

        var response = await ApiClient.postDataToken(
            KalakarConstants.verifyCompanyProfileContactsApi,
            jsonEncode(body),
            loginTable.token);

        if (Get.isDialogOpen!) {
          Get.back();
        }
        if (response.statusCode == 200) {
          ResponseModel responseModel =
              ResponseModel.fromJson(jsonDecode(response.body));

          if (responseModel.replayStatus ?? false) {
            KalakarDialogs.successDialog(
                "Contact Verification Success", responseModel.message!);
            isOtpSent = false;
            isContactVerified = true;
            // startTimer();
          } else {
            KalakarDialogs.successDialog(
                "Contact Verification Failed", responseModel.message!);
          }
        }
      } else {
        if (Get.isDialogOpen!) {
          Get.back();
        }
        KalakarDialogs.successDialog(
            "Contact Verification Failed", "Unable To Get Logged Details");
      }
    }
  }

  Future<void> saveCompanyMoreInfo() async {
    if(_formCompanyProfileMoreInfoOtpKey.currentState!.validate()&&_formCompanyProfileMoreInfoDocumentsKey.currentState!.validate()){
      print("all data");
      KalakarDialogs.loadingDialog(
          "Company More Data", "Saving Company More Info");
      LoginTable? loginTable = await HiveService.getLoginData();

      if (loginTable != null) {
        // Example fields (if any)
        Map<String, String> fields = {
          'FK_AccountID': loginTable.accountID,
          'Email': emailTEController.text,
          'MobileNumber':mobileNumberTEController.text,
          'Name': "",
          'UserID': loginTable.userID,
          'Admin_Ower_CEO': "",
        };
        print(fields);

        // Example files (if any)
        Map<String, File> files = {
          'FilmCorpprationCard_DOC': File(filmCorporationCardPath),
          'AdminAdharCard_DOC': File(adminAadharCardPath),
          'AddressProofofCompany_DOC': File(addressProofCompanyPath),
          'Selfieupload_DOC': File(selfieUploadedPath),
        };

        var response = await ApiClient.postFormDataToken(
            KalakarConstants.saveCompanyProfileMoreInfoApi,
            fields,
            files,
            loginTable.token);
        print(response.statusCode);
        print(response.body);
        isLoading = false;
        if (Get.isDialogOpen!) {
          Get.back();
        }
        if (response.statusCode == 200) {
          ResponseModel responseModel =
          ResponseModel.fromJson(jsonDecode(response.body));

          if (responseModel.replayStatus ?? false) {
            KalakarDialogs.successDialog("Profile More Info Saved", responseModel.message!);
            getProfileData();
          } else {
            KalakarDialogs.successDialog(
                "Profile More Info Save Failed", responseModel.message!);
          }
        }else{

        }
      } else {
        if (Get.isDialogOpen!) {
          Get.back();
        }
        KalakarDialogs.successDialog(
            "Profile More Info Save Failed", "Unable To Get Logged Data");
      }
    }
  }

  void addPhotosAndVideos() {}

  Future<void> getImageFromCamera(BuildContext context) async {
    File? file = await PickerHelper.pickImageFromCamera(context);
    if (file != null) {
      if (documentType == KalakarConstants.selfieUpload) {
        selfieUploadedPath = file.path;
        selfieUploadTEController.text = file.path.split("/").last;
      } else if (documentType == KalakarConstants.companyLogo) {
        isNetworkCompanyLogo = false;
        companyLogo = file.path;
      }
    }
    Get.back();
  }

  Future<void> getImageFromGallery(BuildContext context) async {
    File? file = await PickerHelper.pickImageFromGallery(context);
    if (file != null) {
      if (documentType == KalakarConstants.selfieUpload) {
        selfieUploadedPath = file.path;
        selfieUploadTEController.text = file.path.split("/").last;
      } else if (documentType == KalakarConstants.companyLogo) {
        isNetworkCompanyLogo = false;
        companyLogo = file.path;
      }
      update();
    }
    Get.back();
  }

  void validateProfileFormData() {
    if (_formProfileKey.currentState!.validate()) {
      saveProfileData();
    }
  }

  getStateData() async {
    stateCityPinCodeList = await StateCityPinCodeHelper.getCsvData();
    stateList =
        await StateCityPinCodeHelper.getFilteredState(stateCityPinCodeList);

    update();
  }

  Future<void> getCitiesData(String selectedItem) async {
    print(stateCityPinCodeList.length);
    stateTEController.text = selectedItem;
    cityList = await StateCityPinCodeHelper.getFilteredCities(
        stateCityPinCodeList, selectedItem);
    print(cityList);
    districtTEController.text = "";
    pinCodeTEController.text = "";
    update();
  }

  Future<void> getPinCodesData(String selectedItem) async {
    districtTEController.text = selectedItem;
    pinCodeList = await StateCityPinCodeHelper.getFilteredPinCodes(
        stateCityPinCodeList, stateTEController.text, selectedItem);
    pinCodeTEController.text = "";
    update();
  }

  Future<void> setPinCodeData(String selectedItem) async {
    pinCodeTEController.text = selectedItem;
    update();
  }

  Future<void> saveProfileData() async {
    isLoading = true;
    KalakarDialogs.loadingDialog(
        "Uploading Profile Data", "Saving Profile Data");
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      // Example fields (if any)
      Map<String, String> fields = {
        'FK_AccountID': loginTable.accountID,
        'CompanyLogo': "${companyLogo.split("/").last}",
        'CompanyNameProductionhouse': companyNameTEController.text,
        'AuthoriseAdminName': adminNameTEController.text,
        'Address': addressTEController.text,
        'District': districtTEController.text,
        'State': stateTEController.text,
        'Postalcode': pinCodeTEController.text,
        'Bio': bioTEController.text,
        'FBLink': fbLinkTEController.text,
        'WPLink': wpLinkTEController.text,
        'YTLink': ytLinkTEController.text,
        'Instalink': instaLinkTEController.text,
        'EmailLink': emailLinkTEController.text,
        'WebsiteLink': websiteTEController.text,
      };
      print(fields);

      // Example files (if any)
      Map<String, File> files = {
        'CompanyLogo_Doc': File(companyLogo),
      };

      var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveCompanyProfileBasicsApi,
          fields,
          files,
          loginTable.token);
      print(response.statusCode);
      print(response.body);
      isLoading = false;
      if (Get.isDialogOpen!) {
        Get.back();
      }
      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));

        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog("Profile Saved", responseModel.message!);
          getProfileData();
        } else {
          KalakarDialogs.successDialog(
              "Profile Save Failed", responseModel.message!);
        }
      }
    } else {
      if (Get.isDialogOpen!) {
        Get.back();
      }
      KalakarDialogs.successDialog(
          "Profile Save Failed", "Unable To Get Logged Data");
    }
  }

  Future<void> pickDocument(
      String documentType, BuildContext context, controller) async {
    print(documentType);
    switch (documentType) {
      case KalakarConstants.filmCorporationCard:
        File? file = await PickerHelper.pickPdfFromGallery();
        if (file != null) {
          filmCorporationCardPath = file.path;
          filmCorporationCardTEController.text = file.path.split("/").last;
          update();
        }
        break;
      case KalakarConstants.adminAadharCard:
        File? file = await PickerHelper.pickPdfFromGallery();
        if (file != null) {
          adminAadharCardPath = file.path;
          adminAadharCardTEController.text = file.path.split("/").last;
          update();
        }
        break;
      case KalakarConstants.addressProofOfCompany:
        File? file = await PickerHelper.pickPdfFromGallery();
        if (file != null) {
          addressProofCompanyPath = file.path;
          addressProofOfCompanyTEController.text = file.path.split("/").last;
          update();
        }
        break;
      case KalakarConstants.selfieUpload:
        this.documentType = documentType;
        PickerHelper.showBottomSheet(context, controller);
        break;
    }
  }
}
