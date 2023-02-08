import 'package:get/get.dart';

class Validations{

  static String? nullOnfieldNotEmpty(value) => value.isEmpty ? 'Cannot be empty' : null;

  /// Method to validate whether the field is of email or not.
  static String? fieldIsEmail(String? value) {
    var isEmptyValidation = nullOnfieldNotEmpty(value);

    var boolStringNotEmpty = isEmptyValidation == null;
    if (boolStringNotEmpty) {
      if (GetUtils.isEmail(value!)) {
        return null;
      }
      return 'Invalid email';
    }
    return isEmptyValidation;
  }

  static bool isPassword(String s) => GetUtils.hasMatch(s, r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');


  /// Method to validate whether the field is of password or not.
  static String? fieldIsPw(String? value) {
    var isEmptyValidation = nullOnfieldNotEmpty(value);
    var boolStringNotEmpty = isEmptyValidation == null;
    if (boolStringNotEmpty) {
      if (isPassword(value!)) {
        return null;
      }
      return 'Min 8 chars: 1 uppercase, 1 lowercase letter & 1 digit';
    }
    return isEmptyValidation;
  }

}