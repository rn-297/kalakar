class PaymentAndroidDetailsModel {
  String? callBackURL;
  String? base64Body;
  String? checksum;
  bool? replayStatus;
  String? message;
  String? data;

  PaymentAndroidDetailsModel(
      {this.callBackURL,
        this.base64Body,
        this.checksum,
        this.replayStatus,
        this.message,
        this.data});

  PaymentAndroidDetailsModel.fromJson(Map<String, dynamic> json) {
    callBackURL = json['callBackURL'];
    base64Body = json['base64Body'];
    checksum = json['checksum'];
    replayStatus = json['replayStatus'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['callBackURL'] = this.callBackURL;
    data['base64Body'] = this.base64Body;
    data['checksum'] = this.checksum;
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
