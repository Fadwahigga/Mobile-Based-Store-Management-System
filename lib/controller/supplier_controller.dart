// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/model/supplier_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/api_status.dart';
import '../shared/constants.dart';

class SupplierController extends GetxController {
  // ************ Variables ***************

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<Map<String, dynamic>> supplierList = [];
  List<SupplierModel> listOfSupplierModel = [];

  GlobalKey<FormState> supplierKey = GlobalKey<FormState>();

  DateTime dateTimeFrom = DateTime.now();
  DateTime dateTimeTo = DateTime.now();

  // ************ Methods ****************

  //================ Set Date =================

  setDateFrom(DateTime date) {
    dateTimeFrom = date;
    update();
  }

  setDateTo(DateTime date) {
    dateTimeTo = date;
    update();
  }

  // ************** Here for added new supplier *******************
  addNewSupplier(
      {required String name,
      required String phone,
      required GlobalKey<FormState> key}) async {
    print("WEeeeeeeeeeeeeeeeee are printing phone");
    print(phone.toString());
    if (key.currentState!.validate()) {
      key.currentState!.save();
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
                  children: [
                    const CircularProgressIndicator(
                      color: kprimaryColor,
                      backgroundColor: kprimaryColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Save".tr,
                      style: const TextStyle(
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
            await http.post(Uri.http(baseUrl, apiSuppliers), headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString('token')}'
        }, body: {
          'name': name,
          'phone': phone,
        });
        print("Codeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        // print(json.decode(response.body));
        if (response.statusCode == 201 || response.statusCode == 200) {
          print("Indesssssssssssssssssssssssssss");
          nameController.clear();
          phoneController.clear();
          Get.back();
          return Get.snackbar("Done".tr, "Success process".tr,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3));
        }
        Get.back();
        ApiStatus.checkStatus(response);
      } catch (e) {
        Get.back();
        return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
      }
    }
  }

  // ************** Here to get supplier data *******************

  getSuppliersData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.get(
        Uri.http(baseUrl, apiSuppliers),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString('token')}'
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = json.decode(response.body);
        supplierList.clear();
        for (var i = 0; i < body['data'].length; i++) {
          supplierList.add(body['data'][i]);
        }

        update();
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }

////////////////////////////
  removeFromList(int index) {
    supplierList.removeAt(index);
    update();
  }

  ////////////////////////////////
  //================ Delete supplier ////////////////
  RxBool isThereData = false.obs;
  deleteSupplier(int id) async {
    isThereData.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.delete(
        Uri.http(baseUrl, "$apiSuppliers /$id"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString('token')}'
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        update();
        return Get.snackbar("Done".tr, "Success process".tr,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3));
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }

  //* ================ HERE To Get Supplier Invoices ===================
  getSupplierInvoices({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.get(
        Uri.http(baseUrl, "$apiSuppliers/$id"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString('token')}'
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = json.decode(response.body);
        print(body);
        listOfSupplierModel.clear();
        //body['data']['invoices'].length
        for (var i = 0; i < listOfSupplierModel.length; i++) {
          listOfSupplierModel
              .add(SupplierModel.fromJson(body['data']['invoices'][i]));
        }
        update();
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(
          title: 'Supplier Inovices!', middleText: e.toString());
    }
  }
}
