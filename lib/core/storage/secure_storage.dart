import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../authentication/models/login_state.dart';
import '../models/user_profile.dart';
import '../utils/constants.dart';

class Storage {
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static IOSOptions _getIOSOptions() =>
      const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      );

  static Future<void> saveUserProfile(Profile profile) async {
    final jsonString = jsonEncode(profile.toJson());
    await secureStorage.write(
        key: AppConstants.USER_RESPONSE,
        value: jsonString,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions());
  }

  static Future<Profile?> loadUserProfile() async {
    final jsonString = await secureStorage.read(
        key: AppConstants.USER_RESPONSE,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions());
    if (jsonString != null) {
      return Profile.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  static Future<void> storeUser(String data) async {
    await secureStorage.write(
      key: AppConstants.USER,
      value: data,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  static Future<void> deleteData() async {
    await secureStorage.delete(
      key: AppConstants.USER,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  static Future<void> saveLoginState(LoginState state) async {
    final jsonString = jsonEncode(state.toJson());
    print("login state $state");
    await secureStorage.write(
        key: AppConstants.LOGINSTATE,
        value: jsonString,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions());
  }

  static Future<LoginState?> loadLoginState() async {
    final jsonString = await secureStorage.read(
        key: AppConstants.LOGINSTATE,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions());
    if (jsonString != null) {
      return LoginState.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  static Future<bool> isLoggedIn() async {
    final isLoggedIn = await loadLoginState();
    return isLoggedIn != null ? true : false;
  }
}
