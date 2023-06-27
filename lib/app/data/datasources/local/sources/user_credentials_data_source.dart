import 'dart:convert';

import 'package:abersoft_test/app/data/datasources/index.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserCredentialsDataSource {
  Future<UserCredentialsPreference> getUserCredentials();

  Future<bool> setUserCredentials(
      UserCredentialsPreference userCredentialsPreference);

  Future<bool> unSetUserCredentials();
}

class UserCredentialsDataSourceImpl implements UserCredentialsDataSource {
  final SharedPreferences _preferences = Get.find<SharedPreferences>();

  static const userCredentialsKey = 'user_credentials';

  @override
  Future<UserCredentialsPreference> getUserCredentials() async {
    final jsonString = _preferences.getString(userCredentialsKey);
    if (jsonString == null) {
      return const UserCredentialsPreference(isLoggedIn: false, token: null);
    } else {
      return UserCredentialsPreference.fromJson(
        jsonDecode(jsonString),
      );
    }
  }

  @override
  Future<bool> setUserCredentials(
      UserCredentialsPreference userCredentialsPreference) async {
    final jsonString = userCredentialsPreference.toJson();
    return await _preferences.setString(
        userCredentialsKey, jsonEncode(jsonString));
  }

  @override
  Future<bool> unSetUserCredentials() async {
    return await _preferences.remove(userCredentialsKey);
  }
}
