import 'package:get/get.dart';
import 'package:kalakar/views/auth/forgot_password.dart';
import 'package:kalakar/views/auth/login_page.dart';
import 'package:kalakar/views/bottom_navigation/bottom_navigator.dart';
import 'package:kalakar/views/bottom_navigation/company/company_profile_form.dart';
import 'package:kalakar/views/bottom_navigation/company/company_profile_verification_form.dart';
import 'package:kalakar/views/requirement/requirement_form.dart';

import '../views/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/kalakar_splash';
  static const String login = '/kalakar_login';
  static const String forgotPassword = '/kalakar_forgot_password';
  static const String bottomNavigationPage = '/kalakar_bottom_navigation';
  static const String requirementFormPage = '/kalakar_requirement_form';
  static const String companyProfileFormPage = '/kalakar_company_form';
  static const String companyProfileVerificationFormPage = '/kalakar_company_profile_verification_form';

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
      name: forgotPassword,
      page: () => ForgotPasswordPage(),
    ),
    GetPage(
      name: bottomNavigationPage,
      page: () => BottomNavigatorPage(),
    ),
    GetPage(
      name: requirementFormPage,
      page: () => RequirementFormPage(),
    ),
    GetPage(
      name: companyProfileFormPage,
      page: () => CompanyProfileFormPage(),
    ),
    GetPage(
      name: companyProfileVerificationFormPage,
      page: () => CompanyProfileVerificationFormPage(),
    ),
  ];

}
