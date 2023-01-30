// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/model/inventroy_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../shared/api_status.dart';
import '../shared/constants.dart';

class InventoryController extends GetxController {
  // ********* Variables ***********
  List<InventoryModel> productsList = [];
  RxBool isThereData = false.obs;

  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  DateTime? dateTime = DateTime.now();
  Barcode? result;

  QRViewController? controller;

  TextEditingController productNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  // ********* Methods *************

  @override
  onInit() {
    super.onInit();
    getProductList();
  }
  //============ Delete Product ============

  deleteProduct(int id) async {
    isThereData.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.delete(
          Uri.http(
            baseUrl,
            apiInventory,
          ),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${prefs.getString('token')}'
          },
          body: {
            'id': id.toString()
          });
      print(json.decode(response.body));
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.body);
        update();

        Get.snackbar('Product', 'The product has deleted successfully',
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 2));
      }

      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }

  // ========= Get The List Of Product =========
  getProductList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response =
          await http.get(Uri.http(baseUrl, apiInventory), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = json.decode(response.body);
        for (var i = 0; i < body['data'].length; i++) {
          productsList.add(InventoryModel.fromJson(body['data'][i]));
        }
        update();
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }

  // ========= Add New Product =========
  addNewProduct({
    required String barcode,
    required String itemName,
    required String stockQuantity,
    required String expirationDate,
    required String cost,
    required String category,
    required String price,
  }) async {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) => Center(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  CircularProgressIndicator(
                    color: kprimaryColor,
                    backgroundColor: kprimaryColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Adding...',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response =
          await http.post(Uri.http(baseUrl, apiInventory), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      }, body: {
        'barcode': barcode,
        'item_name': itemName,
        'stock_quantity': stockQuantity,
        'expiration_date': expirationDate,
        'cost': cost,
        'category': category,
        'price': price,
      });
      print(json.decode(response.body));
      if (response.statusCode == 201 || response.statusCode == 200) {
        clearText();
        Get.back();
        Get.snackbar('Product', 'The product has added successfully',
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 2));
      }
      Get.back();
      ApiStatus.checkStatus(response);
    } catch (e) {
      Get.back();
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }

  //==================Delete From List ===============
  removeFromList(int index) {
    productsList.removeAt(index);
    update();
  }

  // =========== To Clear All TextEditingController ==============
  clearText() {
    categoryController.clear();
    productNameController.clear();
    costController.clear();
    priceController.clear();
    quantityController.clear();
  }

  // ========= Bar Code Method =========

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      update();
    });
  }

  // =========== Get Search Data By Scan Bar Code
  getBarCodeSearchData() {}

  // ========= Set Date Time =========
  setDataTime({required DateTime date}) {
    dateTime = date;
    update();
  }
}
