class KalakarConstants {
  //API
  //auth apis
  // static const String baseURL="http://ec2-3-111-135-189.ap-south-1.compute.amazonaws.com";
  // static const String baseURL = "http://superadmin.kalakarapp.com/api";
  static const String baseURL = "https://superadmin.kalakarapp.com/api";
  // static const String baseURL = "http://13.126.226.68/api";
  // static const String baseURL = "https://2f9c-3-111-135-189.ngrok-free.app";
  static const String getCreateAccountOtp = "/Account/CreateAccountGetOTP";
  static const String createAccountApi = "/Account/CreateAccount";
  static const String getForgotPasswordOtpApi = "/Account/ForgotPasswordGetOTP";
  static const String setNewPasswordApi = "/Account/SetForgotPassword";
  static const String getChangePasswordApi = "/Account/ChangePassword";
  static const String getLoginApi = "/Account/AccountLogin";
  static const String getGoogleLoginApi = "/Account/AccountLogin_Google";
  static const String getCreateGoogleLoginApi = "/Account/CreateAccount_Google";
  static const String noInternetMessage = "No Internet Connection !!!";
  static const String somethingWentWrongMsg = "Something Went Wrong";

  //file paths

  static const String profilePath = "kalaakar/profile_docs/";

  //artist profile api
  static const String checkTokenExpired = "/Account/Check_TokenIsExpiredOrNot";
  static const String saveArtistProfileApi = "/ArtistProfile/SaveArtistProfile";
  static const String artistProfileMasterApi =
      "/ArtistProfile/ArtistProfile_Master";
  static const String saveArtistProfileEducationApi =
      "/ArtistProfile/SaveArtistProfile_Education";
  static const String saveArtistProfileHobbiesApi =
      "/ArtistProfile/SaveArtistProfile_Hobbies";
  static const String saveArtistProfileInterestsApi =
      "/ArtistProfile/SaveArtistProfile_Interest";
  static const String saveArtistProfileComfortableInApi =
      "/ArtistProfile/SaveArtistProfile_ComfortableIn";
  static const String saveArtistProfileApplyForApi =
      "/ArtistProfile/ArtistProfile_ApplyFor";
  static const String saveArtistProfileDocumentsApi =
      "/ArtistProfile/ArtistProfile_Documents";
  static const String saveArtistProfileExperienceApi =
      "/ArtistProfile/SaveArtistProfile_Experience";
  static const String saveArtistProfilePortfolioApi =
      "/ArtistProfile/SaveArtistProfile_Portfolio";
  static const String getArtistProfileBasicApi =
      "/ArtistProfile/GetArtistProfile_Basic";
  static const String getArtistProfileEducationApi =
      "/ArtistProfile/GetArtistProfile_Education";
  static const String getArtistProfileHobbiesApi =
      "/ArtistProfile/GetArtistProfile_Hobbies";
  static const String getArtistProfileInterestApi =
      "/ArtistProfile/GetArtistProfile_Interest";
  static const String getArtistProfileComfortableInApi =
      "/ArtistProfile/GetArtistProfile_ComfortableIn";
  static const String getArtistProfileApplyForApi =
      "/ArtistProfile/GetArtistProfile_ApplyFor";
  static const String getArtistProfileDocumentsApi =
      "/ArtistProfile/GetArtistProfile_Documents";
  static const String getArtistPortfolioApi =
      "/ArtistProfile/GetArtistProfile_Portfolio";
  static const String getArtistExperienceApi =
      "/ArtistProfile/GetArtistProfile_Experience";
  static const String deleteArtistEducationDataApi =
      "/ArtistProfile/DeleteArtistProfile_Education";
  static const String deleteArtistHobbyDataApi =
      "/ArtistProfile/DeleteArtistProfile_Hobbies";
  static const String deleteArtistComfortableInDataApi =
      "/ArtistProfile/DeleteArtistProfile_ComfortableIn";
  static const String deleteArtistInterestedInDataApi =
      "/ArtistProfile/DeleteArtistProfile_Interest";
  static const String deleteArtistExperienceDataApi =
      "/ArtistProfile/DeleteArtistProfile_Experience";
  static const String deleteArtistPortfolioDataApi =
      "/ArtistProfile/DeleteArtistProfile_Portfolio";
  static const String deleteArtistApplyForDataApi =
      "/ArtistProfile/DeleteArtistProfile_ApplyFor";
  static const String deleteFromFavouritesDataApi =
      "/RequirementDetails/Delete_ArtistFavoritesRequirementTrans";

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
      "/CompanyProfile/SaveMoreInfoCompanyProfile";
  static const String getCompanyProfileDetailsApi =
      "/CompanyProfile/GetCompanyProileDetails";
  static const String saveCompanyProfileProjectApi =
      "/CompanyProfile/SaveCompanyProject";
  static const String deleteCompanyProjectApi =
      "/CompanyProfile/DeleteCompanyProject";
  static const String deleteCompanyProfileProjectDocumentApi =
      "/CompanyProfile/DeleteCompanyProject_Documents";
  static const String getCompanyProfileProjectsApi =
      "/CompanyProfile/GetCompanyProjects";
  static const String getCompanyProfileProjectDocumentsApi =
      "/CompanyProfile/GetCompanyProjects_Documents";
  static const String getProjectStatus = "/CompanyProfile/GetProjectStatus";

