import 'dart:convert';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  dynamic myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }

    return item;
  }

  Future<bool> addUserToStorage(LocalStorageValues key, User data) async {
    try {
      SharedPreferences ref = await pref;
      String val = json.encode(data);
      ref.setString(key.name, val);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addStringToStorage(LocalStorageValues key, data) async {
    try {
      SharedPreferences ref = await pref;
      ref.setString(key.name, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> getUserFromStorage(LocalStorageValues key) async {
    SharedPreferences ref = await pref;
    var mapString = ref.getString(key.name);
    if (mapString != null) {
      User json = userFromJson(mapString);
      return json;
    } else {
      return null;
    }
  }

  Future getStringFromStorage(LocalStorageValues key) async {
    SharedPreferences ref = await pref;
    var data = ref.getString(key.name);
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future<bool> removeFromStorage(LocalStorageValues key) async {
    try {
      SharedPreferences ref = await pref;
      ref.remove(key.name);
      return true;
    } catch (e) {
      return false;
    }
  }
}
