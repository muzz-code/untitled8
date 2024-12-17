import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';
import '../utils/constants.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? "";
  }

  Future<bool> setLightDarkMode(bool value) async {
    return await _pref.setBool(AppConstants.LIGHTDARKMODE, value);
  }

  bool getLightDarkMode() {
    return _pref.getBool(AppConstants.LIGHTDARKMODE) ?? false;
  }

  String getUserToken(){
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY)??"";
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getBool(String key) {
    return _pref.getBool(key) ?? false;
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }

  Profile? getUserProfile() {
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profile.isEmpty) {
      return null;
    }
    var profileJson = jsonDecode(profile);
    var userProfile = Profile.fromJson(profileJson);
    return userProfile;
  }
}