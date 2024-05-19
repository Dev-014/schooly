class Validator {
  static String? requiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateScholarId(String? value) {
    return requiredField(value);
  }

  static String? validateName(String? value) {
    return requiredField(value);
  }

  static String? validateRollNumber(String? value) {
    return requiredField(value);
  }

  static String? validateDateOfBirth(String? value) {
    return requiredField(value);
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validateBloodGroup(String? value) {
    return requiredField(value);
  }

  static String? validateEmergencyContact(String? value) {
    return requiredField(value);
  }

  static String? validateFathersName(String? value) {
    return requiredField(value);
  }

  static String? validateMothersName(String? value) {
    return requiredField(value);
  }
}