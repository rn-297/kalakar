class ResponseModel {
  bool? replayStatus;
  String? message;
  dynamic data;

  ResponseModel({this.replayStatus, this.message, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    replayStatus = json['replayStatus'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
