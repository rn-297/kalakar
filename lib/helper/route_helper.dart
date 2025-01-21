import 'package:get/get.dart';
import 'package:kalakar/helper/file_viewer/file_viewer.dart';
import 'package:kalakar/views/auth/forgot_password.dart';
import 'package:kalakar/views/auth/google_new_user_page.dart';
import 'package:kalakar/views/auth/login_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_apply_for_form_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_comfortable_in_form_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_documents_form_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_education_form.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_experience_form_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_hobbies_form_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_interest_form_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_more_info_view_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_portfolio_form_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_profile_form_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/artist_search_requirement_page.dart';
import 'package:kalakar/views/bottom_navigation/artist/favourites_requirements_page.dart';
import 'package:kalakar/views/bottom_navigation/bottom_navigator.dart';
import 'package:kalakar/views/bottom_navigation/company/all_projects_page.dart';
import 'package:kalakar/views/bottom_navigation/company/applied_profiles_page.dart';
import 'package:kalakar/views/bottom_navigation/company/artist_profile_view_page.dart';
import 'package:kalakar/views/bottom_navigation/company/company_profile_form.dart';
import 'package:kalakar/views/bottom_navigation/company/company_more_info.dart';
import 'package:kalakar/views/bottom_navigation/company/company_project_view_page.dart';
import 'package:kalakar/views/bottom_navigation/company/company_search_artist_page.dart';
import 'package:kalakar/views/bottom_navigation/company/new_project_form.dart';
import 'package:kalakar/views/bottom_navigation/pay_and_verify.dart';
import 'package:kalakar/views/bottom_navigation/upcoming_project_list_all_page.dart';
import 'package:kalakar/views/requirement/requirement_form.dart';
import 'package:kalakar/views/requirement/requirement_view_page.dart';
import 'package:kalakar/views/requirement/review_view_page.dart';
import 'package:kalakar/views/requirement/upcoming_projects_view_page.dart';
import 'package:kalakar/views/settings/about_us_page.dart';
import 'package:kalakar/views/settings/help_page.dart';
import 'package:kalakar/views/settings/my_applications_page.dart';
import 'package:kalakar/views/settings/notifications_page.dart';
import 'package:kalakar/views/settings/privacy_policy_page.dart';
import 'package:kalakar/views/settings/referral_code_page.dart';
import 'package:kalakar/views/settings/terms_and_conditions_page.dart';

