class ArtistEducationListClass {
  List<EducationList>? educationList;
  bool? replayStatus;
  String? message;

  ArtistEducationListClass(
      {this.educationList, this.replayStatus, this.message});

  ArtistEducationListClass.fromJson(Map<String, dynamic> json) {
    if (json['educationList'] != null) {
      educationList = <EducationList>[];
      json['educationList'].forEach((v) {
        educationList!.add(new EducationList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.educationList != null) {
      data['educationList'] =
          this.educationList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
     return data;
  }
}

class EducationList {
  int? artistProfileEducationID;
  int? fKAccountID;
  String? educationType;
  String? universityOrInstitute;
  String? course;
  String? specialization;
  String? coursetype;
  String? courseStartDate;
  String? courseEndDate;
  double? score;

  EducationList(
      {this.artistProfileEducationID,
        this.fKAccountID,
        this.educationType,
        this.universityOrInstitute,
        this.course,
        this.specialization,
        this.coursetype,
        this.courseStartDate,
        this.courseEndDate,
        this.score});

  EducationList.fromJson(Map<String, dynamic> json) {
    artistProfileEducationID = json['artistProfile_EducationID'];
    fKAccountID = json['fK_AccountID'];
    educationType = json['educationType'];
    universityOrInstitute = json['universityOrInstitute'];
    course = json['course'];
    specialization = json['specialization'];
    coursetype = json['coursetype'];
    courseStartDate = json['courseStartDate'];
    courseEndDate = json['courseEndDate'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_EducationID'] = this.artistProfileEducationID;
    data['fK_AccountID'] = this.fKAccountID;
    data['educationType'] = this.educationType;
    data['universityOrInstitute'] = this.universityOrInstitute;
    data['course'] = this.course;
    data['specialization'] = this.specialization;
    data['coursetype'] = this.coursetype;
    data['courseStartDate'] = this.courseStartDate;
    data['courseEndDate'] = this.courseEndDate;
    data['score'] = this.score;
    return data;
  }
}
