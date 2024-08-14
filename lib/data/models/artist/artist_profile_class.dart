class ArtistProfileDetailsClass {
  int? artistProfileID;
  int? fKAccountID;
  String? profilePic;
  String? profilePicName;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dateOfBirth;
  String? email;
  String? mobileNumber;
  String? gender;
  int? age;
  int? roleAge;
  double? height;
  int? weight;
  String? bio;
  String? fbLink;
  String? wpLink;
  String? ytLink;
  String? instalink;
  String? emailLink;
  String? websiteLink;
  String? address1;
  String? address2;
  String? district;
  String? state;
  String? postalcode;
  String? alternateMobileNumber;
  String? languageKnown;
  String? eyeColor;
  String? hairColor;
  String? bodyType;
  String? maritalStatus;
  String? vehicle;
  bool? travelThrIndia;
  bool? replayStatus;
  String? message;

  ArtistProfileDetailsClass(
      {this.artistProfileID,
        this.fKAccountID,
        this.profilePic,
        this.profilePicName,
        this.firstName,
        this.middleName,
        this.lastName,
        this.dateOfBirth,
        this.email,
        this.mobileNumber,
        this.gender,
        this.age,
        this.roleAge,
        this.height,
        this.weight,
        this.bio,
        this.fbLink,
        this.wpLink,
        this.ytLink,
        this.instalink,
        this.emailLink,
        this.websiteLink,
        this.address1,
        this.address2,
        this.district,
        this.state,
        this.postalcode,
        this.alternateMobileNumber,
        this.languageKnown,
        this.eyeColor,
        this.hairColor,
        this.bodyType,
        this.maritalStatus,
        this.vehicle,
        this.travelThrIndia,
        this.replayStatus,
        this.message});

  ArtistProfileDetailsClass.fromJson(Map<String, dynamic> json) {
    artistProfileID = json['artistProfileID'];
    fKAccountID = json['fK_AccountID'];
    profilePic = json['profilePic'];
    profilePicName = json['profilePic_Name'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    gender = json['gender'];
    age = json['age'];
    roleAge = json['roleAge'];
    height = json['height'];
    weight = json['weight'];
    bio = json['bio'];
    fbLink = json['fbLink'];
    wpLink = json['wpLink'];
    ytLink = json['ytLink'];
    instalink = json['instalink'];
    emailLink = json['emailLink'];
    websiteLink = json['websiteLink'];
    address1 = json['address1'];
    address2 = json['address2'];
    district = json['district'];
    state = json['state'];
    postalcode = json['postalcode'];
    alternateMobileNumber = json['alternateMobileNumber'];
    languageKnown = json['languageKnown'];
    eyeColor = json['eyeColor'];
    hairColor = json['hairColor'];
    bodyType = json['bodyType'];
    maritalStatus = json['maritalStatus'];
    vehicle = json['vehicle'];
    travelThrIndia = json['travelThrIndia'];
    replayStatus = json['replayStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistProfileID'] = this.artistProfileID;
    data['fK_AccountID'] = this.fKAccountID;
    data['profilePic'] = this.profilePic;
    data['profilePic_Name'] = this.profilePicName;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['roleAge'] = this.roleAge;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['bio'] = this.bio;
    data['fbLink'] = this.fbLink;
    data['wpLink'] = this.wpLink;
    data['ytLink'] = this.ytLink;
    data['instalink'] = this.instalink;
    data['emailLink'] = this.emailLink;
    data['websiteLink'] = this.websiteLink;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['district'] = this.district;
    data['state'] = this.state;
    data['postalcode'] = this.postalcode;
    data['alternateMobileNumber'] = this.alternateMobileNumber;
    data['languageKnown'] = this.languageKnown;
    data['eyeColor'] = this.eyeColor;
    data['hairColor'] = this.hairColor;
    data['bodyType'] = this.bodyType;
    data['maritalStatus'] = this.maritalStatus;
    data['vehicle'] = this.vehicle;
    data['travelThrIndia'] = this.travelThrIndia;
    data['replayStatus'] = this.replayStatus;
    data['message'] = this.message;
    return data;
  }
}
