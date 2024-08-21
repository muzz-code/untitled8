import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/storage/secure_storage.dart';
import '../models/login_state.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() {
    _loadLoginState();
    return LoginState();
  }

  Future<void> _loadLoginState() async {
    final loadedState = await Storage.loadLoginState();
    if (loadedState != null) {
      state = loadedState;
    }
  }

  Future<void> _saveLoginState() async {
    await Storage.saveLoginState(state);
  }

  void onUserEmailChange(String email) {
    state = state.copyWith(email: email);
    _saveLoginState();
  }

  void onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
    _saveLoginState();
  }

  void reset() {
    state = LoginState();
  }
}
