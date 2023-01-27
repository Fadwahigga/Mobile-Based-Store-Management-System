// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../shared/api_status.dart';
import '../shared/constants.dart';

class AccountController extends GetxController {
  // ********* Variables *************
  String? saels;
  String? purchase;
  String? revenue;
  String? balance;

  // ********** Methods **************
    
    @override
    onInit() {
      super.onInit();
      getAccountData();
    }

    getAccountData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response =
          await http.get(Uri.http(baseUrl, apiAccount), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      });
      print("Out sideeeeeeee");
      print(json.decode(response.body));
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = json.decode(response.body);
        print("insideeeeeeeeeee");
        print(body);
        saels = body['sales'].toString();
        purchase = body['purchase'].toString();
        revenue = body['revenue'].toString();
        balance = body['balance'].toString();
        update();
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }

}