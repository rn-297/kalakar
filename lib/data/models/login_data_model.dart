class LoginDataClass {
  bool? replayStatus;
  String? message;
  String? accountID;
  String? email;
  String? mobileNumber;
  String? accountType;
  String? fistName;
  String? lastName;
  String? companyName;
  String? profilePic;
  String? token;
  String? userID;
  String? referralCode;
  String? usedReferralCode;
  String? verificationStatus;
  int? verificationStatusID;
  int? profileID;
  bool? isverifiedContacts;
  double? totalReferralAmount;
  double? usedReferralAmount;

  LoginDataClass(
      {this.replayStatus,
        this.message,
        this.accountID,
        this.email,
        this.mobileNumber,
        this.accountType,
        this.fistName,
        this.lastName,
        this.profilePic,
        this.token,
        this.userID,
        this.companyName,
        this.referralCode,
        this.usedReferralCode,
        this.verificationStatus,
        this.verificationStatusID,
        this.profileID,
        this.isverifiedContacts,
        this.totalReferralAmount,
        this.usedReferralAmount});

  LoginDataClass.fromJson(Map<String, dynamic> json) {
    replayStatus = json['replayStatus'];
    message = json['message'];
    accountID = json['accountID'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    accountType = json['accountType'];
    fistName = json['fistName'];
    lastName = json['lastName'];
    profilePic = json['profilePic'];
    token = json['token'];
    userID = json['userID'];
    companyName = json['companyName'];
    referralCode = json['referralCode'];
    usedReferralCode = json['usedReferralCode'];
    verificationStatus = json['verificationStatus'];
    verificationStatusID = json['verificationStatusID'];
    profileID = json['profileID'];
    isverifiedContacts = json['isverifiedContacts'];
    totalReferralAmount = json['totalReferralAmount']*1.0;
    usedReferralAmount = json['usedReferralAmount']*1.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    data['accountID'] = this.accountID;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['accountType'] = this.accountType;
    data['fistName'] = this.fistName;
    data['lastName'] = this.lastName;
    data['profilePic'] = this.profilePic;
    data['token'] = this.token;
    data['userID'] = this.userID;
    data['companyName'] = this.companyName;
    data['referralCode'] = this.referralCode;
    data['usedReferralCode'] = this.usedReferralCode;
    data['verificationStatus'] = this.verificationStatus;
    data['verificationStatusID'] = this.verificationStatusID;
    data['profileID'] = this.profileID;
    data['isverifiedContacts'] = this.isverifiedContacts;
    data['totalReferralAmount'] = this.totalReferralAmount;
    data['usedReferralAmount'] = this.usedReferralAmount;
    return data;
  }
}
