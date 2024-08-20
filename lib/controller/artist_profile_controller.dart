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
import 'package:kalakar/data/models/artist/artist_profile_class.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../data/models/csv_model_class.dart';
import '../helper/picker_helper.dart';
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

  //Lists

  List<CSVData> stateCityPinCodeList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  List<String> pinCodeList = [];
  List<EducationList> artistEducationList = [];
  List<ComfortableInList> artistComfortableInList = [];
  List<HobbiesList> artistHobbiesList = [];
  List<InterestList> artistInterestedInList = [];
  List<DocumentsList> artistDocumentsList = [];
  List<ExperienceList> artistExperienceList = [];
  List<String> genderList = ["Male", "Female", "Other"];

  @override
  onInit() {
    super.onInit();
    checkIfArtist();
  }

  setDate(String type, DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
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
    }
  }

  Future<void> saveArtistProfile() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = <String, String>{};
      body['ArtistProfileID'] = artistProfileId;
      body['FK_AccountID'] = loginTable.accountID;
      body['ProfilePic_Name'] = "image";
      body['FirstName'] = firstNameTEController.text.trim();
      body['MiddleName'] = middleNameTEController.text.trim();
      body['LastName'] = lastNameTEController.text.trim();
      body['DateOfBirth'] = artistDOB.toString();
      body['Email'] = emailLinkTEController.text.trim();
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
      body['TravelThrIndia'] = vehicleTEController.text.trim();

      Map<String, File> files = {
        'ProfilePic': File(artistProfileImage),
      };

      var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveArtistProfileApi, body, files, loginTable.token);
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

  Future<void> saveArtistProfileEducation() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "artistProfile_EducationID": artistEducationId,
        "fK_AccountID": loginTable.accountID,
        "educationType": educationTypeTEController.text.trim(),
        "universityOrInstitute": universityOrInstituteTEController.text.trim(),
        "course": courseTEController.text.trim(),
        "specialization": specializationTEController.text.trim(),
        "coursetype": courseTypeTEController.text.trim(),
        "courseStartDate": courseStartDate.toString(),
        "courseEndDate": courseEndDate.toString(),
        "score": scoreTEController.text.trim()
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.saveArtistProfileEducationApi,
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

  Future<void> saveArtistProfileHobbies() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
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

      if (response.statusCode == 200) {
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> saveArtistProfileInterest() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
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

      if (response.statusCode == 200) {
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> saveArtistProfileComfortableIn() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
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

      if (response.statusCode == 200) {
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
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

  Future<void> artistProfileMaster() async {
    final body = <String, dynamic>{};

    var response =
        await ApiClient.postData(KalakarConstants.artistProfileMasterApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );
    }
  }

  Future<void> saveArtistProfileDocuments() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
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

      if (response.statusCode == 200) {
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> saveArtistProfileExperience() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
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

      if (response.statusCode == 200) {
        // print("response successful ${response.body}");
        // Get.defaultDialog(
        //   content: Text("response successful ${response.body}"),
        // );
      }
    }
  }

  Future<void> saveArtistProfilePortFolio() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = <String, String>{};
      body['UserID'] = loginTable.userID;
      body['ArtistProfile_PortfolioID'] = artistPortfolioId;
      body['FK_AccountID'] = loginTable.accountID;
      body['FileType'] = '';

      Map<String, File> files = {
        'FilePath': File(""),
      };

      var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveArtistProfileExperienceApi,
          body,
          files,
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
      mobileNumberTEController.text = artistProfileDetails.mobileNumber!;
      ageTEController.text = artistProfileDetails.age!.toString();
      roleAgeTEController.text = artistProfileDetails.roleAge.toString()!;
      heightTEController.text = artistProfileDetails.height!.toString();
      weightTEController.text = artistProfileDetails.weight!.toString();
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
          KalakarConstants.getArtistProfileDocumentsApi,
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
    if (_formProfileKey.currentState!.validate()) {}
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
    if (_formEducationKey.currentState!.validate()) {}
  }

  void validateComfortableInForm() {
    if (_formComfortableInKey.currentState!.validate()) {}
  }

  void validateDocumentsForm() {
    if (_formDocumentKey.currentState!.validate()) {}
  }

  void validateExperienceForm() {
    if (_formExperienceKey.currentState!.validate()) {}
  }

  void validateInterestedInForm() {
    if (_formInterestedInKey.currentState!.validate()) {}
  }

  void validatePortfolioForm() {
    if (_formPortFolioKey.currentState!.validate()) {}
  }

  void validateHobbiesForm() {
    if (_formHobbiesKey.currentState!.validate()) {}
  }

  Future<void> checkIfArtist() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null &&
        loginTable.accountType == KalakarConstants.artist) {
      getArtistProfileBasic();
      getArtistProfileEducation(0);
      getArtistProfileComfortableIn(0);
      getArtistProfileHobbies(0);
    }
  }

  void setGenderValue(String value) {
    genderTEController.text = value;
  }
}
