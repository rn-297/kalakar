import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../utils/kalakar_constants.dart';

class ArtistProfileController extends GetxController{
  Future<void> saveArtistProfile()async {
    final body = <String, dynamic>{};
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
    body['ProfilePic'] = '';



    var response = await ApiClient.postData(KalakarConstants.saveArtistProfileApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );

    }
  }

  Future<void> saveArtistProfileEducation()async {
    final body = <String, dynamic>{};
    body['ArtistProfile_EducationID'] = '';
    body['FK_AccountID'] = '';
    body['EducationType'] = '';
    body['UniversityOrInstitute'] = '';
    body['Course'] = '';
    body['Specialization'] = '';
    body['Coursetype'] = '';
    body['CourseStartDate'] = '';
    body['CourseEndDate'] = '';
    body['Score'] = '';




    var response = await ApiClient.postData(KalakarConstants.saveArtistProfileApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );

    }
  }

  Future<void> saveArtistProfileHobbies()async {
    final body = <String, dynamic>{};
    body['ArtistProfile_hobbiesID'] = '';
    body['FK_AccountID'] = '';
    body['HobbyName'] = '';


    var response = await ApiClient.postData(KalakarConstants.saveArtistProfileApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );

    }
  }

  Future<void> saveArtistProfileInterest()async {
    final body = <String, dynamic>{};
    body['ArtistProfile_InterestID'] = '';
    body['FK_AccountID'] = '';
    body['FK_InterstedListMasterID'] = '';




    var response = await ApiClient.postData(KalakarConstants.saveArtistProfileApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );

    }
  }

  Future<void> saveArtistProfileComfortableIn()async {
    final body = <String, dynamic>{};
    body['ArtistProfile_ComfortableInID'] = '';
    body['FK_AccountID'] = '';
    body['FK_ComfortableListMasterID'] = '';
    body['UniversityOrInstitute'] = '';
    body['Course'] = '';
    body['Specialization'] = '';
    body['Coursetype'] = '';
    body['CourseStartDate'] = '';
    body['CourseEndDate'] = '';
    body['Score'] = '';
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
    body['ProfilePic'] = '';



    var response = await ApiClient.postData(KalakarConstants.saveArtistProfileApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );

    }
  }

  Future<void> saveArtistProfileApplyFor()async {
    final body = <String, dynamic>{};
    body['ArtistProfile_ApplyForID'] = '';
    body['FK_AccountID'] = '';
    body['FK_ApplyListMasterID'] = '';




    var response = await ApiClient.postData(KalakarConstants.saveArtistProfileApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );

    }
  }

  Future<void> saveArtistProfileDocuments()async {
    final body = <String, dynamic>{};
    body['ArtistProfile_DocumentsID'] = '';
    body['FK_AccountID'] = '';
    body['UserID'] = '';
    body['Passport'] = '';
    body['FileCorporationCard'] = '';
    body['AdharCard'] = '';





    var response = await ApiClient.postData(KalakarConstants.saveArtistProfileApi, body);
    // print(response.statusCode);
    // print(response);

    if (response.statusCode == 200) {
      // print("response successful ${response.body}");
      // Get.defaultDialog(
      //   content: Text("response successful ${response.body}"),
      // );

    }
  }

  Future<void> saveArtistProfileExperience()async {
    final body = <String, dynamic>{};
    body['UserID'] = '';
    body['ArtistProfile_ExperienceID'] = '';
    body['FK_AccountID'] = '';
    body['CompanyName'] = '';
    body['RoleName'] = '';
    body['StartDate'] = '';
    body['EndDate'] = '';
    body['SkillUsed'] = '';
    body['RoleProfile'] = '';
    body['RoleImage'] = '';
    body['RoleVideo'] = '';





    var response = await ApiClient.postData(KalakarConstants.saveArtistProfileApi, body);
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