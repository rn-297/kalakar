class NotificationSettingsClass {
  bool? isNotificationOn;
  bool? replayStatus;
  String? message;

  NotificationSettingsClass(
      {this.isNotificationOn, this.replayStatus, this.message});

  NotificationSettingsClass.fromJson(Map<String, dynamic> json) {
    isNotificationOn = json['isNotificationOn'];
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isNotificationOn'] = this.isNotificationOn;
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}
