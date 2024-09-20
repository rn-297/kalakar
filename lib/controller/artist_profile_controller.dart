import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalakar/data/models/artist/artist_comfortable_in_class.dart';
import 'package:kalakar/data/models/artist/artist_document_list_class.dart';
import 'package:kalakar/data/models/artist/artist_education_list_class.dart';
import 'package:kalakar/data/models/artist/artist_experience_list_class.dart';
import 'package:kalakar/data/models/artist/artist_hobbies_list_class.dart';
import 'package:kalakar/data/models/artist/artist_interested_in_class.dart';
import 'package:kalakar/data/models/artist/artist_portfolio_class.dart';
import 'package:kalakar/data/models/artist/artist_profile_class.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';
import 'package:kalakar/views/dialogs/kalakar_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../data/models/artist_master_data.dart';
import '../data/models/csv_model_class.dart';
import '../helper/picker_helper.dart';
import '../helper/route_helper.dart';
import '../helper/state_city_pincode_helper/state_city_pincode_helper.dart';
import '../utils/kalakar_constants.dart';
import 'file_controller.dart';
import 'package:kalakar/utils/web_utils.dart' as utils;

class ArtistProfileController extends GetxController {
  //text editing Controllers
  TextEditingController firstNameTEController = TextEditingController();
  TextEditingController middleNameTEController = TextEditingController();
  TextEditingController lastNameTEController = TextEditingController();
  TextEditingController dobTEController = TextEditingController();
  TextEditingController genderTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController mobileNumberTEController = TextEditingController();
  TextEditingController ageTEController = TextEditingController();
  TextEditingController roleAgeTEController = TextEditingController();
  TextEditingController heightTEController = TextEditingController();
  TextEditingController weightTEController = TextEditingController();
  TextEditingController bioTEController = TextEditingController();
  TextEditingController fbLinkTEController = TextEditingController();
  TextEditingController wpLinkTEController = TextEditingController();
  TextEditingController ytLinkTEController = TextEditingController();
  TextEditingController instaTEController = TextEditingController();
  TextEditingController emailLinkTEController = TextEditingController();
  TextEditingController websiteLinkTEController = TextEditingController();
  TextEditingController address1TEController = TextEditingController();
  TextEditingController address2TEController = TextEditingController();
  TextEditingController districtTEController = TextEditingController();
  TextEditingController stateTEController = TextEditingController();
  TextEditingController postalCodeTEController = TextEditingController();
  TextEditingController alternateMobileNumberTEController =
      TextEditingController();
  TextEditingController languageKnownTEController = TextEditingController();
  TextEditingController eyeColorTEController = TextEditingController();
  TextEditingController hairColorTEController = TextEditingController();
  TextEditingController bodyTypeTEController = TextEditingController();
  TextEditingController maritalStatusTEController = TextEditingController();
  TextEditingController vehicleTEController = TextEditingController();
  TextEditingController travelThroughIndiaTEController =
      TextEditingController();
  TextEditingController educationTypeTEController = TextEditingController();
  TextEditingController universityOrInstituteTEController =
      TextEditingController();
  TextEditingController courseTEController = TextEditingController();
  TextEditingController specializationTEController = TextEditingController();
  TextEditingController courseTypeTEController = TextEditingController();
  TextEditingController courseStartDateTEController = TextEditingController();
  TextEditingController courseEndDateTEController = TextEditingController();
  TextEditingController scoreTEController = TextEditingController();
  TextEditingController hobbyTEController = TextEditingController();
  TextEditingController passportTEController = TextEditingController();
  TextEditingController filmCorporationCrdTEController =
      TextEditingController();
  TextEditingController adharCardTEController = TextEditingController();
  TextEditingController companyNameTEController = TextEditingController();
  TextEditingController roleNameTEController = TextEditingController();
  TextEditingController exStartDateTEController = TextEditingController();
  TextEditingController exEndDateTEController = TextEditingController();
  TextEditingController skillsUsedTEController = TextEditingController();
  TextEditingController roleProfileTEController = TextEditingController();
  TextEditingController fileTypeTEController = TextEditingController();
  TextEditingController filePathTEController = TextEditingController();
  TextEditingController comfortableInTEController = TextEditingController();
  TextEditingController expStartDateTEController = TextEditingController();
  TextEditingController expEndDateTEController = TextEditingController();
  TextEditingController roleImageTEController = TextEditingController();
  TextEditingController roleVideoTEController = TextEditingController();
  TextEditingController interestedInTEController = TextEditingController();

  //Strings
  String artistProfileImage = "";
  String passportImage = "";
  String filmCorporationCardImage = "";
  String adharCardImage = "";
  String portFolioImageOrVideo = "";
  String expRoleImage = "";
  String expRoleVideo = "";
  String documentType = "";
  String dobText = "";
  String courseStartDateText = "";
  String courseEndDateText = "";
  String artistProfileId = "0";
  String artistEducationId = "0";
  String artistHobbiesId = "0";
  String artistInterestInId = "0";
  String interestInMasterId = "0";
  String artistComfortableInId = "0";
  String comfortableInMasterId = "0";
  String artistDocumentId = "0";
  String artistExperienceId = "0";
  String artistPortfolioId = "0";

  //date time
  DateTime artistDOB = DateTime.now();
  DateTime courseStartDate = DateTime.now();
  DateTime courseEndDate = DateTime.now();
  DateTime expStartDate = DateTime.now();
  DateTime expEndDate = DateTime.now();

