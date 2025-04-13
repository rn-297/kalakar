import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/controller/file_controller.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/data/models/artist/applied_requirement_list_class.dart';
import 'package:kalakar/data/models/artist/review_details_class.dart';
import 'package:kalakar/data/models/artist/upcoming_company_projects.dart';
import 'package:kalakar/data/models/artist_master_data.dart';
import 'package:kalakar/data/models/company/artist_search_for_company_class.dart';
import 'package:kalakar/data/models/company/company_requirement_list_class.dart';
import 'package:kalakar/data/models/file_data_model.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../data/models/company/company_applied_details_class.dart'
    as company_artist;
import '../data/models/company/project_details_documents_class.dart';
import '../data/models/file_web_model.dart';
import '../helper/file_viewer/web_video_viewer.dart';
import '../helper/picker_helper.dart';
import '../helper/route_helper.dart';
import '../utils/kalakar_constants.dart';
import 'package:intl/intl.dart';

import '../views/dialogs/kalakar_dialogs.dart';import 'package:kalakar/utils/web_utils.dart' as utils;

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
  TextEditingController searchTitleTEController = TextEditingController();
  TextEditingController searchLocationTEController = TextEditingController();
  TextEditingController searchShootingStartDateTEController =
      TextEditingController();
  TextEditingController searchShootingEndDateTEController =
      TextEditingController();
  TextEditingController searchLanguageTEController = TextEditingController();
  TextEditingController searchStartAgeTEController = TextEditingController();
  TextEditingController searchEndAgeTEController = TextEditingController();
  TextEditingController searchProfileTEController = TextEditingController();
  TextEditingController searchApplyForTEController = TextEditingController();
  TextEditingController searchComfortableInTEController = TextEditingController();
  TextEditingController searchInterestedInTEController = TextEditingController();
  TextEditingController searchDistrictTEController = TextEditingController();
  TextEditingController searchMobileNumberTEController =
      TextEditingController();
  TextEditingController searchEmailTEController = TextEditingController();
  TextEditingController searchKalakarTEController = TextEditingController();

  //strings
  String requirementId = "0";
  String requirementStatusId = "1";
  String requirementPhoto = "";
  String? shootingStartDateText = "";
  String? shootingEndDateText = "";
  String? searchShootingStartDateText = "";
  String? searchShootingEndDateText = "";
  String? requirementEndDateText = "";
  String? artistName = "";
  String? companyName = "";
  String auditionVideo = "";
  String artistProfileId = "";


  //imageData
  FileDataWeb requirementPhotoData =
      FileDataWeb(path: "", name: "", type: "", extension: "", imageData: null);

  //date time
  DateTime shootingStartDate = DateTime.now();
  DateTime shootingEndDate = DateTime.now();
  DateTime searchShootingStartDate = DateTime.now();
  DateTime searchShootingEndDate = DateTime.now();
  DateTime requirementEndDate = DateTime.now();

  //lists
  List<RequirementDetailsData> newRequirementDetailsList = [];
  List<RequirementDetailsData> requirementDetailsList = [];
  List<RequirementDetailsData> openRequirementDetailsList = [];
  List<RequirementDetailsData> draftRequirementDetailsList = [];
  List<RequirementDetailsData> closedRequirementDetailsList = [];
  List<RequirementDetailsData> requirementDetailsSearchList = [];
  List<RequirementDetailsData> artistRequirementsFavouritesList = [];
  List<ArtistAppliedRequirementDetailsList>
      artistAppliedRequirementDetailsList = [];
  List<company_artist.AppliedArtistDetailsList>
      companyAppliedRequirementDetailsList = [];
  List<company_artist.AppliedArtistDetailsList>
      filterAppliedRequirementDetailsList = [];
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
  List<String> salaryTypeList = [
    "Hourly",
    "Daily",
    "Weekly",
    "Monthly",
    "Annually",
    "Other"
  ];
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
  List<GetArtistProfileModellist> searchedArtistProfileList = [];
  List<AgeRangeMasterList> ageRangeMasterList = [];
  List<HeighRangeMasterList> heightRangeMasterList = [];
  List<WeightRangeMasterList> weightRangeMasterList = [];

  //integers

  int selectedRequirementId = 0;
  int selectedAppliedRequirementId = 0;

  //objects
  RequirementDetailsData selectedRequirement = RequirementDetailsData();
  ArtistAppliedRequirementDetailsList selectedAppliedRequirement =
      ArtistAppliedRequirementDetailsList();

  company_artist.AppliedArtistDetailsList selectedArtistProfileData =
      company_artist.AppliedArtistDetailsList();
  company_artist.GetArtistProfileModelForRequirememt artistData=company_artist.GetArtistProfileModelForRequirememt();
  List<company_artist.EducationList> artistEducationData =[];
  List<company_artist.HobbiesList> artistHobbiesData =[];
  List<company_artist.InterestList> artistInterestInData =[];
  List<company_artist.ComfortableInList> artistComfortableInData =[];
  List<company_artist.ExperienceList> artistExperienceData =[];
  List<company_artist.ApplyList> artistApplyData =[];
  List<company_artist.PortfolioList> artistPortfolioImagesList = [];
  List<company_artist.PortfolioList> artistPortfolioVideosList = [];

  company_artist.EducationList selectedEducationData=company_artist.EducationList();
  company_artist.ExperienceList selectedExperienceData=company_artist.ExperienceList();

  GetArtistProfileModellist selectedSearchedArtistProfileData =
      GetArtistProfileModellist();
  ProjectDetailAndDocuments upcomingCompanyProject =
      ProjectDetailAndDocuments();
  GetApplicationReviewList selectedReviewData = GetApplicationReviewList();

  //bool
  bool isArtist = false;
  bool isRequirementsLoading = false;
  bool isArtistHomeRequirementsLoading = false;
  bool isArtistOpportunitiesRequirementsLoading = false;
  bool isArtistHomeUpcomingProjectsLoading = false;
  bool isArtistHomeReviewsLoading = false;
  bool isAppliedProfileLoading = false;
  bool isArtistAppliedRequirementsLoading = false;
  bool isArtistRequirementsInFavouritesLoading = false;
  bool isDocumentsLoading = false;
  bool showStatus = false;
  bool isSearching = false;
  bool isSearchedArtist = false;

  FileDataWeb? auditionVideoData;


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
      case KalakarConstants.searchShootingStartDate:
        searchShootingStartDate = date;
        searchShootingStartDateText = formatter.format(date);
        searchShootingStartDateTEController.text = searchShootingStartDateText!;
      case KalakarConstants.searchShootingEndDate:
        searchShootingEndDate = date;
        searchShootingEndDateText = formatter.format(date);
        searchShootingEndDateTEController.text = searchShootingEndDateText!;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // print("date time : ${DateTime(2024, DateTime.august, 15)}");
    // print("date time : ${DateTime(2024, DateTime.august, 20)}");
    // artistProfileMaster();
    // checkIsArtist();
  }

  //global keys
  final _formRequirementKey = GlobalKey<FormState>();

  get formRequirementKey => _formRequirementKey;

  final _formArtistSearchRequirementKey = GlobalKey<FormState>();

  get formArtistSearchRequirementKey => _formArtistSearchRequirementKey;

  saveRequirementsDetails() async {
    if (_formRequirementKey.currentState!.validate()) {
      KalakarDialogs.loadingDialog(
          "Uploading Requirement Data", "Saving Requirement Data");
      LoginTable? loginTable = await HiveService.getLoginData();

      if (loginTable != null) {
        int? profileId = loginTable.profileId ?? 0;

        Map<String, String> fields = {
          'UserID': loginTable.userID ?? "",
          'RequirementDetailsID': selectedRequirementId.toString(),
          'FK_AccountID': loginTable.accountID ?? "",
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
          'Salary': salaryTEController.text.trim(),
          'SalaryType': salaryTypeTEController.text.trim(),
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
            loginTable.token ?? "");
        if (Get.isDialogOpen!) {
          Get.back();
        }

        if (response.statusCode == 200) {
          ResponseModel responseModel =
              ResponseModel.fromJson(jsonDecode(response.body));

          if (responseModel.replayStatus ?? false) {
            KalakarDialogs.successDialog11(
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

  saveRequirementsDetailsWeb() async {
    if (_formRequirementKey.currentState!.validate()) {
      KalakarDialogs.loadingDialog(
          "Uploading Requirement Data", "Saving Requirement Data");
      LoginTable? loginTable = await HiveService.getLoginData();

      if (loginTable != null) {
        int? profileId = loginTable.profileId ?? 0;

        Map<String, String> fields = {
          'UserID': loginTable.userID ?? "",
          'RequirementDetailsID': selectedRequirementId.toString(),
          'FK_AccountID': loginTable.accountID ?? "",
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
          'Salary': salaryTEController.text.trim(),
          'SalaryType': salaryTypeTEController.text.trim(),
        };
        print(fields);

        // Example files (if any)
        Map<String, FileDataWeb> files = {
          'RefPhoto_Doc': requirementPhotoData,
        };

        var response = await ApiClient.postFormDataTokenWeb(
            KalakarConstants.saveRequirementsDetailsApi,
            fields,
            files,
            loginTable.token ?? "");
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
        'userID': loginTable.userID ?? "",
        "requirementDetailsID": selectedRequirementId,
        "fK_AccountID": loginTable.accountID ?? "",
        "fK_CompanyProfileID": "$profileId"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.deleteRequirementsDetailsApi,
          jsonEncode(fields),
          loginTable.token ?? "");
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
        "userID": loginTable.userID ?? "",
        "requirementDetailsID": selectedRequirementId.toString(),
        "fK_AccountID": loginTable.accountID ?? "",
        "fK_CompanyProfileID": "${loginTable.profileId ?? 0}"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getRequirementsDetailsCompanyApi,
          jsonEncode(fields),
          loginTable.token ?? "");
      if (response.statusCode == 200) {
        CompanyRequirementListClass companyRequirementListClass =
            CompanyRequirementListClass.fromJson(jsonDecode(response.body));
        if (companyRequirementListClass.replayStatus ?? false) {
          requirementDetailsList =
              companyRequirementListClass.objResponesRequirementDetailsList!;
          openRequirementDetailsList = requirementDetailsList
              .where((element) => element.fKRequirementStatusMasterID == 2)
              .toList();
          draftRequirementDetailsList = requirementDetailsList
              .where((element) => element.fKRequirementStatusMasterID == 1)
              .toList();
          closedRequirementDetailsList = requirementDetailsList
              .where((element) => element.fKRequirementStatusMasterID == 1)
              .toList();
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
      isSearching = true;
      update();
      final DateFormat format = DateFormat('yyyy-MM-dd');
      var fields = {
        "artistID": loginTable.accountID ?? "",
        "location": searchLocationTEController.text,
        "startShootingDate": searchShootingStartDateTEController.text.isEmpty
            ? ""
            : format.format(searchShootingStartDate),
        "endShootingDate": searchShootingEndDateTEController.text.isEmpty
            ? ""
            : format.format(searchShootingEndDate),
        "title": searchTitleTEController.text,
        "language": searchLanguageTEController.text,
        "startAge": searchStartAgeTEController.text.isEmpty
            ? "0"
            : searchStartAgeTEController.text,
        "endAge": searchEndAgeTEController.text.isEmpty
            ? "0"
            : searchEndAgeTEController.text,
        "requirementDetailsID": "0",
        "fK_CompanyProfileID": loginTable.accountID ?? ""
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.searchRequirementsDetailsArtistsApi,
          jsonEncode(fields),
          loginTable.token ?? "");
      if (response.statusCode == 200) {
        CompanyRequirementListClass companyRequirementListClass =
            CompanyRequirementListClass.fromJson(jsonDecode(response.body));
        requirementDetailsSearchList =
            companyRequirementListClass.objResponesRequirementDetailsList!;
      } else {}
      isSearching = false;
      update();
    }
  }

  searchArtistDetailsCompany() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      isSearching = true;
      update();
      var fields = {
        "fK_AccountID": loginTable.accountID ?? "",
        "applyFor": searchApplyForTEController.text,
        "profile": searchProfileTEController.text,
        "mobileNumber": searchMobileNumberTEController.text,
        "email": searchEmailTEController.text,
        "district": searchDistrictTEController.text,
        "comfortableIn": searchComfortableInTEController.text,
        "interestIn": searchInterestedInTEController.text
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.searchArtistForCompanyApi,
          jsonEncode(fields),
          loginTable.token ?? "");
      if (response.statusCode == 200) {
        CompanySearchArtistClass searchArtistClass =
            CompanySearchArtistClass.fromJson(jsonDecode(response.body));
        searchedArtistProfileList =
            searchArtistClass.getArtistProfileModellist!;
      } else {}
      isSearching = false;
      update();
    }
  }

  saveAppliedToRequirement(int requirementDetailsId) async {
    if(kIsWeb){
      saveAppliedToRequirementWeb(requirementDetailsId);
    }else{
      saveAppliedToRequirementMobile(requirementDetailsId);
    }
  }
  saveAppliedToRequirementMobile(int requirementDetailsId) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Applying For Opportunity", "Applying For Opportunity");
      final body = <String, String>{};
      body['ArtistAppliedForRequirementTransID'] = "0";
      body['FK_RequirementDetailsID'] = requirementDetailsId.toString();
      body['FK_AccountID'] = loginTable.accountID ?? "";
      Map<String, File> files = {
        'AuditionVideo': File(auditionVideo!),
      };
       var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveAppliedToRequirementApi,
          body,
          files,
          loginTable.token ?? "");
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

  saveAppliedToRequirementWeb(int requirementDetailsId) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Applying For Opportunity", "Applying For Opportunity");
      final body = <String, String>{};
      body['ArtistAppliedForRequirementTransID'] = "0";
      body['FK_RequirementDetailsID'] = requirementDetailsId.toString();
      body['FK_AccountID'] = loginTable.accountID ?? "";
      Map<String, FileDataWeb?> files = {
        'AuditionVideo': auditionVideoData,
      };
       var response = await ApiClient.postFormDataTokenWeb(
          KalakarConstants.saveAppliedToRequirementApi,
          body,
          files,
          loginTable.token ?? "");
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

  saveChangesAppliedRequirementStatus(int applyStatusID) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Update Apply Status", "Applying Status for Opportunity");
      var fields = {
        "artistAppliedForRequirementTransID":
            selectedArtistProfileData.artistAppliedForRequirementTransID,
        "fK_RequirementDetailsID":
            selectedArtistProfileData.requirementDetailsID,
        "fK_AccountID": loginTable.accountID ?? "",
        "fK_ApplyStatusMasterID": applyStatusID
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.saveChangesAppliedRequirementStatusApi,
          jsonEncode(fields),
          loginTable.token ?? "");
      if (Get.isDialogOpen!) {
        Get.back();
      }
      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Applying Status for Opportunity Success",
              responseModel.message!);
          selectedAppliedRequirementId =
              selectedArtistProfileData.requirementDetailsID!;
          getAppliedForRequirementCompany();
        } else {
          KalakarDialogs.successDialog(
              "Applying Status for Opportunity Failed", responseModel.message!);
        }
      } else {}
    }
  }

  addRequirementInFavorites(int requirementId, bool doubleBack) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Adding To Favourites", "Adding To Favourites");
      var fields = {
        "artistFavoritesRequirementTransID": 0,
        "fK_RequirementDetailsID": requirementId,
        "fK_AccountID": loginTable.accountID ?? ""
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.addRequirementInFavoritesApi,
          jsonEncode(fields),
          loginTable.token ?? "");
      if (Get.isDialogOpen!) {
        Get.back();
      }
      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          if (doubleBack) {
            KalakarDialogs.successDialog1(
                "Adding To Favourites Success", responseModel.message!);
          } else {
            KalakarDialogs.successDialog(
                "Adding To Favourites Success", responseModel.message!);
          }

          getArtistRequirementInFavorites(0);
          getArtistHomeRequirementDetails(false);
          getArtistHomeRequirementDetails(true);
          getAppliedForRequirementCompany();
          getArtistRequirementInFavorites(0);
        } else {
          KalakarDialogs.successDialog(
              "Adding To Favourites Failed", responseModel.message!);
        }
      } else {}
    }
  }

  getArtistRequirementInFavorites(int requirementId) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      isArtistRequirementsInFavouritesLoading = true;
      update();
      var fields = {
        "fK_RequirementDetailsID": requirementId,
        "fK_AccountID": loginTable.accountID ?? ""
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistFavouritesRequirementsApi,
          jsonEncode(fields),
          loginTable.token ?? "");

      if (response.statusCode == 200) {
        CompanyRequirementListClass companyRequirementListClass =
            CompanyRequirementListClass.fromJson(jsonDecode(response.body));
        if (companyRequirementListClass.replayStatus ?? false) {
          artistRequirementsFavouritesList =
              companyRequirementListClass.objResponesRequirementDetailsList!;
        }
      } else {}
      isArtistRequirementsInFavouritesLoading = false;
      update();
    }
  }

  getAppliedForRequirementArtist(int id) async {


      LoginTable? loginTable = await HiveService.getLoginData();


    if (loginTable != null) {
      isArtist = loginTable.accountType == KalakarConstants.artist;
      isArtistAppliedRequirementsLoading = true;
      update();
      var fields = {
        "requirementDetailsID": id,
        "fK_AccountID": loginTable.accountID ?? ""
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAppliedForRequirementArtistApi,
          jsonEncode(fields),
          loginTable.token ?? "");
      if (response.statusCode == 200) {
        ArtistAppliedRequirementDetailsClass companyRequirementListClass =
            ArtistAppliedRequirementDetailsClass.fromJson(
                jsonDecode(response.body));
        if (companyRequirementListClass.replayStatus ?? false) {
          if (id == 0) {
            artistAppliedRequirementDetailsList =
                companyRequirementListClass.objResponesRequirementDetailsList!;
          } else {
            selectedAppliedRequirement = companyRequirementListClass
                .objResponesRequirementDetailsList![0];
            print(selectedAppliedRequirement.shootingStartDate);
          }
        }
      } else {}
      isArtistAppliedRequirementsLoading = false;

      update();
    }

  }

  Future<void> removeFromFavourites(int id, bool doubleBack) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Removing From Favourites Data", "Removing From Favourites Data");
      final body = <String, String>{};
      body['userID'] = loginTable.userID ?? "";
      body['fK_AccountID'] = loginTable.accountID ?? "";
      body['recordID'] = id.toString();

      var response = await ApiClient.deleteDataToken(
          KalakarConstants.deleteFromFavouritesDataApi,
          body,
          loginTable.token ?? "");
      print(response.statusCode);
      print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          if (doubleBack) {
            KalakarDialogs.successDialog1(
                "Removing From Favourites Success", responseModel.message!);
          } else {
            KalakarDialogs.successDialog(
                "Removing From Favourites Success", responseModel.message!);
          }

          getArtistRequirementInFavorites(0);
          getArtistHomeRequirementDetails(false);
          getArtistHomeRequirementDetails(true);
          getAppliedForRequirementCompany();
          getArtistRequirementInFavorites(0);
        } else {
          KalakarDialogs.successDialog(
              "Removing From Favourites Failed", responseModel.message!);
        }
      }
    }
  }

  getAppliedForRequirementCompany() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      companyAppliedRequirementDetailsList=[];
      filterAppliedRequirementDetailsList=[];
      isAppliedProfileLoading = true;
      update();
      var fields = {
        "requirementDetailsID": selectedAppliedRequirementId,
        "fK_AccountID": loginTable.accountID ?? ""
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAppliedForRequirementCompanyApi,
          jsonEncode(fields),
          loginTable.token ?? "");
      if (response.statusCode == 200) {
        company_artist.CompanyAppliedRequirementDetailsClass
            companyAppliedRequirementDetailsClass =
            company_artist.CompanyAppliedRequirementDetailsClass.fromJson(
                jsonDecode(response.body));
        if (companyAppliedRequirementDetailsClass.replayStatus ?? false) {
          List<company_artist.AppliedArtistDetailsList> list =
              companyAppliedRequirementDetailsClass
                  .objResponesRequirementDetailsList!;
          companyAppliedRequirementDetailsList=list;
          filterAppliedRequirementDetailsList=list;
          isAppliedProfileLoading = false;
          update();
          for (int j = 0; j < list.length; j++) {
            List<company_artist.PortfolioList> list1 = list[j].portfolioList!;
            for (int i = 0; i < list1.length; i++) {
              if (list1[i].fileType == 2) {
                try {
                  list1[i].thumbnail = await VideoThumbnail.thumbnailData(
                    video: list1[i].filePath!,
                    // Replace with your video URL
                    imageFormat: ImageFormat.JPEG,
                    maxHeight: 150,
                    // Set a maximum height for the thumbnail
                    quality: 75,
                  );
                } catch (e) {
                  print(e);
                }
              }
            }
            companyAppliedRequirementDetailsClass
                .objResponesRequirementDetailsList![j].portfolioList = list1;
          }

          List<company_artist.AppliedArtistDetailsList> list2 =
              companyAppliedRequirementDetailsClass
                  .objResponesRequirementDetailsList!;

          print("object");
          for (int j = 0; j < list2.length; j++) {
            List<company_artist.ExperienceList> list1 =
                list2[j].experienceList!;
            for (int i = 0; i < list1.length; i++) {
              if (list1[i].roleVideo == 2) {
                try {
                  list1[i].thumbnail = await VideoThumbnail.thumbnailData(
                    video: list1[i].roleVideo!,
                    // Replace with your video URL
                    imageFormat: ImageFormat.JPEG,
                    maxHeight: 150,
                    // Set a maximum height for the thumbnail
                    quality: 75,
                  );
                } catch (e) {
                  print(e);
                }
              }
            }
            companyAppliedRequirementDetailsClass
                .objResponesRequirementDetailsList![j].experienceList = list1;
          }
          companyAppliedRequirementDetailsList =
              companyAppliedRequirementDetailsClass
                  .objResponesRequirementDetailsList!;
          filterAppliedRequirementDetailsList =
              companyAppliedRequirementDetailsClass
                  .objResponesRequirementDetailsList!;
        }
      } else {}
      isAppliedProfileLoading = false;
      update();
    }
  }

  pickOrShowDocument(BuildContext context,controller){

    if (auditionVideo.isNotEmpty) {
      PickerHelper.showOrPickDocBottomSheet(
          "Audition Video", context, controller);
    } else {
      PickerHelper.showVideoBottomSheet(context, controller);
    }
  }
  pickOrShowDocumentWeb(BuildContext context,controller){

    if (auditionVideo.isNotEmpty) {
      PickerHelper.showOrPickDocBottomSheetWeb(
          "Audition Video", context, controller);
    } else {
      // PickerHelper.showVideoBottomSheetWeb(context, controller);
      getVideoFromGallery(context);
    }
  }

  Future<void> getVideoFromGallery(BuildContext context) async {
    File? file;
    FileDataWeb? pickerData;
    if (!kIsWeb) {
      file = await PickerHelper.pickVideoFromGallery(context);
    } else {
      pickerData = await PickerHelper.pickVideoFromGalleryWeb(context);
    }

    if (!kIsWeb && file != null) {
      auditionVideo = file.path;
      // roleVideoTEController.text = file.path.split("/").last;
    }else if (kIsWeb && pickerData != null){
      auditionVideo = pickerData.path;
      auditionVideoData = FileDataWeb(
          name: pickerData!.name,

          path: pickerData!.path,
          type: "VIDEO",
          extension: pickerData!.name.split(".").last,
          imageData: await pickerData.imageData);
    }
    update();

  }

  showDocument1(String url, String type, String fileType) {
    print("");
    FileController fileController = Get.put(FileController());
    fileController.viewFile1(url, type, fileType);
  }

  showDocument(String url) {
print("objectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobject");
      FileController fileController = Get.put(FileController());
      fileController.viewFile1(auditionVideo, "Audition Video", "VIDEO");

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
      requirementPhoto = file.path;
      update();
      Get.back();
    } else if (kIsWeb && pickerData != null) {
      requirementPhoto = pickerData.path;
      requirementPhotoData = FileDataWeb(
          path: pickerData.path,
          name: pickerData.name,
          type: "",
          extension: "",
          imageData: pickerData.imageData);
      update();
    }
  }

  void setGenderValue(String value) {
    genderTEController.text = value;
  }

  void checkIsArtist() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      if (isArtist) {
        getArtistHomeRequirementDetails(false);

        getAppliedForRequirementArtist(0);
      } else {
        getRequirementDetailsCompany(0);
      }
      getUpcomingProjectsDetails();
      getReviewDetails();
    } else {}
    update();
  }

  checkArtistAndSetData(RequirementDetailsData requirementData) async {
    // LoginTable? loginTable = await HiveService.getLoginData();
    print(requirementData.companyNameProductionhouse);

    // if (loginTable != null&&loginTable.accountType==KalakarConstants.artist){
    setRequirementViewData(requirementData, false);
    // }else {
    // setOpportunityData(requirementData);}
  }

  void setOpportunityData(RequirementDetailsData requirementData) async {
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
          KalakarConstants.artistProfileMasterApi,
          body,
          loginTable.token ?? "");
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
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
    if (loginTable.profileId==0){
      KalakarDialogs.successDialog("title", "Please Fill Profile Data and Try Again");
    }else {


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
      salaryTEController.text = "";
      salaryTypeTEController.text = "";
      Get.toNamed(RouteHelper.requirementFormPage);
    }
    }
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
      artistName = "${loginTable.fistName} ${loginTable.lastName}";
      isArtist = loginTable.accountType == KalakarConstants.artist;

      if (iSAll) {
        isRequirementsLoading = true;
      } else {
        isArtistHomeRequirementsLoading = true;
      }
      update();
      var body = {"fK_AccountID": loginTable.accountID ?? "", "isAll": iSAll};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistHomeRequirementsApi,
          jsonEncode(body),
          loginTable.token ?? "");
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        CompanyRequirementListClass artistHomeRequirementsClass =
            CompanyRequirementListClass.fromJson(jsonDecode(response.body));
        if (iSAll) {
          requirementDetailsList =
              artistHomeRequirementsClass.objResponesRequirementDetailsList!;
        } else {
          newRequirementDetailsList =
              artistHomeRequirementsClass.objResponesRequirementDetailsList!;
        }
      }
      if (iSAll) {
        isRequirementsLoading = false;
      } else {
        isArtistHomeRequirementsLoading = false;
      }
      update();
    }
  }

  Future<void> getUpcomingProjectsDetails() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      isArtistHomeUpcomingProjectsLoading = true;
      update();
      var body = {"superAdminProjectID": "0", "fK_AccountID": "0"};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistHomeUpcomingProjectsApi,
          jsonEncode(body),
          loginTable.token ?? "");
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        UpcomingProjectClass upcomigProjectClass =
            UpcomingProjectClass.fromJson(jsonDecode(response.body));
        upcomingProjectsDetailsList =
            upcomigProjectClass.lResponseCompanyProjects!;
      }
      isArtistHomeUpcomingProjectsLoading = false;
      update();
    }
  }

  Future<void> getReviewDetails() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      isArtistHomeReviewsLoading = true;
      update();
      var body = {"applicationReviewID": "0", "fK_AccountID": "0"};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistHomeReviewApi,
          jsonEncode(body),
          loginTable.token ?? "");
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        ReviewClass reviewClass =
            ReviewClass.fromJson(jsonDecode(response.body));
        reviewDetailsList = reviewClass.getApplicationReviewList!;
      }
      isArtistHomeReviewsLoading = false;

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
          loginTable.token ?? "");
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
      RequirementDetailsData requirement, bool showStatus) {
    auditionVideo="";
    selectedRequirement = requirement;
    this.showStatus = showStatus;
    Get.toNamed(RouteHelper.requirementViewPage);
  }

  void setUpcomingProjectViewData(ResponseCompanyProjects upcomingProject) {
    isDocumentsLoading = true;

    getUpcomingProjectDocumentDetails(
        upcomingProject.companyProjectID!.toString());
    Get.toNamed(RouteHelper.upcomingProjectViewPage);
  }

  Future<void> openSocialMedia(int index, String link) async {
    try {
      print(link);
        if(link.isNotEmpty) {
        launchUrl(Uri.parse(link));
      } else{
          KalakarDialogs.successDialog("Facebook Link", "Link Not Added");
        }

        // KalakarDialogs.successDialog("Facebook Link", "Link Not Added");

    } catch (e) {
      print(e);

    }
    /* switch (index) {
      case 0:


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
    }*/
  }

  void setReviewDataToView(GetApplicationReviewList reviewData) {
    selectedReviewData = reviewData;
    Get.toNamed(RouteHelper.reviewViewPage);
  }

  void setAppliedRequirementViewData(
      ArtistAppliedRequirementDetailsList requirementData, bool showStatus) {
    selectedAppliedRequirement = requirementData;
    this.showStatus = showStatus;
    Get.toNamed(RouteHelper.requirementViewPage);
  }

  void getAppliedData(RequirementDetailsData requirementDetails) {
    selectedRequirement = requirementDetails;
    selectedAppliedRequirementId = requirementDetails.requirementDetailsID!;
    getAppliedForRequirementCompany();
    Get.toNamed(RouteHelper.appliedProfilesPage);
  }

  Future<void> setArtistProfileDataToView(
      company_artist.AppliedArtistDetailsList appliedProfileDetail) async {
    isSearchedArtist = false;
    selectedArtistProfileData = appliedProfileDetail;
    ArtistProfileController artistProfileController=Get.put(ArtistProfileController());
    artistProfileController.isArtist=false;
    List<company_artist.PortfolioList> artistPortfolioData =
    selectedArtistProfileData.portfolioList!;
     artistData =         selectedArtistProfileData.getArtistProfileModelForRequirememt!;
     artistProfileId =         selectedArtistProfileData.artistUserID!;
     artistEducationData =
    selectedArtistProfileData.educationList!;
     artistHobbiesData =
    selectedArtistProfileData.hobbiesList!;
    artistInterestInData =
    selectedArtistProfileData.interestList!;
    artistComfortableInData =
    selectedArtistProfileData.comfortableInList!;
     artistExperienceData =
    selectedArtistProfileData.experienceList!;
     artistApplyData =
    selectedArtistProfileData.applyList!;

    List<company_artist.PortfolioList> imagesList = [];
    List<company_artist.PortfolioList> videosList = [];
    for (int i = 0; i < artistPortfolioData.length; i++) {
      if (artistPortfolioData[i].fileType == 2) {
        try {
          artistPortfolioData[i].thumbnail = await VideoThumbnail.thumbnailData(
            video: artistPortfolioData[i].filePath!,
            // Replace with your video URL
            imageFormat: ImageFormat.JPEG,
            maxHeight: 150,
            // Set a maximum height for the thumbnail
            quality: 75,
          );
          videosList.add(artistPortfolioData[i]);
        } catch (e) {
          print(e);
        }
      } else {
        imagesList.add(artistPortfolioData[i]);
      }
    }
    artistPortfolioImagesList = imagesList;
    artistPortfolioVideosList = videosList;
    update();

    Get.toNamed(RouteHelper.artistProfilePage);
  }

  void clearSearchFilters() {
    searchLocationTEController.text = "";
    searchLanguageTEController.text = "";
    searchShootingStartDateTEController.text = "";
    searchShootingEndDateTEController.text = "";
    searchStartAgeTEController.text = "";
    searchEndAgeTEController.text = "";
  }

  void setArtistProfileDataToView1(
      GetArtistProfileModellist appliedProfileDetail) {
    isSearchedArtist = true;
    selectedSearchedArtistProfileData = appliedProfileDetail;

    Get.toNamed(RouteHelper.artistProfileViewPage);
  }

  void setSalaryTypeValue(String selectedItem) {
    salaryTypeTEController.text = selectedItem;
  }

  void filterAppliedRequirementDetailsListData() {
    if (searchKalakarTEController.text.isNotEmpty) {
      filterAppliedRequirementDetailsList = companyAppliedRequirementDetailsList
          .where((requirement) =>
              requirement.firstName
                  .toString()
                  .toLowerCase()
                  .contains(searchKalakarTEController.text.toLowerCase()) ||
              requirement.middleName
                  .toString()
                  .toLowerCase()
                  .contains(searchKalakarTEController.text.toLowerCase()))
          .toList();
    } else {
      filterAppliedRequirementDetailsList =
          companyAppliedRequirementDetailsList;
    }
    update();
  }

  void getCompanyProfileData() {
    ProfileController profileController = Get.put(ProfileController());
    profileController.getProfileDataForArtist(selectedRequirement.fKAccountID!);
    profileController
        .getCompanyProjectsForArtist(selectedRequirement.fKAccountID!);
    Get.toNamed(RouteHelper.companyProfilePage);
  }

  void showAuditionVideo(String? auditionVideoPath) {
    FileController fileController=Get.put(FileController());
    fileController.viewFile1(auditionVideoPath!, "Audition Video", "VIDEO");
  }

  void showLocalAuditionVideo() {
    // Get.to(BlobVideoPlayer(blobUrl: auditionVideoData!.path));
  }

  void deleteAuditionVideo() {
    auditionVideo="";
    update();
  }

}
