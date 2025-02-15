class ArtistDocumentListClass {
  List<DocumentsList>? documentsList;
  bool? replayStatus;
  String? message;

  ArtistDocumentListClass(
      {this.documentsList, this.replayStatus, this.message});

  ArtistDocumentListClass.fromJson(Map<String, dynamic> json) {
    if (json['documentsList'] != null) {
      documentsList = <DocumentsList>[];
      json['documentsList'].forEach((v) {
        documentsList!.add(new DocumentsList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documentsList != null) {
      data['documentsList'] =
          this.documentsList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class DocumentsList {
  int? fKAccountID;
  String? passport;
  String? fileCorporationCard;
  String? adharCard;
  String? passportName;
  String? fileCorporationCardName;
  String? adharCardName;

  DocumentsList(
      {this.fKAccountID,
        this.passport,
        this.fileCorporationCard,
        this.adharCard,
        this.passportName,
        this.fileCorporationCardName,
        this.adharCardName,});

  DocumentsList.fromJson(Map<String, dynamic> json) {
    fKAccountID = json['fK_AccountID'];
    passport = json['passport'];
    fileCorporationCard = json['fileCorporationCard'];
    adharCardName = json['adharCard'];
    passportName = json['passportName'];
    fileCorporationCardName = json['fileCorporationCardName'];
    adharCardName = json['adharCardName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fK_AccountID'] = this.fKAccountID;
    data['passport'] = this.passport;
    data['fileCorporationCard'] = this.fileCorporationCard;
    data['adharCard'] = this.adharCard;
    data['passportName'] = this.passportName;
    data['fileCorporationCardName'] = this.fileCorporationCardName;
    data['adharCardName'] = this.adharCardName;
    return data;
  }
}
