class ProjectDetailAndDocuments {
  List<ProjectDocuments>? projectDocuments;
  int? companyProjectID;
  String? projectDescription;
  String? projectStatus;
  String? projectStatusID;
  String? projectTitle;
  String? projectCoverDoc;
  bool? replayStatus;
  String? message;

  ProjectDetailAndDocuments(
      {this.projectDocuments,
        this.companyProjectID,
        this.projectDescription,
        this.projectStatus,
        this.projectStatusID,
        this.projectTitle,
        this.projectCoverDoc,
        this.replayStatus,
        this.message});

  ProjectDetailAndDocuments.fromJson(Map<String, dynamic> json) {
    if (json['projectDocuments'] != null) {
      projectDocuments = <ProjectDocuments>[];
      json['projectDocuments'].forEach((v) {
        projectDocuments!.add(new ProjectDocuments.fromJson(v));
      });
    }
    companyProjectID = json['companyProjectID'];
    projectDescription = json['projectDescription'];
    projectStatus = json['projectStatus'];
    projectStatusID = json['projectStatusID'];
    projectTitle = json['projectTitle'];
    projectCoverDoc = json['projectCoverDoc'];
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projectDocuments != null) {
      data['projectDocuments'] =
          this.projectDocuments!.map((v) => v.toJson()).toList();
    }
    data['companyProjectID'] = this.companyProjectID;
    data['projectDescription'] = this.projectDescription;
    data['projectStatus'] = this.projectStatus;
    data['projectStatusID'] = this.projectStatusID;
    data['projectTitle'] = this.projectTitle;
    data['projectCoverDoc'] = this.projectCoverDoc;
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class ProjectDocuments {
  String? projectDocuments;
  int? companyProjectDocumentID;

  ProjectDocuments({this.projectDocuments, this.companyProjectDocumentID});

  ProjectDocuments.fromJson(Map<String, dynamic> json) {
    projectDocuments = json['projectDocuments'];
    companyProjectDocumentID = json['companyProjectDocumentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectDocuments'] = this.projectDocuments;
    data['companyProjectDocumentID'] = this.companyProjectDocumentID;
    return data;
  }
}
