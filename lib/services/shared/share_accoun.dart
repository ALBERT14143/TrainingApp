import 'package:shared_preferences/shared_preferences.dart';

class SharedAccount{
  static const accountKey = "MyKey";
  Future<bool> setUserAccount(String userData) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(accountKey, userData);
  }

  Future<bool> checkUserExist() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey(accountKey);
  }
}