import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/model/inventroy_model.dart';
import 'package:gp/model/purhcase_model.dart';

class PurchaseController extends GetxController {
  // ************* Vaiables ****************
  List<PurchaseModel> listOfPurchaseModel = [];
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

// delet from list
  deleteItem(int index) {
    removeFromList(index);
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

  setSupplierData(
      {required String phone, required String name, required int id}) {
    purchaseMap = {'phone': phone, 'name': name, 'id': id};
    update();
  }

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
