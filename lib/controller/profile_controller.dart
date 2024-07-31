import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/api/api_client.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/data/models/company_projects_class.dart';
import 'package:kalakar/data/models/file_data_model.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';
import 'package:kalakar/data/models/get_profile_data_class.dart';
import 'package:kalakar/data/models/project_status_list_class.dart';
import 'package:kalakar/controller/file_controller.dart';
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
  TextEditingController nameTEController = TextEditingController();
  TextEditingController ownerCeoNameTEController = TextEditingController();
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
  String projectCoverPath = "";
  String projectStatusId = "";
  List<FileData> projectDocuments = [
    FileData(path: "", type: "Add", imageData: null)
  ];
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
  List<GetProjectStatusMasterlist> projectStatusList = [];
  List<String> projectStatusStringList = [];
  List<CompanyProjectsList> companyAllProjects = [];
  CompanyProjectsList selectedCompanyProject = CompanyProjectsList();

  ProfileGetDataClass? profileData = ProfileGetDataClass();

  final _formProfileKey = GlobalKey<FormState>();

  get formProfileKey => _formProfileKey;

  final _formNewProjectKey = GlobalKey<FormState>();

  get formNewProjectKey => _formNewProjectKey;

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
    getProjectStatusData();
    getCompanyProjects("0");
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

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Name';
    }
    return null;
  }

  String? ownerCeoNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Admin Owner CEO';
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
    if (value == null) {
      return 'Please Enter Bio';
    }
    return null;
  }

  Future<void> openSocialMedia(int index) async {
    switch (index) {
      case 0:
        try {
          launchUrl(Uri.parse(profileData!.fbLink!));
        } catch (e) {
          print(e);
        }

        break;
      case 1:
        try {
          launchUrl(Uri.parse(profileData!.instalink!));
        } catch (e) {
          print(e);
        }

        break;
      case 2:
        try {
          launchUrl(Uri.parse(profileData!.wpLink!));
        } catch (e) {
          print(e);
        }

        break;
      case 3:
        try {
          launchUrl(Uri.parse(profileData!.ytLink!));
        } catch (e) {
          print(e);
        }

        break;
      case 4:
        try {
          launchUrl(Uri.parse(profileData!.emailLink!));
        } catch (e) {
          print(e);
        }
        break;
      case 5:
        try {
          launchUrl(Uri.parse(profileData!.websiteLink!));
        } catch (e) {
          print(e);
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
          "mobileNo": mobileNumberTEController.text.trim(),
          "email": emailTEController.text.trim(),
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
    print(profileData!.verificationStatus);
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
    mobileNumberTEController.text = profileData!.mobileNumber ?? "";
    emailTEController.text = profileData!.email ?? "";
    nameTEController.text = profileData!.name ?? "";
    ownerCeoNameTEController.text = profileData!.adminOwerCEO ?? "";
    filmCorporationCardTEController.text =
        (profileData!.filmCorpprationCardDOC ?? "").isNotEmpty
            ? profileData!.filmCorpprationCardDOC.toString().split("\\").last
            : "";
    filmCorporationCardPath = profileData!.filmCorpprationCardDOC ?? "";
    adminAadharCardTEController.text =
        (profileData!.adminAdharCardDOC ?? "").isNotEmpty
            ? profileData!.adminAdharCardDOC.toString().split("\\").last
            : "";
    adminAadharCardPath = profileData!.adminAdharCardDOC ?? "";
    addressProofOfCompanyTEController.text =
        (profileData!.addressProofofCompanyDOC ?? "").isNotEmpty
            ? profileData!.addressProofofCompanyDOC.toString().split("\\").last
            : "";
    addressProofCompanyPath = profileData!.addressProofofCompanyDOC ?? "";
    selfieUploadTEController.text =
        (profileData!.selfieuploadDOC ?? "").isNotEmpty
            ? profileData!.selfieuploadDOC.toString().split("\\").last
            : "";
    selfieUploadedPath = profileData!.selfieuploadDOC ?? "";
    isContactVerified = profileData!.isVerifiedContacts == "True";
    mobileNumberEditable = !(profileData!.isVerifiedContacts == "True");
    emailEditable = !(profileData!.isVerifiedContacts == "True");
    FileController fileController = Get.put(FileController());
    if (filmCorporationCardPath.isNotEmpty) {
      print("here");
      fileController.downloadFile(
          KalakarConstants.profilePath, filmCorporationCardPath);
    }
    if (adminAadharCardPath.isNotEmpty) {
      fileController.downloadFile(
          KalakarConstants.profilePath, adminAadharCardPath);
    }
    if (addressProofCompanyPath.isNotEmpty) {
      fileController.downloadFile(
          KalakarConstants.profilePath, addressProofCompanyPath);
    }

    update();
  }

  void getCompanyProjects(String projectId) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var body = {
        "fK_AccountID": loginTable.accountID,
        "companyProjectID": projectId
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getCompanyProfileProjectsApi,
          jsonEncode(body),
          loginTable.token);


      if (response.statusCode == 200) {
        CompanyProjectClass responseModel =
            CompanyProjectClass.fromJson(jsonDecode(response.body));

        if (responseModel.replayStatus ?? false) {
          if (projectId == '0') {
            companyAllProjects = responseModel.lResponseCompanyProjects!;
          } else {
            selectedCompanyProject = responseModel.lResponseCompanyProjects![0];
          }
        } else {}
      }
    }
    update();
  }

  void verifyContact() async {
    if (_formCompanyProfileMoreInfoOtpKey.currentState!.validate()) {
      KalakarDialogs.loadingDialog(
          "Contact Verification", "Verifying Contact ...");
      LoginTable? loginTable = await HiveService.getLoginData();

      if (loginTable != null) {
        var body = {
          "mobileNo": mobileNumberTEController.text.trim(),
          "email": emailTEController.text.trim(),
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
    if (_formCompanyProfileMoreInfoOtpKey.currentState!.validate() &&
        _formCompanyProfileMoreInfoDocumentsKey.currentState!.validate()) {
      print("all data");
      KalakarDialogs.loadingDialog(
          "Company More Data", "Saving Company More Info");
      LoginTable? loginTable = await HiveService.getLoginData();

      if (loginTable != null) {
        // Example fields (if any)
        Map<String, String> fields = {
          'FK_AccountID': loginTable.accountID,
          'Email': emailTEController.text.trim(),
          'MobileNumber': mobileNumberTEController.text.trim(),
          'Name': nameTEController.text.trim(),
          'UserID': loginTable.userID,
          'Admin_Ower_CEO': ownerCeoNameTEController.text.trim(),
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
            KalakarDialogs.successDialog(
                "Profile More Info Saved", responseModel.message!);
            getProfileData();
          } else {
            KalakarDialogs.successDialog(
                "Profile More Info Save Failed", responseModel.message!);
          }
        } else {}
      } else {
        if (Get.isDialogOpen!) {
          Get.back();
        }
        KalakarDialogs.successDialog(
            "Profile More Info Save Failed", "Unable To Get Logged Data");
      }
    }
  }

  void addPhotosAndVideos(BuildContext context, ProfileController controller) {
    documentType = KalakarConstants.projectDocuments;
    PickerHelper.showImageVideoBottomSheet(context, controller);
  }

  Future<void> getImageFromCamera(BuildContext context) async {
    File? file = await PickerHelper.pickImageFromCamera(context);
    if (file != null) {
      if (documentType == KalakarConstants.selfieUpload) {
        selfieUploadedPath = file.path;
        selfieUploadTEController.text = file.path.split("/").last;
      } else if (documentType == KalakarConstants.projectCover) {
        projectCoverPath = file.path;
        // selfieUploadTEController.text = file.path.split("/").last;
      } else if (documentType == KalakarConstants.companyLogo) {
        isNetworkCompanyLogo = false;
        companyLogo = file.path;
      } else if (documentType == KalakarConstants.projectDocuments) {
        Uint8List imageData = await File(file.path).readAsBytesSync();
        FileData fileData =
            FileData(path: file.path, type: "IMAGE", imageData: imageData);
        projectDocuments.add(fileData);
      }
      update();
    }
    Get.back();
  }

  Future<void> getImageFromGallery(BuildContext context) async {
    File? file = await PickerHelper.pickImageFromGallery(context);
    if (file != null) {
      if (documentType == KalakarConstants.selfieUpload) {
        selfieUploadedPath = file.path;
        selfieUploadTEController.text = file.path.split("/").last;
      } else if (documentType == KalakarConstants.projectCover) {
        projectCoverPath = file.path;
        // selfieUploadTEController.text = file.path.split("/").last;
      } else if (documentType == KalakarConstants.companyLogo) {
        isNetworkCompanyLogo = false;
        companyLogo = file.path;
      } else if (documentType == KalakarConstants.projectDocuments) {
        Uint8List imageData = await File(file.path).readAsBytesSync();
        FileData fileData =
            FileData(path: file.path, type: "IMAGE", imageData: imageData);
        projectDocuments.add(fileData);
      }
      update();
    }
    Get.back();
  }

  Future<void> getVideoFromCamera(BuildContext context) async {
    File? file = await PickerHelper.pickVideoFromCamera(context);
    if (file != null) {
      if (documentType == KalakarConstants.projectDocuments) {
        Uint8List imageData = await File(file.path).readAsBytesSync();
        FileData fileData =
            FileData(path: file.path, type: "VIDEO", imageData: imageData);
        projectDocuments.add(fileData);
      }
    }
    Get.back();
  }

  Future<void> getVideoFromGallery(BuildContext context) async {
    File? file = await PickerHelper.pickVideoFromGallery(context);
    if (file != null) {
      if (documentType == KalakarConstants.selfieUpload) {
        selfieUploadedPath = file.path;
        selfieUploadTEController.text = file.path.split("/").last;
      } else if (documentType == KalakarConstants.projectCover) {
        projectCoverPath = file.path;
        // selfieUploadTEController.text = file.path.split("/").last;
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
        'CompanyNameProductionhouse': companyNameTEController.text.trim(),
        'AuthoriseAdminName': adminNameTEController.text.trim(),
        'Address': addressTEController.text.trim(),
        'District': districtTEController.text.trim(),
        'State': stateTEController.text.trim(),
        'Postalcode': pinCodeTEController.text.trim(),
        'Bio': bioTEController.text.trim(),
        'FBLink': fbLinkTEController.text.trim(),
        'WPLink': wpLinkTEController.text.trim(),
        'YTLink': ytLinkTEController.text.trim(),
        'Instalink': instaLinkTEController.text.trim(),
        'EmailLink': emailLinkTEController.text.trim(),
        'WebsiteLink': websiteTEController.text.trim(),
      };
      print(fields);

      // Example files (if any)
      Map<String, File?> files = {
        'CompanyLogo_Doc': companyLogo.startsWith("http")?null:File(companyLogo),
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

  pickOrShowDocument(String documentType, BuildContext context, controller) {
    switch (documentType) {
      case KalakarConstants.filmCorporationCard:
        if (filmCorporationCardPath.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          pickDocument(documentType, context, controller);
        }
        break;
      case KalakarConstants.adminAadharCard:
        if (adminAadharCardPath.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          pickDocument(documentType, context, controller);
        }
        break;
      case KalakarConstants.addressProofOfCompany:
        if (addressProofCompanyPath.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          pickDocument(documentType, context, controller);
        }
        break;
      case KalakarConstants.selfieUpload:
        if (selfieUploadedPath.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          PickerHelper.showImageBottomSheet(context, controller);
        }
        break;
    }
  }

  showDocument(String documentType) {
    FileController fileController = Get.put(FileController());
    switch (documentType) {
      case KalakarConstants.filmCorporationCard:
        fileController.viewFile(KalakarConstants.profilePath,
            filmCorporationCardTEController.text.trim(), documentType);
        break;
      case KalakarConstants.adminAadharCard:
        fileController.viewFile(KalakarConstants.profilePath,
            adminAadharCardTEController.text.trim(), documentType);
        break;
      case KalakarConstants.addressProofOfCompany:
        fileController.viewFile(KalakarConstants.profilePath,
            addressProofOfCompanyTEController.text.trim(), documentType);
        break;
      case KalakarConstants.selfieUpload:
        fileController.viewFile1(selfieUploadedPath, documentType);
        break;
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
        PickerHelper.showImageBottomSheet(context, controller);
        break;
    }
  }

  Future<void> sendProfileForVerification() async {
    isLoading = true;
    KalakarDialogs.loadingDialog(
        "Profile Verification", "Sending Profile for Verification");
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      // Example fields (if any)
      var body = {"fK_AccountID": "${loginTable.accountID}"};
      print(body);

      var response = await ApiClient.postDataToken(
          KalakarConstants.sendCompanyProfileForVerificationApi,
          jsonEncode(body),
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
          KalakarDialogs.successDialog(
              "Profile For Verification", responseModel.message!);
          getProfileData();
        } else {
          KalakarDialogs.successDialog(
              "Sending Profile For Verification Failed",
              responseModel.message!);
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

  Future<void> getProjectStatusData() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var body = {"fK_AccountID": loginTable.accountID};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getProjectStatus,
          jsonEncode(body),
          loginTable.token);

      if (response.statusCode == 200) {
        ProjectStatusListClass projectStatusListClass =
            ProjectStatusListClass.fromJson(jsonDecode(response.body));
        projectStatusList = projectStatusListClass.getProjectStatusMasterlist!;
        projectStatusStringList =
            projectStatusList.map((item) => item.projectStatus!).toList();
      }
    }
  }

  void setProjectStatus(String selectedItem) {
    projectStatusId = projectStatusList
        .where((element) => element.projectStatus == selectedItem)
        .first
        .projectStatusID
        .toString();
  }

  Future<void> saveNewProject() async {
    isLoading = true;
    KalakarDialogs.loadingDialog(
        "Uploading New Project", "Uploading New Project");
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      // Example fields (if any)
      Map<String, String> fields = {
        'UserID': loginTable.userID,
        'CompanyProjectID': "0",
        'FK_AccountID': loginTable.accountID,
        'FK_CompanyProfileID': profileData!.companyProfileID!.toString(),
        'ProjectDescription': projectDescriptionTEController.text.trim(),
        'ProjectStatusID': projectStatusId,
        'ProjectTitle': projectTitleTEController.text.trim(),
      };
      print(fields);

      // Example files (if any)
      Map<String, File> files = {
        'ProjectCoverDoc': File(projectCoverPath),
      };

      // Example files (if any)
      Map<String, List<FileData>> files1 = {
        'ProjectDocuments':
            projectDocuments.where((element) => element.path != "").toList(),
      };

      var response = await ApiClient.postFormDataToken1(
          KalakarConstants.saveCompanyProfileProjectApi,
          fields,
          files,
          files1,
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
}