  //requirement details apis
  static const String saveRequirementsDetailsApi =
      "/RequirementDetails/SaveRequirementDetails";
  static const String deleteRequirementsDetailsApi =
      "/RequirementDetails/DeleteRequirementDetails";
  static const String getRequirementsDetailsCompanyApi =
      "/RequirementDetails/RequirementDetails_Company";
  static const String searchRequirementsDetailsArtistsApi =
      "/RequirementDetails/SearchRequirementDetails_Artist";
  static const String saveAppliedToRequirementApi =
      "/RequirementDetails/SaveAppliedToRequirement";
  static const String saveChangesAppliedRequirementStatusApi =
      "/RequirementDetails/SaveChangesAppliedRequirementStatus";
  static const String addRequirementInFavoritesApi =
      "/RequirementDetails/AddRequirementInFavorites";
  static const String getAppliedForRequirementArtistApi =
      "/RequirementDetails/GetAppliedForRequirement_Artist";
  static const String getAppliedForRequirementCompanyApi =
      "/RequirementDetails/GetAppliedForRequirement_Company";
  static const String getArtistHomeRequirementsApi =
      "/RequirementDetails/GetRequirementDetails_ArtistHome";
  static const String getArtistHomeUpcomingProjectsApi =
      "/SuperAdmin/GetSuperAdminCompanyProjects";
  static const String getArtistHomeReviewApi =
      "/SuperAdmin/GetApplicationReview";
  static const String getArtistHomeProjectDocumentsApi =
      "/SuperAdmin/GetSuperAdminCompanyProjects_Documents";
  static const String getReferralCodeDetailsApi =
      "/Account/GetReferralCodeDetailsForReferralCode";
  static const String getArtistFavouritesRequirementsApi =
      "/RequirementDetails/GetArtistFavoritesRequirement_Artist";
  static const String useReferralCodeApi = "/Account/UseReferralCode";
  static const String getSettingsDataApi = "/Account/Get_AppSettingsData";
  static const String getNotificationDataApi =
      "/Account/Get_AccountNotification";
  static const String setNotificationDataApi =
      "/Account/Set_AccountNotification";

  static const String searchArtistForCompanyApi =
      "/CompanyProfile/GetSearchArtistProfile_Company";
  static const String getAccountData = "/Account/Get_AccountLogin_Infodata";

