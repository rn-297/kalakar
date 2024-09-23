class ApplyForListClass {
  List<ApplyList>? applyList;
  bool? replayStatus;
  String? message;

  ApplyForListClass({this.applyList, this.replayStatus, this.message});

  ApplyForListClass.fromJson(Map<String, dynamic> json) {
    if (json['applyList'] != null) {
      applyList = <ApplyList>[];
      json['applyList'].forEach((v) {
        applyList!.add(new ApplyList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.applyList != null) {
      data['applyList'] = this.applyList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class ApplyList {
  int? artistProfileApplyForID;
  int? fKAccountID;
  int? fKApplyListMasterID;
  String? applyName;
  bool? yesOrNO;

  ApplyList(
      {this.artistProfileApplyForID,
        this.fKAccountID,
        this.fKApplyListMasterID,
        this.applyName,
        this.yesOrNO});

  ApplyList.fromJson(Map<String, dynamic> json) {
    artistProfileApplyForID = json['artistProfile_ApplyForID'];
    fKAccountID = json['fK_AccountID'];
    fKApplyListMasterID = json['fK_ApplyListMasterID'];
    applyName = json['applyName'];
    yesOrNO = json['yesOrNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_ApplyForID'] = this.artistProfileApplyForID;
    data['fK_AccountID'] = this.fKAccountID;
    data['fK_ApplyListMasterID'] = this.fKApplyListMasterID;
    data['applyName'] = this.applyName;
    data['yesOrNO'] = this.yesOrNO;
    return data;
  }
}
