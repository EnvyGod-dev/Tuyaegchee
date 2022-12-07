import 'dart:convert';

import 'package:http/http.dart';
import 'package:lapp/api%20&%20bloc/api_helper.dart';
import 'package:lapp/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:lapp/models/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';

class ApiManager {
  static Future<LoginResponse> login(Map<String, dynamic> request) async {
    Response response = await http.post(
      Uri.parse(ApiHelper.BaseUrl + HttpPaths.login),
      body: request,
    );
    var res = LoginResponse.fromJson(jsonDecode(response.body));
    SharedPref.setSessionToken(res.token!);
    return res;
  }
  // void getHttp() async {
  //   try {
  //     var response = await Dio().get(ApiHelper.BaseUrl + HttpPaths.login);
  //     var res = LoginResponse.fromJson(jsonDecode(response.body));
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  static Future<Userinfo> getUserData() async {
    /// Huseltiin omno zaawal zarlaj ogoh
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");

    Response response = await http
        .get(Uri.parse(ApiHelper.BaseUrl + HttpPaths.getUserData), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    var res = Userinfo.fromJson(jsonDecode(response.body));
    return res;
  }

  static checkUserValidate() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");

    Response response = await http
        .get(Uri.parse(ApiHelper.BaseUrl + HttpPaths.checkUser), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    var res = jsonDecode(response.body);
    if (res.isss == true) {
      return true;
    } else {
      return false;
    }
  }
}

class HttpPaths {
  static const String login = '/api/auth/login';
  static const String getUserData = '/api/user/info/';
  static const String checkUser = '/api/';
}
