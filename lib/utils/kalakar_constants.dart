class KalakarConstants {
  //API
  //auth apis
  // static const String baseURL="http://ec2-3-111-135-189.ap-south-1.compute.amazonaws.com";
  static const String baseURL = "http://3.111.135.189";
  static const String getCreateAccountOtp = "/Account/CreateAccountGetOTP";
  static const String createAccountApi = "/Account/CreateAccount";
  static const String getForgotPasswordOtpApi = "/Account/ForgotPasswordGetOTP";
  static const String setNewPasswordApi = "/Account/SetForgotPassword";
  static const String getChangePasswordApi = "/Account/ChangePassword";
  static const String getLoginApi = "/Account/AccountLogin";
  static const String noInternetMessage = "No Internet Connection !!!";

  //artist profile api
  static const String saveArtistProfileApi = "/SaveArtistProfile";
  static const String saveArtistProfileEducationApi =
      "/SaveArtistProfile_Education";
  static const String saveArtistProfileHobbiesApi =
      "/SaveArtistProfile_Hobbies";
  static const String saveArtistProfileInterestsApi =
      "/SaveArtistProfile_Interest";
  static const String saveArtistProfileComfortableInApi =
      "/SaveArtistProfile_ComfortableIn";
  static const String saveArtistProfileApplyForApi = "/ArtistProfile_ApplyFor";
  static const String saveArtistProfileDocumentsApi = "/ArtistProfile_ApplyFor";
  static const String saveArtistProfileExperienceApi =
      "/SaveArtistProfile_Experience";

  //company profile apis
  static const String saveCompanyProfileBasicsApi =
      "/CompanyProfile/SaveBasicCompanyProfile";
  static const String sendCompanyProfileForVerificationApi =
      "/CompanyProfile/SendProfileForVerification";
  static const String getCompanyProfileContactVerificationOtpApi =
      "/CompanyProfile/GetOTPVerificationCompanyContacts";
  static const String verifyCompanyProfileContactsApi =
      "/CompanyProfile/VerifyCompanyContacts";
  static const String saveCompanyProfileMoreInfoApi =
      "/CompanyProfile/VerifyCompanyContacts";
  static const String getCompanyProfileDetailsApi =
      "/CompanyProfile/GetCompanyProileDetails";
  static const String saveCompanyProfileProjectApi =
      "/CompanyProfile/SaveCompanyProject";
  static const String deleteCompanyProfileProjectApi =
      "/CompanyProfile/DeleteCompanyProject";
  static const String deleteCompanyProfileProjectDocumentApi =
      "/CompanyProfile/DeleteCompanyProject_Documents";
  static const String getCompanyProfileProjectsApi =
      "/CompanyProfile/GetCompanyProjects";
  static const String getCompanyProfileProjectDocumentsApi =
      "/CompanyProfile/GetCompanyProjects";

  //requirement details apis
  static const String saveRequirementsDetailsApi = "/SaveRequirementDetails";
  static const String deleteRequirementsDetailsApi =
      "/DeleteRequirementDetails";
  static const String getRequirementsDetailsCompanyApi =
      "/RequirementDetails_Company";
  static const String searchRequirementsDetailsArtistsApi =
      "/SearchRequirementDetails_Artist";

  //Strings
  static const String usernameHint = "E-mail Id or Contact Number";
  static const String passwordHint = "Password";
  static const String login = "Log In";
  static const String forgotPassword = "Forgot Password?";
  static const String createAccount = "Create Account";
  static const String fieldName = "Field Name";
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String whatsappNumber = "WhatsApp Number";
  static const String email = "Email";
  static const String artist = "Artist";
  static const String company = "Company";
  static const String password = "Password";
  static const String cnfmPassword = "Confirm Password";
  static const String userName = "User Name";
  static const String referralCode = "Referral Code";
  static const String getStarted = "Sign Up";
  static const String resetPass = "Reset Password";
  static const String userType = "User Type";
  static const String enterOtp = "Enter OTP";
  static const String getOtp = "Get Otp";
  static const String orSignupWith = "Or sign up with";
  static const String welcomeBack = "Welcome back";
  static const String newKalakaarAccount = "New Kalakaar Account";
  static const String signIn = "Sign In";
  static const String orSignInWith = "Or sign in with";
  static const String continueWithGoogle = "Continue with Google";
  static const String signupText =
      "Let's get started by filling out the form below.";
  static const String sigInText =
      "Fill out the information below in order to access your account";
  static const String kalakaar = "KALAKAAR";
  static const String home = "Home";
  static const String profile = "Profile";
  static const String profile1 = "PROFILE";
  static const String settings = "Settings";
  static const String opportunities = "Opportunities";
  static const String opportunitiesText = "1st Step To Prove Yourself";
  static const String opportunities1 = "OPPORTUNITIES";
  static const String namskarKalakar = "Namskar Kalakaar";
  static const String searchAnything = "Search Anything";
  static const String searchArtist = "SEARCH ARTIST";
  static const String newOpportunities = "New Opportunities :";
  static const String seeAll = "See all >>";
  static const String upcomingProjects = "Upcoming Projects :";
  static const String reviews = "REVIEWS :";
  static const String portfolio = "PORTFOLIO :";
  static const String experienceLevel = "Experience Level";
  static const String moreInfo = "More Info";
  static const String experience = "EXPERIENCE :";
  static const String age = "Age";
  static const String height = "Height";
  static const String weight = "Weight";
  static const String bio = "Bio :";
  static const String city = "City";
  static const String district = "District";
  static const String state = "State";
  static const String kalakarId = "Kalakaar ID :";
  static const String openOpportunities = "Open Opportunities";
  static const String appliedArtist = "Applied Artist";
  static const String createNewOpportunity = "CREATE NEW OPPORTUNITY";
  static const String completedOpportunities = "CREATE NEW OPPORTUNITY";
  static const String draft = "Draft";
  static const String completed = "Completed";
  static const String edit = "Edit";

  //settings
  static const String myProfile = "My Profile";
  static const String myApplications = "My Applications";
  static const String myFavourites = "My Favourites";
  static const String aboutUs = "About Us";
  static const String help = "Help";
  static const String privacyPolicy = "Privacy Policy";
  static const String termsNConditions = "Terms & Conditions";
  static const String referralCode1 = "REFERRAL CODE";
  static const String followUsOn = "Follow us on";
  static const String appVersion = "App Version";
  static const String logout = "Log Out";

  //requirements
  static const String requirement = "REQUIREMENT";
  static const String requirementTitle = "Requirement Title";
  static const String description = "Description";
  static const String lookingFor = "Looking For";
  static const String noOfOpenings = "Number Of Openings";
  static const String gender = "Gender";
  static const String language = "Language";
  static const String hairColor = "Hair Color";
  static const String bodyType = "Body Type";
  static const String experiences = "Experiences";
  static const String startDate = "Start Date";
  static const String endDate = "End Date";
  static const String shootingLocation = "Shooting Location";
  static const String defineRole = "Define Role";
  static const String specialSkillRequired = "Special Skill Required";
  static const String comfortableIn = "Comfortable In";
  static const String scriptForAudition = "Script For Audition";
  static const String requirementEndDate = "Requirement End Date";
  static const String fbLink = "FB Link";
  static const String wpLink = "WP Link";
  static const String ytLink = "YT Link";
  static const String instaLink = "Insta Link";
  static const String emailLink = "Email Link";
  static const String websiteLink = "Website Link";
  static const String uploadRefPhoto = "Upload Ref Photo";
  static const String saveAsDraft = "Save as Draft";
  static const String publish = "Publish";

  //Profile
  static const String companyName = "Company Name / Production House";
  static const String authoriseAdminName = "Authorise Admin Name";
  static const String address = "Address";
  static const String pinCode = "Postal Code / PIN Code";
  static const String whatsappLink = "WhatsApp Link";
  static const String sendProfileForVerification =
      "Send Profile For Verification";
  static const String mobileNumber = "Mobile Number";
  static const String saveProfile = "Save Profile";
  static const String profileVerification = "Profile Verification";
  static const String otp = "OTP";
  static const String adminCeo = "Admin/CEO";
  static const String filmCorporationCard = "Film Corporation Card";
  static const String adminAadharCard = "Admin Aadhar Card";
  static const String selfieUpload = "Selfie Upload";
  static const String addressProofOfCompany = "Address Proof of Company";
  static const String verifyContact = "Verify Contact";
  static const String saveChanges = "Save Changes";
  static const String viewAll = "View All";
  static const String createProject = "Create Project";
  static const String projectCover = "Project Cover";
  static const String projectTitle = "Project Title";
  static const String projectDescription = "Project Description";
  static const String projectStatus = "Project Status";
  static const String addPhotosAndVideos = "Add Photos And Videos";

}
