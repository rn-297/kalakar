class LoginDataClass {
  bool? replayStatus;
  String? message;
  String? accountID;
  String? email;
  String? mobileNumber;
  String? accountType;
  String? fistName;
  String? lastName;
  String? token;
  String? userID;
  String? verificationStatus;
  int? verificationStatusID;
  bool? isverifiedContacts;
  int? profileID;


  LoginDataClass(
      {this.replayStatus,
        this.message,
        this.accountID,
        this.email,
        this.mobileNumber,
        this.accountType,
        this.fistName,
        this.lastName,
        this.token,
        this.userID,
        this.verificationStatus,
        this.verificationStatusID,
        this.isverifiedContacts,
        this.profileID,
      });

  LoginDataClass.fromJson(Map<String, dynamic> json) {
    replayStatus = json['replayStatus'];
    message = json['message'];
    accountID = json['accountID'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    accountType = json['accountType'];
    fistName = json['fistName'];
    lastName = json['lastName'];
    token = json['token'];
    userID = json['userID'];
    verificationStatus = json['verificationStatus'];
    verificationStatusID = json['verificationStatusID'];
    profileID = json['profileID'];
    isverifiedContacts = json['isverifiedContacts'];
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
    data['token'] = this.token;
    data['userID'] = this.userID;
    data['verificationStatus'] = this.verificationStatus;
    data['verificationStatusID'] = this.verificationStatusID;
    data['profileID'] = this.profileID;
    data['isverifiedContacts'] = this.isverifiedContacts;
    return data;
  }
}
