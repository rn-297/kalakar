class CompanyProjectClass {
  List<CompanyProjectsList>? lResponseCompanyProjects;
  bool? replayStatus;
  String? message;


  CompanyProjectClass(
      {this.lResponseCompanyProjects,
        this.replayStatus,
        this.message});

  CompanyProjectClass.fromJson(Map<String, dynamic> json) {
    if (json['_ResponseCompanyProjects'] != null) {
      lResponseCompanyProjects = <CompanyProjectsList>[];
      json['_ResponseCompanyProjects'].forEach((v) {
        lResponseCompanyProjects!.add(new CompanyProjectsList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lResponseCompanyProjects != null) {
      data['_ResponseCompanyProjects'] =
          this.lResponseCompanyProjects!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class CompanyProjectsList {
  int? companyProjectID;
  String? projectDescription;
  String? projectStatus;
  String? projectStatusID;
  String? projectTitle;
  String? projectCoverDoc;

  CompanyProjectsList(
      {this.companyProjectID,
        this.projectDescription,
        this.projectStatus,
        this.projectStatusID,
        this.projectTitle,
        this.projectCoverDoc});

  CompanyProjectsList.fromJson(Map<String, dynamic> json) {
    companyProjectID = json['companyProjectID'];
    projectDescription = json['projectDescription'];
    projectStatus = json['projectStatus'];
    projectStatusID = json['projectStatusID'];
    projectTitle = json['projectTitle'];
    projectCoverDoc = json['projectCoverDoc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyProjectID'] = this.companyProjectID;
    data['projectDescription'] = this.projectDescription;
    data['projectStatus'] = this.projectStatus;
    data['projectStatusID'] = this.projectStatusID;
    data['projectTitle'] = this.projectTitle;
    data['projectCoverDoc'] = this.projectCoverDoc;
    return data;
  }
}
