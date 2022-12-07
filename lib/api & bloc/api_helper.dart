import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  static const String BaseUrl = "http://10.5.33.173";
}

class HttpMethod {
  static const post = 'POST';
  static const get = 'GET';
  static const put = 'PUT';
  static const delete = 'DELETE';
}

class SharedPref {
  static getSessionToken() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString("token");
  }

  static setSessionToken(String sessionToken) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("token", sessionToken);
  }
}

SharedPreferences? sharedPref;

class SharedPrefKey {
  static const String sessionToken = 'sessionToken'; // Session token
}
