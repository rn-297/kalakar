class Validator {
  // Validate First Name
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First Name';
    }
    return null;
  }

  // Validate Last Name
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  // Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Email';
    }
    // Regular expression for email validation
    String pattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a Valid Email';
    }
    return null;
  }

  // Validate Mobile Number
  static String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Mobile Number';
    }
    // Regular expression for 10-digit number validation
    String pattern = r'^\d{10}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  // Validate either Email or Mobile Number
  static String? validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter a Value';
    }

    // Check if value matches the pattern of a valid email
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp emailRegex = RegExp(emailPattern);

    // Check if value matches the pattern of a 10-digit mobile number
    String mobilePattern = r'^\d{10}$';
    RegExp mobileRegex = RegExp(mobilePattern);

    if (emailRegex.hasMatch(value)) {
      return null; // Valid email
    } else if (mobileRegex.hasMatch(value)) {
      return null; // Valid mobile number
    } else {
      return 'Enter a Valid Email or Mobile Number';
    }
  }

  // Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Password';
    }
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigits = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = value.length >= 8;

    if (!hasUppercase) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!hasLowercase) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!hasDigits) {
      return 'Password must contain at least one digit';
    }
    if (!hasSpecialCharacters) {
      return 'Password must contain at least one special character';
    }
    if (!hasMinLength) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // Validate Confirm Password
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    }
    if (value != password) {
      return "Password didn't match";
    }
    return null;
  }

  //validate company name
  static String? validateCompanyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Company Name/Production House';
    }
    return null;
  }

  //validate authorize Admin Name
  static String? validateAuthorizeAdminName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Authorize Admin Name';
    }
    return null;
  }

  //validate name
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Name';
    }
    return null;
  }

  //validate owner ceo name
  static String? validateOwnerCeoName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Admin Owner CEO';
    }
    return null;
  }

  //validate address
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Address';
    }
    return null;
  }

  //validate address
  static String? validateAddressLine1(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Address Line 1';
    }
    return null;
  }

  //validate address
  static String? validateAddressLine2(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Address Line 1';
    }
    return null;
  }

  // validate postal code
  static String? validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Postal Code / Pin Code';
    }
    return null;
  }

  // validate district
  static String? validateDistrict(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select District';
    }
    return null;
  }

  // validate state

  static String? validateState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select State';
    }
    return null;
  }
  // validate gender

  static String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Gender';
    }
    return null;
  }

  // validate apply for

  static String? validateApplyFor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Apply For';
    }
    return null;
  }

  // validate Bio
  static String? validateBio(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Bio';
    }
    return null;
  }

  // validate project title

  static String? validateProjectTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Project Title';
    }
    return null;
  }

  // validate project title

  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Title';
    }
    return null;
  }

  // validate project Description
  static String? validateProjectDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Project Description';
    }
    return null;
  }

  // validate project Status
  static String? validateProjectStatus(String? value) {
    if (value == null) {
      return 'Please Select Project Status';
    }
    return null;
  }

// validate admin adhar card
  static String? validateAdminAdharCard(String? value) {
    if (value == null) {
      return 'Please Select Admin Adhar Card';
    }
    return null;
  }

// validate film corporation card
  static String? validateFilmCorporationCard(String? value) {
    if (value == null) {
      return 'Please Select Film Corporation Card';
    }
    return null;
  }

// validate upload selfie
  static String? validateUploadSelfie(String? value) {
    if (value == null) {
      return 'Please Select Upload Selfie';
    }
    return null;
  }

// validate address proof of company
  static String? validateAddressProofOfCompany(String? value) {
    if (value == null) {
      return 'Please Select Address Proof of Company';
    }
    return null;
  }

// validate first name
  static String? validateMiddleName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Middle Name';
    }
    return null;
  }

//validate dob
  static String? validateDob(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Date Of Birth';
    }
    return null;
  }

  //validate height
  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Height';
    }
    return null;
  }

  //validate weight
  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Weight';
    }
    return null;
  }

  //validate age
  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Age';
    }
    return null;
  }

  //validate age
  static String? validateHairColor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Hair Color';
    }
    return null;
  }

// validate role age
  static String? validateRoleAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Role Age';
    }
    return null;
  }