import '../views/bottom_navigation/company_profile.dart';
import '../views/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/kalakar_splash';
  static const String login = '/kalakar_login';
  static const String forgotPassword = '/kalakar_forgot_password';
  static const String bottomNavigationPage = '/kalakar_bottom_navigation';
  static const String requirementFormPage = '/kalakar_requirement_form';
  static const String companyProfileFormPage = '/kalakar_company_form';
  static const String companyProfilePage = '/kalakar_company_profile_page';
  static const String companyMoreInfoFormPage =
      '/kalakar_company_more_info_form';
  static const String newProjectFormPage = '/kalakar_new_project_form';
  static const String fileViewer = '/kalakar_file_viewer';
  static const String allProjects = '/kalakar_all_projects';
  static const String artistProfileForm = '/kalakar_artist_profile_form';
  static const String artistComfortableInForm =
      '/kalakar_artist_comfortable_in_form';
  static const String artistDocumentForm = '/kalakar_artist_document_form';
  static const String artistEducationForm = '/kalakar_artist_Education_form';
  static const String artistMoreInfoViewPage = '/kalakar_artist_more_info_view_page';
  static const String artistExperienceForm = '/kalakar_artist_experience_form';
  static const String artistInterestForm = '/kalakar_artist_interest_form';
  static const String artistPortfolio = '/kalakar_artist_portfolio_form';
  static const String artistHobbiesForm = '/kalakar_artist_Hobbies_form';
  static const String aboutUsPage = '/kalakar_about_us';
  static const String helpPage = '/kalakar_help';
  static const String privacyPolicyPage = '/kalakar_privacy_policy';
  static const String myApplicationsPage = '/kalakar_my_applications';
  static const String myFavouritesPage = '/kalakar_my_favourites';
  static const String termsAndConditionsPage = '/kalakar_terms_and_conditions';
  static const String referralCodePage = '/kalakar_referral_code';
  static const String notificationPage = '/kalakar_notification_page';
  static const String requirementViewPage = '/kalakar_requirement_view';
  static const String applyForFormPage = '/kalakar_apply_for_form';
  static const String upcomingProjectViewPage = '/kalakar_upcoming_project_view';
  static const String companyProjectViewPage = '/kalakar_company_project_view';
  static const String upcomingProjectListAllPage = '/kalakar_upcoming_project_list_all';
  static const String reviewViewPage = '/kalakar_review_view';
  static const String appliedProfilesPage = '/kalakar_applied_profiles';
  static const String artistProfileViewPage = '/kalakar_artist_profile_view';
  static const String artistSearchRequirementPage = '/kalakar_artist_search_requirement';
  static const String companySearchArtistPage = '/kalakar_company_search_artist';
  static const String googleNewUserPage = '/kalakar_google_new_user_page';
  static const String payAndVerifyPage = '/kalakar_pay_and_verify_page';

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
      name: companyProfilePage,
      page: () => CompanyProfilePage(),
    ),
    GetPage(
      name: companyProfileFormPage,
      page: () => CompanyProfileFormPage(),
    ),
    GetPage(
      name: companyMoreInfoFormPage,
      page: () => CompanyMoreInfoFormPage(),
    ),
    GetPage(
      name: newProjectFormPage,
      page: () => NewProjectFormPage(),
    ),
    GetPage(
      name: fileViewer,
      page: () => ViewFilePage(),
    ),
    GetPage(
      name: companyProjectViewPage,
      page: () => CompanyProjectsViewPage(),
    ),
    GetPage(
      name: allProjects,
      page: () => AllProjectsPage(),
    ),
    GetPage(
      name: artistProfileForm,
      page: () => ArtistProfileFormPage(),
    ),
    GetPage(
      name: artistComfortableInForm,
      page: () => ArtistComfortableInFormPage(),
    ),
    GetPage(
      name: artistDocumentForm,
      page: () => ArtistDocumentsFormPage(),
    ),
    GetPage(
      name: artistEducationForm,
      page: () => ArtistEducationFormPage(),
    ),
    GetPage(
      name: artistExperienceForm,
      page: () => ArtistExperienceFormPage(),
    ),
    GetPage(
      name: artistHobbiesForm,
      page: () => ArtistHobbiesFormPage(),
    ),
    GetPage(
      name: artistInterestForm,
      page: () => ArtistInterestFormPage(),
    ),
    GetPage(
      name: artistPortfolio,
      page: () => ArtistPortfolioFormPage(),
    ),
    GetPage(
      name: aboutUsPage,
      page: () => AboutUsPage(),
    ),
    GetPage(
      name: helpPage,
      page: () => HelpPage(),
    ),
    GetPage(
      name: privacyPolicyPage,
      page: () => PrivacyPolicyPage(),
    ),
    GetPage(
      name: termsAndConditionsPage,
      page: () => TermsAndConditionsPage(),
    ),
    GetPage(
      name: referralCodePage,
      page: () => ReferralCodePage(),
    ),
    GetPage(
      name: requirementViewPage,
      page: () => RequirementViewPage(),
    ),
    GetPage(
      name: myApplicationsPage,
      page: () => MyApplicationsPage(),
    ),
    GetPage(
      name: applyForFormPage,
      page: () => ArtistApplyForFormPage(),
    ),
    GetPage(
      name: upcomingProjectViewPage,
      page: () => UpcomingProjectsViewPage(),
    ),
    GetPage(
      name: reviewViewPage,
      page: () => ReviewViewPage(),
    ),

    GetPage(
      name: RouteHelper.notificationPage,
      page: () => NotificationsPage(),
    ),

    GetPage(
      name: RouteHelper.appliedProfilesPage,
      page: () => AppliedProfilesPage(),
    ),
    GetPage(
      name: RouteHelper.artistProfileViewPage,
      page: () => ArtistProfileViewPage(),
    ),
    GetPage(
      name: RouteHelper.artistSearchRequirementPage,
      page: () => ArtistSearchRequirementPage(),
    ),
    GetPage(
      name: RouteHelper.companySearchArtistPage,
      page: () => CompanySearchArtistPage(),
    ),
    GetPage(
      name: RouteHelper.myFavouritesPage,
      page: () => FavouritesRequirementsPage(),
    ),
    GetPage(
      name: RouteHelper.upcomingProjectListAllPage,
      page: () => UpcomingProjectListAllPage(),
    ),
    GetPage(
      name: RouteHelper.googleNewUserPage,
      page: () => GoogleNewUserPage(),
    ),
    GetPage(
      name: RouteHelper.artistMoreInfoViewPage,
      page: () => ArtistMoreInfoViewPage(),
    ),

    GetPage(
      name: RouteHelper.payAndVerifyPage,
      page: () => PayAndVerifyPage(),
    ),
  ];
}