  //artist profile details
  ArtistProfileDetailsClass artistProfileDetails = ArtistProfileDetailsClass();

//form keys
  final _formProfileKey = GlobalKey<FormState>();

  get formProfileKey => _formProfileKey;
  final _formEducationKey = GlobalKey<FormState>();

  get formEducationKey => _formEducationKey;

  final _formDocumentKey = GlobalKey<FormState>();

  get formDocumentKey => _formDocumentKey;
  final _formExperienceKey = GlobalKey<FormState>();

  get formExperienceKey => _formExperienceKey;
  final _formHobbiesKey = GlobalKey<FormState>();

  get formHobbiesKey => _formHobbiesKey;
  final _formInterestedInKey = GlobalKey<FormState>();

  get formInterestedInKey => _formInterestedInKey;
  final _formComfortableInKey = GlobalKey<FormState>();

  get formComfortableInKey => _formComfortableInKey;
  final _formPortFolioKey = GlobalKey<FormState>();

  get formPortFolioKey => _formPortFolioKey;

  //Date Formatter
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  //Lists

  List<CSVData> stateCityPinCodeList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  List<String> pinCodeList = [];
  List<EducationList> artistEducationList = [];
  List<ComfortableInList> artistComfortableInList = [];
  List<HobbiesList> artistHobbiesList = [];
  List<InterestList> artistInterestedInList = [];
  List<AgeRangeMasterList> ageRangeMasterList = [];
  List<HeighRangeMasterList> heightRangeMasterList = [];
  List<WeightRangeMasterList> weightRangeMasterList = [];
  List<MaritalStatusMasterList> maritalStatusMasterList = [];

  List<DocumentsList> artistDocumentsList = [];
  List<ExperienceList> artistExperienceList = [];
  List<PortfolioList> artistPortfolioList = [];
  List<String> genderList = ["Male", "Female", "Other"];
  List<String> interestInList = ["Films", "Web series", "Advertise"];
  List<String> fileTypeList = ["IMAGE", "VIDEO"];
  List<String> maritalStatusList = ["Single", "Married", "Divorced"];
  List<String> comfortableInList = ["Bold look", "Clean shave", "Bikini shoot"];
  List<String> hairColorList = [
    "Black",
    "Brown",
    "Red",
    "Blond",
    "Gray and white"
  ];
  List<String> ageRangeList = ["1-2 Years", "2-3 Years", "3-5 Years"];
  List<String> heightRangeList = ["0-1 Feet", "1-2 Feet", "2-3 Feet"];
  List<String> weightRangeList = ["1-2 KG", "2-3 KG", "3-5 KG"];
  List<String> bodyTypeList = ["Good Looking", "Slim", "Muscular"];
  List<String> eyeColorList = ["Light Brown", "Black", "White"];
  List<String> yesNoList = ["Yes", "No"];
  List<String> requirementStatusList = ["Save as Draft", "Published", "Closed"];
  List<InterestedListMaster> artistInterestedInMasterList = [];

  List<ComfortableListMaster> comfortableInMasterList = [];
  List<HaiColorMasterList> hairColorMasterList = [];
  List<BodyTypeMasterList> bodyTypeMasterList = [];
  List<EyeColorMasterList> eyeColorMasterList = [];
  List<RequirementStatusMasterList> requirementStatusMasterList = [];

  @override
  onInit() {
    super.onInit();
    checkIfArtist();
  }

  setDate(String type, DateTime date) {
    switch (type) {
      case KalakarConstants.dob:
        artistDOB = date;
        dobTEController.text = formatter.format(date);
      case KalakarConstants.courseStartDate:
        courseStartDate = date;
        courseStartDateTEController.text = formatter.format(date);
      case KalakarConstants.courseEndDate:
        courseEndDate = date;
        courseEndDateTEController.text = formatter.format(date);
      case KalakarConstants.expStartDate:
        expStartDate = date;
        expStartDateTEController.text = formatter.format(date);
      case KalakarConstants.expEndDate:
        expEndDate = date;
        expEndDateTEController.text = formatter.format(date);
    }
    update();
  }

