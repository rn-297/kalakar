import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/views/bottom_navigation/kalakar_home.dart';
import 'package:kalakar/views/bottom_navigation/kalakar_profile.dart';
import 'package:kalakar/views/bottom_navigation/opportunity_page.dart';
import 'package:kalakar/views/settings/settings_page.dart';

class BottomNavigationController extends GetxController{

  int selectedIndex=0;
  List<Widget> navigatorPages=<Widget>[KalakarHomePage(),OpportunityPage(),KalakarProfilePage(),SettingsPage()];
  getSelectedIndex() {
    return selectedIndex;
  }

  setSelectedIndex( int index){
    selectedIndex=index;
    update();
  }

  Widget getSelectedPage() {
    return navigatorPages.elementAt(selectedIndex);
  }

}