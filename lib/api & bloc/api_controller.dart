import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lapp/api%20&%20bloc/api_helper.dart';
import 'package:lapp/models/brand_list.dart';
import 'package:lapp/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:lapp/models/product_list.dart';
import 'package:lapp/models/userInfo.dart';
import 'package:lapp/widgets/alert_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';

class ApiManager {
  static Future<LoginResponse> login(Map<String, dynamic> request, BuildContext context) async {
    LoginResponse res = LoginResponse();
    Response response = await http.post(
      Uri.parse(ApiHelper.BaseUrl + HttpPaths.login),
      body: request,
    );
    if (response.statusCode == 200) {
      res = LoginResponse.fromJson(jsonDecode(response.body));
      SharedPref.setSessionToken(res.token!);
    } else {
      if (response.statusCode == 401) {
        WarningAlert().showDialog(context: context, text: 'Нэвтрэх нэр нууц үг буруу байна');
      } else {
        WarningAlert().showDialog(context: context, text: 'Системийн алдаа');
      }
    }
    return res;
  }

  static Future<Userinfo> getUserData() async {
    /// Huseltiin omno zaawal zarlaj ogoh
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");

    Response response = await http.get(Uri.parse(ApiHelper.BaseUrl + HttpPaths.getUserData), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    var res = Userinfo.fromJson(jsonDecode(response.body));
    return res;
  }

  static checkUserValidate(String dugaar, BuildContext context) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");
    Response response = await http.post(Uri.parse(ApiHelper.BaseUrl + HttpPaths.checkUser),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: dugaar);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print("res::::::${res['result']}");
      return res['result'];
    } else {
      WarningAlert().showDialog(context: context, text: 'Системийн алдаа');
    }
  }

  static userCreate(Map<String, dynamic> request, BuildContext context) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");
    Response response = await http.post(
      Uri.parse(ApiHelper.BaseUrl + HttpPaths.userCreate),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: request,
    );
    var res = jsonDecode(response.body);
    if (res['status'] == 'success') {
      WarningAlert().showDialog(context: context, text: 'Хэрэглэгч амжилттай бүртгэлээ');
      return true;
    } else if (res['status'] == "error") {
      if (res['errors'] != null) {
        WarningAlert().showDialog(context: context, text: 'Хэрэглэгчийн мэйл хаяг, нэр, утасны дугаар бүртгэлтэй байна.');
      }
    }
  }

  static Future<BrandList> getBrands() async {
    /// Huseltiin omno zaawal zarlaj ogoh
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");

    Response response = await http.get(Uri.parse(ApiHelper.BaseUrl + HttpPaths.getBrands), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    var res = BrandList.fromJson(jsonDecode(response.body));
    return res;
  }

  static Future<ProductList> getProducts() async {
    /// Huseltiin omno zaawal zarlaj ogoh
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");

    Response response = await http.get(Uri.parse(ApiHelper.BaseUrl + HttpPaths.getProducts), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    var res = ProductList.fromJson(jsonDecode(response.body));
    return res;
  }

  static orderCreate(Map<String, dynamic> request, BuildContext context) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");
    print("req:::${request}");
    Response response = await http.post(
      Uri.parse(ApiHelper.BaseUrl + HttpPaths.createOrder),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: request,
    );
    var res = jsonDecode(response.body);
    if (res['status'] == 'success') {
      WarningAlert().showDialog(context: context, text: 'Захиалга амжилттай.');
      return true;
    } else if (res['status'] == "error") {
      if (res['errors'] != null) {
        WarningAlert().showDialog(context: context, text: 'Захиалга хийхэд алдаа гарлаа.');
      }
    }
  }
}

class HttpPaths {
  static const String login = '/api/auth/login';
  static const String getUserData = '/api/user/info/';
  static const String checkUser = '/api/user/check';
  static const String userCreate = '/api/user/create';
  static const String getBrands = '/api/user/brand/list';
  static const String getProducts = '/api/user/products/list';
  static const String createOrder = '/api/user/order/create';
}