  //payment
  static const String initiatePayment = "/SuperAdmin/InitiatePayment";
  static const String getPaymentDetails = "/SuperAdmin/PaymentIntegrationAPIResponse";
  static const String getPaymentAndroidDetails = "/SuperAdmin/GetPaymentDatailsForApp";



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
  static const String emailOrMobile = "Email Or Mobile Number";
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
  static const String saveAndSignIn = "Save And Sign In";
  static const String orSignInWith = "Or sign in with";
  static const String continueWithGoogle = "Continue with Google";
  static const String signupText =
      "Let's get started by filling out the form below.";
  static const String sigInText =
      "Fill out the information below in order to access your account";
  static const String kalakaar = "KALAKAAR";
  static const String home = "Home";
  static const String profile = "Profile";
  static const String artistProfile = "Artist Profile";
  static const String profile1 = "PROFILE";
  static const String settings = "Settings";
  static const String opportunities = "Opportunities";
  static const String opportunity = "Opportunity";
  static const String opportunitiesText = "1st Step To Prove Yourself";
  static const String opportunities1 = "OPPORTUNITIES";
  static const String namskarKalakar = "Namskar Kalakaar";
  static const String searchAnything = "Search Anything";
  static const String searchArtist = "SEARCH ARTIST";
  static const String searchKalakar = "Search Kalakar";
  static const String searchRequirement = "Search Opportunities";
  static const String newOpportunities = "New Opportunities :";
  static const String seeAll = "See all >>";
  static const String upcomingProjects = "Upcoming Projects :";
  static const String upcomingProject = "Upcoming Projects";
  static const String reviews = "REVIEWS :";
  static const String review = "Review";
  static const String portfolio = "PORTFOLIO :";
  static const String portfolio1 = "PORTFOLIO";
  static const String experienceLevel = "Experience Level";
  static const String moreInfo = "More Info";
  static const String experience = "EXPERIENCE :";
  static const String opportunityEndDate = "Opportunity End date";
  static const String age = "Age";
  static const String height = "Height";
  static const String weight = "Weight";
  static const String bio = "Bio :";
  static const String about1 = "About :";
  static const String city = "City";
  static const String district = "District";
  static const String state = "State";
  static const String kalakarId = "Kalakaar ID :";
  static const String companyId = "Company ID :";
  static const String openOpportunities = "Open Opportunities";
  static const String appliedArtist = "Applied Artist";
  static const String createNewOpportunity = "CREATE NEW OPPORTUNITY";
  static const String completedOpportunities = "Completed Opportunities";
  static const String draft = "Draft";
  static const String completed = "Completed";
  static const String personal = "Personal";
  static const String interest = "Interest";
  static const String qualificationNSkills = "Qualification & Skills";
  static const String edit = "Edit";
  static const String other = "Other";

  //settings
  static const String myProfile = "My Profile";
  static const String myApplications = "My Applications";
  static const String myFavourites = "My Favourites";
  static const String about = "ABOUT";
  static const String aboutUs = "About Us";
  static const String help = "Help";
  static const String privacyPolicy = "Privacy Policy";
  static const String termsNConditions = "Terms & Conditions";
  static const String referralCode1 = "REFERRAL CODE";
  static const String followUsOn = "Follow us on";
  static const String appVersion = "App Version";
  static const String logout = "Log Out";
  static const String notifications = "Notifications";

  //requirements
  static const String requirement = "REQUIREMENT";
  static const String requirementTitle = "Requirement Title";
  static const String requirementStatus = "Requirement Status";
  static const String description = "Description";
  static const String referenceLook = "Reference Look";
  static const String script = "Script";
  static const String lookingFor = "Looking For";
  static const String noOfOpenings = "Number Of Openings";
  static const String gender = "Gender";
  static const String language = "Language";
  static const String hairColor = "Hair Color";
  static const String bodyType = "Body Type";
  static const String eyeColor = "Eye Color";
  static const String experiences = "Experiences";
  static const String experience1 = "Experience";
  static const String startDate = "Start Date";
  static const String endDate = "End Date";
  static const String shootingLocation = "Shooting Location";
  static const String searchShootingStartDate = "Search Shooting Start Date";
  static const String searchShootingEndDate = "Search Shooting End Date";
  static const String shootingStartDate = "Shooting Start Date";
  static const String shootingEndDate = "Shooting End Date";
  static const String character = "Character";
  static const String defineRole = "Define Role";
  static const String specialSkillRequired = "Special Skill Required";
  static const String specialSkills = "Special Skills";
  static const String comfortableIn = "Comfortable In";
  static const String scriptForAudition = "Script For Audition";
  static const String requirementEndDate = "Requirement End Date";
  static const String fbLink = "FB Link";
  static const String wpLink = "WP Link";
  static const String ytLink = "YT Link";
  static const String instaLink = "Insta Link";
  static const String emailLink = "Email Link";
  static const String websiteLink = "Website Link";
  static const String salary = "Salary";
  static const String salaryType = "Salary Type";
  static const String uploadRefPhoto = "Upload Ref Photo";
  static const String saveAsDraft = "Save as Draft";
  static const String publish = "Publish";
  static const String createRequirement = "Create Requirement";
  static const String saveRequirement = "Save";
  static const String deleteRequirement = "Delete";
  static const String male = "Male";
  static const String female = "Female";
  static const String apply = "Apply";
  static const String addVideo = "Add Audition Video";
  static const String applied = "Applied";
  static const String appliedProfiles = "Applied Profiles";
  static const String opportunityApplicants = "Opportunity Applicants";
  static const String select = "Select";
  static const String reject = "Reject";
  static const String hold = "Hold";
  static const String selected = "Selected";
  static const String rejected = "Rejected";
  static const String onHold = "On Hold";

