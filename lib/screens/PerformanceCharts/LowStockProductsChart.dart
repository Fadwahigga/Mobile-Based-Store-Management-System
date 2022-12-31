// ignore_for_file: file_names

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LowStockProductsChart extends StatelessWidget {
  LowStockProductsChart({Key? key}) : super(key: key);
  final List<BarChartModel> data = [
    BarChartModel(
      productname: "product1",
      quantity: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
      productname: "product2",
      quantity: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      productname: "product3",
      quantity: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      productname: "product4",
      quantity: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      productname: "product5",
      quantity: 650,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Quantity",
        data: data,
        domainFn: (BarChartModel series, _) => series.productname,
        measureFn: (BarChartModel series, _) => series.quantity,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Container(
      height: MediaQuery.of(context).size.height - 200,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: charts.BarChart(
        series,
        animate: true,
      ),
    );
  }
}

class BarChartModel {
  String productname;
  int quantity;
  final charts.Color color;

  BarChartModel({
    required this.productname,
    required this.quantity,
    required this.color,
  });
}
