// ignore_for_file: avoid_print, dead_code, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/sales_model.dart';
import '../shared/constants.dart';

class SalesController extends GetxController {
  // *********** Variables *************

  RxList<SalesModel> listOfSalesModel = <SalesModel>[].obs;
  double total = 0.0;
  RxBool isThereData = false.obs;
 double change = 0;
  double totalResultselse = 0;

  TextEditingController quantitiesController = TextEditingController();
  TextEditingController PayedController = TextEditingController();
 getChange() {
    change = totalResultselse - double.parse(PayedController.text);
    update();
  }

  List<Map<String, dynamic>> paymentData = [];
  DateTime? dateTime = DateTime.now();
  Barcode? result;
  QRViewController? controller;
  // onInit() {
  //   super.onInit();
  //   // getSalesData();
  // }

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
  // getSalesData() async {
  //   isThereData.value = false;
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     http.Response response =
  //         await http.get(Uri.http(baseUrl, "$apiSales/1"), headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${prefs.getString('token')}'
  //     });
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       var body = json.decode(response.body);
  //       print(body['data']);
  //       //Todo: HERE AFTER FALAH fixing the bug
  //       // for (var i = 0; i < body['data'].length; i++) {
  //       //   listOfSalesModel.add(SalesModel.fromJson(body['data'][i]));
  //       // }
  //       listOfSalesModel.add(SalesModel.fromJson(body['data']));
  //       isThereData.value = body['data'] != null;
  //     }
  //     ApiStatus.checkStatus(response);
  //   } catch (e) {
  //     return Get.defaultDialog(
  //       title: "Oops!",
  //       middleText: e.toString(),
  //     );
  //   }
  // }

  setSaleData({required Map<String, dynamic> map}) {
    listOfSalesModel.add(SalesModel.fromJson(map));
    update();
  }

  payment({
    required List<Map<String, dynamic>> paymentData,
  }) async {
    isThereData.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(json.encode(paymentData));
      for (var i = 0; i < paymentData.length; i++) {
        await http.post(
          Uri.http(
            baseUrl,
            apiSales,
          ),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${prefs.getString('token')}'
          },
          body: {
            'id': paymentData[i]['id'].toString(),
            'quantity': paymentData[i]['quantity'].toString(),
          },
        );
      }
      return Get.back();
      // ApiStatus.checkStatus(response);

      quantitiesController.clear();
    } catch (e) {
      print(e);
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }
}
