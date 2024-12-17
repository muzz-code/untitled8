import '../../core/widget/popup_messages.dart';

class SignUpUtils{
  static void validateUserDetails({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
  }) {
    // Check for empty fields
    if (firstName.isEmpty) {
      toastInfo("Your first name is empty");
      return;
    }

    if (lastName.isEmpty) {
      toastInfo("Your last name is empty");
      return;
    }

    if (phoneNumber.isEmpty) {
      toastInfo("Your phone number is empty");
      return;
    }

    if (email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if (password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }

    // Additional validation for length
    if (firstName.length < 6) {
      toastInfo("Your first name is too short");
      return;
    }

    if (lastName.length < 6) {
      toastInfo("Your last name is too short");
      return;
    }

    // All validations passed
    toastInfo("All fields are valid!");
  }

}