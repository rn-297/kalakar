import 'package:get/get.dart';
import 'package:kalakar/views/auth/create_account_page.dart';
import 'package:kalakar/views/auth/login_page.dart';

import '../views/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String login = '/kalakar_login';
  static const String createAccount = '/kalakar_create_account';
  static const String homePage = '/kalakar_home_page';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: createAccount,
      page: () => CreateAccountPage(),
    ),
  ];
}
