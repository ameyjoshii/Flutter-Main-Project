import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static SharedPreferences? pref;

  static initPrefs() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future addData({String value = '', String key = ''}) async{
    pref!.setString( key, value);
  }

  static String getData({String key = '',}) {
    String? msg = pref!.getString(key);
    return msg??'';
  }

  static dispose(){
    pref!.clear();
  }

}
