class ArtistComfortableInListClass {
  List<ComfortableInList>? comfortableInList;
  bool? replayStatus;
  String? message;

  ArtistComfortableInListClass(
      {this.comfortableInList, this.replayStatus, this.message});

  ArtistComfortableInListClass.fromJson(Map<String, dynamic> json) {
    if (json['comfortableInList'] != null) {
      comfortableInList = <ComfortableInList>[];
      json['comfortableInList'].forEach((v) {
        comfortableInList!.add(new ComfortableInList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comfortableInList != null) {
      data['comfortableInList'] =
          this.comfortableInList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class ComfortableInList {
  int? artistProfileComfortableInID;
  int? fKAccountID;
  int? fKComfortableListMasterID;
  String? comfortableName;
  bool? yesOrNO;

  ComfortableInList(
      {this.artistProfileComfortableInID,
        this.fKAccountID,
        this.fKComfortableListMasterID,
        this.comfortableName,
        this.yesOrNO});

  ComfortableInList.fromJson(Map<String, dynamic> json) {
    artistProfileComfortableInID = json['artistProfile_ComfortableInID'];
    fKAccountID = json['fK_AccountID'];
    fKComfortableListMasterID = json['fK_ComfortableListMasterID'];
    comfortableName = json['comfortableName'];
    yesOrNO = json['yesOrNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_ComfortableInID'] = this.artistProfileComfortableInID;
    data['fK_AccountID'] = this.fKAccountID;
    data['fK_ComfortableListMasterID'] = this.fKComfortableListMasterID;
    data['comfortableName'] = this.comfortableName;
    data['yesOrNO'] = this.yesOrNO;
    return data;
  }
}
