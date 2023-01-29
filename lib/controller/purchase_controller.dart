// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gp/model/inventroy_model.dart';
import 'package:gp/model/purhcase_model.dart';
import 'package:gp/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseController extends GetxController {
  // ************* Vaiables ****************
  List<PurchaseModel> listOfPurchaseModel = [];
  RxBool isThereData = false.obs;
  double total = 0;
  double totalresute = 0;
  double change = 0;
  TextEditingController newCostController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();
  TextEditingController payedController = TextEditingController();

  Map<String, dynamic> purchaseMap = {};
  getChange() {
    change = double.parse(payedController.text) - totalresute;
    update();
  }

  totalOnsave() {
    totalresute = 0.0;
    change = 0;
    update();
  }

  // set new quantity
  newvalu(int index) {
    listOfPurchaseModel[index].quantity = newQuantityController.text;
    listOfPurchaseModel[index].cost = newCostController.text;
    update();
  }

  newtotal(int index) {
    listOfPurchaseModel[index].total =
        double.parse(newQuantityController.text) *
            double.parse(newCostController.text);

    update();
  }

  newtotalreselt(index) {
    totalresute += double.parse(newQuantityController.text) *
        double.parse(newCostController.text);

    update();
  }
  // ************* Methods *****************

  setData(InventoryModel snapshot) {
    listOfPurchaseModel.add(PurchaseModel(
        total: double.parse(snapshot.cost) * double.parse(snapshot.quantity),
        cost: snapshot.cost,
        id: snapshot.id,
        price: snapshot.price,
        productName: snapshot.productName,
        quantity: snapshot.quantity));
    update();
  }

  removeFromList(int index) {
    listOfPurchaseModel.removeAt(index);
    update();
  }

  totalAfterdeletItem(int index) {
    totalresute -= listOfPurchaseModel[index].total;
    update();
  }

  setSupplierData(
      {required String phone, required String name, required int id}) {
    purchaseMap = {'phone': phone, 'name': name, 'id': id};
    update();
  } ////////////////////////////

  List<Map<String, dynamic>> paymentData = [];
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
            'cost': paymentData[i]['cost'].toString(),
            'price': paymentData[i]['price'].toString(),
          },
        );
      }
      listOfPurchaseModel.clear();
      payedController.clear();
      purchaseMap.clear();
      return Get.back();

      // ApiStatus.checkStatus(response);

    } catch (e) {
      print(e);
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }
///////////////////////////////////
  // @override
  // onInit() {
  //   super.onInit();
  //   // getSalesReportsData();
  // }

  //  getSalesReportsData() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     http.Response response =
  //         await http.get(Uri.http(baseUrl, apiSales), headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${prefs.getString('token')}'
  //     });
  //     print("Out check");
  //     var body = json.decode(response.body);
  //     print(body);
  //     // print(json.decode(response.body));
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       var body = json.decode(response.body);
  //       print("========================");
  //       print(body);
  //       // for (var i = 0; i < body['data'].length; i++) {

  //       // }
  //       // update();
  //     }
  //     ApiStatus.checkStatus(response);
  //   } catch (e) {
  //     print(e);
  //     return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
  //   }
  // }

}
