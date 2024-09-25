class TokenExpirationClass {
  bool? replayStatus;
  String? message;
  String? token;

  TokenExpirationClass({this.replayStatus, this.message, this.token});

  TokenExpirationClass.fromJson(Map<String, dynamic> json) {
    replayStatus = json['replayStatus'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}
