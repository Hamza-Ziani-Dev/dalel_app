// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
 static late SharedPreferences sharedPreferences;

// here The Initialize of Cache:
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

// this method to put data in local database using key:
  dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

// this method to remove data in local database using key:
  Future<bool> removaData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  // this method to Chek Constants data in local database using key:
  Future<bool> containsKey({
    required String key,
  }) async {
    return sharedPreferences.containsKey(key);
  }

  // This method to put data in local database using key
  Future<bool> saveData({required String key, required dynamic value}) async {
    try {
      if (value is bool) {
        return await sharedPreferences.setBool(key, value);
      }
      if (value is String) {
        return await sharedPreferences.setString(key, value);
      }
      if (value is int) {
        return await sharedPreferences.setInt(key, value);
      }
      throw Exception('Unsupported data type');
    } catch (e) {
      print('Error saving data: e');
      return false;
    }
  }

  // Clear All Data in local database
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  // This method to put data in local database using key:
  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
  }
}
