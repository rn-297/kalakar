import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/local_database/hive_service.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/utils/kalakar_constants.dart';
import 'package:kalakar/views/bottom_navigation/company_home.dart';
import 'package:kalakar/views/bottom_navigation/company_profile.dart';
import 'package:kalakar/views/bottom_navigation/kalakar_home.dart';
import 'package:kalakar/views/bottom_navigation/kalakar_profile.dart';
import 'package:kalakar/views/bottom_navigation/opportunity_page.dart';
import 'package:kalakar/views/settings/settings_page.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;
  String accountType = "Company";
   List<Widget> navigatorArtistPages = <Widget>[
    KalakarHomePage(),
    OpportunityPage(),
    KalakarProfilePage(),
    SettingsPage()
  ];

  @override
  onInit() {
    super.onInit();
    getLogiData();
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
      tempList.add(KalakarHomePage());
    } else if (accountType == KalakarConstants.company) {
      tempList.add(CompanyProfilePage());
    }
    tempList.addAll([OpportunityPage(), KalakarProfilePage(), SettingsPage()]);
    navigatorArtistPages=tempList;
    return navigatorArtistPages.elementAt(selectedIndex);
  }

  void getLogiData() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    print(loginTable!.accountID!);
  }
}
