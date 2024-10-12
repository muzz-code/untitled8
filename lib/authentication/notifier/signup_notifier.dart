import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:untitled8/authentication/models/signup_state.dart';

import '../../core/storage/secure_storage.dart';

part 'signup_notifier.g.dart';

@riverpod
class SignupNotifier extends _$SignupNotifier {
  @override
  SignupState build() {
    _loadSignupState();
    return SignupState();
  }

  Future<void> _loadSignupState() async {
    final loadedState = await Storage.loadSignupState();
    if (loadedState != null) {
      state = loadedState;
    }
  }

  Future<void> _saveSignupState() async {
    await Storage.saveSignupState(state);
  }

  void onUserEmailChange(String email) {
    state = state.copyWith(email: email);
    _saveSignupState();
  }

  void onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
    _saveSignupState();
  }

  void onUserFirstNameChange(String firstName) {
    state = state.copyWith(firstName: firstName);
    _saveSignupState();
  }

  void onUserPhoneNumberChange(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
    _saveSignupState();
  }

  void onUserLastNameChange(String lastName) {
    state = state.copyWith(lastName: lastName);
    _saveSignupState();
  }

  void onUserReferralCodeChange(String referralCode) {
    state = state.copyWith(referralCode: referralCode);
    _saveSignupState();
  }
}
