// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gp/model/inventroy_model.dart';
import 'package:gp/model/purhcase_model.dart';
import 'package:gp/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseController extends GetxController {
  // **************************** Vaiables *******************************************
  List<PurchaseModel> listOfPurchaseModel = [];
  List<PurchaseModel> paymentData = [];
  RxBool isThereData = false.obs;
  double total = 0;
  double totalresute = 0;
  double change = 0;
  TextEditingController newCostController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();
  TextEditingController payedController = TextEditingController();
  Map<String, dynamic> purchaseMap = {};
  // ************************************* Methods *********************************************
  ///////// Get Change
  getChange() {
    change = double.parse(payedController.text) - totalresute;
    update();
  }

//////////////////// reset total and chang after save
  totalOnsave() {
    totalresute = 0.0;
    change = 0;
    update();
  }

  //////////////////////// set new quantity and new cost
  newvalu(int index) {
    listOfPurchaseModel[index].quantity = newQuantityController.text;
    listOfPurchaseModel[index].cost = newCostController.text;
    update();
  }

////////////////////////////// set new total
  newtotal(int index) {
    listOfPurchaseModel[index].total =
        double.parse(newQuantityController.text) *
            double.parse(newCostController.text);
    update();
  }

///////////////////////// set new total result
  newtotalreselt(index) {
    totalresute += double.parse(newQuantityController.text) *
        double.parse(newCostController.text);
    update();
  }

////////////////////////////////////// set data
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

/////////////////////////////// remove item from list
  removeFromList(int index) {
    listOfPurchaseModel.removeAt(index);
    update();
  }

///////////////////////////// set total afler delet item
  totalAfterdeletItem(int index) {
    if (totalresute > 0) {
      totalresute -= listOfPurchaseModel[index].total;
      update();
    }
  }

////////////////////////////////////////////// set supplier data
  setSupplierData(
      {required String phone, required String name, required int id}) {
    purchaseMap = {'phone': phone, 'name': name, 'id': id};
    update();
  } ////////////////////////////

/////////////////////////////////////// payment function

  payment(
      {required List<PurchaseModel> paymentData,
      required int supplier_id}) async {
    isThereData.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //print(json.encode(paymentData));
      for (var i = 0; i < paymentData.length; i++) {
        print( supplier_id.toString());
        print(paymentData[i].id.toString());
        print(paymentData[i].quantity.toString());
        print(paymentData[i].cost.toString());
        print(paymentData[i].price.toString());
        await http.post(
          Uri.http(
            baseUrl,
            apiPurchase,
          ),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${prefs.getString('token')}'
          },
          body: {
            'supplier_id': supplier_id.toString(),
            'id': paymentData[i].id.toString(),
            'quantity': paymentData[i].quantity.toString(),
            'cost': paymentData[i].cost.toString(),
            'price': paymentData[i].price.toString(),
          },
        );
      }

      payedController.clear();

      // ApiStatus.checkStatus(response);
    } catch (e) {
      print(e);
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }
}