  Future<void> getArtistProfileMaster() async {
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
          maritalStatusMasterList = artistMasterClass.maritalStatusMasterList!;
          artistInterestedInMasterList =
              artistMasterClass.interestedListMaster!;

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
          names = maritalStatusMasterList
              .map((status) => status.name as String)
              .toList();
          maritalStatusList = names;
          names = artistInterestedInMasterList
              .map((status) => status.name as String)
              .toList();
          interestInList = names;
          update();
        }
      }
    }
  }

  Future<void> saveArtistProfile() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    print("object");
    if (loginTable != null) {
      final DateFormat format = DateFormat('yyyy-MM-dd');
      KalakarDialogs.loadingDialog(
          "Uploading Profile Data", "Saving Profile Data");
      final body = <String, String>{};
      body['ArtistProfileID'] = artistProfileId;
      body['FK_AccountID'] = loginTable.accountID;
      body['ProfilePic_Name'] = "image";
      body['FirstName'] = firstNameTEController.text.trim();
      body['MiddleName'] = middleNameTEController.text.trim();
      body['LastName'] = lastNameTEController.text.trim();
      body['DateOfBirth'] = format.format(artistDOB);
      body['Email'] = emailTEController.text.trim();
      body['MobileNumber'] = mobileNumberTEController.text.trim();
      body['Gender'] = genderTEController.text.trim();
      body['Age'] = ageTEController.text.trim();
      body['RoleAge'] = roleAgeTEController.text.trim();
      body['Height'] = heightTEController.text.trim();
      body['Weight'] = weightTEController.text.trim();
      body['Bio'] = bioTEController.text.trim();
      body['FBLink'] = fbLinkTEController.text.trim();
      body['WPLink'] = wpLinkTEController.text.trim();
      body['YTLink'] = ytLinkTEController.text.trim();
      body['Instalink'] = ytLinkTEController.text.trim();
      body['EmailLink'] = emailLinkTEController.text.trim();
      body['WebsiteLink'] = websiteLinkTEController.text.trim();
      body['Address1'] = address1TEController.text.trim();
      body['Address2'] = address2TEController.text.trim();
      body['District'] = districtTEController.text.trim();
      body['State'] = stateTEController.text.trim();
      body['Postalcode'] = postalCodeTEController.text.trim();
      body['AlternateMobileNumber'] =
          alternateMobileNumberTEController.text.trim();
      body['LanguageKnown'] = languageKnownTEController.text.trim();
      body['EyeColor'] = eyeColorTEController.text.trim();
      body['HairColor'] = hairColorTEController.text.trim();
      body['BodyType'] = bodyTypeTEController.text.trim();
      body['MaritalStatus'] = maritalStatusTEController.text.trim();
      body['Vehicle'] = vehicleTEController.text.trim();
      body['TravelThrIndia'] =
          vehicleTEController.text.trim() == "Yes" ? "True" : "False";

      Map<String, File> files = {
        'ProfilePic': File(artistProfileImage),
      };
      print(body);

      var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveArtistProfileApi, body, files, loginTable.token);
      // print(response.statusCode);
      // print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Saving Profile Data Success", responseModel.message!);
          getArtistProfileBasic();
        } else {
          KalakarDialogs.successDialog(
              "Saving Profile Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> saveArtistProfileEducation() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      String startDate = courseStartDate.toIso8601String();
      String endDate = courseEndDate.toIso8601String();
      KalakarDialogs.loadingDialog(
          "Uploading Education Data", "Saving Education Data");
      final body = {
        "artistProfile_EducationID": artistEducationId,
        "fK_AccountID": loginTable.accountID,
        "educationType": educationTypeTEController.text.trim(),
        "universityOrInstitute": universityOrInstituteTEController.text.trim(),
        "course": courseTEController.text.trim(),
        "specialization": specializationTEController.text.trim(),
        "coursetype": courseTypeTEController.text.trim(),
        "courseStartDate": startDate + "Z",
        "courseEndDate": endDate + "Z",
        "score": scoreTEController.text.trim()
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.saveArtistProfileEducationApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Saving Education Data Success", responseModel.message!);
          getArtistProfileEducation(0);
        } else {
          KalakarDialogs.successDialog(
              "Saving Education Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> saveArtistProfileHobbies() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Saving Hobbies Data", "Saving Hobbies Data");
      final body = {
        "artistProfile_hobbiesID": artistHobbiesId,
        "fK_AccountID": loginTable.accountID,
        "hobbyName": hobbyTEController.text.trim()
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.saveArtistProfileHobbiesApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Saving Hobbies Data Success", responseModel.message!);
          getArtistProfileHobbies(0);
        } else {
          KalakarDialogs.successDialog(
              "Saving Hobbies Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> saveArtistProfileInterest() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Saving Interested In Data", "Saving Interested In Data");
      final body = {
        "artistProfile_InterestID": artistInterestInId,
        "fK_AccountID": loginTable.accountID,
        "fK_InterstedListMasterID": interestInMasterId
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.saveArtistProfileInterestsApi,
          (jsonEncode(body)),
          loginTable.token);
      // print(response.statusCode);
      // print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Saving Interest Data Success", responseModel.message!);
          getArtistProfileInterest(0);
        } else {
          KalakarDialogs.successDialog(
              "Saving Interest Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> saveArtistProfileComfortableIn() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Saving Comfortable In Data", "Saving Comfortable In Data");
      final body = {
        "artistProfile_ComfortableInID": artistComfortableInId,
        "fK_AccountID": loginTable.accountID,
        "fK_ComfortableListMasterID": comfortableInMasterId
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.saveArtistProfileComfortableInApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Saving Comfortable In Data Success", responseModel.message!);
          getArtistProfileComfortableIn(0);
        } else {
          KalakarDialogs.successDialog(
              "Saving Comfortable In Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> saveArtistProfileApplyFor() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "artistProfile_ApplyForID": 0,
        "fK_AccountID": 0,
        "fK_ApplyListMasterID": "string"
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.saveArtistProfileApplyForApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> saveArtistProfileDocuments() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Saving Artist Documents Data", "Saving Artist Documents Data");
      final body = <String, String>{};
      body['ArtistProfile_DocumentsID'] = artistDocumentId;
      body['FK_AccountID'] = loginTable.accountID;
      body['UserID'] = loginTable.userID;

      Map<String, File> files = {
        'Passport': File(passportImage),
        'FileCorporationCard': File(filmCorporationCardImage),
        'AdharCard': File(adharCardImage),
      };

      var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveArtistProfileDocumentsApi,
          body,
          files,
          loginTable.token);
      // print(response.statusCode);
      // print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Saving Artist Documents Data Success", responseModel.message!);
        } else {
          KalakarDialogs.successDialog(
              "Saving Artist Documents Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> saveArtistProfileExperience() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Saving Experience Data", "Saving Experience Data");
      final body = <String, String>{};
      body['UserID'] = loginTable.userID;
      body['ArtistProfile_ExperienceID'] = artistExperienceId;
      body['FK_AccountID'] = loginTable.accountID;
      body['CompanyName'] = companyNameTEController.text.trim();
      body['RoleName'] = roleNameTEController.text.trim();
      body['StartDate'] = expStartDate.toString();
      body['EndDate'] = expEndDate.toString();
      body['SkillUsed'] = skillsUsedTEController.text.trim();
      body['RoleProfile'] = roleProfileTEController.text.trim();
      Map<String, File> files = {
        'RoleImage': File(expRoleImage),
        'RoleVideo': File(expRoleVideo),
      };

      var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveArtistProfileExperienceApi,
          body,
          files,
          loginTable.token);
      // print(response.statusCode);
      // print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Saving Experience Data Success", responseModel.message!);
          getArtistExperience(0);
        } else {
          KalakarDialogs.successDialog(
              "Saving Experience Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> saveArtistProfilePortFolio() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Saving Portfolio Data", "Saving Portfolio Data");
      final body = <String, String>{};
      body['UserID'] = loginTable.userID;
      body['ArtistProfile_PortfolioID'] = artistPortfolioId;
      body['FK_AccountID'] = loginTable.accountID;
      body['FileType'] = fileTypeTEController.text == "IMAGE" ? "1" : "2";

      Map<String, File> files = {
        'FilePath': File(portFolioImageOrVideo),
      };
      print(body);

      var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveArtistProfilePortfolioApi,
          body,
          files,
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Saving Portfolio Data Success", responseModel.message!);
          getArtistPortFolio(0);
        } else {
          KalakarDialogs.successDialog(
              "Saving Portfolio Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> getArtistProfileBasic() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "userID": loginTable.userID,
        "fK_AccountID": loginTable.accountID
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileBasicApi,
          jsonEncode(body),
          loginTable.token);
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        ArtistProfileDetailsClass responseModel =
            ArtistProfileDetailsClass.fromJson(jsonDecode(response.body));

        if (responseModel.replayStatus ?? false) {
          artistProfileDetails = responseModel;

          setArtistProfileData();
        }
      }
    }
  }

  setArtistProfileData() {
    if (artistProfileDetails != null) {
      artistProfileImage = artistProfileDetails.profilePic!;
      firstNameTEController.text = artistProfileDetails.firstName!;
      middleNameTEController.text = artistProfileDetails.middleName!;
      lastNameTEController.text = artistProfileDetails.lastName!;
      dobTEController.text = artistProfileDetails.dateOfBirth!;
      emailTEController.text = artistProfileDetails.email!;
      genderTEController.text = artistProfileDetails.gender!;
      mobileNumberTEController.text = artistProfileDetails.mobileNumber!;
      languageKnownTEController.text = artistProfileDetails.languageKnown!;
      alternateMobileNumberTEController.text =
          artistProfileDetails.alternateMobileNumber!;
      ageTEController.text =
          artistProfileDetails.age!.toString().split(".").first;
      roleAgeTEController.text =
          artistProfileDetails.roleAge.toString().split(".").first;
      heightTEController.text = artistProfileDetails.height!.toString();
      weightTEController.text = artistProfileDetails.weight!.toString();
      bodyTypeTEController.text = artistProfileDetails.bodyType!.toString();
      eyeColorTEController.text = artistProfileDetails.eyeColor!.toString();
      hairColorTEController.text = artistProfileDetails.hairColor!.toString();
      maritalStatusTEController.text =
          artistProfileDetails.maritalStatus!.toString();
      vehicleTEController.text = artistProfileDetails.vehicle!.toString();
      travelThroughIndiaTEController.text =
          artistProfileDetails.travelThrIndia!.toString();
      address1TEController.text = artistProfileDetails.address1!;
      address2TEController.text = artistProfileDetails.address2!;
      stateTEController.text = artistProfileDetails.state!;
      districtTEController.text = artistProfileDetails.district!;
      postalCodeTEController.text = artistProfileDetails.postalcode!;
      bioTEController.text = artistProfileDetails.bio!;
      fbLinkTEController.text = artistProfileDetails.fbLink!;
      wpLinkTEController.text = artistProfileDetails.wpLink!;
      ytLinkTEController.text = artistProfileDetails.ytLink!;
      emailLinkTEController.text = artistProfileDetails.emailLink!;
      websiteLinkTEController.text = artistProfileDetails.websiteLink!;
      // firstNameTEController.text = artistProfileDetails.firstName!;
      // firstNameTEController.text = artistProfileDetails.firstName!;
      // firstNameTEController.text = artistProfileDetails.firstName!;
      update();
    }
  }

  pickOrShowDocument(String documentType, BuildContext context, controller) {
    this.documentType = documentType;
    switch (documentType) {
      case KalakarConstants.profilePhoto:
        if (artistProfileImage.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          pickDocument(documentType, context, controller);
        }
        break;
      case KalakarConstants.passport:
        if (passportImage.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          pickDocument(documentType, context, controller);
        }
        break;
      case KalakarConstants.filmCorporationCard:
        if (filmCorporationCardImage.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          pickDocument(documentType, context, controller);
        }
        break;
      case KalakarConstants.aadharCard:
        if (adharCardImage.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          PickerHelper.showImageBottomSheet(context, controller);
        }
        break;
      case KalakarConstants.portfolio:
        if (portFolioImageOrVideo.isNotEmpty) {
          documentType = KalakarConstants.portfolio;
          PickerHelper.showImageVideoBottomSheet(context, controller);
        } else {
          PickerHelper.showImageBottomSheet(context, controller);
        }
        break;
      case KalakarConstants.roleImage:
        if (expRoleImage.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          PickerHelper.showImageBottomSheet(context, controller);
        }
        break;
      case KalakarConstants.roleVideo:
        if (expRoleVideo.isNotEmpty) {
          PickerHelper.showOrPickDocBottomSheet(
              documentType, context, controller);
        } else {
          PickerHelper.showImageBottomSheet(context, controller);
        }
        break;
    }
  }

  Future<void> pickDocument(
      String documentType, BuildContext context, controller) async {
    print(documentType);
    this.documentType = documentType;
    PickerHelper.showImageBottomSheet(context, controller);
    /*switch (documentType) {
      case KalakarConstants.profilePhoto:
        File? file = await PickerHelper.pickPdfFromGallery();
        if (file != null) {
          artistProfileImage = file.path;
          update();
        }
        break;
      case KalakarConstants.passport:
        File? file = await PickerHelper.pickPdfFromGallery();
        if (file != null) {
          passportImage = file.path;
          passportTEController.text = file.path.split("/").last;
          update();
        }
        break;
      case KalakarConstants.filmCorporationCard:
        File? file = await PickerHelper.pickPdfFromGallery();
        if (file != null) {
          fileCorporationCardImage = file.path;
          filmCorporationCrdTEController.text = file.path.split("/").last;
          update();
        }
        break;
      case KalakarConstants.aadharCard:
        this.documentType = documentType;
        PickerHelper.showImageBottomSheet(context, controller);
        break;
    }*/
  }

  showDocument(String documentType) {
    FileController fileController = Get.put(FileController());
    switch (documentType) {
      case KalakarConstants.passport:
        if (kIsWeb) {
          utils.openLink(passportImage);
        } else {
          fileController.viewFile1(passportImage, documentType);
        }
        break;
      case KalakarConstants.filmCorporationCard:
        if (kIsWeb) {
          utils.openLink(filmCorporationCardImage);
        } else {
          fileController.viewFile1(filmCorporationCardImage, documentType);
        }
        break;
      case KalakarConstants.aadharCard:
        if (kIsWeb) {
          utils.openLink(adharCardImage);
        } else {
          fileController.viewFile1(adharCardImage, documentType);
        }
        break;
      case KalakarConstants.portfolio:
        if (kIsWeb) {
          utils.openLink(portFolioImageOrVideo);
        } else {
          fileController.viewFile1(portFolioImageOrVideo, documentType);
        }
        break;
      case KalakarConstants.roleImage:
        if (kIsWeb) {
          utils.openLink(expRoleImage);
        } else {
          fileController.viewFile1(expRoleImage, documentType);
        }
        break;
      case KalakarConstants.roleVideo:
        if (kIsWeb) {
          utils.openLink(expRoleVideo);
        } else {
          fileController.viewFile1(expRoleVideo, documentType);
        }
        break;
      case KalakarConstants.profilePhoto:
        if (kIsWeb) {
          utils.openLink(artistProfileImage);
        } else {
          fileController.viewFile1(artistProfileImage, documentType);
        }
        break;
      /*case KalakarConstants.selfieUpload:
        if (kIsWeb) {
          utils.openLink(selfieUploadedPath);
        } else {
          fileController.viewFile1(selfieUploadedPath, documentType);
        }
        break;*/
    }
  }

  Future<void> getImageFromCamera(BuildContext context, String type) async {
    File? file;
    if (type == KalakarConstants.camera) {
      file = await PickerHelper.pickImageFromCamera(context);
    } else if (type == KalakarConstants.gallery) {
      file = await PickerHelper.pickImageFromGallery(context);
    }
    if (file != null) {
      print("here ${file.path}");
      if (documentType == KalakarConstants.profilePhoto) {
        artistProfileImage = file.path;
      } else if (documentType == KalakarConstants.passport) {
        passportImage = file.path;
        passportTEController.text = passportImage.split("/").last;
      } else if (documentType == KalakarConstants.filmCorporationCard) {
        filmCorporationCardImage = file.path;
        filmCorporationCrdTEController.text =
            filmCorporationCardImage.split("/").last;
      } else if (documentType == KalakarConstants.aadharCard) {
        adharCardImage = file.path;
        adharCardTEController.text = adharCardImage.split("/").last;
      } else if (documentType == KalakarConstants.portfolio) {
        portFolioImageOrVideo = file.path;
        filePathTEController.text = portFolioImageOrVideo.split("/").last;
      } else if (documentType == KalakarConstants.roleImage) {
        expRoleImage = file.path;
        roleImageTEController.text = expRoleImage.split("/").last;
      } else if (documentType == KalakarConstants.roleVideo) {
        expRoleVideo = file.path;

        roleVideoTEController.text = expRoleVideo.split("/").last;
      }
      update();
    }
    Get.back();
  }

  Future<void> getArtistProfileEducation(int recordID) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "userID": loginTable.userID,
        "fK_AccountID": loginTable.accountID,
        "recordID": recordID
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileEducationApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        ArtistEducationListClass artistEducationListClass =
            ArtistEducationListClass.fromJson(jsonDecode(response.body));
        if (artistEducationListClass.replayStatus ?? false) {
          artistEducationList = artistEducationListClass.educationList!;
          update();
        }

        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> getArtistProfileHobbies(int recordId) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "userID": loginTable.userID,
        "fK_AccountID": loginTable.accountID,
        "recordID": recordId
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileHobbiesApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        ArtistHobbiesListClass artistHobbiesListClass =
            ArtistHobbiesListClass.fromJson(jsonDecode(response.body));
        artistHobbiesList = artistHobbiesListClass.hobbiesList!;
        update();

        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> getArtistProfileInterest(int recordId) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "userID": loginTable.userID,
        "fK_AccountID": loginTable.accountID,
        "recordID": recordId
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileInterestApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        ArtistInterestedInClass artistInterestedInClass =
            ArtistInterestedInClass.fromJson(jsonDecode(response.body));
        artistInterestedInList = artistInterestedInClass.interestList!;
        update();
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> getArtistProfileComfortableIn(int recordId) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "userID": loginTable.userID,
        "fK_AccountID": loginTable.accountID,
        "recordID": recordId
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileComfortableInApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        ArtistComfortableInListClass artistComfortableInListClass =
            ArtistComfortableInListClass.fromJson(jsonDecode(response.body));
        if (artistComfortableInListClass.replayStatus ?? false) {
          artistComfortableInList =
              artistComfortableInListClass.comfortableInList!;
          update();
        }
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> getArtistDocuments() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "userID": loginTable.userID,
        "fK_AccountID": loginTable.accountID
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileDocumentsApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        ArtistDocumentListClass artistDocumentListClass =
            ArtistDocumentListClass.fromJson(jsonDecode(response.body));
        if (artistDocumentListClass.replayStatus ?? false) {
          artistDocumentsList = artistDocumentListClass.documentsList!;
          passportTEController.text =
              artistDocumentsList[0].passport.toString().split("/").last;
          passportImage = artistDocumentsList[0].passport.toString();
          adharCardTEController.text =
              artistDocumentsList[0].adharCard.toString().split("/").last;
          adharCardImage = artistDocumentsList[0].adharCard.toString();
          filmCorporationCrdTEController.text = artistDocumentsList[0]
              .fileCorporationCard
              .toString()
              .split("/")
              .last;
          filmCorporationCardImage =
              artistDocumentsList[0].fileCorporationCard.toString();

          update();
        }
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> getArtistExperience(int recordId) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "userID": loginTable.userID,
        "fK_AccountID": loginTable.accountID,
        "recordID": recordId
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistExperienceApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        ArtistExperienceListClass artistExperienceListClass =
            ArtistExperienceListClass.fromJson(jsonDecode(response.body));
        if (artistExperienceListClass.replayStatus ?? false) {
          artistExperienceList = artistExperienceListClass.experienceList!;
          update();
        }
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> getArtistPortFolio(int recordId) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "userID": loginTable.userID,
        "fK_AccountID": loginTable.accountID,
        "recordID": recordId
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistPortfolioApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        ArtistPortfolioListClass artistPortfolioListClass =
            ArtistPortfolioListClass.fromJson(jsonDecode(response.body));
        if (artistPortfolioListClass.replayStatus ?? false) {
          artistPortfolioList = artistPortfolioListClass.portfolioList!;
          update();
        }
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> getArtistProfileApplyFor() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {"userID": "string", "fK_AccountID": 0, "recordID": 0};

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileApplyForApi,
          jsonEncode(body),
          loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
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
    postalCodeTEController.text = "";
    update();
  }

  Future<void> getPinCodesData(String selectedItem) async {
    districtTEController.text = selectedItem;
    pinCodeList = await StateCityPinCodeHelper.getFilteredPinCodes(
        stateCityPinCodeList, stateTEController.text, selectedItem);
    postalCodeTEController.text = "";
    update();
  }

  Future<void> setPinCodeData(String selectedItem) async {
    postalCodeTEController.text = selectedItem;
    update();
  }

  void validateProfileFormData() {
    if (_formProfileKey.currentState!.validate()) {
      saveArtistProfile();
    }
  }

  Future<void> openSocialMedia(int index) async {
    switch (index) {
      case 0:
        try {
          launchUrl(Uri.parse(artistProfileDetails!.fbLink!));
        } catch (e) {
          print(e);
        }

        break;
      case 1:
        try {
          launchUrl(Uri.parse(artistProfileDetails!.instalink!));
        } catch (e) {
          print(e);
        }

        break;
      case 2:
        try {
          launchUrl(Uri.parse(artistProfileDetails!.wpLink!));
        } catch (e) {
          print(e);
        }

        break;
      case 3:
        try {
          launchUrl(Uri.parse(artistProfileDetails!.ytLink!));
        } catch (e) {
          print(e);
        }

        break;
      case 4:
        try {
          launchUrl(Uri.parse(artistProfileDetails!.emailLink!));
        } catch (e) {
          print(e);
        }
        break;
      case 5:
        try {
          launchUrl(Uri.parse(artistProfileDetails!.websiteLink!));
        } catch (e) {
          print(e);
        }
        break;
    }
  }

  void validateEducationForm() {
    if (_formEducationKey.currentState!.validate()) {
      saveArtistProfileEducation();
    }
  }

  void validateComfortableInForm() {
    if (_formComfortableInKey.currentState!.validate()) {
      saveArtistProfileComfortableIn();
    }
  }

  void validateDocumentsForm() {
    if (_formDocumentKey.currentState!.validate()) {
      saveArtistProfileDocuments();
    }
  }

  void validateExperienceForm() {
    if (_formExperienceKey.currentState!.validate()) {
      saveArtistProfileExperience();
    }
  }

  void validateInterestedInForm() {
    if (_formInterestedInKey.currentState!.validate()) {
      saveArtistProfileInterest();
    }
  }

  void validatePortfolioForm() {
    if (_formPortFolioKey.currentState!.validate()) {
      saveArtistProfilePortFolio();
    }
  }

  void validateHobbiesForm() {
    if (_formHobbiesKey.currentState!.validate()) {
      saveArtistProfileHobbies();
    }
  }

  Future<void> checkIfArtist() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null &&
        loginTable.accountType == KalakarConstants.artist) {
      final apiCalls = [
        getArtistProfileMaster(),
        getArtistProfileBasic(),
        getArtistProfileEducation(0),
        getArtistProfileComfortableIn(0),
        getArtistProfileHobbies(0),
        getArtistProfileInterest(0),
        getArtistExperience(0),
        getArtistDocuments(),
        getArtistPortFolio(0)
      ];

      // Process only 2 API calls at a time
      final results = await Future.wait(apiCalls, eagerError: true);
      print(results);
    }
  }

  void setGenderValue(String value) {
    genderTEController.text = value;
  }

  Future<void> deleteEducationData() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    print("object");
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Deleting Education Data", "Deleting Education Data");
      final body = <String, String>{};
      body['userID'] = loginTable.userID;
      body['fK_AccountID'] = loginTable.accountID;
      body['recordID'] = artistEducationId;

      var response = await ApiClient.deleteDataToken(
          KalakarConstants.deleteArtistEducationDataApi,
          body,
          loginTable.token);
      print(response.statusCode);
      print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Deleting Education Data Success", responseModel.message!);
          getArtistProfileEducation(0);
        } else {
          KalakarDialogs.successDialog(
              "Deleting Education Data Failed", responseModel.message!);
        }
      }
    }
  }

  void setComfortableInValue(String selectedItem) {
    comfortableInTEController.text = selectedItem;
    comfortableInMasterId = comfortableInMasterList
        .where((status) => status.name == selectedItem)
        .toList()
        .first
        .id
        .toString();
    update();
  }

  Future<void> deleteComfortableIn() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    print("object");
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Deleting Comfortable In Data", "Deleting Comfortable In Data");
      final body = <String, String>{};
      body['userID'] = loginTable.userID;
      body['fK_AccountID'] = loginTable.accountID;
      body['recordID'] = artistEducationId;

      var response = await ApiClient.deleteDataToken(
          KalakarConstants.deleteArtistHobbyDataApi, body, loginTable.token);
      print(response.statusCode);
      print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Deleting Comfortable In Data Success", responseModel.message!);
          getArtistProfileHobbies(0);
        } else {
          KalakarDialogs.successDialog(
              "Deleting Comfortable Data Failed", responseModel.message!);
        }
      }
    }
  }

  Future<void> deleteHobbies() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    print("object");
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Deleting Hobby Data", "Deleting Hobby Data");
      final body = <String, String>{};
      body['userID'] = loginTable.userID;
      body['fK_AccountID'] = loginTable.accountID;
      body['recordID'] = artistHobbiesId;

      var response = await ApiClient.deleteDataToken(
          KalakarConstants.deleteArtistHobbyDataApi, body, loginTable.token);
      print(response.statusCode);
      print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Deleting Hobby Data Success", responseModel.message!);
          getArtistProfileHobbies(0);
        } else {
          KalakarDialogs.successDialog(
              "Deleting Hobby Data Failed", responseModel.message!);
        }
      }
    }
  }

  void setInterestedInValue(String selectedItem) {
    interestedInTEController.text = selectedItem;
    interestInMasterId = artistInterestedInMasterList
        .where((interestIn) => interestIn.name == selectedItem)
        .first
        .id
        .toString();
  }

  void deleteInterestIn() {}

  Future<void> deleteExperienceForm() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    print("object");
    if (loginTable != null) {
      KalakarDialogs.loadingDialog(
          "Deleting Experience Data", "Deleting Experience Data");
      final body = <String, String>{};
      body['userID'] = loginTable.userID;
      body['fK_AccountID'] = loginTable.accountID;
      body['recordID'] = artistExperienceId;

      var response = await ApiClient.deleteDataToken(
          KalakarConstants.deleteArtistExperienceDataApi,
          body,
          loginTable.token);
      print(response.statusCode);
      print(response);
      if (Get.isDialogOpen!) {
        Get.back();
      }

      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(jsonDecode(response.body));
        if (responseModel.replayStatus ?? false) {
          KalakarDialogs.successDialog1(
              "Deleting Experience Data Success", responseModel.message!);
          getArtistExperience(0);
        } else {
          KalakarDialogs.successDialog(
              "Deleting Experience Data Failed", responseModel.message!);
        }
      }
    }
  }

  void setEducationData(EducationList? educationData) {
    if (educationData != null) {
      artistEducationId = educationData.artistProfileEducationID.toString();
      educationTypeTEController.text = educationData.educationType.toString();
      universityOrInstituteTEController.text =
          educationData.universityOrInstitute.toString();
      courseTEController.text = educationData.course.toString();
      specializationTEController.text = educationData.specialization.toString();
      courseTypeTEController.text = educationData.coursetype.toString();
      DateTime startDate =
          DateTime.parse(educationData.courseStartDate.toString());
      courseStartDate = startDate;
      courseStartDateTEController.text = formatter.format(startDate);

      DateTime endDate =
          DateTime.parse(educationData.courseStartDate.toString());
      courseEndDate = endDate;
      courseEndDateTEController.text = formatter.format(endDate);
      scoreTEController.text = educationData.score.toString();
    } else {
      artistEducationId = "0";
      educationTypeTEController.text = "";
      universityOrInstituteTEController.text = "";
      courseTEController.text = "";
      specializationTEController.text = "";
      courseTypeTEController.text = "";

      courseStartDateTEController.text = "";

      courseEndDateTEController.text = "";
      scoreTEController.text = "";
    }
    Get.toNamed(RouteHelper.artistEducationForm);
  }

  void setAgeRangeValue(String selectedItem) {
    ageTEController.text = selectedItem;
  }

  void setRoleAgeRangeValue(String selectedItem) {
    roleAgeTEController.text = selectedItem;
  }

  void setHeightRangeValue(String selectedItem) {
    heightTEController.text = selectedItem;
  }

  void setBodyTypeValue(String selectedItem) {
    bodyTypeTEController.text = selectedItem;
  }

  void setEyeColorValue(String selectedItem) {
    eyeColorTEController.text = selectedItem;
  }

  void setHairColorValue(String selectedItem) {
    hairColorTEController.text = selectedItem;
  }

  void setMaritalStatusValue(String selectedItem) {
    maritalStatusTEController.text = selectedItem;
  }

  void setTravelThrIndiaValue(String selectedItem) {
    travelThroughIndiaTEController.text = selectedItem;
  }

  void setVehicleValue(String selectedItem) {
    vehicleTEController.text = selectedItem;
  }

  void setComfortableInEditData(ComfortableInList? comfortableInData) async {
    if (comfortableInData != null) {
      comfortableInMasterId =
          comfortableInData.artistProfileComfortableInID.toString();
      comfortableInTEController.text =
          comfortableInData.comfortableName.toString();
    } else {
      comfortableInMasterId = "0";
      comfortableInTEController.text = "";
    }
    Get.toNamed(RouteHelper.artistComfortableInForm);
  }

  void setEditHobbiesData(HobbiesList? hobbiesData) {
    if (hobbiesData != null) {
      artistHobbiesId = hobbiesData.artistProfileHobbiesID.toString();
      hobbyTEController.text = hobbiesData.hobbyName.toString();
    } else {
      artistHobbiesId = "0";
      hobbyTEController.text = "";
    }
    Get.toNamed(RouteHelper.artistHobbiesFrom);
  }

  void setEditInterestInData(InterestList? interestInData) {
    if (interestInData != null) {
      interestInMasterId = interestInData.artistProfileInterestID.toString();
      interestedInTEController.text = interestInData.interestedName.toString();
    } else {
      interestInMasterId = "0";
      interestedInTEController.text = "";
    }
    Get.toNamed(RouteHelper.artistInterestForm);
  }

  void setEditExperienceData(ExperienceList? expereinceData) {
    if (expereinceData != null) {
      artistExperienceId = expereinceData.artistProfileExperienceID.toString();
      companyNameTEController.text = "";
      roleNameTEController.text = expereinceData.roleName.toString();

      DateTime startDate = DateTime.parse(expereinceData.startDate.toString());
      expStartDate = startDate;
      expStartDateTEController.text = formatter.format(startDate);
      DateTime endDate = DateTime.parse(expereinceData.startDate.toString());
      expEndDate = endDate;
      expEndDateTEController.text = formatter.format(endDate);
      roleImageTEController.text =
          expereinceData.roleImage.toString().split("/").last;
      expRoleImage = expereinceData.roleImage!;
      roleVideoTEController.text =
          expereinceData.roleVideo.toString().split("/").last;
      expRoleVideo = expereinceData.roleImage!;
    } else {
      companyNameTEController.text = "";
      roleNameTEController.text = "";
      expEndDateTEController.text = "";
      expStartDateTEController.text = "";
      roleImageTEController.text = "";
      expRoleImage = "";
      roleVideoTEController.text = "";
      expRoleVideo = "";
      artistExperienceId = "0";
    }
    Get.toNamed(RouteHelper.artistExperienceForm);
  }

  void setFileTypeValue(String selectedItem) {
    fileTypeTEController.text = selectedItem;
  }

  void editArtistPortfolio(PortfolioList? artistPortfolio) {
    if (artistPortfolio != null) {
      artistPortfolioId = artistPortfolio.artistProfilePortfolioID.toString();
      fileTypeTEController.text =
          artistPortfolio.fileType.toString() == "1" ? "IMAGE" : "VIDEO";
      filePathTEController.text = artistPortfolio.filePath.toString();
    } else {
      artistPortfolioId = "0";
      fileTypeTEController.text = "";
      filePathTEController.text = "";
    }
    Get.toNamed(RouteHelper.artistPortfolio);
  }

  void deletePortfolioData() {}
}
