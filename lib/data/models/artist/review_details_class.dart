class ReviewClass {
  List<GetApplicationReviewList>? getApplicationReviewList;
  bool? replayStatus;
  String? message;

  ReviewClass({this.getApplicationReviewList, this.replayStatus, this.message});

  ReviewClass.fromJson(Map<String, dynamic> json) {
    if (json['getApplicationReviewList'] != null) {
      getApplicationReviewList = <GetApplicationReviewList>[];
      json['getApplicationReviewList'].forEach((v) {
        getApplicationReviewList!.add(new GetApplicationReviewList.fromJson(v));
      });
    }
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getApplicationReviewList != null) {
      data['getApplicationReviewList'] =
          this.getApplicationReviewList!.map((v) => v.toJson()).toList();
    }
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}

class GetApplicationReviewList {
  int? applicationReviewID;
  int? fKAccountID;
  String? reviewByProfilePic;
  String? reviewBy;
  double? reviewStar;
  String? review;

  GetApplicationReviewList(
      {this.applicationReviewID,
        this.fKAccountID,
        this.reviewByProfilePic,
        this.reviewBy,
        this.reviewStar,
        this.review});

  GetApplicationReviewList.fromJson(Map<String, dynamic> json) {
    applicationReviewID = json['applicationReviewID'];
    fKAccountID = json['fK_AccountID'];
    reviewByProfilePic = json['reviewByProfilePic'];
    reviewBy = json['reviewBy'];
    reviewStar = json['reviewStar'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicationReviewID'] = this.applicationReviewID;
    data['fK_AccountID'] = this.fKAccountID;
    data['reviewByProfilePic'] = this.reviewByProfilePic;
    data['reviewBy'] = this.reviewBy;
    data['reviewStar'] = this.reviewStar;
    data['review'] = this.review;
    return data;
  }
}
