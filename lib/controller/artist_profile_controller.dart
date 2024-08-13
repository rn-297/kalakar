import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../data/models/csv_model_class.dart';
import '../utils/kalakar_constants.dart';

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

  //Strings
  String artistProfileImage="";
  String documentType="";

//form keys
  final _formProfileKey = GlobalKey<FormState>();

  get formProfileKey => _formProfileKey;

  //Lists

  List<CSVData> stateCityPinCodeList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  List<String> pinCodeList = [];

  //validators

  String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }

  String? middleNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Middle Name';
    }
    return null;
  }

  String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? dobValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? mobileNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? heightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? weightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? roleAgeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? bioValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? stateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? districtValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? postalCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? address1Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? address2Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? alternateMobileNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? languageKnownValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? eyeColorValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? hairColorValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? bodyTypeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? maritalStatusValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? vehicleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  String? travelThrIndiaValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  @override
  onInit(){
    super.onInit();
  getArtistProfileBasic();

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

  Future<void> saveArtistProfileComfortableIn() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "artistProfile_ComfortableInID": 0,
        "fK_AccountID": 0,
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
      final body = {"userID": "string", "fK_AccountID": 0};

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileBasicApi,
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

  Future<void> getArtistProfileEducation() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {"userID": "string", "fK_AccountID": 0, "recordID": 0};

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileEducationApi,
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

  Future<void> getArtistProfileHobbies() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {"userID": "string", "fK_AccountID": 0, "recordID": 0};

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileHobbiesApi,
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

  Future<void> getArtistProfileInterest() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {"userID": "string", "fK_AccountID": 0, "recordID": 0};

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileInterestApi,
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

  Future<void> getArtistProfileComfortableIn() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {"userID": "string", "fK_AccountID": 0, "recordID": 0};

      var response = await ApiClient.postDataToken(
          KalakarConstants.getArtistProfileComfortableInApi,
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

  void getCitiesData(String selectedItem) {

  }

  void getPinCodesData(String selectedItem
      ) {}

  void setPinCodeData(String selectedItem) {}

  void validateProfileFormData() {}
}
