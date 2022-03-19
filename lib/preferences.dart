import 'package:flutter_project_main/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? pref;

  static initPrefs() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future addData() async {
    pref!.setString('login', 'success');
    pref!.setString('email', userEmail);
  }

  static String? getData() {
    String? msg = pref!.getString('login');
    userEmail = pref!.getString('email').toString();
    return msg;
  }

  static dispose() {
    pref!.clear();
  }
}
