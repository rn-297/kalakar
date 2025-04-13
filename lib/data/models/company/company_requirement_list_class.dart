class CompanyRequirementListClass {
  List<RequirementDetailsData>? objResponesRequirementDetailsList;
  bool? replayStatus;
  String? message;

  CompanyRequirementListClass(
      {this.objResponesRequirementDetailsList,
        this.replayStatus,
        this.message});

  CompanyRequirementListClass.fromJson(Map<String, dynamic> json) {
    if (json['objResponesRequirementDetailsList'] != null) {
      objResponesRequirementDetailsList = <RequirementDetailsData>[];
      json['objResponesRequirementDetailsList'].forEach((v) {
        objResponesRequirementDetailsList!
            .add(new RequirementDetailsData.fromJson(v));
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

class RequirementDetailsData {
  String? userID;
  int? requirementDetailsID;
  int? fKApplyStatusMasterID;
  String? applyStatus;
  int? artistAppliedForRequirementTransID;
  int? artistFavoritesRequirementTransID;
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
  String? createdDate;
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
  String? appliedCount;
  String? auditionVideoPath;
  String? auditionVideoName;
  List<AppliedProfilePics>? appliedProfilePics;

  RequirementDetailsData(
      {this.userID,
        this.requirementDetailsID,
        this.fKApplyStatusMasterID,
        this.applyStatus,
        this.artistAppliedForRequirementTransID,
        this.artistFavoritesRequirementTransID,
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
        this.createdDate,
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
        this.appliedCount,
        this.auditionVideoPath,
        this.auditionVideoName,
        this.appliedProfilePics});

  RequirementDetailsData.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    requirementDetailsID = json['requirementDetailsID'];
    fKApplyStatusMasterID = json['fK_ApplyStatusMasterID'];
    applyStatus = json['applyStatus'];
    artistAppliedForRequirementTransID =
    json['artistAppliedForRequirementTransID'];
    artistFavoritesRequirementTransID =
    json['artistFavoritesRequirementTransID'];
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
    createdDate = json['createdDate'];
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
    appliedCount = json['appliedCount'];
    auditionVideoPath = json['auditionVideoPath'];
    auditionVideoName = json['auditionVideoName'];
    if (json['appliedProfilePics'] != null) {
      appliedProfilePics = <AppliedProfilePics>[];
      json['appliedProfilePics'].forEach((v) {
        appliedProfilePics!.add(new AppliedProfilePics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['requirementDetailsID'] = this.requirementDetailsID;
    data['fK_ApplyStatusMasterID'] = this.fKApplyStatusMasterID;
    data['applyStatus'] = this.applyStatus;
    data['artistAppliedForRequirementTransID'] =
        this.artistAppliedForRequirementTransID;
    data['artistFavoritesRequirementTransID'] =
        this.artistFavoritesRequirementTransID;
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
    data['createdDate'] = this.createdDate;
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
    data['appliedCount'] = this.appliedCount;
    if (this.appliedProfilePics != null) {
      data['appliedProfilePics'] =
          this.appliedProfilePics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppliedProfilePics {
  String? appliedProfilePics;

  AppliedProfilePics({this.appliedProfilePics});

  AppliedProfilePics.fromJson(Map<String, dynamic> json) {
    appliedProfilePics = json['appliedProfilePics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appliedProfilePics'] = this.appliedProfilePics;
    return data;
  }
}
