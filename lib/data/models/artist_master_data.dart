class ArtistMasterClass {
  List<ComfortableListMaster>? comfortableListMaster;
  List<ApplyListMaster>? applyListMaster;
  List<InterestedListMaster>? interestedListMaster;
  List<RequirementStatusMasterList>? requirementStatusMasterList;
  List<HaiColorMasterList>? haiColorMasterList;
  List<BodyTypeMasterList>? bodyTypeMasterList;
  List<EyeColorMasterList>? eyeColorMasterList;
  List<MaritalStatusMasterList>? maritalStatusMasterList;
  List<AgeRangeMasterList>? ageRangeMasterList;
  List<HeighRangeMasterList>? heighRangeMasterList;
  List<WeightRangeMasterList>? weightRangeMasterList;
  bool? replayStatus;
  String? message;

  ArtistMasterClass(
      {this.comfortableListMaster,
      this.applyListMaster,
      this.interestedListMaster,
      this.requirementStatusMasterList,
      this.haiColorMasterList,
      this.bodyTypeMasterList,
      this.eyeColorMasterList,
      this.maritalStatusMasterList,
      this.ageRangeMasterList,
      this.heighRangeMasterList,
      this.weightRangeMasterList,
      this.replayStatus,
      this.message});

  ArtistMasterClass.fromJson(Map<String, dynamic> json) {
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
    if (json['requirementStatusMasterList'] != null) {
      requirementStatusMasterList = <RequirementStatusMasterList>[];
      json['requirementStatusMasterList'].forEach((v) {
        requirementStatusMasterList!
            .add(new RequirementStatusMasterList.fromJson(v));
      });
    }
    if (json['haiColorMasterList'] != null) {
      haiColorMasterList = <HaiColorMasterList>[];
      json['haiColorMasterList'].forEach((v) {
        haiColorMasterList!.add(new HaiColorMasterList.fromJson(v));
      });
    }
    if (json['bodyTypeMasterList'] != null) {
      bodyTypeMasterList = <BodyTypeMasterList>[];
      json['bodyTypeMasterList'].forEach((v) {
        bodyTypeMasterList!.add(new BodyTypeMasterList.fromJson(v));
      });
    }
    if (json['eyeColorMasterList'] != null) {
      eyeColorMasterList = <EyeColorMasterList>[];
      json['eyeColorMasterList'].forEach((v) {
        eyeColorMasterList!.add(new EyeColorMasterList.fromJson(v));
      });
    }
    if (json['maritalStatusMasterList'] != null) {
      maritalStatusMasterList = <MaritalStatusMasterList>[];
      json['maritalStatusMasterList'].forEach((v) {
        maritalStatusMasterList!.add(new MaritalStatusMasterList.fromJson(v));
      });
    }
    if (json['ageRangeMasterList'] != null) {
      ageRangeMasterList = <AgeRangeMasterList>[];
      json['ageRangeMasterList'].forEach((v) {
        ageRangeMasterList!.add(new AgeRangeMasterList.fromJson(v));
      });
    }
    if (json['heighRangeMasterList'] != null) {
      heighRangeMasterList = <HeighRangeMasterList>[];
      json['heighRangeMasterList'].forEach((v) {
        heighRangeMasterList!.add(new HeighRangeMasterList.fromJson(v));
      });
    }
    if (json['weightRangeMasterList'] != null) {
      weightRangeMasterList = <WeightRangeMasterList>[];
      json['weightRangeMasterList'].forEach((v) {
        weightRangeMasterList!.add(new WeightRangeMasterList.fromJson(v));
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
    if (this.requirementStatusMasterList != null) {
      data['requirementStatusMasterList'] =
          this.requirementStatusMasterList!.map((v) => v.toJson()).toList();
    }
    if (this.haiColorMasterList != null) {
      data['haiColorMasterList'] =
          this.haiColorMasterList!.map((v) => v.toJson()).toList();
    }
    if (this.bodyTypeMasterList != null) {
      data['bodyTypeMasterList'] =
          this.bodyTypeMasterList!.map((v) => v.toJson()).toList();
    }
    if (this.eyeColorMasterList != null) {
      data['eyeColorMasterList'] =
          this.eyeColorMasterList!.map((v) => v.toJson()).toList();
    }
    if (this.maritalStatusMasterList != null) {
      data['maritalStatusMasterList'] =
          this.maritalStatusMasterList!.map((v) => v.toJson()).toList();
    }
    if (this.ageRangeMasterList != null) {
      data['ageRangeMasterList'] =
          this.ageRangeMasterList!.map((v) => v.toJson()).toList();
    }
    if (this.heighRangeMasterList != null) {
      data['heighRangeMasterList'] =
          this.heighRangeMasterList!.map((v) => v.toJson()).toList();
    }
    if (this.weightRangeMasterList != null) {
      data['weightRangeMasterList'] =
          this.weightRangeMasterList!.map((v) => v.toJson()).toList();
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

class RequirementStatusMasterList {
  String? name;
  int? id;

  RequirementStatusMasterList({this.name, this.id});

  RequirementStatusMasterList.fromJson(Map<String, dynamic> json) {
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

class HaiColorMasterList {
  String? name;
  int? id;

  HaiColorMasterList({this.name, this.id});

  HaiColorMasterList.fromJson(Map<String, dynamic> json) {
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

class BodyTypeMasterList {
  String? name;
  int? id;

  BodyTypeMasterList({this.name, this.id});

  BodyTypeMasterList.fromJson(Map<String, dynamic> json) {
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

class EyeColorMasterList {
  String? name;
  int? id;

  EyeColorMasterList({this.name, this.id});

  EyeColorMasterList.fromJson(Map<String, dynamic> json) {
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

class MaritalStatusMasterList {
  String? name;
  int? id;

  MaritalStatusMasterList({this.name, this.id});

  MaritalStatusMasterList.fromJson(Map<String, dynamic> json) {
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

class AgeRangeMasterList {
  String? name;
  int? id;

  AgeRangeMasterList({this.name, this.id});

  AgeRangeMasterList.fromJson(Map<String, dynamic> json) {
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

class HeighRangeMasterList {
  String? name;
  int? id;

  HeighRangeMasterList({this.name, this.id});

  HeighRangeMasterList.fromJson(Map<String, dynamic> json) {
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

class WeightRangeMasterList {
  String? name;
  int? id;

  WeightRangeMasterList({this.name, this.id});

  WeightRangeMasterList.fromJson(Map<String, dynamic> json) {
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
