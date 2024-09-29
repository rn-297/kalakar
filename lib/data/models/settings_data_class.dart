class SettingsDataClass {
  String? aboutUS;
  String? help;
  String? privacyPolicy;
  String? termsAndConditions;
  String? fbLink;
  String? instaLink;
  String? ytLink;
  String? emailLink;
  String? whatsAppLink;
  String? websiteLink;
  String? xOrTwitterlink;
  bool? replayStatus;
  String? message;

  SettingsDataClass(
      {this.aboutUS,
        this.help,
        this.privacyPolicy,
        this.termsAndConditions,
        this.fbLink,
        this.instaLink,
        this.ytLink,
        this.emailLink,
        this.whatsAppLink,
        this.websiteLink,
        this.xOrTwitterlink,
        this.replayStatus,
        this.message});

  SettingsDataClass.fromJson(Map<String, dynamic> json) {
    aboutUS = json['aboutUS'];
    help = json['help'];
    privacyPolicy = json['privacyPolicy'];
    termsAndConditions = json['termsAndConditions'];
    fbLink = json['fbLink'];
    instaLink = json['instaLink'];
    ytLink = json['ytLink'];
    emailLink = json['emailLink'];
    whatsAppLink = json['whatsAppLink'];
    websiteLink = json['websiteLink'];
    xOrTwitterlink = json['xOrTwitterlink'];
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aboutUS'] = this.aboutUS;
    data['help'] = this.help;
    data['privacyPolicy'] = this.privacyPolicy;
    data['termsAndConditions'] = this.termsAndConditions;
    data['fbLink'] = this.fbLink;
    data['instaLink'] = this.instaLink;
    data['ytLink'] = this.ytLink;
    data['emailLink'] = this.emailLink;
    data['whatsAppLink'] = this.whatsAppLink;
    data['websiteLink'] = this.websiteLink;
    data['xOrTwitterlink'] = this.xOrTwitterlink;
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}
