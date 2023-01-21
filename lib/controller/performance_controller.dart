import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../model/performance_model.dart';
import '../shared/api_status.dart';
import '../shared/constants.dart';
import 'package:http/http.dart' as http;

class PerformanceController extends GetxController {
  // *********** Variables **********

  DateTime? dateTimeFrom = DateTime.now();
  DateTime? dateTimeTo = DateTime.now();

  List<PerformanceModel> listOfPerfomanceModel = [];

  Map<String, dynamic>? dashboardData;

  List<charts.Series<dynamic, String>> series = []; 
  List<charts.Series<dynamic, String>> series2 = []; 
  List<charts.Series<dynamic, String>> series3 = []; 

  // *********** Methods **********

  @override
  onInit() {
    super.onInit();
    getSalesReportsData();
    getDashBoardData();
  }

  //================ Set Date =================
  setDateFrom(DateTime date) {
    dateTimeFrom = date;
    update();
  }

  setDateTo(DateTime date) {
    dateTimeTo = date;
    update();
  }

  //============== Here To Get Sales Reports ===============
  getSalesReportsData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response =
          await http.get(Uri.http(baseUrl, apiSalesReport), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      });
      print("Out sideeeeeeee");
      print(json.decode(response.body));
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = json.decode(response.body);
        print("insideeeeeeeeeee");
        print(body);
        for (var i = 0; i < body['data'].length; i++) {
          listOfPerfomanceModel.add(PerformanceModel.formJson(body['data'][i]));
        }
        update();
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }

  // ************* Get Performance Data ******************

  getDashBoardData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response =
          await http.get(Uri.http(baseUrl, apiReports), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = json.decode(response.body);
        print("Dashboardddddddddddddddddddddddddd");
        print(body);
        dashboardData = body;
        series.add(
          charts.Series(
            id: "soldquantity",
            data: dashboardData!['bestSelling'] ?? [],
            domainFn: (dynamic series, _) => series['item_name'],
            measureFn: (dynamic series, _) => int.parse(series['sales']),
            colorFn: (dynamic series, _) =>
                charts.ColorUtil.fromDartColor(Colors.blueGrey),
          ),
        );
        series2.add(
          charts.Series(
            id: "Loc Stock",
            data: dashboardData!['leastSelling'] ?? [],
            domainFn: (dynamic series, _) => series['item_name'] ?? "null",
            measureFn: (dynamic series, _) => int.parse(series['sales'] ?? "null"),
            colorFn: (dynamic series, _) =>
                charts.ColorUtil.fromDartColor(Colors.blueGrey),
          )
        );
         series3.add(
          charts.Series(
            id: "Quantity",
            data: dashboardData!['lowStock'] ?? [],
            domainFn: (dynamic series, _) => series['barcode'] ?? "null",
            measureFn: (dynamic series, _) => int.parse(series['stock_quantity'] ?? "null"),
            colorFn: (dynamic series, _) =>
                charts.ColorUtil.fromDartColor(Colors.blueGrey),
          )
        );
        update();
      }
      ApiStatus.checkStatus(response);
    } catch (e) {
      return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
    }
  }
}