import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/data/models/artist/applied_requirement_list_class.dart';
import 'package:kalakar/data/models/artist/review_details_class.dart';
import 'package:kalakar/data/models/artist/upcoming_company_projects.dart';
import 'package:kalakar/data/models/artist_master_data.dart';
import 'package:kalakar/data/models/company/company_requirement_list_class.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../data/models/company/project_details_documents_class.dart';
import '../helper/picker_helper.dart';
import '../helper/route_helper.dart';
import '../utils/kalakar_constants.dart';
import 'package:intl/intl.dart';

import '../views/dialogs/kalakar_dialogs.dart';

class RequirementController extends GetxController {
  //TEControllers
  TextEditingController requirementTitleTEController = TextEditingController();
  TextEditingController requirementStatusTEController = TextEditingController();
  TextEditingController descriptionTEController = TextEditingController();
  TextEditingController lookingForTEController = TextEditingController();
  TextEditingController noOfOpeningsTEController = TextEditingController();
  TextEditingController genderTEController = TextEditingController();
  TextEditingController ageTEController = TextEditingController();
  TextEditingController languageTEController = TextEditingController();
  TextEditingController heightTEController = TextEditingController();
  TextEditingController weightTEController = TextEditingController();
  TextEditingController hairColorTEController = TextEditingController();
  TextEditingController bodyTypeTEController = TextEditingController();
  TextEditingController experienceTEController = TextEditingController();
  TextEditingController startDateTEController = TextEditingController();
  TextEditingController endDateTEController = TextEditingController();
  TextEditingController shootingLocationTEController = TextEditingController();
  TextEditingController defineRoleTEController = TextEditingController();
  TextEditingController splSkillRequiredTEController = TextEditingController();
  TextEditingController comfortableInTEController = TextEditingController();
  TextEditingController scriptForAuditionTEController = TextEditingController();
  TextEditingController requirementEndDateTEController =
      TextEditingController();
  TextEditingController fbLinkTEController = TextEditingController();
  TextEditingController wpLinkTEController = TextEditingController();
  TextEditingController ytLinkTEController = TextEditingController();
  TextEditingController instaLinkTEController = TextEditingController();
  TextEditingController emailLinkTEController = TextEditingController();
  TextEditingController websiteLinkTEController = TextEditingController();
  TextEditingController salaryTEController = TextEditingController();
  TextEditingController salaryTypeTEController = TextEditingController();

  //searchTEControllers

  //strings
  String requirementId = "0";
  String requirementStatusId = "1";
  String requirementPhoto = "";
  String? shootingStartDateText = "";
  String? shootingEndDateText = "";
  String? requirementEndDateText = "";

  //date time
  DateTime shootingStartDate = DateTime.now();
  DateTime shootingEndDate = DateTime.now();
  DateTime requirementEndDate = DateTime.now();

  //lists
  List<ObjResponesRequirementDetailsList> newRequirementDetailsList = [];
  List<ObjResponesRequirementDetailsList> allRequirementDetailsList = [];
  List<ObjResponesRequirementDetailsList> requirementDetailsList = [];
  List<AppliedRequirementDetailsList> appliedRequirementDetailsList = [];
  List<ResponseCompanyProjects> upcomingProjectsDetailsList = [];
  List<GetApplicationReviewList> reviewDetailsList = [];
  List<String> genderList = ["Male", "Female", "Other"];
  List<String> comfortableInList = ["Bold look", "Clean shave", "Bikini shoot"];
  List<String> hairColorList = [
    "Black",
    "Brown",
    "Red",
    "Blond",
    "Gray and white"
  ];
  List<String> bodyTypeList = ["Good Looking", "Slim", "Muscular"];
  List<String> eyeColorList = ["Light Brown", "Black", "White"];
  List<String> requirementStatusList = ["Save as Draft", "Published", "Closed"];
  List<String> ageRangeList = ["1-2 Years", "2-3 Years", "3-5 Years"];
  List<String> heightRangeList = ["0-1 Feet", "1-2 Feet", "2-3 Feet"];
  List<String> weightRangeList = ["1-2 KG", "2-3 KG", "3-5 KG"];

