import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RequirementController extends GetxController {
  TextEditingController requirementTitleTEController = TextEditingController();
  TextEditingController descriptionTEController = TextEditingController();
  TextEditingController lookingForTEController = TextEditingController();
  TextEditingController noOfOpeningsTEController = TextEditingController();
  TextEditingController ageTEController = TextEditingController();
  TextEditingController languageTEController = TextEditingController();
  TextEditingController heightTEController = TextEditingController();
  TextEditingController weightTEController = TextEditingController();
  TextEditingController hairColorTEController = TextEditingController();
  TextEditingController bodyTypeTEController = TextEditingController();
  TextEditingController experienceTEController = TextEditingController();
  TextEditingController startDateTEController = TextEditingController();
  TextEditingController endDateTEController = TextEditingController();
  TextEditingController shootingLocationTEController = TextEditingController();
  TextEditingController defineRoleTEController = TextEditingController();
  TextEditingController splSkillRequiredTEController = TextEditingController();
  TextEditingController comfortableInTEController = TextEditingController();
  TextEditingController scriptForAuditionTEController = TextEditingController();
  TextEditingController fbLinkTEController = TextEditingController();
  TextEditingController wpLinkTEController = TextEditingController();
  TextEditingController ytLinkTEController = TextEditingController();
  TextEditingController instaLinkTEController = TextEditingController();
  TextEditingController emailLinkTEController = TextEditingController();
  TextEditingController websiteLinkTEController = TextEditingController();

  //global keys
  final _formRequirementKey = GlobalKey<FormState>();

  get formRequirementKey => _formRequirementKey;

  //validators
  String? requirementTitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Requirement Title';
    }
    return null;
  }

  String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }String? lookingForValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Looking For';
    }
    return null;
  }

  String? noOfOpeningValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Number Of Openings';
    }
    return null;
  }String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Age';
    }
    return null;
  }

  String? languageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Language';
    }
    return null;
  }String? heightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Height';
    }
    return null;
  }

  String? weightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Weight';
    }
    return null;
  }

  String? hairColorValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Hair Color';
    }
    return null;
  }String? bodyTypeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Body Type';
    }
    return null;
  }

  String? experienceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Experience';
    }
    return null;
  }

  String? startDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select Start Date';
    }
    return null;
  }

  String? endDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select End Date';
    }
    return null;
  }
  String? shootingLocationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Shooting Location';
    }
    return null;
  }

  String? defineRoleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Define Role';
    }
    return null;
  }String? splSkillsRequiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Special Skills Required';
    }
    return null;
  }

  String? comfortableInValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Comfortable In';
    }
    return null;
  }String? scriptForAuditionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Script For Audition';
    }
    return null;
  }

  String? fbLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }String? wpLinkTitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Requirement Title';
    }
    return null;
  }

  String? ytLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }String? instaLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Requirement Title';
    }
    return null;
  }

  String? emailLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }
  String? websiteLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }
}
