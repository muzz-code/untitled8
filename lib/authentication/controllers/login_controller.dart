import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  void validateEmailField() {
    final corporateId = emailController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: corporateId, fieldType: AppConstants.EMAILFIELD);
  }

  void validatePasswordField() {
    final password = passwordController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: password, fieldType: AppConstants.PASSWORDFIELD);
  }

  void validatePhoneNumberField() {
    final username = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: username, fieldType: AppConstants.PHONENUMBER);
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

    _resetState();

  }
  void _resetState() {
    emailController.clear();
    passwordController.clear();
    ref.read(loginNotifierProvider.notifier).reset();
    ref.read(validationProvider.notifier).resetValidation();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
