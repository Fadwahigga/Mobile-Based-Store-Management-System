// ignore_for_file: file_names

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LeastSellingChart extends StatelessWidget {
  LeastSellingChart({Key? key}) : super(key: key);
  final List<BarChartModel> data = [
    BarChartModel(
      productname: "product1",
      soldquantity: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
      productname: "product2",
      soldquantity: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      productname: "product3",
      soldquantity: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      productname: "product4",
      soldquantity: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "soldquantity",
        data: data,
        domainFn: (BarChartModel series, _) => series.productname,
        measureFn: (BarChartModel series, _) => series.soldquantity,
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
  int soldquantity;
  final charts.Color color;

  BarChartModel({
    required this.productname,
    required this.soldquantity,
    required this.color,
  });
}
