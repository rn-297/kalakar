import 'package:get/get.dart';
import 'package:kalakar/views/auth/forgot_password.dart';
import 'package:kalakar/views/auth/login_page.dart';
import 'package:kalakar/views/bottom_navigation/bottom_navigator.dart';

import '../views/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String login = '/kalakar_login';
  static const String createAccount = '/kalakar_create_account';
  static const String bottomNavigationPage = '/kalakar_bottom_navigation';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: login,
      page: () => AuthPage(),
    ),
    GetPage(
      name: createAccount,
      page: () => ForgotPasswordPage(),
    ),
    GetPage(
      name: bottomNavigationPage,
      page: () => BottomNavigatorPage(),
    ),
  ];
}
