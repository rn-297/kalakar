import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/controller/settings_controller.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:kalakar/views/bottom_navigation/company_home.dart';
import 'package:kalakar/views/bottom_navigation/company_profile.dart';
import 'package:kalakar/views/bottom_navigation/kalakar_home.dart';
import 'package:kalakar/views/bottom_navigation/artist/kalakar_profile.dart';
import 'package:kalakar/views/bottom_navigation/opportunity_page.dart';
import 'package:kalakar/views/settings/settings_page.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;
  int homeCount = 0;
  int profileCount = 0;
  int opportunityCount = 0;
  int settingsCount = 0;
  String accountType = "Company";
  List<Widget> navigatorArtistPages = <Widget>[];
  ArtistProfileController artistProfileController =
      Get.put(ArtistProfileController());
  RequirementController requirementController =
      Get.put(RequirementController());
  SettingsController settingsController = Get.put(SettingsController());
  ProfileController companyProfileController = Get.put(ProfileController());

  @override
  onInit() {
    super.onInit();
    getLoginData();
  }

  getSelectedArtistIndex() {
    return selectedIndex;
  }

  setSelectedArtistIndex(int index) {
    selectedIndex = index;
    update();
  }

  Widget getSelectedArtistPage() {
    List<Widget> tempList = [];

    if (accountType == KalakarConstants.artist) {
      print("here1");
      tempList.addAll([
        KalakarHomePage(),
        OpportunityPage(),
        KalakarProfilePage(),
        SettingsPage()
      ]);
      print(selectedIndex);
      print(homeCount);

      if (selectedIndex == 0 && homeCount == 0) {
        print("here");
        requirementController.getArtistHomeRequirementDetails(false);
        requirementController.getUpcomingProjectsDetails();
        requirementController.getReviewDetails();
        homeCount = 1;
      } else if (selectedIndex == 1 && opportunityCount == 0) {
        requirementController.getArtistHomeRequirementDetails(true);
        opportunityCount = 1;
      } else if (selectedIndex == 2 && profileCount == 0) {
        artistProfileController.getArtistProfileMaster();
        artistProfileController.getArtistProfileBasic();

        artistProfileController.getArtistExperience(0);
        artistProfileController.getArtistPortFolio(0);
        artistProfileController.getStateData();
        profileCount = 1;
      } else if (selectedIndex == 3 && settingsCount == 0) {
        requirementController.getAppliedForRequirementArtist(0);
        requirementController.getArtistRequirementInFavorites(0);
      }
    } else if (accountType == KalakarConstants.company) {
      tempList.addAll([
        CompanyHomePage(),
        OpportunityPage(),
        CompanyProfilePage(),
        SettingsPage()
      ]);

      if (selectedIndex == 0 && homeCount == 0) {
        // requirementController.getUpcomingProjectsDetails();
        // requirementController.getReviewDetails();
        requirementController.getRequirementDetailsCompany(0);
        requirementController.artistProfileMaster();
        companyProfileController.getCompanyName();
        opportunityCount = 1;
        homeCount = 1;
      } else if (selectedIndex == 1 && opportunityCount == 0) {
      } else if (selectedIndex == 2 && profileCount == 0) {
        ProfileController profileController = Get.put(ProfileController());
        print("object getrequireddata");
        profileController.getRequireData();
        profileCount = 1;
      }
    }
    if (selectedIndex == 3 && settingsCount == 0) {
      settingsController.setSettingsList();
      settingsController.getSettingsData();
      settingsController.getNotificationData();
      settingsController.getReferralData();
      settingsCount = 1;
    }

    tempList.addAll([]);
    navigatorArtistPages = tempList;
    update();
    return navigatorArtistPages.elementAt(selectedIndex);
  }

  void getLoginData() async {
    try {
      LoginTable? loginTable = await HiveService.getLoginData();
      print("account  type ${loginTable!.accountType ?? ""!}");
      accountType = loginTable!.accountType ?? "";
      homeCount = 0;
      profileCount = 0;
      opportunityCount = 0;
      settingsCount = 0;
      update();
    } catch (e) {
      print(e);
    }
  }
}