  //Profile
  static const String companyName = "Company Name / Production House";
  static const String companyLogo = "Company Logo";
  static const String authoriseAdminName = "Authorise Admin Name";
  static const String address = "Address";
  static const String postalCode = "Postal Code / PIN Code";
  static const String pinCode = "Pin Code";
  static const String whatsappLink = "WhatsApp Link";
  static const String sendProfileForVerification =
      "Send Profile For Verification";
  static const String mobileNumber = "Mobile Number";
  static const String saveProfile = "Save Profile";
  static const String saveEducation = "Save Education";
  static const String profileVerification = "Profile Verification";
  static const String otp = "OTP";
  static const String name = "Name";
  static const String adminCeo = "Admin/CEO";
  static const String filmCorporationCard = "Film Corporation Card";
  static const String adminAadharCard = "Admin Aadhar Card";
  static const String selfieUpload = "Selfie Upload";
  static const String addressProofOfCompany = "Address Proof of Company";
  static const String verifyContact = "Verify Contact";
  static const String verifyProfile = "Verify Profile";
  static const String saveChanges = "Save Changes";
  static const String viewAll = "View All";
  static const String createProject = "Create Project";
  static const String projects = "Projects";
  static const String project = "Project";
  static const String projectCover = "Project Cover";
  static const String projectTitle = "Project Title";
  static const String projectDescription = "Project Description";
  static const String projectStatus = "Project Status";
  static const String addPhotosAndVideos = "Add Photos And Videos";
  static const String saveNewProject = "Save Project";
  static const String newProjects = "New Projects";
  static const String deleteProject = "Delete Project";
  static const String selectState = "Select State";
  static const String selectDistrict = "Select District";
  static const String selectPinCode = "Select Pin Code";
  static const String projectDocuments = "Project Documents";
  static const String projectType = "Project Type";
  static const String artistDocuments = "Artist Documents";

  //payment
  static const String makePayment = "Make Payment";

  //artist
  static const String middleName = "Middle Name";
  static const String address1 = "Address Line 1";
  static const String address2 = "Address Line 2";
  static const String dob = "DOB";
  static const String roleAge = "Role Age";
  static const String roleImage = "Role Image";
  static const String roleVideo = "Role Video";
  static const String alternateMobileNumber = "Alternate Mobile Number";
  static const String languageKnown = "Language Known";
  static const String maritalStatus = "Marital Status";
  static const String travelThrIndia = "Travel Through India";
  static const String education = "Education";
  static const String educationType = "Education Type";
  static const String universityOrInstitute = "University Or Institute";
  static const String course = "Course";
  static const String specialization = "Specialization";
  static const String courseType = "Course Type";
  static const String courseStartDate = "Course Start Date";
  static const String courseEndDate = "Course End Date";
  static const String expStartDate = "Experience Start Date";
  static const String expEndDate = "Experience End Date";
  static const String score = "Score";
  static const String hobby = "Hobby";
  static const String hobbies = "Hobbies";
  static const String interestIn = "Interest In";
  static const String applyFor = "Apply For";
  static const String passport = "Passport";
  static const String aadharCard = "Aadhar Card";
  static const String vehicle = "Vehicle";

  static const String roleName = "Role Name";
  static const String skillsUsed = "Skill Used";
  static const String roleProfile = "Role Profile";
  static const String fileType = "File Type";
  static const String filePath = "File Path";
  static const String profilePhoto = "Profile Photo";
  static const String camera = "Camera";
  static const String gallery = "Gallery";
  static const String saveDocuments = "Save Documents";
  static const String saveComfortableIn = "Save Comfortable In";
  static const String saveExperience = "Save Experience";
  static const String saveHobby = "Save Hobby";
  static const String saveInterestedIn = "Save Interested In";
  static const String savePortfolio = "Save Portfolio";
  static const String deleteEducation = "Delete Education";
  static const String deleteComfortableIn = "Delete Comfortable In";
  static const String deleteHobby = "Delete Hobby";
  static const String deleteInterestIn = "Delete Interest In";
  static const String deleteExperience = "Delete Experience";
  static const String save = "Save";
  static const String delete = "Delete";

// static const String roleProfile = "roleProfile";
}
