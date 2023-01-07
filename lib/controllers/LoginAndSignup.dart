// ignore_for_file: file_names, avoid_print, prefer_typing_uninitialized_variables

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://electro.spatiulab.com/api";
  var status;

  var token;

  loginData(String email, String password) async {
    final response = await http.post(
        Uri.parse("http://electro.spatiulab.com/api/login"),
        headers: {'Accept': 'application/json'},
        body: {"email": email, "password": password});
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  registerData(String name, String email, String password,
      String manegerPassword) async {
    final response = await http
        .post(Uri.parse("http://electro.spatiulab.com/api/register"), headers: {
      'Accept': 'application/json'
    }, body: {
      "name": name,
      "email": email,
      "password": password,
      "manegerPassword": manegerPassword
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
