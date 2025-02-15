class PaymentDetailsModel {
  List<ReturnPaymentIntegrationAPIResponseList>?
  returnPaymentIntegrationAPIResponseList;
  ProfileStatusData? pProfileStatusData;
  bool? replayStatus;
  String? message;

  PaymentDetailsModel(
      {this.returnPaymentIntegrationAPIResponseList,
        this.pProfileStatusData,
        this.replayStatus,
        this.message});

  PaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['returnPaymentIntegrationAPIResponseList'] != null) {
      returnPaymentIntegrationAPIResponseList =
      <ReturnPaymentIntegrationAPIResponseList>[];
      json['returnPaymentIntegrationAPIResponseList'].forEach((v) {
        returnPaymentIntegrationAPIResponseList!
            .add(new ReturnPaymentIntegrationAPIResponseList.fromJson(v));
      });
    }
    pProfileStatusData = json['_ProfileStatusData'] != null
        ? new ProfileStatusData.fromJson(json['_ProfileStatusData'])
        : null;
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.returnPaymentIntegrationAPIResponseList != null) {
      data['returnPaymentIntegrationAPIResponseList'] = this
          .returnPaymentIntegrationAPIResponseList!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.pProfileStatusData != null) {
      data['_ProfileStatusData'] = this.pProfileStatusData!.toJson();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class ReturnPaymentIntegrationAPIResponseList {
  String? transactionId;
  String? responseCode;
  String? message;
  String? paymentDate;
  double? amount;
  String? merchantTransactionId;
  String? paymentType;

  ReturnPaymentIntegrationAPIResponseList(
      {this.transactionId,
        this.responseCode,
        this.message,
        this.paymentDate,
        this.amount,
        this.merchantTransactionId,
        this.paymentType});

  ReturnPaymentIntegrationAPIResponseList.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    responseCode = json['responseCode'];
    message = json['message'];
    paymentDate = json['paymentDate'];
    amount = json['amount']*1.0;
    merchantTransactionId = json['merchantTransactionId'];
    paymentType = json['paymentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    data['paymentDate'] = this.paymentDate;
    data['amount'] = this.amount;
    data['merchantTransactionId'] = this.merchantTransactionId;
    data['paymentType'] = this.paymentType;
    return data;
  }
}

class ProfileStatusData {
  int? verificationStatusID;
  String? verificationStatus;
  int? registrationStatusID;
  String? registrationStatus;
  String? expiryDate;
  String? subscriptionExpiryDate;
  double? appPrice;
  double? discount;
  double? discountedAmount;

  ProfileStatusData(
      {this.verificationStatusID=0,
        this.verificationStatus="",
        this.registrationStatusID=0,
        this.registrationStatus="",
        this.expiryDate="",
        this.subscriptionExpiryDate="",
        this.appPrice=0,
        this.discount=0,
      this.discountedAmount=0
      });

  ProfileStatusData.fromJson(Map<String, dynamic> json) {
    verificationStatusID = json['verificationStatusID'];
    verificationStatus = json['verificationStatus'];
    registrationStatusID = json['registrationStatusID'];
    registrationStatus = json['registrationStatus'];
    expiryDate = json['expiryDate'];
    subscriptionExpiryDate = json['subscriptionExpiryDate'];
    appPrice = json['appPrice']*1.0;
    discount = json['discount']*1.0;
    discountedAmount = json['discountedAmount']*1.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verificationStatusID'] = this.verificationStatusID;
    data['verificationStatus'] = this.verificationStatus;
    data['registrationStatusID'] = this.registrationStatusID;
    data['registrationStatus'] = this.registrationStatus;
    data['appPrice'] = this.appPrice;
    data['discount'] = this.discount;
    data['discountedAmount'] = this.discountedAmount;
    data['expiryDate'] = this.expiryDate;
    data['subscriptionExpiryDate'] = this.subscriptionExpiryDate;
    return data;
  }
}
