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
  int? amount;
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
    amount = json['amount'];
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
  int? appPrice;
  int? discount;

  ProfileStatusData(
      {this.verificationStatusID,
        this.verificationStatus,
        this.registrationStatusID,
        this.registrationStatus,
        this.appPrice,
        this.discount});

  ProfileStatusData.fromJson(Map<String, dynamic> json) {
    verificationStatusID = json['verificationStatusID'];
    verificationStatus = json['verificationStatus'];
    registrationStatusID = json['registrationStatusID'];
    registrationStatus = json['registrationStatus'];
    appPrice = json['appPrice'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verificationStatusID'] = this.verificationStatusID;
    data['verificationStatus'] = this.verificationStatus;
    data['registrationStatusID'] = this.registrationStatusID;
    data['registrationStatus'] = this.registrationStatus;
    data['appPrice'] = this.appPrice;
    data['discount'] = this.discount;
    return data;
  }
}
