class ValidationState {
  final bool isFirstNameFieldValid;
  final bool isPasswordFieldValid;
  final bool isLastNameFieldValid;
  final bool isPhoneNumberFieldValid;
  final bool isWelcomeBackEmailFieldValid;
  final bool isWelcomeBackPasswordFieldValid;
  final bool isEmailFieldValid;
  final bool isReferralCodeFieldValid;
  final bool isValidInputs;

  ValidationState({
    this.isWelcomeBackPasswordFieldValid = true,
    this.isWelcomeBackEmailFieldValid = true,
    this.isPhoneNumberFieldValid = true,
    this.isLastNameFieldValid = true,
    this.isFirstNameFieldValid = true,
    this.isPasswordFieldValid = true,
    this.isEmailFieldValid = true,
    this.isReferralCodeFieldValid = true,
    this.isValidInputs = false,
  });

  ValidationState copyWith({
    bool? isFirstNameFieldValid,
    bool? isPasswordFieldValid,
    bool? isLastNameFieldValid,
    bool? isPhoneNumberFieldValid,
    bool? isWelcomeBackEmailFieldValid,
    bool? isWelcomeBackPasswordFieldValid,
    bool? isEmailFieldValid,
    bool? isReferralCodeFieldValid,
    bool? isValidInputs,
  }) {
    return ValidationState(
      isFirstNameFieldValid: isFirstNameFieldValid ?? this.isFirstNameFieldValid,
      isPasswordFieldValid: isPasswordFieldValid ?? this.isPasswordFieldValid,
      isLastNameFieldValid: isLastNameFieldValid ?? this.isLastNameFieldValid,
      isPhoneNumberFieldValid: isPhoneNumberFieldValid ?? this.isPhoneNumberFieldValid,
      isWelcomeBackEmailFieldValid: isWelcomeBackEmailFieldValid ?? this.isWelcomeBackEmailFieldValid,
      isWelcomeBackPasswordFieldValid: isWelcomeBackPasswordFieldValid ?? this.isWelcomeBackPasswordFieldValid,
      isEmailFieldValid: isEmailFieldValid ?? this.isEmailFieldValid,
      isReferralCodeFieldValid: isReferralCodeFieldValid ?? this.isReferralCodeFieldValid,
      isValidInputs: isValidInputs ?? this.isValidInputs,
    );
  }
}
