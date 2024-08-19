class ArtistInterestedInClass {
  List<InterestList>? interestList;
  bool? replayStatus;
  String? message;

  ArtistInterestedInClass({this.interestList, this.replayStatus, this.message});

  ArtistInterestedInClass.fromJson(Map<String, dynamic> json) {
    if (json['interestList'] != null) {
      interestList = <InterestList>[];
      json['interestList'].forEach((v) {
        interestList!.add(new InterestList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.interestList != null) {
      data['interestList'] = this.interestList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class InterestList {
  int? fKInterstedListMasterID;
  int? fKAccountID;
  int? artistProfileInterestID;
  String? interestedName;
  bool? yesOrNO;

  InterestList(
      {this.fKInterstedListMasterID,
        this.fKAccountID,
        this.artistProfileInterestID,
        this.interestedName,
        this.yesOrNO});

  InterestList.fromJson(Map<String, dynamic> json) {
    fKInterstedListMasterID = json['fK_InterstedListMasterID'];
    fKAccountID = json['fK_AccountID'];
    artistProfileInterestID = json['artistProfile_InterestID'];
    interestedName = json['interestedName'];
    yesOrNO = json['yesOrNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fK_InterstedListMasterID'] = this.fKInterstedListMasterID;
    data['fK_AccountID'] = this.fKAccountID;
    data['artistProfile_InterestID'] = this.artistProfileInterestID;
    data['interestedName'] = this.interestedName;
    data['yesOrNO'] = this.yesOrNO;
    return data;
  }
}
