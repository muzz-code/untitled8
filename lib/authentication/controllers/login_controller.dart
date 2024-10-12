import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled8/authentication/screens/homepage.dart';
import 'package:untitled8/authentication/widgets/otp_screen.dart';
import 'package:untitled8/core/screens/dashboard.dart';
import 'package:untitled8/core/utils/constants.dart';

import '../../core/provider/global_loader.dart';
import '../../core/widget/popup_messages.dart';
import '../notifier/login_notifier.dart';
import '../notifier/validation_notifier.dart';

class LoginController {
  late final WidgetRef ref;

  LoginController({required this.ref});

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  void validateEmailField() {
    final email = emailController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: email, fieldType: AppConstants.EMAILFIELD);
  }

  void validatePasswordField() {
    final password = passwordController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: password, fieldType: AppConstants.PASSWORDFIELD);
  }

  void validatePhoneNumberField() {
    final phoneNumber = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: phoneNumber, fieldType: AppConstants.PHONENUMBER);
  }

  void validateFirstNameField() {
    final firstName = firstnameController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: firstName, fieldType: AppConstants.FIRSTNAME);
  }

  void validateLastNameField() {
    final lastName = lastnameController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: lastName, fieldType: AppConstants.LASTNAME);
  }

  void validateSignUpPhoneNumberField() {
    final phoneNumber = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: phoneNumber, fieldType: AppConstants.PHONENUMBER);
  }
  void validateSignUpPasswordField() {
    final password = passwordController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: password, fieldType: AppConstants.PASSWORDFIELD);
  }

  void validateReferralCodeField() {
    final referralCode = referralCodeController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: referralCode, fieldType: AppConstants.REFERRALCODEFIELD);
  }

  Future<void> handleLogin(BuildContext context) async {
    validateEmailField();
    validatePasswordField();
    final isValidInputs = ref.read(validationProvider).isValidInputs;

    if (!isValidInputs) {
      toastInfo("Enter your credentials");
      return;
    }
    String email = emailController.text;
    String password = passwordController.text;

    var postData = {
      "email": email.toUpperCase().trim(),
      "password": password.trim(),
    };
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    await Future.delayed(const Duration(seconds: 5));
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);

    toastInfo("Login successful");
    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Dashboard.routeName, (r) => false);
    }

    _resetState();

  }

  Future<void> handleSignup(BuildContext context) async {
    validateEmailField();
    validateSignUpPasswordField();
    validateFirstNameField();
    validateLastNameField();
    validatePhoneNumberField();
    final isValidInputs = ref.read(validationProvider).isValidInputs;

    if (!isValidInputs) {
      toastInfo("Enter your credentials");
      return;
    }
    String email = emailController.text;
    String password = passwordController.text;
    String phoneNumber = phoneNumberController.text;
    String firstName = firstnameController.text;
    String lastName = lastnameController.text;
    String referralCode = referralCodeController.text;

    var postData = {
      "email": email.toUpperCase().trim(),
      "password": password.trim(),
      "phoneNumber": phoneNumber.trim(),
      "firstName": firstName.trim(),
      "lastName": lastName.trim(),
      "referralCode": referralCode.trim(),
    };
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    await Future.delayed(const Duration(seconds: 5));
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);

    toastInfo("Login successful");
    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(OtpScreen.routeName, (r) => false);
    }

    _resetState();

  }
  void _resetState() {
    emailController.clear();
    passwordController.clear();
    phoneNumberController.clear();
    firstnameController.clear();
    lastnameController.clear();
    ref.read(loginNotifierProvider.notifier).reset();
    ref.read(validationProvider.notifier).resetValidation();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
