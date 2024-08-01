class CompanyProjectClass {
  List<CompanyProjectsData>? lResponseCompanyProjects;
  bool? replayStatus;
  String? message;


  CompanyProjectClass(
      {this.lResponseCompanyProjects,
        this.replayStatus,
        this.message});

  CompanyProjectClass.fromJson(Map<String, dynamic> json) {
    if (json['_ResponseCompanyProjects'] != null) {
      lResponseCompanyProjects = <CompanyProjectsData>[];
      json['_ResponseCompanyProjects'].forEach((v) {
        lResponseCompanyProjects!.add(new CompanyProjectsData.fromJson(v));
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

class CompanyProjectsData {
  int? companyProjectID;
  String? projectDescription;
  String? projectStatus;
  String? projectStatusID;
  String? projectTitle;
  String? projectCoverDoc;

  CompanyProjectsData(
      {this.companyProjectID,
        this.projectDescription,
        this.projectStatus,
        this.projectStatusID,
        this.projectTitle,
        this.projectCoverDoc});

  CompanyProjectsData.fromJson(Map<String, dynamic> json) {
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
