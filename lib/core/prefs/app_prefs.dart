import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static late AppPrefs _appPreferences;
  static SharedPreferences? _sharedPreferences;

  static SharedPreferences get sharedPreferences => _sharedPreferences!;

  AppPrefs._();

  static Future<AppPrefs> getInstance() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      _appPreferences = AppPrefs._();
    }
    return _appPreferences;
  }

  _set(
    String key,
    dynamic value,
  ) {
    if (value is int) {
      sharedPreferences.setInt(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is List) {
      sharedPreferences.setStringList(key, value as List<String>);
    } else {
      debugPrint('Invalid type');
    }
  }

  String? _getString(String key, {String? def}) {
    return sharedPreferences.containsKey(key)
        ? sharedPreferences.getString(key)
        : def;
  }

  List<String>? _getStringList(String key, {List<String>? def}) {
    return sharedPreferences.containsKey(key)
        ? sharedPreferences.getStringList(key)
        : def;
  }

  bool _getBool(String key, [bool def = false]) {
    final contains = sharedPreferences.containsKey(key);
    if (contains) {
      return sharedPreferences.getBool(key) ?? def;
    }
    return def;
  }

  int _getInt(String key, [int def = -1]) {
    final contains = sharedPreferences.containsKey(key);
    if (contains) {
      return sharedPreferences.getInt(key) ?? def;
    }
    return def;
  }

  Future<bool> clear() {
    return sharedPreferences.clear();
  }
}
