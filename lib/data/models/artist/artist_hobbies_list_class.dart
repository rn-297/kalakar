class ArtistHobbiesListClass {
  List<HobbiesList>? hobbiesList;
  bool? replayStatus;
  String? message;

  ArtistHobbiesListClass({this.hobbiesList, this.replayStatus, this.message});

  ArtistHobbiesListClass.fromJson(Map<String, dynamic> json) {
    if (json['hobbiesList'] != null) {
      hobbiesList = <HobbiesList>[];
      json['hobbiesList'].forEach((v) {
        hobbiesList!.add(new HobbiesList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hobbiesList != null) {
      data['hobbiesList'] = this.hobbiesList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class HobbiesList {
  int? artistProfileHobbiesID;
  int? fKAccountID;
  String? hobbyName;

  HobbiesList({this.artistProfileHobbiesID, this.fKAccountID, this.hobbyName});

  HobbiesList.fromJson(Map<String, dynamic> json) {
    artistProfileHobbiesID = json['artistProfile_hobbiesID'];
    fKAccountID = json['fK_AccountID'];
    hobbyName = json['hobbyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_hobbiesID'] = this.artistProfileHobbiesID;
    data['fK_AccountID'] = this.fKAccountID;
    data['hobbyName'] = this.hobbyName;
    return data;
  }
}