//validate alternate mobile number
  static String? validateAlternateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Last Name';
    }
    return null;
  }

  //validate language known
  static String? validateLanguageKnown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Language Known';
    }
    return null;
  }

  //validate eye color
  static String? validateEyeColor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Eye Color';
    }
    return null;
  }

  //validate hair color
  static String? hairColorValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Hair Color';
    }
    return null;
  }

  //validate body type
  static String? validateBodyType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Body type';
    }
    return null;
  }

  //validate marital status
  static String? validateMaritalStatus(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Marital Status';
    }
    return null;
  }

  //validate vehicle
  static String? validateVehicle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Vehicle ';
    }
    return null;
  }

  //validate travel through india
  static String? validateTravelThrIndia(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Travel Through India';
    }
    return null;
  }

  //validate Education Type
  static String? validateEducationType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Education Type';
    }
    return null;
  }

  //validate University or institute
  static String? validateUniversityOrInstitute(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter University Or Institute';
    }
    return null;
  }

  //validate course
  static String? validateCourse(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Course';
    }
    return null;
  }

  //validate specialization
  static String? validateSpecialization(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Specialization';
    }
    return null;
  }

  //validate course type
  static String? validateCourseType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Course Type';
    }
    return null;
  }

  //validate course Start Date
  static String? validateCourseStartDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Course Start Date';
    }
    return null;
  }

  //validate Course End date
  static String? validateCourseEndDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Course End Date';
    }
    return null;
  }

//validate Education Type
  static String? validateScore(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Score';
    }
    return null;
  }

//validate passport
  static String? validatePassport(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Passport';
    }
    return null;
  }

  //validate adhar card
  static String? validateAdharCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Adhar Card';
    }
    return null;
  }

  //validate Comfortable
  static String? validateComfortableIn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Comfortable In';
    }
    return null;
  }

  //validate Role Name
  static String? validateRoleName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Role Name';
    }
    return null;
  }

  //validate Start Date
  static String? validateStartDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Start Date';
    }
    return null;
  }

  //validate End date
  static String? validateEndDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select End Date';
    }
    return null;
  }

  //validate Skills Used
  static String? validateSkillsUsed(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Skills Used';
    }
    return null;
  }

  //validate role profile
  static String? validateRoleProfile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Role Profile';
    }
    return null;
  }

  //validate Education Type
  static String? validateHobby(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Hobby';
    }
    return null;
  }

  //validate Education Type
  static String? validateInterestedIn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Interested In';
    }
    return null;
  }

  //validate File Type
  static String? validateFileType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select File Type';
    }
    return null;
  } //validate Education Type

  static String? validateFilePath(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select File Path';
    }
    return null;
  }


  //validate requirement title
  static String? validateRequirementTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Requirement Title';
    }
    return null;
  }

//validate requirement status
  static String? validateRequirementStatus(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Requirement Status';
    }
    return null;
  }

  //validate requirement Description
  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }

  //validate looking for
  static  String? validateLookingFor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Looking For';
    }
    return null;
  }

  //validate number of openings
  static  String? validateNoOfOpening(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Number Of Openings';
    }
    return null;
  }

  //validate Language
  static String? validateLanguage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Language';
    }
    return null;
  }
  //validate Experience

  static String? validateExperience(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Experience';
    }
    return null;
  }

  //validate shooting location
  static String? validateShootingLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Shooting Location';
    }
    return null;
  }
  //validate shooting Start Date
  static String? validateShootingStartDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Shooting Start Date';
    }
    return null;
  }

  //validate shooting Start Date
  static String? validateShootingEndDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Shooting End Date';
    }
    return null;
  }

  //validate shooting location
  static String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Location';
    }
    return null;
  }

  //validate define role
  static String? validateDefineRole(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Define Role';
    }
    return null;
  }

  //validate Special Skills required
  static String? validateSplSkillsRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Special Skills Required';
    }
    return null;
  }

  //validate Special Script for validation
  static  String? validateScriptForAudition(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Script For Audition';
    }
    return null;
  }

  //validate requirement End date
  static String? validateRequirementEndDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Requirement End Date';
    }
    return null;
  }



/*
    //validate Education Type
  static String? validateEducationType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Education Type';
    }
    return null; }//validate Education Type
  static String? validateEducationType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Education Type';
    }
    return null; }//validate Education Type
  static String? validateEducationType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Education Type';
    }
    return null;
  }*/
}
