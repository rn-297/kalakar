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
import '../utils/kalakar_constants.dart';
import 'file_controller.dart';
import 'package:kalakar/utils/web_utils.dart' as utils;

class ArtistProfileController extends GetxController {
  //text editing Controllers
  TextEditingController firstNameTEController = TextEditingController();
  TextEditingController middleNameTEController = TextEditingController();
  TextEditingController lastNameTEController = TextEditingController();
  TextEditingController dobTEController = TextEditingController();
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
  String documentType = "";
  String dobText = "";
  String courseStartDateText = "";
  String courseEndDateText = "";

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

  @override
  onInit() {
    super.onInit();
    checkIfArtist();
  }

  setDate(String type, DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    switch (type) {
      case KalakarConstants.dob:
        dobText = formatter.format(date);
        dobTEController.text = dobText!;
      case KalakarConstants.courseStartDate:
        courseStartDateText = formatter.format(date);
        courseStartDateTEController.text = courseStartDateText!;
      case KalakarConstants.courseEndDate:
        courseEndDateText = formatter.format(date);
        courseEndDateTEController.text = courseEndDateText!;
    }
  }

  Future<void> saveArtistProfile() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = <String, String>{};
      body['ArtistProfileID'] = '';
      body['FK_AccountID'] = '';
      body['ProfilePic_Name'] = '';
      body['FirstName'] = '';
      body['MiddleName'] = '';
      body['LastName'] = '';
      body['DateOfBirth'] = '';
      body['Email'] = '';
      body['MobileNumber'] = '';
      body['Gender'] = '';
      body['Age'] = '';
      body['RoleAge'] = '';
      body['Height'] = '';
      body['Weight'] = '';
      body['Bio'] = '';
      body['FBLink'] = '';
      body['WPLink'] = '';
      body['YTLink'] = '';
      body['Instalink'] = '';
      body['EmailLink'] = '';
      body['WebsiteLink'] = '';
      body['Address1'] = '';
      body['Address2'] = '';
      body['District'] = '';
      body['State'] = '';
      body['Postalcode'] = '';
      body['AlternateMobileNumber'] = '';
      body['LanguageKnown'] = '';
      body['EyeColor'] = '';
      body['HairColor'] = '';
      body['BodyType'] = '';
      body['MaritalStatus'] = '';
      body['Vehicle'] = '';
      body['TravelThrIndia'] = '';

      Map<String, File> files = {
        'ProjectCoverDoc': File(""),
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
        "artistProfile_EducationID": 0,
        "fK_AccountID": 0,
        "educationType": "string",
        "universityOrInstitute": "string",
        "course": "string",
        "specialization": "string",
        "coursetype": "string",
        "courseStartDate": "2024-08-11T12:41:58.809Z",
        "courseEndDate": "2024-08-11T12:41:58.809Z",
        "score": 0
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
        "artistProfile_hobbiesID": 0,
        "fK_AccountID": 0,
        "hobbyName": "string"
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
        "artistProfile_InterestID": 0,
        "fK_AccountID": 0,
        "fK_InterstedListMasterID": "string"
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

  Future<void> saveArtistProfileComfortableIn(int comfortableInId) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "artistProfile_ComfortableInID": comfortableInId,
        "fK_AccountID": loginTable.accountID,
        "fK_ComfortableListMasterID": "string"
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.saveArtistProfileApi,
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

  Future<void> saveArtistProfileMaster() async {
    final body = <String, dynamic>{};

    var response = await ApiClient.postData(
        KalakarConstants.saveArtistProfileMasterApi, body);
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
      body['ArtistProfile_DocumentsID'] = '';
      body['FK_AccountID'] = '';
      body['UserID'] = '';

      Map<String, File> files = {
        'Passport': File(""),
        'FileCorporationCard': File(""),
        'AdharCard': File(""),
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
      body['UserID'] = '';
      body['ArtistProfile_ExperienceID'] = '';
      body['FK_AccountID'] = '';
      body['CompanyName'] = '';
      body['RoleName'] = '';
      body['StartDate'] = '';
      body['EndDate'] = '';
      body['SkillUsed'] = '';
      body['RoleProfile'] = '';
      Map<String, File> files = {
        'RoleImage': File(""),
        'RoleVideo': File(""),
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
      body['UserID'] = '';
      body['ArtistProfile_PortfolioID'] = '';
      body['FK_AccountID'] = '';
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

  void getCitiesData(String selectedItem) {}

  void getPinCodesData(String selectedItem) {}

  void setPinCodeData(String selectedItem) {}

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
}
