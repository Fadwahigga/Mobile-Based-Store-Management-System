import 'dart:convert';

import 'package:get/get.dart';
import 'package:gp/model/inventroy_model.dart';
import 'package:gp/model/purhcase_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/api_status.dart';
import '../shared/constants.dart';

class PurchaseController extends GetxController {
  // ************* Vaiables ****************
  List<PurchaseModel> listOfPurchaseModel = [];
  int total = 0;

  // ************* Methods *****************

  setData(InventoryModel snapshot) {
    listOfPurchaseModel.add(PurchaseModel(
        total: 500,
        cost: snapshot.cost,
        id: snapshot.id,
        price: snapshot.price,
        productName: snapshot.productName,
        quantity: snapshot.quantity));
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
