
import 'dart:typed_data';

class CompanyAppliedRequirementDetailsClass {
  List<AppliedArtistDetailsList>? objResponesRequirementDetailsList;
  bool? replayStatus;
  String? message;

  CompanyAppliedRequirementDetailsClass(
      {this.objResponesRequirementDetailsList,
        this.replayStatus,
        this.message});

  CompanyAppliedRequirementDetailsClass.fromJson(Map<String, dynamic> json) {
    if (json['objResponesRequirementDetailsList'] != null) {
      objResponesRequirementDetailsList = <AppliedArtistDetailsList>[];
      json['objResponesRequirementDetailsList'].forEach((v) {
        objResponesRequirementDetailsList!
            .add(new AppliedArtistDetailsList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.objResponesRequirementDetailsList != null) {
      data['objResponesRequirementDetailsList'] = this
          .objResponesRequirementDetailsList!
          .map((v) => v.toJson())
          .toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class AppliedArtistDetailsList {
  String? userID;
  String? artistUserID;
  int? requirementDetailsID;
  int? fKAccountID;
  int? fKCompanyProfileID;
  int? fKRequirementStatusMasterID;
  String? requirementTitle;
  String? requirementDescription;
  String? lookingFor;
  int? nUmberOfOpenings;
  String? gender;
  String? age;
  String? language;
  String? height;
  String? weight;
  String? hairColor;
  String? bodyType;
  double? experiences;
  String? shootingStartDate;
  String? shootingEndDate;
  String? shootingLocation;
  String? defineRole;
  String? specialSkillRequired;
  String? comfortableIn;
  String? scriptForAuditions;
  String? requirementEndDate;
  String? fbLink;
  String? wpLink;
  String? ytLink;
  String? instalink;
  String? emailLink;
  String? websiteLink;
  String? refPhotoName;
  double? salary;
  String? salaryType;
  String? requirementStatus;
  String? companyNameProductionhouse;
  String? companyLogo;
  String? firstName;
  String? middleName;
  String? profilePic;
  int? fKApplyStatusMasterID;
  String? applyStatus;
  int? artistFavoritesRequirementTransID;
  int? artistAppliedForRequirementTransID;
  int? fKAccountIDArtist;
  String? artistGender;
  String? artistState;
  String? district;
  String? email;
  String? mobileNumber;
  String? auditionVideoPath;
  String? auditionVideoName;
  List<EducationList>? educationList;
  List<HobbiesList>? hobbiesList;
  List<InterestList>? interestList;
  List<ComfortableInList>? comfortableInList;
  List<ApplyList>? applyList;
  List<ExperienceList>? experienceList;
  List<PortfolioList>? portfolioList;
  GetArtistProfileModelForRequirememt? getArtistProfileModelForRequirememt;

  AppliedArtistDetailsList(
      {this.userID,
        this.artistUserID,
        this.requirementDetailsID,
        this.fKAccountID,
        this.fKCompanyProfileID,
        this.fKRequirementStatusMasterID,
        this.requirementTitle,
        this.requirementDescription,
        this.lookingFor,
        this.nUmberOfOpenings,
        this.gender,
        this.age,
        this.language,
        this.height,
        this.weight,
        this.hairColor,
        this.bodyType,
        this.experiences,
        this.shootingStartDate,
        this.shootingEndDate,
        this.shootingLocation,
        this.defineRole,
        this.specialSkillRequired,
        this.comfortableIn,
        this.scriptForAuditions,
        this.requirementEndDate,
        this.fbLink,
        this.wpLink,
        this.ytLink,
        this.instalink,
        this.emailLink,
        this.websiteLink,
        this.refPhotoName,
        this.salary,
        this.salaryType,
        this.requirementStatus,
        this.companyNameProductionhouse,
        this.companyLogo,
        this.firstName,
        this.middleName,
        this.profilePic,
        this.fKApplyStatusMasterID,
        this.applyStatus,
        this.artistFavoritesRequirementTransID,
        this.artistAppliedForRequirementTransID,
        this.fKAccountIDArtist,
        this.artistGender,
        this.artistState,
        this.district,
        this.email,
        this.mobileNumber,
        this.auditionVideoPath,
        this.auditionVideoName,
        this.educationList,
        this.hobbiesList,
        this.interestList,
        this.comfortableInList,
        this.applyList,
        this.experienceList,
        this.portfolioList,
        this.getArtistProfileModelForRequirememt});

  AppliedArtistDetailsList.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    artistUserID = json['artistUserID'];
    requirementDetailsID = json['requirementDetailsID'];
    fKAccountID = json['fK_AccountID'];
    fKCompanyProfileID = json['fK_CompanyProfileID'];
    fKRequirementStatusMasterID = json['fK_RequirementStatusMasterID'];
    requirementTitle = json['requirementTitle'];
    requirementDescription = json['requirementDescription'];
    lookingFor = json['lookingFor'];
    nUmberOfOpenings = json['nUmberOfOpenings'];
    gender = json['gender'];
    age = json['age'];
    language = json['language'];
    height = json['height'];
    weight = json['weight'];
    hairColor = json['hairColor'];
    bodyType = json['bodyType'];
    experiences = json['experiences'];
    shootingStartDate = json['shootingStartDate'];
    shootingEndDate = json['shootingEndDate'];
    shootingLocation = json['shootingLocation'];
    defineRole = json['defineRole'];
    specialSkillRequired = json['specialSkillRequired'];
    comfortableIn = json['comfortableIn'];
    scriptForAuditions = json['scriptForAuditions'];
    requirementEndDate = json['requirementEndDate'];
    fbLink = json['fbLink'];
    wpLink = json['wpLink'];
    ytLink = json['ytLink'];
    instalink = json['instalink'];
    emailLink = json['emailLink'];
    websiteLink = json['websiteLink'];
    refPhotoName = json['refPhotoName'];
    salary = json['salary'];
    salaryType = json['salaryType'];
    requirementStatus = json['requirementStatus'];
    companyNameProductionhouse = json['companyNameProductionhouse'];
    companyLogo = json['companyLogo'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    profilePic = json['profilePic'];
    fKApplyStatusMasterID = json['fK_ApplyStatusMasterID'];
    applyStatus = json['applyStatus'];
    artistFavoritesRequirementTransID =
    json['artistFavoritesRequirementTransID'];
    artistAppliedForRequirementTransID =
    json['artistAppliedForRequirementTransID'];
    fKAccountIDArtist = json['fK_AccountID_Artist'];
    artistGender = json['artistGender'];
    artistState = json['artistState'];
    district = json['district'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    auditionVideoPath = json['auditionVideoPath'];
    auditionVideoName = json['auditionVideoName'];
    if (json['educationList'] != null) {
      educationList = <EducationList>[];
      json['educationList'].forEach((v) {
        educationList!.add(new EducationList.fromJson(v));
      });
    }
    if (json['hobbiesList'] != null) {
      hobbiesList = <HobbiesList>[];
      json['hobbiesList'].forEach((v) {
        hobbiesList!.add(new HobbiesList.fromJson(v));
      });
    }
    if (json['interestList'] != null) {
      interestList = <InterestList>[];
      json['interestList'].forEach((v) {
        interestList!.add(new InterestList.fromJson(v));
      });
    }
    if (json['comfortableInList'] != null) {
      comfortableInList = <ComfortableInList>[];
      json['comfortableInList'].forEach((v) {
        comfortableInList!.add(new ComfortableInList.fromJson(v));
      });
    }
    if (json['applyList'] != null) {
      applyList = <ApplyList>[];
      json['applyList'].forEach((v) {
        applyList!.add(new ApplyList.fromJson(v));
      });
    }
    if (json['experienceList'] != null) {
      experienceList = <ExperienceList>[];
      json['experienceList'].forEach((v) {
        experienceList!.add(new ExperienceList.fromJson(v));
      });
    }
    if (json['portfolioList'] != null) {
      portfolioList = <PortfolioList>[];
      json['portfolioList'].forEach((v) {
        portfolioList!.add(new PortfolioList.fromJson(v));
      });
    }
    getArtistProfileModelForRequirememt =
    json['getArtistProfileModel_ForRequirememt'] != null
        ? new GetArtistProfileModelForRequirememt.fromJson(
        json['getArtistProfileModel_ForRequirememt'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['artistUserID'] = this.artistUserID;
    data['requirementDetailsID'] = this.requirementDetailsID;
    data['fK_AccountID'] = this.fKAccountID;
    data['fK_CompanyProfileID'] = this.fKCompanyProfileID;
    data['fK_RequirementStatusMasterID'] = this.fKRequirementStatusMasterID;
    data['requirementTitle'] = this.requirementTitle;
    data['requirementDescription'] = this.requirementDescription;
    data['lookingFor'] = this.lookingFor;
    data['nUmberOfOpenings'] = this.nUmberOfOpenings;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['language'] = this.language;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['hairColor'] = this.hairColor;
    data['bodyType'] = this.bodyType;
    data['experiences'] = this.experiences;
    data['shootingStartDate'] = this.shootingStartDate;
    data['shootingEndDate'] = this.shootingEndDate;
    data['shootingLocation'] = this.shootingLocation;
    data['defineRole'] = this.defineRole;
    data['specialSkillRequired'] = this.specialSkillRequired;
    data['comfortableIn'] = this.comfortableIn;
    data['scriptForAuditions'] = this.scriptForAuditions;
    data['requirementEndDate'] = this.requirementEndDate;
    data['fbLink'] = this.fbLink;
    data['wpLink'] = this.wpLink;
    data['ytLink'] = this.ytLink;
    data['instalink'] = this.instalink;
    data['emailLink'] = this.emailLink;
    data['websiteLink'] = this.websiteLink;
    data['refPhotoName'] = this.refPhotoName;
    data['salary'] = this.salary;
    data['salaryType'] = this.salaryType;
    data['requirementStatus'] = this.requirementStatus;
    data['companyNameProductionhouse'] = this.companyNameProductionhouse;
    data['companyLogo'] = this.companyLogo;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['profilePic'] = this.profilePic;
    data['fK_ApplyStatusMasterID'] = this.fKApplyStatusMasterID;
    data['applyStatus'] = this.applyStatus;
    data['artistFavoritesRequirementTransID'] =
        this.artistFavoritesRequirementTransID;
    data['artistAppliedForRequirementTransID'] =
        this.artistAppliedForRequirementTransID;
    data['fK_AccountID_Artist'] = this.fKAccountIDArtist;
    data['artistGender'] = this.artistGender;
    data['artistState'] = this.artistState;
    data['district'] = this.district;
    data['email'] = this.email;
    data['auditionVideoName'] = this.auditionVideoName;
    data['auditionVideoPath'] = this.auditionVideoPath;
    data['mobileNumber'] = this.mobileNumber;
    if (this.educationList != null) {
      data['educationList'] =
          this.educationList!.map((v) => v.toJson()).toList();
    }
    if (this.hobbiesList != null) {
      data['hobbiesList'] = this.hobbiesList!.map((v) => v.toJson()).toList();
    }
    if (this.interestList != null) {
      data['interestList'] = this.interestList!.map((v) => v.toJson()).toList();
    }
    if (this.comfortableInList != null) {
      data['comfortableInList'] =
          this.comfortableInList!.map((v) => v.toJson()).toList();
    }
    if (this.applyList != null) {
      data['applyList'] = this.applyList!.map((v) => v.toJson()).toList();
    }
    if (this.experienceList != null) {
      data['experienceList'] =
          this.experienceList!.map((v) => v.toJson()).toList();
    }
    if (this.portfolioList != null) {
      data['portfolioList'] =
          this.portfolioList!.map((v) => v.toJson()).toList();
    }
    if (this.getArtistProfileModelForRequirememt != null) {
      data['getArtistProfileModel_ForRequirememt'] =
          this.getArtistProfileModelForRequirememt!.toJson();
    }
    return data;
  }
}

class EducationList {
  int? artistProfileEducationID;
  int? fKAccountID;
  String? educationType;
  String? universityOrInstitute;
  String? course;
  String? specialization;
  String? coursetype;
  String? courseStartDate;
  String? courseEndDate;
  double? score;

  EducationList(
      {this.artistProfileEducationID,
        this.fKAccountID,
        this.educationType,
        this.universityOrInstitute,
        this.course,
        this.specialization,
        this.coursetype,
        this.courseStartDate,
        this.courseEndDate,
        this.score});

  EducationList.fromJson(Map<String, dynamic> json) {
    artistProfileEducationID = json['artistProfile_EducationID'];
    fKAccountID = json['fK_AccountID'];
    educationType = json['educationType'];
    universityOrInstitute = json['universityOrInstitute'];
    course = json['course'];
    specialization = json['specialization'];
    coursetype = json['coursetype'];
    courseStartDate = json['courseStartDate'];
    courseEndDate = json['courseEndDate'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_EducationID'] = this.artistProfileEducationID;
    data['fK_AccountID'] = this.fKAccountID;
    data['educationType'] = this.educationType;
    data['universityOrInstitute'] = this.universityOrInstitute;
    data['course'] = this.course;
    data['specialization'] = this.specialization;
    data['coursetype'] = this.coursetype;
    data['courseStartDate'] = this.courseStartDate;
    data['courseEndDate'] = this.courseEndDate;
    data['score'] = this.score;
    return data;
  }
}

class HobbiesList {
  int? artistProfileHobbiesID;
  int? fKAccountID;
  String? hobbyName;

  HobbiesList({this.artistProfileHobbiesID, this.fKAccountID, this.hobbyName});

  HobbiesList.fromJson(Map<String, dynamic> json) {
    artistProfileHobbiesID = json['artistProfile_hobbiesID'];
    fKAccountID = json['fK_AccountID'];
    hobbyName = json['hobbyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_hobbiesID'] = this.artistProfileHobbiesID;
    data['fK_AccountID'] = this.fKAccountID;
    data['hobbyName'] = this.hobbyName;
    return data;
  }
}

class InterestList {
  int? fKInterstedListMasterID;
  int? fKAccountID;
  int? artistProfileInterestID;
  String? interestedName;
  bool? yesOrNO;

  InterestList(
      {this.fKInterstedListMasterID,
        this.fKAccountID,
        this.artistProfileInterestID,
        this.interestedName,
        this.yesOrNO});

  InterestList.fromJson(Map<String, dynamic> json) {
    fKInterstedListMasterID = json['fK_InterstedListMasterID'];
    fKAccountID = json['fK_AccountID'];
    artistProfileInterestID = json['artistProfile_InterestID'];
    interestedName = json['interestedName'];
    yesOrNO = json['yesOrNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fK_InterstedListMasterID'] = this.fKInterstedListMasterID;
    data['fK_AccountID'] = this.fKAccountID;
    data['artistProfile_InterestID'] = this.artistProfileInterestID;
    data['interestedName'] = this.interestedName;
    data['yesOrNO'] = this.yesOrNO;
    return data;
  }
}

class ComfortableInList {
  int? artistProfileComfortableInID;
  int? fKAccountID;
  int? fKComfortableListMasterID;
  String? comfortableName;
  bool? yesOrNO;

  ComfortableInList(
      {this.artistProfileComfortableInID,
        this.fKAccountID,
        this.fKComfortableListMasterID,
        this.comfortableName,
        this.yesOrNO});

  ComfortableInList.fromJson(Map<String, dynamic> json) {
    artistProfileComfortableInID = json['artistProfile_ComfortableInID'];
    fKAccountID = json['fK_AccountID'];
    fKComfortableListMasterID = json['fK_ComfortableListMasterID'];
    comfortableName = json['comfortableName'];
    yesOrNO = json['yesOrNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_ComfortableInID'] = this.artistProfileComfortableInID;
    data['fK_AccountID'] = this.fKAccountID;
    data['fK_ComfortableListMasterID'] = this.fKComfortableListMasterID;
    data['comfortableName'] = this.comfortableName;
    data['yesOrNO'] = this.yesOrNO;
    return data;
  }
}

class ApplyList {
  int? artistProfileApplyForID;
  int? fKAccountID;
  int? fKApplyListMasterID;
  String? applyName;
  bool? yesOrNO;

  ApplyList(
      {this.artistProfileApplyForID,
        this.fKAccountID,
        this.fKApplyListMasterID,
        this.applyName,
        this.yesOrNO});

  ApplyList.fromJson(Map<String, dynamic> json) {
    artistProfileApplyForID = json['artistProfile_ApplyForID'];
    fKAccountID = json['fK_AccountID'];
    fKApplyListMasterID = json['fK_ApplyListMasterID'];
    applyName = json['applyName'];
    yesOrNO = json['yesOrNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_ApplyForID'] = this.artistProfileApplyForID;
    data['fK_AccountID'] = this.fKAccountID;
    data['fK_ApplyListMasterID'] = this.fKApplyListMasterID;
    data['applyName'] = this.applyName;
    data['yesOrNO'] = this.yesOrNO;
    return data;
  }
}

class ExperienceList {
  int? artistProfileExperienceID;
  int? fKAccountID;
  String? roleName;
  String? startDate;
  String? endDate;
  String? skillUsed;
  String? roleProfile;
  String? companyName;
  String? roleImage;
  String? roleVideo;
  Uint8List? thumbnail;

  ExperienceList(
      {this.artistProfileExperienceID,
        this.fKAccountID,
        this.roleName,
        this.startDate,
        this.endDate,
        this.skillUsed,
        this.roleProfile,
        this.companyName,
        this.roleImage,
        this.roleVideo});

  ExperienceList.fromJson(Map<String, dynamic> json) {
    artistProfileExperienceID = json['artistProfile_ExperienceID'];
    fKAccountID = json['fK_AccountID'];
    roleName = json['roleName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    skillUsed = json['skillUsed'];
    roleProfile = json['roleProfile'];
    companyName = json['companyName'];
    roleImage = json['roleImage'];
    roleVideo = json['roleVideo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_ExperienceID'] = this.artistProfileExperienceID;
    data['fK_AccountID'] = this.fKAccountID;
    data['roleName'] = this.roleName;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['skillUsed'] = this.skillUsed;
    data['roleProfile'] = this.roleProfile;
    data['companyName'] = this.companyName;
    data['roleImage'] = this.roleImage;
    data['roleVideo'] = this.roleVideo;
    return data;
  }
}

class PortfolioList {
  int? artistProfilePortfolioID;
  int? fKAccountID;
  int? fileType;
  String? filePath;
  Uint8List?thumbnail;

  PortfolioList(
      {this.artistProfilePortfolioID,
        this.fKAccountID,
        this.fileType,
        this.filePath});

  PortfolioList.fromJson(Map<String, dynamic> json) {
    artistProfilePortfolioID = json['artistProfile_PortfolioID'];
    fKAccountID = json['fK_AccountID'];
    fileType = json['fileType'];
    filePath = json['filePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_PortfolioID'] = this.artistProfilePortfolioID;
    data['fK_AccountID'] = this.fKAccountID;
    data['fileType'] = this.fileType;
    data['filePath'] = this.filePath;
    return data;
  }
}

class GetArtistProfileModelForRequirememt {
  int? artistProfileID;
  int? fKAccountID;
  String? profilePic;
  String? profilePicName;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dateOfBirth;
  String? email;
  String? mobileNumber;
  String? gender;
  double? age;
  double? roleAge;
  double? height;
  double? weight;
  String? bio;
  String? fbLink;
  String? wpLink;
  String? ytLink;
  String? instalink;
  String? emailLink;
  String? websiteLink;
  String? address1;
  String? address2;
  String? district;
  String? state;
  String? postalcode;
  String? alternateMobileNumber;
  String? languageKnown;
  String? eyeColor;
  String? hairColor;
  String? bodyType;
  String? maritalStatus;
  String? vehicle;
  String? auditionVideoPath;
  String? auditionVideoName;
  bool? travelThrIndia;

  GetArtistProfileModelForRequirememt(
      {this.artistProfileID,
        this.fKAccountID,
        this.profilePic,
        this.profilePicName,
        this.firstName,
        this.middleName,
        this.lastName,
        this.dateOfBirth,
        this.email,
        this.mobileNumber,
        this.gender,
        this.age,
        this.roleAge,
        this.height,
        this.weight,
        this.bio,
        this.fbLink,
        this.wpLink,
        this.ytLink,
        this.instalink,
        this.emailLink,
        this.websiteLink,
        this.address1,
        this.address2,
        this.district,
        this.state,
        this.postalcode,
        this.alternateMobileNumber,
        this.languageKnown,
        this.eyeColor,
        this.hairColor,
        this.bodyType,
        this.maritalStatus,
        this.vehicle,
        this.auditionVideoPath,
        this.auditionVideoName,
        this.travelThrIndia});

  GetArtistProfileModelForRequirememt.fromJson(Map<String, dynamic> json) {
    artistProfileID = json['artistProfileID'];
    fKAccountID = json['fK_AccountID'];
    profilePic = json['profilePic'];
    profilePicName = json['profilePic_Name'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    gender = json['gender'];
    age = json['age'];
    roleAge = json['roleAge'];
    height = json['height'];
    weight = json['weight'];
    bio = json['bio'];
    fbLink = json['fbLink'];
    wpLink = json['wpLink'];
    ytLink = json['ytLink'];
    instalink = json['instalink'];
    emailLink = json['emailLink'];
    websiteLink = json['websiteLink'];
    address1 = json['address1'];
    address2 = json['address2'];
    district = json['district'];
    state = json['state'];
    postalcode = json['postalcode'];
    alternateMobileNumber = json['alternateMobileNumber'];
    languageKnown = json['languageKnown'];
    eyeColor = json['eyeColor'];
    hairColor = json['hairColor'];
    bodyType = json['bodyType'];
    maritalStatus = json['maritalStatus'];
    vehicle = json['vehicle'];
    auditionVideoPath = json['auditionVideoPath'];
    auditionVideoName = json['auditionVideoName'];
    travelThrIndia = json['travelThrIndia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfileID'] = this.artistProfileID;
    data['fK_AccountID'] = this.fKAccountID;
    data['profilePic'] = this.profilePic;
    data['profilePic_Name'] = this.profilePicName;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['roleAge'] = this.roleAge;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['bio'] = this.bio;
    data['fbLink'] = this.fbLink;
    data['wpLink'] = this.wpLink;
    data['ytLink'] = this.ytLink;
    data['instalink'] = this.instalink;
    data['emailLink'] = this.emailLink;
    data['websiteLink'] = this.websiteLink;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['district'] = this.district;
    data['state'] = this.state;
    data['postalcode'] = this.postalcode;
    data['alternateMobileNumber'] = this.alternateMobileNumber;
    data['languageKnown'] = this.languageKnown;
    data['eyeColor'] = this.eyeColor;
    data['hairColor'] = this.hairColor;
    data['bodyType'] = this.bodyType;
    data['maritalStatus'] = this.maritalStatus;
    data['vehicle'] = this.vehicle;
    data['auditionVideoPath'] = this.auditionVideoPath;
    data['auditionVideoName'] = this.auditionVideoName;
    data['travelThrIndia'] = this.travelThrIndia;
    return data;
  }
}
