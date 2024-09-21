class ArtistExperienceListClass {
  List<ExperienceList>? experienceList;
  bool? replayStatus;
  String? message;

  ArtistExperienceListClass(
      {this.experienceList, this.replayStatus, this.message});

  ArtistExperienceListClass.fromJson(Map<String, dynamic> json) {
    if (json['experienceList'] != null) {
      experienceList = <ExperienceList>[];
      json['experienceList'].forEach((v) {
        experienceList!.add(new ExperienceList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.experienceList != null) {
      data['experienceList'] =
          this.experienceList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class ExperienceList {
  int? artistProfileExperienceID;
  int? fKAccountID;
  String? roleName;
  String? startDate;
  String? endDate;
  String? skillUsed;
  String? roleProfile;
  String? companyName;
  String? roleImage;
  String? roleVideo;

  ExperienceList(
      {this.artistProfileExperienceID,
        this.fKAccountID,
        this.roleName,
        this.startDate,
        this.endDate,
        this.skillUsed,
        this.roleProfile,
        this.companyName,
        this.roleImage,
        this.roleVideo});

  ExperienceList.fromJson(Map<String, dynamic> json) {
    artistProfileExperienceID = json['artistProfile_ExperienceID'];
    fKAccountID = json['fK_AccountID'];
    roleName = json['roleName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    skillUsed = json['skillUsed'];
    roleProfile = json['roleProfile'];
    companyName = json['companyName'];
    roleImage = json['roleImage'];
    roleVideo = json['roleVideo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_ExperienceID'] = this.artistProfileExperienceID;
    data['fK_AccountID'] = this.fKAccountID;
    data['roleName'] = this.roleName;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['skillUsed'] = this.skillUsed;
    data['roleProfile'] = this.roleProfile;
    data['companyName'] = this.companyName;
    data['roleImage'] = this.roleImage;
    data['roleVideo'] = this.roleVideo;
    return data;
  }
}
