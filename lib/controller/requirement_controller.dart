import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../utils/kalakar_constants.dart';

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
  TextEditingController fbLinkTEController = TextEditingController();
  TextEditingController wpLinkTEController = TextEditingController();
  TextEditingController ytLinkTEController = TextEditingController();
  TextEditingController instaLinkTEController = TextEditingController();
  TextEditingController emailLinkTEController = TextEditingController();
  TextEditingController websiteLinkTEController = TextEditingController();

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
  }String? lookingForValidator(String? value) {
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
  }String? ageValidator(String? value) {
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
  }String? heightValidator(String? value) {
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
  }String? bodyTypeValidator(String? value) {
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
  }String? splSkillsRequiredValidator(String? value) {
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
  }String? scriptForAuditionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Script For Audition';
    }
    return null;
  }

  String? fbLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }String? wpLinkTitleValidator(String? value) {
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
  }String? instaLinkValidator(String? value) {
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


  saveRequirementsDetails()async {

    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
      Map<String, String> fields = {
        'UserID': "",
        'RequirementDetailsID': "0",
        'FK_AccountID': "",
        'FK_CompanyProfileID': "",
        'FK_RequirementStatusMasterID': "",
        'RequirementTitle': "",
        'RequirementDescription': "",
        'LookingFor': "",
        'NUmberOfOpenings': "",
        'Gender': "",
        'Age': "",
        'Language': "",
        'Height': "",
        'Weight': "",
        'HairColor': "",
        'BodyType': "",
        'Experiences': "",
        'ShootingStartDate': "",
        'ShootingEndDate': "",
        'ShootingLocation': "",
        'DefineRole': "",
        'SpecialSkillRequired': "",
        'ComfortableIn': "",
        'ScriptForAuditions': "",
        'RequirementEndDate': "",
        'FBLink': "",
        'WPLink': "",
        'YTLink': "",
        'Instalink': "",
        'EmailLink': "",
        'WebsiteLink': "",
        'RefPhotoName': "",
        'Salary': "",
        'SalaryType': "",
      };
      print(fields);

      // Example files (if any)
      Map<String, File> files = {
        'RefPhoto_Doc': File(""),
      };

      var response = await ApiClient.postFormDataToken(
          KalakarConstants.saveRequirementsDetailsApi,
          fields,
          files,
          loginTable.token);

      if (response.statusCode == 200) {}else{

      }
    }
  }

  deleteRequirement()async{
    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
      var fields = {
        'userID': loginTable.userID,
        "requirementDetailsID": "0",
        "fK_AccountID": "0",
        "fK_CompanyProfileID": "0"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.deleteRequirementsDetailsApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {}else{

      }
    }
  }

  getRequirementDetailsCompany()async{
    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
      var fields = {
        "userID": "string",
        "requirementDetailsID": "0",
        "fK_AccountID": "0",
        "fK_CompanyProfileID": "0"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getRequirementsDetailsCompanyApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {}else{

      }
    }
  }

  searchRequirementDetailsArtist()async{
    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
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
      if (response.statusCode == 200) {}else{

      }
    }
  }

  saveAppliedToRequirement()async{
    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
      var fields = {
        "artistAppliedForRequirementTransID": "0",
        "fK_RequirementDetailsID": "0",
        "fK_AccountID": "0"
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.saveAppliedToRequirementApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {}else{

      }
    }
  }
  saveChangesAppliedRequirementStatus()async{
    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
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
      if (response.statusCode == 200) {}else{

      }
    }
  }

  addRequirementInFavorites()async{
    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
      var fields = {
        "artistFavoritesRequirementTransID": 0,
        "fK_RequirementDetailsID": 0,
        "fK_AccountID": 0
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.addRequirementInFavoritesApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {}else{

      }
    }
  }


  getAppliedForRequirementArtist()async{
    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
      var fields = {
        "requirementDetailsID": 0,
        "fK_AccountID": 0
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAppliedForRequirementArtistApi,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {}else{

      }
    }
  }

  getAppliedForRequirementCompany()async{
    LoginTable? loginTable = await HiveService.getLoginData();

    if(loginTable!=null){
      var fields = {
        "requirementDetailsID": 0,
        "fK_AccountID": 0
      };
      var response = await ApiClient.postDataToken(
          KalakarConstants.getAppliedForRequirementCompany,
          jsonEncode(fields),
          loginTable.token);
      if (response.statusCode == 200) {}else{

      }
    }
  }
}
