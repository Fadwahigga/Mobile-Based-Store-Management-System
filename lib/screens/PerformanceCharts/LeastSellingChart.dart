// ignore_for_file: file_names

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/performance_controller.dart';
import '../../shared/constants.dart';

class LeastSellingChart extends GetWidget<PerformanceController> {
  const LeastSellingChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<charts.Series<BarChartModel, String>> series = [
    //   charts.Series(
    //     id: "soldquantity",
    //     data: [],
    //     domainFn: (BarChartModel series, _) => series.productname,
    //     measureFn: (BarChartModel series, _) => series.soldquantity,
    //     colorFn: (BarChartModel series, _) => series.color,
    //   ),
    // ];

    return GetBuilder<PerformanceController>(builder: (controller) {
      return controller.dashboardData == null
          ? Container(
              height: MediaQuery.of(context).size.height - 200,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: kprimaryColor,
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height - 200,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: charts.BarChart(
                controller.series2,
                animate: true,
              ),
            );
    });
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
