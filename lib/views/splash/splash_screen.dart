import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/auth_page_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthPageController authPageController = Get.put(AuthPageController());
    authPageController.splashScreenTask(authPageController);
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/app_logo2.PNG"),
      ),
    );
  }
}
