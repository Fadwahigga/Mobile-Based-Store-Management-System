import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/sales_model.dart';
import '../shared/api_status.dart';
import '../shared/constants.dart';

class SalesController extends GetxController {
  // *********** Variables *************

  RxList<SalesModel> listOfSalesModel = <SalesModel>[].obs;
  RxBool isThereData = false.obs;

  DateTime? dateTime = DateTime.now();
  Barcode? result;
  QRViewController? controller;

  // *********** Methods ***************

  @override
  onInit() {
    super.onInit();
    getSalesData();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      update();
    });
  }

  void setDateTime(date) {
    dateTime = date;
    update();
  }

  //* =================== Get Data Fot Sale ========================
  getSalesData() async {
    isThereData.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response =
          await http.get(Uri.http(baseUrl, "$apiSales/1"), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = json.decode(response.body);
        print(body['data']);
        //Todo: HERE AFTER FALAH fixing the bug
        // for (var i = 0; i < body['data'].length; i++) {
        //   listOfSalesModel.add(SalesModel.fromJson(body['data'][i]));
        // }
        listOfSalesModel.add(SalesModel.fromJson(body['data']));
        isThereData.value = body['data'] != null;
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      print(e);
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }

  //* ========================== DELETE Data =================
  deleteSalesData({required int id}) async {
    isThereData.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response =
          await http.delete(Uri.http(baseUrl, "$apiSales/$id"), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        update();
        return Get.snackbar('Delete', "The product has deleted",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1));
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }
}