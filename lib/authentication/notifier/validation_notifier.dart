import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled8/core/models/validation_state.dart';

import '../../core/utils/constants.dart';

class ValidationNotifier extends StateNotifier<ValidationState> {
  ValidationNotifier() : super(ValidationState());

  void validateField({required String value, required String fieldType}) {
    bool isFieldValid = value.isNotEmpty;

    switch (fieldType) {
      case AppConstants.FIRSTNAME:
        _updateSignUpValidity(isFirstNameFieldValid: isFieldValid);
        break;
      case AppConstants.LASTNAME:
        _updateSignUpValidity(isLastNameFieldValid: isFieldValid);
        break;
      case AppConstants.PHONENUMBER:
        _updateSignUpValidity(isPhoneNumberFieldValid: isFieldValid);
        break;
      case AppConstants.SIGNUPEMAIL:
        _updateSignUpValidity(isWelcomeBackEmailFieldValid: isFieldValid);
        break;
      case AppConstants.SIGNUPPASSWORD:
        _updateSignUpValidity(isWelcomeBackPasswordFieldValid: isFieldValid);
        break;
      case AppConstants.EMAILFIELD:
        _updateLoginValidity(isEmailFieldValid: isFieldValid);
        break;
      case AppConstants.PASSWORDFIELD:
        _updateLoginValidity(isPasswordFieldValid: isFieldValid);
        break;
    }
  }

  void _updateLoginValidity({
    bool? isEmailFieldValid,
    bool? isPasswordFieldValid,
  }) {
    final newState = state.copyWith(
      isEmailFieldValid: isEmailFieldValid ?? state.isEmailFieldValid,
      isPasswordFieldValid: isPasswordFieldValid ?? state.isPasswordFieldValid,
    );

    state = newState.copyWith(
        isValidInputs:
            newState.isEmailFieldValid && newState.isPasswordFieldValid);
  }

  void _updateSignUpValidity({
    bool? isFirstNameFieldValid,
    bool? isLastNameFieldValid,
    bool? isPhoneNumberFieldValid,
    bool? isWelcomeBackEmailFieldValid,
    bool? isWelcomeBackPasswordFieldValid,
  }) {
    final newState = state.copyWith(
      isFirstNameFieldValid:
          isFirstNameFieldValid ?? state.isFirstNameFieldValid,
      isLastNameFieldValid: isLastNameFieldValid ?? state.isLastNameFieldValid,
      isPhoneNumberFieldValid:
          isPhoneNumberFieldValid ?? state.isPhoneNumberFieldValid,
      isWelcomeBackEmailFieldValid:
          isWelcomeBackEmailFieldValid ?? state.isWelcomeBackEmailFieldValid,
      isWelcomeBackPasswordFieldValid: isWelcomeBackPasswordFieldValid ??
          state.isWelcomeBackPasswordFieldValid,
    );

    state = newState.copyWith(
      isValidInputs: newState.isFirstNameFieldValid &&
          newState.isLastNameFieldValid &&
          newState.isPhoneNumberFieldValid &&
          newState.isWelcomeBackEmailFieldValid &&
          newState.isWelcomeBackPasswordFieldValid,
    );
  }

  void resetValidation() {
    state = ValidationState();
  }
}

final validationProvider =
StateNotifierProvider<ValidationNotifier, ValidationState>(
      (ref) => ValidationNotifier(),
);
