class ReferralDetailsClass {
  String? referralCode;
  int? accountID;
  double? companyPrice;
  double? artistPrice;
  String? fistName;
  String? lastName;
  bool? replayStatus;
  String? message;

  ReferralDetailsClass(
      {this.referralCode,
        this.accountID,
        this.companyPrice,
        this.artistPrice,
        this.fistName,
        this.lastName,
        this.replayStatus,
        this.message});

  ReferralDetailsClass.fromJson(Map<String, dynamic> json) {
    referralCode = json['referralCode'];
    accountID = json['accountID'];
    companyPrice = json['companyPrice'];
    artistPrice = json['artistPrice'];
    fistName = json['fistName'];
    lastName = json['lastName'];
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referralCode'] = this.referralCode;
    data['accountID'] = this.accountID;
    data['companyPrice'] = this.companyPrice;
    data['artistPrice'] = this.artistPrice;
    data['fistName'] = this.fistName;
    data['lastName'] = this.lastName;
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}
