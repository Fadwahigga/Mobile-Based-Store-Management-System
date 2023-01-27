import 'dart:convert';

import 'package:get/get.dart';
import 'package:gp/model/inventroy_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../shared/api_status.dart';
import '../shared/constants.dart';

class PurchasesRepo {
  static List<InventoryModel> listOfInventoryModel = [];

  static Future<List<InventoryModel>> getProductList(
      {required String apiPath,
      required String nameAtapi,
      required String? itemName}) async {
    listOfInventoryModel.clear();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http
          .get(Uri.http(baseUrl, apiPath, {nameAtapi: itemName}), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = json.decode(response.body);
        for (var i = 0; i < body['data'].length; i++) {
          listOfInventoryModel.add(InventoryModel.fromJson(body['data'][i]));
        }
        return listOfInventoryModel;
      }
      ApiStatus.checkStatus(response);
      return listOfInventoryModel;
    } catch (e) {
      Get.defaultDialog(title: 'Oops!', middleText: e.toString());
      return listOfInventoryModel;
    }
  }
}
