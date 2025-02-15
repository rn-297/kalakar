import 'dart:typed_data';

class ArtistPortfolioListClass {
  List<PortfolioList>? portfolioList;
  bool? replayStatus;
  String? message;

  ArtistPortfolioListClass(
      {this.portfolioList, this.replayStatus, this.message});

  ArtistPortfolioListClass.fromJson(Map<String, dynamic> json) {
    if (json['portfolioList'] != null) {
      portfolioList = <PortfolioList>[];
      json['portfolioList'].forEach((v) {
        portfolioList!.add(new PortfolioList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.portfolioList != null) {
      data['portfolioList'] =
          this.portfolioList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class PortfolioList {
  int? artistProfilePortfolioID;
  int? fKAccountID;
  int? fileType;
  String? filePath;
  String? filePathName;
  Uint8List? thumbnail;

  PortfolioList(
      {this.artistProfilePortfolioID,
      this.fKAccountID,
      this.fileType,
      this.filePath,
      this.filePathName,
      });

  PortfolioList.fromJson(Map<String, dynamic> json) {
    artistProfilePortfolioID = json['artistProfile_PortfolioID'];
    fKAccountID = json['fK_AccountID'];
    fileType = json['fileType'];
    filePath = json['filePath'];
    filePathName = json['filePathName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfile_PortfolioID'] = this.artistProfilePortfolioID;
    data['fK_AccountID'] = this.fKAccountID;
    data['fileType'] = this.fileType;
    data['filePath'] = this.filePath;
    data['filePathName'] = this.filePathName;
    return data;
  }
}
