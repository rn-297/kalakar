class ArtistMasterData {
  List<ComfortableListMaster>? comfortableListMaster;
  List<ApplyListMaster>? applyListMaster;
  List<InterestedListMaster>? interestedListMaster;
  bool? replayStatus;
  String? message;

  ArtistMasterData(
      {this.comfortableListMaster,
        this.applyListMaster,
        this.interestedListMaster,
        this.replayStatus,
        this.message});

  ArtistMasterData.fromJson(Map<String, dynamic> json) {
    if (json['comfortableListMaster'] != null) {
      comfortableListMaster = <ComfortableListMaster>[];
      json['comfortableListMaster'].forEach((v) {
        comfortableListMaster!.add(new ComfortableListMaster.fromJson(v));
      });
    }
    if (json['applyListMaster'] != null) {
      applyListMaster = <ApplyListMaster>[];
      json['applyListMaster'].forEach((v) {
        applyListMaster!.add(new ApplyListMaster.fromJson(v));
      });
    }
    if (json['interestedListMaster'] != null) {
      interestedListMaster = <InterestedListMaster>[];
      json['interestedListMaster'].forEach((v) {
        interestedListMaster!.add(new InterestedListMaster.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comfortableListMaster != null) {
      data['comfortableListMaster'] =
          this.comfortableListMaster!.map((v) => v.toJson()).toList();
    }
    if (this.applyListMaster != null) {
      data['applyListMaster'] =
          this.applyListMaster!.map((v) => v.toJson()).toList();
    }
    if (this.interestedListMaster != null) {
      data['interestedListMaster'] =
          this.interestedListMaster!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class ComfortableListMaster {
  String? name;
  int? id;

  ComfortableListMaster({this.name, this.id});

  ComfortableListMaster.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class ApplyListMaster {
  String? name;
  int? id;

  ApplyListMaster({this.name, this.id});

  ApplyListMaster.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class InterestedListMaster {
  String? name;
  int? id;

  InterestedListMaster({this.name, this.id});

  InterestedListMaster.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
