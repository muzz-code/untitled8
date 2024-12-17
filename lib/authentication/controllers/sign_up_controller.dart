import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/provider/global_loader.dart';
import '../../core/utils/constants.dart';
import '../../core/widget/popup_messages.dart';
import '../notifier/signup_notifier.dart';
import '../notifier/validation_notifier.dart';
import '../repo/sign_up_repo.dart';
import '../utils/sign_up_utils.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  final phoneNumberController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final idTypeController = TextEditingController();
  final passwordController = TextEditingController();
  final identificationNumberController = TextEditingController();

  void validateField(String fieldValue, String fieldType) {
    ref.read(validationProvider.notifier).validateField(value: fieldValue, fieldType: fieldType);
  }

  void validatePhoneNumberField() => validateField(phoneNumberController.text, AppConstants.PHONENUMBER);
  void validateFirstNameField() => validateField(firstNameController.text, AppConstants.FIRSTNAME);
  void validateLastNameField() => validateField(lastNameController.text, AppConstants.LASTNAME);
  void validateEmailField() => validateField(emailController.text, AppConstants.EMAILFIELD);
  void validateIdentificationNumberField() => validateField(identificationNumberController.text, AppConstants.IEDNTIFICATIONNUMBERFIELD);

  void navigateToOtpScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/SignUpOtpScreen');
  }

  Future<void> handleSignUp() async {
    final state = ref.read(signupNotifierProvider);
    final loader = ref.read(appLoaderProvider.notifier);

    String firstName = state.firstName;
    String lastName = state.lastName;
    String phoneNumber = state.phoneNumber;
    String? referralCode = state.referralCode;
    String email = state.email;
    String password = state.password;

    try {
      SignUpUtils.validateUserDetails(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );

      loader.setLoaderValue(true);

      final credential = await SignUpRep.firebaseSignUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
      );

      if (credential?.user != null) {
        await credential?.user?.sendEmailVerification();
        await credential?.user?.updateDisplayName(firstName);
        await credential?.user?.updatePhotoURL("uploads/default.png");

        toastInfo("An email has been sent to verify your account. Please open that email and confirm your identity.");
        Navigator.pushNamed(ref.context, '/OtpScreen');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          toastInfo("This password is too weak");
          break;
        case 'email-already-in-use':
          toastInfo("This email address has already been registered");
          break;
        default:
          toastInfo("An error occurred: ${e.message}");
      }
      log(e.code);
    } catch (e) {
      toastInfo("An unexpected error occurred. Please try again.");
      log(e.toString());
    } finally {
      loader.setLoaderValue(false);
    }
  }

  void dispose() {
    phoneNumberController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    idTypeController.dispose();
    passwordController.dispose();
    identificationNumberController.dispose();
  }
}
