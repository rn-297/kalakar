import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/api/api_client.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/data/models/company/company_projects_class.dart';
import 'package:kalakar/data/models/file_data_model.dart';
import 'package:kalakar/data/models/file_web_model.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';
import 'package:kalakar/data/models/company/project_details_documents_class.dart';
import 'package:kalakar/data/models/company/project_status_list_class.dart';
import 'package:kalakar/controller/file_controller.dart';
import 'package:kalakar/helper/picker_helper.dart';
import 'package:kalakar/helper/state_city_pincode_helper/state_city_pincode_helper.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kalakar/utils/web_utils.dart' as utils;
import '../data/models/company/get_profile_data_class.dart';
import '../data/models/csv_model_class.dart';
import '../helper/route_helper.dart';
import '../views/dialogs/kalakar_dialogs.dart';
import 'package:http/http.dart' as http;

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
  TextEditingController projectTypeTEController = TextEditingController();
  TextEditingController projectDescriptionTEController =
      TextEditingController();
  TextEditingController projectStatusTEController = TextEditingController();

  String oTP = "";
  String companyName = "";
  String companyLogo = "";
  String profilePic = "";
  String documentType = "";
  String filmCorporationCardPath = "";
  String adminAadharCardPath = "";
  String addressProofCompanyPath = "";
  String selfieUploadedPath = "";
  String projectCoverPath = "";
  String selectedProjectStatusId = "";
  String companyProjectId = "0";
  String? selectedProjectStatus = null;
  List<FileData> projectDocuments = [FileData(path: "", type: "Add")];
  List<FileDataWeb> projectDocuments1 = [
    FileDataWeb(name: "", path: "", type: "Add", extension: '', imageData: null)
  ];
  int startTime = 90;
  int companyProfileID = 0;

  FileDataWeb? selfieUploadedData;
  FileDataWeb? companyLogoData;
  FileDataWeb? filmCorporationCardData;
  FileDataWeb? adminAadharCardData;
  FileDataWeb? addressProofCompanyData;

  bool isNetworkCompanyLogo = true;
  bool isProfileLoading = false;
  bool isArtist = false;
  bool otpError = false;
  bool isOtpSent = false;
  bool isContactVerified = false;
  bool isLoading = false;
  bool mobileNumberEditable = true;
  bool emailEditable = true;
  bool isDocumentLoading = false;
  bool isProjectDocumentLoading = false;

  List<CSVData> stateCityPinCodeList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  List<String> pinCodeList = [];
  List<GetProjectStatusMasterlist> projectStatusList = [];
  List<String> projectStatusStringList = [];
  List<CompanyProjectsData> companyAllProjects = [];
  List<CompanyProjectsData> companyNewProjects = [];
  List<CompanyProjectsData> companyUpcomingProjects = [];
  CompanyProjectsData? selectedCompanyProject = CompanyProjectsData();
  ProjectDetailAndDocuments projectDetailAndDocumentsForArtist =
      ProjectDetailAndDocuments();

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
    // getRequireData();
    getCompanyName();
  }

  getRequireData() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null &&
        loginTable.accountType == KalakarConstants.company) {
      companyProfileID = loginTable.profileId;
      getProfileData();
      getStateData();
      getProjectStatusData();
      getCompanyProjects("0");
    }
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

  void getProfileDataForArtist(int id) async {
    print("here");
    isProfileLoading = true;
    update();
    LoginTable? loginTable = await HiveService.getLoginData();
    print("userId ${loginTable?.userID}");
    if (loginTable != null) {
      isArtist = loginTable.accountType == KalakarConstants.artist;
      var body = {"fK_AccountID": id};
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

  Future<void> openSocialMedia(int index) async {
    switch (index) {
      case 0:
        try {
          if (profileData!.fbLink!.isNotEmpty) {
            launchUrl(Uri.parse(profileData!.fbLink!));
          } else {
            KalakarDialogs.successDialog("Facebook Link", "Link Not Added");
          }
        } catch (e) {
          print(e);
        }

        break;
      case 1:
        try {
          if (profileData!.instalink!.isNotEmpty) {
            launchUrl(Uri.parse(profileData!.instalink!));
          } else {
            KalakarDialogs.successDialog("Instagram Link", "Link Not Added");
          }
        } catch (e) {
          print(e);
        }

        break;
      case 2:
        try {
          if (profileData!.wpLink!.isNotEmpty) {
            launchUrl(Uri.parse(profileData!.wpLink!));
          } else {
            KalakarDialogs.successDialog("WhatsApp Link", "Link Not Added");
          }
        } catch (e) {
          print(e);
        }

        break;
      case 3:
        try {
          if (profileData!.ytLink!.isNotEmpty) {
            launchUrl(Uri.parse(profileData!.ytLink!));
          } else {
            KalakarDialogs.successDialog("YouTube Link", "Link Not Added");
          }
        } catch (e) {
          print(e);
        }

        break;
      case 4:
        try {
          if (profileData!.emailLink!.isNotEmpty) {
            launchUrl(Uri.parse(profileData!.emailLink!));
          } else {
            KalakarDialogs.successDialog("Email Link", "Link Not Added");
          }
        } catch (e) {
          print(e);
        }
        break;
      case 5:
        try {
          if (profileData!.websiteLink!.isNotEmpty) {
            launchUrl(Uri.parse(profileData!.websiteLink!));
          } else {
            KalakarDialogs.successDialog("Website Link", "Link Not Added");
          }
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
    companyProfileID = profileData!.companyProfileID ?? 0;
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
    if (!kIsWeb) {
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
            companyNewProjects = companyAllProjects
                .where((element) => element.projectStatusID == "1")
                .toList();
            companyUpcomingProjects = companyAllProjects
                .where((element) => element.projectStatusID == "2")
                .toList();
          } else {
            selectedCompanyProject = responseModel.lResponseCompanyProjects![0];
          }
        } else {}
      }
    }
    update();
  }

  void getCompanyProjectsForArtist(int id) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var body = {"fK_AccountID": id, "companyProjectID": "0"};

      var response = await ApiClient.postDataToken(
          KalakarConstants.getCompanyProfileProjectsApi,
          jsonEncode(body),
          loginTable.token);

      if (response.statusCode == 200) {
        CompanyProjectClass responseModel =
            CompanyProjectClass.fromJson(jsonDecode(response.body));

        if (responseModel.replayStatus ?? false) {
          companyAllProjects = responseModel.lResponseCompanyProjects!;
          companyNewProjects = companyAllProjects
              .where((element) => element.projectStatusID == "1")
              .toList();
          companyUpcomingProjects = companyAllProjects
              .where((element) => element.projectStatusID == "2")
              .toList();
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

  Future<void> saveCompanyMoreInfoWeb() async {
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
        Map<String, FileDataWeb?> files = {
          'FilmCorpprationCard_DOC': filmCorporationCardData,
          'AdminAdharCard_DOC': adminAadharCardData,
          'AddressProofofCompany_DOC': addressProofCompanyData,
          'Selfieupload_DOC': selfieUploadedData,
        };

        var response = await ApiClient.postFormDataTokenWeb(
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
    if (kIsWeb) {
      print("here");
      PickerHelper.showImageVideoBottomSheetWeb(context, controller);
    } else {
      PickerHelper.showImageVideoBottomSheet(context, controller);
    }
  }

  Future<void> getImageFromCamera(BuildContext context, String type) async {
    File? file = null;
    FileDataWeb? pickerData = null;
    if (type == KalakarConstants.camera) {
      file = await PickerHelper.pickImageFromCamera(context);
    } else if (type == KalakarConstants.gallery) {
      if (!kIsWeb) {
        file = await PickerHelper.pickImageFromGallery(context);
      } else {
        pickerData = await PickerHelper.pickImageFromGalleryWeb(context);
      }
    }
    if (!kIsWeb && file != null) {
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
        // Uint8List imageData = await File(file.path).readAsBytesSync();
        FileData fileData = FileData(path: file.path, type: "IMAGE");
        projectDocuments.add(fileData);
      }
    } else if (kIsWeb && pickerData != null) {
      if (documentType == KalakarConstants.selfieUpload) {
        selfieUploadedData = FileDataWeb(
            name: pickerData!.name,
            path: pickerData!.path,
            type: "IMAGE",
            extension: pickerData!.name.split(".").last,
            imageData: await pickerData.imageData);
        selfieUploadTEController.text = pickerData.name;
      } else if (documentType == KalakarConstants.projectCover) {
        projectCoverPath = pickerData.path;
        // selfieUploadTEController.text = file.path.split("/").last;
      } else if (documentType == KalakarConstants.companyLogo) {
        isNetworkCompanyLogo = false;
        companyLogo = pickerData!.path;
        companyLogoData = FileDataWeb(
            name: pickerData!.name,
            path: pickerData!.path,
            type: "IMAGE",
            extension: pickerData!.name.split(".").last,
            imageData: await pickerData.imageData);
        print("done");
        print("done " + pickerData!.name);
        print("done " + pickerData!.path);
        print("done " + pickerData!.name.split(".").last);
        print("done " + pickerData.imageData.toString());
      } else if (documentType == KalakarConstants.projectDocuments) {
        // Uint8List imageData = pickerData.imageData!;
        FileDataWeb fileData = FileDataWeb(
            name: pickerData!.name,
            path: pickerData!.path,
            type: "IMAGE",
            extension: pickerData!.name.split(".").last,
            imageData: await pickerData.imageData);
        projectDocuments1.add(fileData);
      }
    }
    update();

    // Get.back();
  }

  Future<void> getVideoFromCamera(BuildContext context) async {
    File? file = null;
    FileDataWeb? pickerData = null;

    if (!kIsWeb) {
      file = await PickerHelper.pickVideoFromCamera(context);
    } else {
      pickerData = await PickerHelper.pickVideoFromGalleryWeb(context);
    }

    if (kIsWeb) {
      FileDataWeb fileData = FileDataWeb(
          name: pickerData!.name,
          path: pickerData!.path,
          type: "IMAGE",
          extension: pickerData!.name.split(".").last,
          imageData: await pickerData.imageData);
      projectDocuments1.add(fileData);
    } else {
      if (file != null) {
        if (documentType == KalakarConstants.projectDocuments) {
          FileData fileData = FileData(path: file.path, type: "VIDEO");
          projectDocuments.add(fileData);
        }
      }
    }
    update();
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
      if (!kIsWeb) {
        saveProfileData();
      } else {
        saveProfileDataWeb();
      }
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
        'CompanyLogo_Doc':
            companyLogo.startsWith("http") ? null : File(companyLogo),
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

  Future<void> saveProfileDataWeb() async {
    isLoading = true;
    print("object");
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
      Map<String, FileDataWeb?> files = {
        'CompanyLogo_Doc': companyLogoData,
      };

      var response = await ApiClient.postFormDataTokenWeb(
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

  pickOrShowDocumentWeb(String documentType, BuildContext context, controller) {
    switch (documentType) {
      case KalakarConstants.filmCorporationCard:
        if (filmCorporationCardPath.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheetWeb(
              documentType, context, controller);
        } else {
          pickDocumentWeb(documentType, context, controller);
        }
        break;
      case KalakarConstants.adminAadharCard:
        if (adminAadharCardPath.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheetWeb(
              documentType, context, controller);
        } else {
          pickDocumentWeb(documentType, context, controller);
        }
        break;
      case KalakarConstants.addressProofOfCompany:
        if (addressProofCompanyPath.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheetWeb(
              documentType, context, controller);
        } else {
          pickDocumentWeb(documentType, context, controller);
        }
        break;
      case KalakarConstants.selfieUpload:
        if (selfieUploadedPath.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheetWeb(
              documentType, context, controller);
        } else {
          // PickerHelper.showImageBottomSheetWeb(context, controller);
          getImageFromCamera(context, KalakarConstants.gallery);
        }
        break;
    }
  }

  showDocument(String documentType) {
    FileController fileController = Get.put(FileController());
    switch (documentType) {
      case KalakarConstants.filmCorporationCard:
        if (kIsWeb) {
          utils.openLink(filmCorporationCardPath);
        } else {
          fileController.viewFile(KalakarConstants.profilePath,
              filmCorporationCardTEController.text.trim(), documentType);
        }
        break;
      case KalakarConstants.adminAadharCard:
        if (kIsWeb) {
          utils.openLink(adminAadharCardPath);
        } else {
          fileController.viewFile(KalakarConstants.profilePath,
              adminAadharCardTEController.text.trim(), documentType);
        }
        break;
      case KalakarConstants.addressProofOfCompany:
        if (kIsWeb) {
          utils.openLink(addressProofCompanyPath);
        } else {
          fileController.viewFile(KalakarConstants.profilePath,
              addressProofOfCompanyTEController.text.trim(), documentType);
        }
        break;
      case KalakarConstants.selfieUpload:
        if (kIsWeb) {
          utils.openLink(selfieUploadedPath);
        } else {
          fileController.viewFile1(selfieUploadedPath, documentType);
        }
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
        PickerHelper.showImageBottomSheetWeb(context, controller);
        // getImageFromCamera(context,KalakarConstants.gallery);
        break;
    }
  }

  Future<void> pickDocumentWeb(
      String documentType, BuildContext context, controller) async {
    print(documentType);
    switch (documentType) {
      case KalakarConstants.filmCorporationCard:
        FileDataWeb? fileData = await PickerHelper.pickPdfFromGalleryWeb();
        if (fileData != null) {
          print("file.path ${fileData.name}");
          filmCorporationCardPath = fileData.name;

          filmCorporationCardTEController.text = fileData.path.split("/").last;
          filmCorporationCardData = FileDataWeb(
              name: fileData!.name,
              path: fileData!.path,
              type: "PDF",
              extension: fileData!.name.split(".").last,
              imageData: await fileData.imageData);
          update();
        }
        break;
      case KalakarConstants.adminAadharCard:
        FileDataWeb? fileData = await PickerHelper.pickPdfFromGalleryWeb();
        if (fileData != null) {
          adminAadharCardPath = fileData.name;
          adminAadharCardTEController.text = fileData.path.split("/").last;
          adminAadharCardData = FileDataWeb(
              name: fileData!.name,
              path: fileData!.path,
              type: "PDF",
              extension: fileData!.name.split(".").last,
              imageData: await fileData.imageData);
          update();
        }
        break;
      case KalakarConstants.addressProofOfCompany:
        FileDataWeb? fileData = await PickerHelper.pickPdfFromGalleryWeb();
        if (fileData != null) {
          addressProofCompanyPath = fileData.name;
          addressProofOfCompanyTEController.text =
              fileData.path.split("/").last;
          addressProofCompanyData = FileDataWeb(
              name: fileData!.name,
              path: fileData!.path,
              type: "PDF",
              extension: fileData!.name.split(".").last,
              imageData: await fileData.imageData);
          update();
        }
        break;
      case KalakarConstants.selfieUpload:
        this.documentType = documentType;
        // PickerHelper.showImageBottomSheetWeb(context, controller);
        getImageFromCamera(context, KalakarConstants.gallery);
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
    selectedProjectStatusId = projectStatusList
        .where((element) => element.projectStatus == selectedItem)
        .first
        .projectStatusID
        .toString();
  }

  Future<void> saveNewProject() async {
    isLoading = true;
    KalakarDialogs.loadingDialog(
        "Uploading Project Details", "Uploading Project Details");
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      // Example fields (if any)
      Map<String, String> fields = {
        'UserID': loginTable.userID,
        'CompanyProjectID': companyProjectId,
        'FK_AccountID': loginTable.accountID,
        'FK_CompanyProfileID': profileData!.companyProfileID!.toString(),
        'ProjectDescription': projectDescriptionTEController.text.trim(),
        'ProjectStatusID': selectedProjectStatusId,
        'ProjectTitle': projectTitleTEController.text.trim(),
        'ProjectSubTitle': projectTypeTEController.text.trim(),
      };
      print(fields);

      // Example files (if any)
      Map<String, File> files = {
        'ProjectCoverDoc':
            File(projectCoverPath.startsWith("http") ? "" : projectCoverPath),
      };

      // Example files (if any)
      Map<String, List<FileData>> files1 = {
        'ProjectDocuments': projectDocuments
            .where((element) =>
                element.path != "" && !element.path.startsWith("http"))
            .toList(),
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
          KalakarDialogs.successDialog1(
              "Profile Saved", responseModel.message!);
          getProfileData();
          getCompanyProjects("0");
          if (companyProjectId != "0") {
            getProjectDocuments(companyProjectId);
          }
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

  void openProjectDetails(CompanyProjectsData companyProject) {
    if (isArtist) {
      getProjectDocumentsForArtist(companyProject.companyProjectID!.toString(),
          profileData!.fKAccountID!);
      Get.toNamed(RouteHelper.companyProjectViewPage);
    } else {
      projectDocuments = [];
      update();
      companyProjectId = companyProject.companyProjectID.toString();
      selectedCompanyProject = companyProject;
      projectCoverPath = companyProject.projectCoverDoc!;
      projectTitleTEController.text = companyProject.projectTitle!;
      projectDescriptionTEController.text = companyProject.projectDescription!;
      projectTypeTEController.text = companyProject.projectSubTitle!;
      selectedProjectStatus = getProjectStatus(companyProject.projectStatusID);
      print(selectedProjectStatus);
      selectedProjectStatusId = projectStatusList
          .where((element) => element.projectStatus == selectedProjectStatus)
          .first
          .projectStatusID
          .toString();
      getProjectDocuments(companyProject.companyProjectID.toString());
      Get.toNamed(RouteHelper.newProjectFormPage);
    }
  }

  String? getProjectStatus(String? projectStatusID) {
    return projectStatusList
        .where(
            (project) => project.projectStatusID.toString() == projectStatusID)
        .first
        .projectStatus;
  }

  void createNewProject() {
    projectCoverPath = "";
    projectTitleTEController.text = "";
    projectDescriptionTEController.text = "";
    selectedProjectStatus = null;
    selectedCompanyProject = null;
    Get.toNamed(RouteHelper.newProjectFormPage);
  }

  Future<void> getProjectDocuments(String companyProjectID) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      // Example fields (if any)
      isProjectDocumentLoading = true;
      update();
      var fields = {
        'companyProjectID': "$companyProjectID",
        'fK_AccountID': loginTable.accountID,
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getCompanyProfileProjectDocumentsApi,
          jsonEncode(fields),
          loginTable.token);
      print(response.statusCode);
      print(response.body);
      print("response.body");

      if (response.statusCode == 200) {
        ProjectDetailAndDocuments projectDetailAndDocuments =
            ProjectDetailAndDocuments.fromJson(jsonDecode(response.body));
        if (kIsWeb) {
          projectDocuments1.clear();
          projectDocuments1 = [
            FileDataWeb(
                name: "", path: "", type: "Add", extension: '', imageData: null)
          ];
          if (projectDetailAndDocuments.projectDocuments!.isNotEmpty) {
            print(
                "object${projectDetailAndDocuments.projectDocuments!.length}");
            for (int i = 0;
                i < projectDetailAndDocuments.projectDocuments!.length;
                i++) {
              projectDocuments1.add(FileDataWeb(
                  name: projectDetailAndDocuments
                      .projectDocuments![i].projectDocuments!,
                  path: projectDetailAndDocuments
                      .projectDocuments![i].projectDocuments!,
                  type: "IMAGE",
                  documentId: projectDetailAndDocuments
                      .projectDocuments![i].companyProjectDocumentID!,
                  extension: projectDetailAndDocuments
                      .projectDocuments![i].projectDocuments!
                      .split(".")
                      .last,
                  imageData: null));
              update();
            }
          }
        } else {
          projectDocuments.clear();
          projectDocuments = [FileData(path: "", type: "Add")];
          if (projectDetailAndDocuments.projectDocuments!.isNotEmpty) {
            print(
                "object${projectDetailAndDocuments.projectDocuments!.length}");
            for (int i = 0;
                i < projectDetailAndDocuments.projectDocuments!.length;
                i++) {
              String path = projectDetailAndDocuments
                  .projectDocuments![i].projectDocuments!;
              int documentId = projectDetailAndDocuments
                  .projectDocuments![i].companyProjectDocumentID!;
              String type =
                  path.toLowerCase().endsWith(".mp4") ? "VIDEO" : "IMAGE";

              projectDocuments.add(
                  FileData(path: path, type: type, documentId: documentId));
              update();
            }
          }
        }

        isProjectDocumentLoading = false;
      }
    } else {}
  }

  Future<void> getProjectDocumentsForArtist(
      String companyProjectID, int id) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      // Example fields (if any)
      isProjectDocumentLoading = true;
      update();
      var fields = {
        'companyProjectID': "$companyProjectID",
        'fK_AccountID': id,
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getCompanyProfileProjectDocumentsApi,
          jsonEncode(fields),
          loginTable.token);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        ProjectDetailAndDocuments projectDetailAndDocuments =
            ProjectDetailAndDocuments.fromJson(jsonDecode(response.body));
        projectDetailAndDocumentsForArtist = projectDetailAndDocuments;
        isProjectDocumentLoading = false;

        update();
      }
    } else {}
  }

  Future<void> deleteProjectDocuments(
      int? companyProjectID, int? documentId) async {
    KalakarDialogs.loadingDialog("Delete Document", "Deleting Document ");
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      // Example fields (if any)
      var fields = {
        'companyProjectID': "$companyProjectID",
        'fK_AccountID': loginTable.accountID,
        'companyProjectDocumentID': documentId,
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.deleteCompanyProfileProjectDocumentApi,
          jsonEncode(fields),
          loginTable.token);
      if (Get.isDialogOpen!) {
        Get.back();
      }
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus!) {
          KalakarDialogs.successDialog(
              "Delete Document", responseModel.message!);
          getProjectDocuments(companyProjectID.toString());
        } else {
          KalakarDialogs.successDialog(
              "Delete Document Failed", responseModel.message!);
        }
      }
    } else {}
  }

  Future<void> deleteProject() async {
    KalakarDialogs.loadingDialog("Delete Project", "Deleting Project ");
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      // Example fields (if any)
      var fields = {
        'companyProjectID': "${selectedCompanyProject!.companyProjectID!}",
        'fK_AccountID': loginTable.accountID,
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.deleteCompanyProjectApi,
          jsonEncode(fields),
          loginTable.token);
      if (Get.isDialogOpen!) {
        Get.back();
      }
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus!) {
          KalakarDialogs.successDialog(
              "Delete Project", responseModel.message!);
          getProfileData();
          Get.back();
        }
      }
    } else {}
  }

  Future<void> getCompanyName() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      companyName = "${loginTable.fistName ?? ""} ${loginTable.lastName ?? ""}";
      profilePic = loginTable.profilePic;
    }
  }

  Future<bool> checkImageValidity(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  void showDocument1(String url, String type) {
    FileController fileController = Get.put(FileController());
    fileController.viewFile1(url, type);
  }
}
