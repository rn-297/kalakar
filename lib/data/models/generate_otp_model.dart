class GenerateOtpClass {
  Result? result;

  GenerateOtpClass({this.result});

  GenerateOtpClass.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  bool? replayStatus;
  String? message;
  Null? data;

  Result({this.replayStatus, this.message, this.data});

  Result.fromJson(Map<String, dynamic> json) {
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
