import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/data/models/company/company_requirement_list_class.dart';
import 'package:kalakar/data/models/generate_otp_model.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../helper/picker_helper.dart';
import '../utils/kalakar_constants.dart';
import 'package:intl/intl.dart';

class RequirementController extends GetxController {
  TextEditingController requirementTitleTEController = TextEditingController();
  TextEditingController descriptionTEController = TextEditingController();
  TextEditingController lookingForTEController = TextEditingController();
  TextEditingController noOfOpeningsTEController = TextEditingController();
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

  //strings
  String requirementId = "0";
  String requirementStatusId = "0";
  String requirementPhoto = "";
  String? shootingStartDateText = "";
  String? shootingEndDateText = "";
  String? requirementEndDateText = "";

  //date time
  DateTime shootingStartDate = DateTime.now();
  DateTime shootingEndDate = DateTime.now();
  DateTime requirementEndDate = DateTime.now();

  //lists
  List<ObjResponesRequirementDetailsList> requirementDetailsList = [];

  //integers
  int? genderValue = 1;

  setDate(String type, DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    switch (type) {
      case KalakarConstants.startDate:
        shootingStartDateText = formatter.format(date);
        startDateTEController.text = shootingStartDateText!;
      case KalakarConstants.endDate:
        shootingEndDateText = formatter.format(date);
        endDateTEController.text = shootingEndDateText!;
      case KalakarConstants.requirementEndDate:
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
    getRequirementDetailsCompany("0");
  }

  //global keys
  final _formRequirementKey = GlobalKey<FormState>();

  get formRequirementKey => _formRequirementKey;

  //validators
  String? requirementTitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Requirement Title';
    }
    return null;
  }

  String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }

  String? lookingForValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Looking For';
    }
    return null;
  }

  String? noOfOpeningValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Number Of Openings';
    }
    return null;
  }

  String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Age';
    }
    return null;
  }

  String? languageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Language';
    }
    return null;
  }

  String? heightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Height';
    }
    return null;
  }

  String? weightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Weight';
    }
    return null;
  }

  String? hairColorValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Hair Color';
    }
    return null;
  }

  String? bodyTypeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Body Type';
    }
    return null;
  }

  String? experienceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Experience';
    }
    return null;
  }

  String? startDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Start Date';
    }
    return null;
  }

  String? endDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select End Date';
    }
    return null;
  }

  String? shootingLocationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Shooting Location';
    }
    return null;
  }

  String? defineRoleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Define Role';
    }
    return null;
  }

  String? splSkillsRequiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Special Skills Required';
    }
    return null;
  }

  String? comfortableInValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Comfortable In';
    }
    return null;
  }

  String? scriptForAuditionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Script For Audition';
    }
    return null;
  }

  String? requirementEndDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Requirement End Date';
    }
    return null;
  }

  String? fbLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }

  String? wpLinkTitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Requirement Title';
    }
    return null;
  }

  String? ytLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }

  String? instaLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Requirement Title';
    }
    return null;
  }

  String? emailLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }

  String? websiteLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }

  saveRequirementsDetails() async {
    if (_formRequirementKey.currentState!.validate()) {
      LoginTable? loginTable = await HiveService.getLoginData();
      ProfileController profileController = Get.put(ProfileController());
      int? profileId = profileController.profileData!.companyProfileID;

      if (loginTable != null) {
        Map<String, String> fields = {
          'UserID': loginTable.userID,
          'RequirementDetailsID': requirementId,
          'FK_AccountID': loginTable.accountID,
          'FK_CompanyProfileID': "$profileId",
          'FK_RequirementStatusMasterID': "$requirementStatusId",
          'RequirementTitle': requirementTitleTEController.text.trim(),
          'RequirementDescription': descriptionTEController.text.trim(),
          'LookingFor': lookingForTEController.text.trim(),
          'NUmberOfOpenings': noOfOpeningsTEController.text.trim(),
          'Gender': genderValue == 1 ? "Male" : "Female",
          'Age': ageTEController.text.trim(),
          'Language': languageTEController.text.trim(),
          'Height': heightTEController.text.trim(),
          'Weight': weightTEController.text.trim(),
          'HairColor': hairColorTEController.text.trim(),
          'BodyType': bodyTypeTEController.text.trim(),
          'Experiences': experienceTEController.text.trim(),
          'ShootingStartDate': startDateTEController.text.trim(),
          'ShootingEndDate': endDateTEController.text.trim(),
          'ShootingLocation': shootingLocationTEController.text.trim(),
          'DefineRole': defineRoleTEController.text.trim(),
          'SpecialSkillRequired': splSkillRequiredTEController.text.trim(),
          'ComfortableIn': comfortableInTEController.text.trim(),
          'ScriptForAuditions': scriptForAuditionTEController.text.trim(),
          'RequirementEndDate': requirementEndDateTEController.text.trim(),
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
            loginTable.token);

        if (response.statusCode == 200) {
          ResponseModel responseModel =
              ResponseModel.fromJson(jsonDecode(response.body));
          if (responseModel.replayStatus ?? false) {
            Get.defaultDialog(
              content: Text("response successful ${responseModel.message}"),
            );
          }
        } else {}
      }
    }
  }

  deleteRequirement(String requirementDetailsID) async {
    LoginTable? loginTable = await HiveService.getLoginData();
    ProfileController profileController = Get.put(ProfileController());
    int? profileId = profileController.profileData!.companyProfileID;
    if (loginTable != null) {
      var fields = {
        'userID': loginTable.userID,
        "requirementDetailsID": requirementDetailsID,
        "fK_AccountID": loginTable.accountID,
        "fK_CompanyProfileID": "$profileId"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.deleteRequirementsDetailsApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
      } else {}
    }
  }

  getRequirementDetailsCompany(String requirementDetailsID) async {
    LoginTable? loginTable = await HiveService.getLoginData();

    ProfileController profileController = Get.put(ProfileController());
    int? profileId = profileController.profileData!.companyProfileID;
    if (loginTable != null) {
      var fields = {
        "userID": loginTable.userID,
        "requirementDetailsID": requirementDetailsID,
        "fK_AccountID": loginTable.accountID,
        "fK_CompanyProfileID": "$profileId"
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
    }
  }

  searchRequirementDetailsArtist() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var fields = {
        "artistID": "string",
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

  saveAppliedToRequirement() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var fields = {
        "artistAppliedForRequirementTransID": "0",
        "fK_RequirementDetailsID": "0",
        "fK_AccountID": "0"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.saveAppliedToRequirementApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
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
      var fields = {"requirementDetailsID": 0, "fK_AccountID": 0};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAppliedForRequirementArtistApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {
      } else {}
    }
  }

  getAppliedForRequirementCompany() async {
    LoginTable? loginTable = await HiveService.getLoginData();

    if (loginTable != null) {
      var fields = {"requirementDetailsID": 0, "fK_AccountID": 0};
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAppliedForRequirementCompany,
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

  void setGenderValue(int? value) {
    genderValue = value;
  }
}
