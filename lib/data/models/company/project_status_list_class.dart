class ProjectStatusListClass {
  List<GetProjectStatusMasterlist>? getProjectStatusMasterlist;
  bool? replayStatus;
  String? message;

  ProjectStatusListClass(
      {this.getProjectStatusMasterlist, this.replayStatus, this.message});

  ProjectStatusListClass.fromJson(Map<String, dynamic> json) {
    if (json['getProjectStatusMasterlist'] != null) {
      getProjectStatusMasterlist = <GetProjectStatusMasterlist>[];
      json['getProjectStatusMasterlist'].forEach((v) {
        getProjectStatusMasterlist!
            .add(new GetProjectStatusMasterlist.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getProjectStatusMasterlist != null) {
      data['getProjectStatusMasterlist'] =
          this.getProjectStatusMasterlist!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class GetProjectStatusMasterlist {
  int? projectStatusID;
  String? projectStatus;

  GetProjectStatusMasterlist({this.projectStatusID, this.projectStatus});

  GetProjectStatusMasterlist.fromJson(Map<String, dynamic> json) {
    projectStatusID = json['projectStatusID'];
    projectStatus = json['projectStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectStatusID'] = this.projectStatusID;
    data['projectStatus'] = this.projectStatus;
    return data;
  }
}
