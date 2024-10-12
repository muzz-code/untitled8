import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/constants.dart';
import '../notifier/validation_notifier.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idTypeController = TextEditingController();
  TextEditingController identificationNumberController = TextEditingController();

  void validatePhoneNumberField() {
    final phoneNumber = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: phoneNumber, fieldType: AppConstants.PHONENUMBER);
  }
  void validateFirstNameField() {
    final phoneNumber = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: phoneNumber, fieldType: AppConstants.FIRSTNAME);
  }
  void validateLastNameField() {
    final phoneNumber = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: phoneNumber, fieldType: AppConstants.LASTNAME);
  }
  void validateEmailField() {
    final phoneNumber = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: phoneNumber, fieldType: AppConstants.EMAILFIELD);
  }
  void validateIdentificationNumberField() {
    final phoneNumber = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: phoneNumber, fieldType: AppConstants.IEDNTIFICATIONNUMBERFIELD);
  }

  void navigateToOtpScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/SignUpOtpScreen' ?? "");
  }
}
