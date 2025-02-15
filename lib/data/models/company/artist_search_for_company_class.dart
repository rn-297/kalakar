import 'dart:typed_data';

class CompanySearchArtistClass {
  List<GetArtistProfileModellist>? getArtistProfileModellist;
  bool? replayStatus;
  String? message;

  CompanySearchArtistClass(
      {this.getArtistProfileModellist,
        this.replayStatus,
        this.message});

  CompanySearchArtistClass.fromJson(Map<String, dynamic> json) {
    if (json['getArtistProfileModellist'] != null) {
      getArtistProfileModellist = <GetArtistProfileModellist>[];
      json['getArtistProfileModellist'].forEach((v) {
        getArtistProfileModellist!
            .add(new GetArtistProfileModellist.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getArtistProfileModellist != null) {
      data['getArtistProfileModellist'] =
          this.getArtistProfileModellist!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class GetArtistProfileModellist {
  int? artistProfileID;
  int? fKAccountID;
  String? userID;
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
  bool? travelThrIndia;
  List<EducationList>? educationList;
  List<HobbiesList>? hobbiesList;
  List<InterestList>? interestList;
  List<ComfortableInList>? comfortableInList;
  List<ApplyList>? applyList;
  List<ExperienceList>? experienceList;
  List<PortfolioList>? portfolioList;
  GetArtistProfileModelForRequirememt? getArtistProfileModelForRequirememt;

  GetArtistProfileModellist(
      {this.artistProfileID,
        this.fKAccountID,
        this.userID,
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
        this.travelThrIndia,
        this.educationList,
        this.hobbiesList,
        this.interestList,
        this.comfortableInList,
        this.applyList,
        this.experienceList,
        this.portfolioList,
        this.getArtistProfileModelForRequirememt});

  GetArtistProfileModellist.fromJson(Map<String, dynamic> json) {
    artistProfileID = json['artistProfileID'];
    fKAccountID = json['fK_AccountID'];
    userID = json['userID'];
    profilePic = json['profilePic'];
    profilePicName = json['profilePic_Name']??"";
    firstName = json['firstName']??"";
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
    travelThrIndia = json['travelThrIndia'];
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
    data['artistProfileID'] = this.artistProfileID;
    data['fK_AccountID'] = this.fKAccountID;
    data['userID'] = this.userID;
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
    data['travelThrIndia'] = this.travelThrIndia;
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
  Null? profilePicName;
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
    data['travelThrIndia'] = this.travelThrIndia;
    return data;
  }
}
