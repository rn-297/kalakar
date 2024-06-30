class LoginDataClass {
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
  bool? replayStatus;
  String? message;
  dynamic data;

  LoginDataClass(
      {this.accountID,
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
        this.replayStatus,
        this.message,
        this.data});

  LoginDataClass.fromJson(Map<String, dynamic> json) {
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
    isverifiedContacts = json['isverifiedContacts'];
    replayStatus = json['replayStatus'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['isverifiedContacts'] = this.isverifiedContacts;
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