  List<ComfortableListMaster> comfortableInMasterList = [];
  List<HaiColorMasterList> hairColorMasterList = [];
  List<BodyTypeMasterList> bodyTypeMasterList = [];
  List<EyeColorMasterList> eyeColorMasterList = [];
  List<RequirementStatusMasterList> requirementStatusMasterList = [];
  List<AgeRangeMasterList> ageRangeMasterList = [];
  List<HeighRangeMasterList> heightRangeMasterList = [];
  List<WeightRangeMasterList> weightRangeMasterList = [];

  //integers

  int selectedRequirementId = 0;

  //objects
  ObjResponesRequirementDetailsList selectedRequirement =
      ObjResponesRequirementDetailsList();
  AppliedRequirementDetailsList selectedAppliedRequirement =
      AppliedRequirementDetailsList();
  ProjectDetailAndDocuments upcomingCompanyProject =
      ProjectDetailAndDocuments();
  GetApplicationReviewList selectedReviewData = GetApplicationReviewList();

  //bool
  bool isArtist = false;
  bool isRequirementsLoading = false;
  bool isDocumentsLoading = false;
  bool showStatus = false;

  setDate(String type, DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    switch (type) {
      case KalakarConstants.startDate:
        shootingStartDate = date;
        shootingStartDateText = formatter.format(date);
        startDateTEController.text = shootingStartDateText!;
      case KalakarConstants.endDate:
        shootingEndDate = date;
        shootingEndDateText = formatter.format(date);
        endDateTEController.text = shootingEndDateText!;
      case KalakarConstants.requirementEndDate:
        requirementEndDate = date;
        requirementEndDateText = formatter.format(date);
        requirementEndDateTEController.text = requirementEndDateText!;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // print("date time : ${DateTime(2024, DateTime.august, 15)}");
    // print("date time : ${DateTime(2024, DateTime.august, 20)}");
    artistProfileMaster();
    checkIsArtist();
  }

  //global keys
  final _formRequirementKey = GlobalKey<FormState>();

  get formRequirementKey => _formRequirementKey;

  saveRequirementsDetails() async {
    if (_formRequirementKey.currentState!.validate()) {
      KalakarDialogs.loadingDialog(
          "Uploading Requirement Data", "Saving Requirement Data");
      LoginTable? loginTable = await HiveService.getLoginData();
      ProfileController profileController = Get.put(ProfileController());
      int? profileId = profileController.profileData!.companyProfileID;

      if (loginTable != null) {
        Map<String, String> fields = {
          'UserID': loginTable.userID,
          'RequirementDetailsID': selectedRequirementId.toString(),
          'FK_AccountID': loginTable.accountID,
          'FK_CompanyProfileID': "$profileId",
          'FK_RequirementStatusMasterID': "$requirementStatusId",
          'RequirementTitle': requirementTitleTEController.text.trim(),
          'RequirementDescription': descriptionTEController.text.trim(),
          'LookingFor': lookingForTEController.text.trim(),
          'NUmberOfOpenings': noOfOpeningsTEController.text.trim(),
          'Gender': genderTEController.text.trim(),
          'Age': ageTEController.text.trim(),
          'Language': languageTEController.text.trim(),
          'Height': heightTEController.text.trim(),
          'Weight': weightTEController.text.trim(),
          'HairColor': hairColorTEController.text.trim(),
          'BodyType': bodyTypeTEController.text.trim(),
          'Experiences': experienceTEController.text.trim(),
          'ShootingStartDate': shootingStartDate.toString(),
          'ShootingEndDate': shootingEndDate.toString(),
          'ShootingLocation': shootingLocationTEController.text.trim(),
          'DefineRole': defineRoleTEController.text.trim(),
          'SpecialSkillRequired': splSkillRequiredTEController.text.trim(),
          'ComfortableIn': comfortableInTEController.text.trim(),
          'ScriptForAuditions': scriptForAuditionTEController.text.trim(),
          'RequirementEndDate': requirementEndDate.toString(),
          'FBLink': fbLinkTEController.text.trim(),
          'WPLink': wpLinkTEController.text.trim(),
          'YTLink': ytLinkTEController.text.trim(),
          'Instalink': instaLinkTEController.text.trim(),
          'EmailLink': emailLinkTEController.text.trim(),
          'WebsiteLink': websiteLinkTEController.text.trim(),
          'RefPhotoName': "image",
          'Salary': "0",
          'SalaryType': "0",
        };
        print(fields);

        // Example files (if any)
        Map<String, File> files = {
          'RefPhoto_Doc': File(requirementPhoto),
        };

        var response = await ApiClient.postFormDataToken(
            KalakarConstants.saveRequirementsDetailsApi,
            fields,
            files,
            loginTable.token);
        if (Get.isDialogOpen!) {
          Get.back();
        }

        if (response.statusCode == 200) {
          ResponseModel responseModel =
              ResponseModel.fromJson(jsonDecode(response.body));

          if (responseModel.replayStatus ?? false) {
            KalakarDialogs.successDialog1(
                "Uploading Requirement Data", responseModel.message!);
            getRequirementDetailsCompany(0);
          } else {
            KalakarDialogs.successDialog(
                "Uploading Requirement Data", responseModel.message!);
          }
        } else {}
      }
    }
  }

  deleteRequirement() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    ProfileController profileController = Get.put(ProfileController());
    int? profileId = profileController.profileData!.companyProfileID;
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Delete Requirement Data", "Deleting Requirement Data");
      var fields = {
        'userID': loginTable.userID,
        "requirementDetailsID": selectedRequirementId,
        "fK_AccountID": loginTable.accountID,
        "fK_CompanyProfileID": "$profileId"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.deleteRequirementsDetailsApi,
          jsonEncode(fields),
          loginTable.token);
      if (Get.isDialogOpen!) {
        Get.back();
      }
      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Deleting Requirement Data", responseModel.message!);
          getRequirementDetailsCompany(0);
        } else {
          KalakarDialogs.successDialog(
              "Deleting Requirement Data", responseModel.message!);
        }
      } else {}
    }
  }

  getRequirementDetailsCompany(int selectedRequirementId) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      isRequirementsLoading = true;
      update();
      var fields = {
        "userID": loginTable.userID,
        "requirementDetailsID": selectedRequirementId.toString(),
        "fK_AccountID": loginTable.accountID,
        "fK_CompanyProfileID": "${loginTable.profileId}"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getRequirementsDetailsCompanyApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
        CompanyRequirementListClass companyRequirementListClass =
            CompanyRequirementListClass.fromJson(jsonDecode(response.body));
        if (companyRequirementListClass.replayStatus ?? false) {
          requirementDetailsList =
              companyRequirementListClass.objResponesRequirementDetailsList!;
          update();
        }
      } else {}
      isRequirementsLoading = false;
      update();
    }
  }

  searchRequirementDetailsArtist() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var fields = {
        "artistID": loginTable.accountID,
        "location": "string",
        "startShootingDate": "string",
        "endShootingDate": "string",
        "title": "string",
        "language": "string",
        "startAge": "0",
        "endAge": "0",
        "requirementDetailsID": "0",
        "fK_CompanyProfileID": "0"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getRequirementsDetailsCompanyApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
      } else {}
    }
  }

  saveAppliedToRequirement(int requirementDetailsId) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Applying For Opportunity", "Applying For Opportunity");
      var fields = {
        "artistAppliedForRequirementTransID": "0",
        "fK_RequirementDetailsID": requirementDetailsId,
        "fK_AccountID": loginTable.accountID
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.saveAppliedToRequirementApi,
          jsonEncode(fields),
          loginTable.token);
      if (Get.isDialogOpen!) {
        Get.back();
      }
      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Applying For Opportunity Success", responseModel.message!);
        } else {
          KalakarDialogs.successDialog(
              "Applying For Opportunity Failed", responseModel.message!);
        }
      } else {}
    }
  }

  saveChangesAppliedRequirementStatus() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var fields = {
        "artistAppliedForRequirementTransID": 0,
        "fK_RequirementDetailsID": 0,
        "fK_AccountID": 0,
        "fK_ApplyStatusMasterID": 0
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.saveChangesAppliedRequirementStatusApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
      } else {}
    }
  }

  addRequirementInFavorites() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var fields = {
        "artistFavoritesRequirementTransID": 0,
        "fK_RequirementDetailsID": 0,
        "fK_AccountID": 0
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.addRequirementInFavoritesApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
      } else {}
    }
  }

  getAppliedForRequirementArtist() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var fields = {
        "requirementDetailsID": 0,
        "fK_AccountID": loginTable.accountID
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAppliedForRequirementArtistApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
        ArtistAppliedRequirementDetailsClass companyRequirementListClass =
            ArtistAppliedRequirementDetailsClass.fromJson(
                jsonDecode(response.body));
        if (companyRequirementListClass.replayStatus ?? false) {
          appliedRequirementDetailsList =
              companyRequirementListClass.objResponesRequirementDetailsList!;
        }
        update();
      } else {}
    }
  }

  getAppliedForRequirementCompany() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var fields = {"requirementDetailsID": 0, "fK_AccountID": 0};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAppliedForRequirementCompanyApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
      } else {}
    }
  }

  Future<void> getImageFromCamera(BuildContext context, String type) async {
    File? file = null;
    if (type == KalakarConstants.camera) {
      file = await PickerHelper.pickImageFromCamera(context);
    } else if (type == KalakarConstants.gallery) {
      file = await PickerHelper.pickImageFromGallery(context);
    }
    if (file != null) {
      requirementPhoto = file.path;
      update();
    }
    Get.back();
  }

  void setGenderValue(String value) {
    genderTEController.text = value;
  }

  void checkIsArtist() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      isArtist = loginTable.accountType == KalakarConstants.artist;
      if (isArtist) {
        getArtistHomeRequirementDetails(false);
        getArtistHomeRequirementDetails(true);
        getUpcomingProjectsDetails();
        getAppliedForRequirementArtist();
        getReviewDetails();
      } else {
        getRequirementDetailsCompany(0);
      }
    } else {}
    update();
  }

  void setOpportunityData(
      ObjResponesRequirementDetailsList requirementData) async {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    selectedRequirementId = requirementData.requirementDetailsID!;
    requirementPhoto = requirementData.refPhotoName ?? "";
    requirementTitleTEController.text = requirementData.requirementTitle! ?? "";
    requirementStatusTEController.text =
        requirementData.requirementStatus! ?? "";
    descriptionTEController.text =
        requirementData.requirementDescription! ?? "";
    lookingForTEController.text = requirementData.requirementDescription! ?? "";
    ageTEController.text = requirementData.age!.split(".")[0] ?? "";
    languageTEController.text = requirementData.language! ?? "";
    noOfOpeningsTEController.text =
        requirementData.nUmberOfOpenings!.toString() ?? "";
    genderTEController.text = requirementData.gender.toString() ?? "";
    heightTEController.text = requirementData.height.toString() ?? "";
    weightTEController.text = requirementData.weight.toString() ?? "";
    hairColorTEController.text = requirementData.hairColor.toString() ?? "";
    bodyTypeTEController.text = requirementData.bodyType.toString() ?? "";
    experienceTEController.text =
        requirementData.experiences.toString()!.split(".")[0] ?? "";
    DateTime startDate = DateTime.parse(requirementData!.shootingStartDate!);
    shootingStartDate = startDate;
    startDateTEController.text = formatter.format(startDate);
    DateTime endDate = DateTime.parse(requirementData!.shootingEndDate!);
    shootingEndDate = endDate;
    endDateTEController.text = formatter.format(endDate);
    shootingLocationTEController.text = requirementData!.shootingLocation ?? "";
    defineRoleTEController.text = requirementData!.defineRole ?? "";
    splSkillRequiredTEController.text =
        requirementData!.specialSkillRequired ?? "";
    comfortableInTEController.text = requirementData!.comfortableIn ?? "";
    scriptForAuditionTEController.text =
        requirementData!.scriptForAuditions ?? "";
    DateTime reqEndDate = DateTime.parse(requirementData!.requirementEndDate!);
    requirementEndDate = reqEndDate;
    requirementEndDateTEController.text = formatter.format(reqEndDate);
    fbLinkTEController.text = requirementData!.fbLink ?? "";
    wpLinkTEController.text = requirementData!.wpLink ?? "";
    ytLinkTEController.text = requirementData!.ytLink ?? "";
    instaLinkTEController.text = requirementData!.instalink ?? "";
    emailLinkTEController.text = requirementData!.emailLink ?? "";
    websiteLinkTEController.text = requirementData!.websiteLink ?? "";
    salaryTEController.text = requirementData!.salary.toString() ?? "";
    salaryTypeTEController.text = requirementData!.salaryType ?? "";
    Get.toNamed(RouteHelper.requirementFormPage);
  }

  Future<void> artistProfileMaster() async {
    final body = <String, dynamic>{};
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var response = await ApiClient.postDataToken1(
          KalakarConstants.artistProfileMasterApi, body, loginTable.token);
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        ArtistMasterClass artistMasterClass =
            ArtistMasterClass.fromJson(jsonDecode(response.body));
        if (artistMasterClass.replayStatus ?? false) {
          comfortableInMasterList = artistMasterClass.comfortableListMaster!;
          hairColorMasterList = artistMasterClass.haiColorMasterList!;
          bodyTypeMasterList = artistMasterClass.bodyTypeMasterList!;
          eyeColorMasterList = artistMasterClass.eyeColorMasterList!;
          requirementStatusMasterList =
              artistMasterClass.requirementStatusMasterList!;
          ageRangeMasterList = artistMasterClass.ageRangeMasterList!;
          heightRangeMasterList = artistMasterClass.heighRangeMasterList!;
          weightRangeMasterList = artistMasterClass.weightRangeMasterList!;

          // Extract only the 'name' strings
          List<String> names = comfortableInMasterList
              .map((status) => status.name as String)
              .toList();
          comfortableInList = names;
          names = hairColorMasterList
              .map((status) => status.name as String)
              .toList();
          hairColorList = names;
          names = bodyTypeMasterList
              .map((status) => status.name as String)
              .toList();
          bodyTypeList = names;
          names = eyeColorMasterList
              .map((status) => status.name as String)
              .toList();
          eyeColorList = names;
          names = requirementStatusMasterList
              .map((status) => status.name as String)
              .toList();
          requirementStatusList = names;
          names = ageRangeMasterList
              .map((status) => status.name as String)
              .toList();
          ageRangeList = names;
          names = heightRangeMasterList
              .map((status) => status.name as String)
              .toList();
          heightRangeList = names;
          names = weightRangeMasterList
              .map((status) => status.name as String)
              .toList();
          weightRangeList = names;
          update();
        }
      }
    }
  }

  void emptyOpportunityData() async {
    selectedRequirementId = 0;
    requirementPhoto = "";
    requirementTitleTEController.text = "";
    requirementStatusTEController.text = "";
    descriptionTEController.text = "";
    lookingForTEController.text = "";
    ageTEController.text = "";
    languageTEController.text = "";
    noOfOpeningsTEController.text = "";
    genderTEController.text = "";
    heightTEController.text = "";
    weightTEController.text = "";
    hairColorTEController.text = "";
    bodyTypeTEController.text = "";
    experienceTEController.text = "";

    startDateTEController.text = "";

    endDateTEController.text = "";
    shootingLocationTEController.text = "";
    defineRoleTEController.text = "";
    splSkillRequiredTEController.text = "";
    comfortableInTEController.text = "";
    scriptForAuditionTEController.text = "";

    requirementEndDateTEController.text = "";
    fbLinkTEController.text = "";
    wpLinkTEController.text = "";
    ytLinkTEController.text = "";
    instaLinkTEController.text = "";
    emailLinkTEController.text = "";
    websiteLinkTEController.text = "";
    salaryTEController.text = "0";
    salaryTypeTEController.text = "0";
    Get.toNamed(RouteHelper.requirementFormPage);
  }

  void setHairColorValue(String selectedItem) {
    hairColorTEController.text = selectedItem;
    update();
  }

  void setBodyTypeValue(String selectedItem) {
    bodyTypeTEController.text = selectedItem;
    update();
  }

  void setRequirementStatusValue(String selectedItem) {
    requirementStatusTEController.text = selectedItem;
    requirementStatusId = requirementStatusMasterList
        .where((status) => status.name == selectedItem)
        .toList()
        .first
        .id
        .toString();
    update();
  }

  void setComfortableInValue(String selectedItem) {
    comfortableInTEController.text = selectedItem;
    update();
  }

  void setAgeRangeValue(String selectedItem) {
    ageTEController.text = selectedItem;
    update();
  }

  void setWeightRangeValue(String selectedItem) {
    weightTEController.text = selectedItem;
    update();
  }

  void setHeightRangeValue(String selectedItem) {
    heightTEController.text = selectedItem;
    update();
  }

  Future<void> getArtistHomeRequirementDetails(bool iSAll) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var body = {"fK_AccountID": loginTable.accountID, "isAll": iSAll};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistHomeRequirementsApi,
          jsonEncode(body),
          loginTable.token);
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        CompanyRequirementListClass artistHomeRequirementsClass =
            CompanyRequirementListClass.fromJson(jsonDecode(response.body));
        if (iSAll) {
          allRequirementDetailsList =
              artistHomeRequirementsClass.objResponesRequirementDetailsList!;
        } else {
          newRequirementDetailsList =
              artistHomeRequirementsClass.objResponesRequirementDetailsList!;
        }
      }
      update();
    }
  }

  Future<void> getUpcomingProjectsDetails() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var body = {"superAdminProjectID": "0", "fK_AccountID": "0"};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistHomeUpcomingProjectsApi,
          jsonEncode(body),
          loginTable.token);
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        UpcomigProjectClass upcomigProjectClass =
            UpcomigProjectClass.fromJson(jsonDecode(response.body));
        upcomingProjectsDetailsList =
            upcomigProjectClass.lResponseCompanyProjects!;
      }
      update();
    }
  }

  Future<void> getReviewDetails() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var body = {"applicationReviewID": "0", "fK_AccountID": "0"};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistHomeReviewApi,
          jsonEncode(body),
          loginTable.token);
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        ReviewClass reviewClass =
            ReviewClass.fromJson(jsonDecode(response.body));
        reviewDetailsList = reviewClass.getApplicationReviewList!;
      }
      update();
    }
  }

  Future<void> getUpcomingProjectDocumentDetails(String projectId) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var body = {"superAdminProjectID": projectId, "fK_AccountID": "0"};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistHomeProjectDocumentsApi,
          jsonEncode(body),
          loginTable.token);
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        ProjectDetailAndDocuments reviewClass =
            ProjectDetailAndDocuments.fromJson(jsonDecode(response.body));
        upcomingCompanyProject = reviewClass;
      }
      isDocumentsLoading = false;

      update();
    }
  }

  void setRequirementViewData(
      ObjResponesRequirementDetailsList requirement, bool showStatus) {
    selectedRequirement = requirement;
    this.showStatus = showStatus;
    Get.toNamed(RouteHelper.requirementViewPage);
  }

  void setUpcomingProjectViewData(ResponseCompanyProjects upcomingProject) {
    isDocumentsLoading = true;

    getUpcomingProjectDocumentDetails(upcomingProject.projectStatusID!);
    Get.toNamed(RouteHelper.upcomingProjectViewPage);
  }

  Future<void> openSocialMedia(int index, String link) async {
    switch (index) {
      case 0:
        try {
          launchUrl(Uri.parse(link));
        } catch (e) {
          print(e);
        }

        break;
      case 1:
        try {
          launchUrl(Uri.parse(link!));
        } catch (e) {
          print(e);
        }

        break;
      case 2:
        try {
          launchUrl(Uri.parse(link));
        } catch (e) {
          print(e);
        }

        break;
      case 3:
        try {
          launchUrl(Uri.parse(link));
        } catch (e) {
          print(e);
        }

        break;
      case 4:
        try {
          launchUrl(Uri.parse(link));
        } catch (e) {
          print(e);
        }
        break;
      case 5:
        try {
          launchUrl(Uri.parse(link));
        } catch (e) {
          print(e);
        }
        break;
    }
  }

  void setReviewDataToView(GetApplicationReviewList reviewData) {
    selectedReviewData = reviewData;
    Get.toNamed(RouteHelper.reviewViewPage);
  }

  void setAppliedRequirementViewData(
      AppliedRequirementDetailsList requirementData, bool showStatus) {
    selectedAppliedRequirement = requirementData;
    this.showStatus = showStatus;
    Get.toNamed(RouteHelper.requirementViewPage);
  }
}
