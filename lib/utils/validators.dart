import 'package:flutter_lagos_widget_testing_session/utils/constants.dart';

class Validators {
  static String? validateEmail(String? value) {
    const Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(emailPattern.toString());
    if (value!.isEmpty || !regex.hasMatch(value)) {
      return AppStrings.pleaseEnterAValidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null) return null;

    if (value.isEmpty) {
      return AppStrings.pleaseEnterPassword;
    }
    if (value.length < 8) {
      return AppStrings.passwordMustContainAtLeast8Characters;
    }
    return null;
  }
}
