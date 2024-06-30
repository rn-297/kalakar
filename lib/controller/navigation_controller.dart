import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/views/bottom_navigation/company_home.dart';
import 'package:kalakar/views/bottom_navigation/company_profile.dart';
import 'package:kalakar/views/bottom_navigation/kalakar_home.dart';
import 'package:kalakar/views/bottom_navigation/kalakar_profile.dart';
import 'package:kalakar/views/bottom_navigation/opportunity_page.dart';
import 'package:kalakar/views/settings/settings_page.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;
  List<Widget> navigatorArtistPages = <Widget>[
    KalakarHomePage(),
    OpportunityPage(),
    KalakarProfilePage(),
    SettingsPage()
  ];
  List<Widget> navigatorCompanyPages = <Widget>[
    CompanyHomePage(),
    OpportunityPage(),
    CompanyProfilePage(),
    SettingsPage()
  ];

  getSelectedArtistIndex() {
    return selectedIndex;
  }

  setSelectedArtistIndex(int index) {
    selectedIndex = index;
    update();
  }

  Widget getSelectedArtistPage() {
    return navigatorArtistPages.elementAt(selectedIndex);
  }
  getSelectedCompanyIndex() {
    return selectedIndex;
  }

  setSelectedCompanyIndex(int index) {
    selectedIndex = index;
    update();
  }

  Widget getSelectedCompanyPage() {
    return navigatorCompanyPages.elementAt(selectedIndex);
  }
}
