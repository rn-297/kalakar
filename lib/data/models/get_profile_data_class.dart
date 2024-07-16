class ProfileGetDataClass {
  int? fKAccountID;
  int? companyProfileID;
  String? userID;
  String? companyLogo;
  String? companyNameProductionhouse;
  String? authoriseAdminName;
  String? address;
  String? district;
  String? state;
  String? postalcode;
  String? bio;
  String? fbLink;
  String? wpLink;
  String? ytLink;
  String? instalink;
  String? emailLink;
  String? websiteLink;
  String? email;
  String? mobileNumber;
  String? name;
  String? adminOwerCEO;
  String? filmCorpprationCardDOC;
  String? adminAdharCardDOC;
  String? addressProofofCompanyDOC;
  String? selfieuploadDOC;
  String? fKVerificationStatusID;
  String? isVerifiedContacts;
  String? verificationSend;
  String? verificationApproveDate;
  String? verificationStatus;
  bool? replayStatus;
  String? message;

  ProfileGetDataClass(
      {this.fKAccountID,
      this.companyProfileID,
      this.userID,
      this.companyLogo,
      this.companyNameProductionhouse,
      this.authoriseAdminName,
      this.address,
      this.district,
      this.state,
      this.postalcode,
      this.bio,
      this.fbLink,
      this.wpLink,
      this.ytLink,
      this.instalink,
      this.emailLink,
      this.websiteLink,
      this.email,
      this.mobileNumber,
      this.name,
      this.adminOwerCEO,
      this.filmCorpprationCardDOC,
      this.adminAdharCardDOC,
      this.addressProofofCompanyDOC,
      this.selfieuploadDOC,
      this.fKVerificationStatusID,
      this.isVerifiedContacts,
      this.verificationSend,
      this.verificationApproveDate,
      this.verificationStatus,
      this.replayStatus,
      this.message});

  ProfileGetDataClass.fromJson(Map<String, dynamic> json) {
    fKAccountID = json['fK_AccountID'] ?? 0;
    companyProfileID = json['companyProfileID'] ?? 0;
    userID = json['userID'] ?? "NA";
    companyLogo = json['companyLogo'] ?? "NA";
    companyNameProductionhouse = json['companyNameProductionhouse'] ?? "NA";
    authoriseAdminName = json['authoriseAdminName'] ?? "NA";
    address = json['address'] ?? "NA";
    district = json['district'] ?? "NA";
    state = json['state'] ?? "NA";
    postalcode = json['postalcode'] ?? "NA";
    bio = json['bio'] ?? "NA";
    fbLink = json['fbLink'] ?? "NA";
    wpLink = json['wpLink'] ?? "NA";
    ytLink = json['ytLink'] ?? "NA";
    instalink = json['instalink'] ?? "NA";
    emailLink = json['emailLink'] ?? "NA";
    websiteLink = json['websiteLink'] ?? "NA";
    email = json['email'] ?? "NA";
    mobileNumber = json['mobileNumber'] ?? "NA";
    name = json['name'] ?? "NA";
    adminOwerCEO = json['admin_Ower_CEO'] ?? "NA";
    filmCorpprationCardDOC = json['filmCorpprationCard_DOC'] ?? "NA";
    adminAdharCardDOC = json['adminAdharCard_DOC'] ?? "NA";
    addressProofofCompanyDOC = json['addressProofofCompany_DOC'] ?? "NA";
    selfieuploadDOC = json['selfieupload_DOC'] ?? "NA";
    fKVerificationStatusID = json['fK_VerificationStatusID'] ?? "NA";
    isVerifiedContacts = json['isverifiedContacts'] ?? "NA";
    verificationSend = json['verificationSend'] ?? "NA";
    verificationApproveDate = json['verificationApproveDate'] ?? "NA";
    verificationStatus = json['verificationStatus'] ?? "NA";
    replayStatus = json['replayStatus'] ?? false;
    message = json['message'] ?? "NA";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fK_AccountID'] = this.fKAccountID;
    data['companyProfileID'] = this.companyProfileID;
    data['userID'] = this.userID;
    data['companyLogo'] = this.companyLogo;
    data['companyNameProductionhouse'] = this.companyNameProductionhouse;
    data['authoriseAdminName'] = this.authoriseAdminName;
    data['address'] = this.address;
    data['district'] = this.district;
    data['state'] = this.state;
    data['postalcode'] = this.postalcode;
    data['bio'] = this.bio;
    data['fbLink'] = this.fbLink;
    data['wpLink'] = this.wpLink;
    data['ytLink'] = this.ytLink;
    data['instalink'] = this.instalink;
    data['emailLink'] = this.emailLink;
    data['websiteLink'] = this.websiteLink;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['name'] = this.name;
    data['admin_Ower_CEO'] = this.adminOwerCEO;
    data['filmCorpprationCard_DOC'] = this.filmCorpprationCardDOC;
    data['adminAdharCard_DOC'] = this.adminAdharCardDOC;
    data['addressProofofCompany_DOC'] = this.addressProofofCompanyDOC;
    data['selfieupload_DOC'] = this.selfieuploadDOC;
    data['fK_VerificationStatusID'] = this.fKVerificationStatusID;
    data['isverifiedContacts'] = this.isVerifiedContacts;
    data['verificationSend'] = this.verificationSend;
    data['verificationApproveDate'] = this.verificationApproveDate;
    data['verificationStatus'] = this.verificationStatus;
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}
