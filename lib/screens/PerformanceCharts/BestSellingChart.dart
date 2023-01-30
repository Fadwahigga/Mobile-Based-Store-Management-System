// ignore_for_file: file_names

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/controller/performance_controller.dart';

import '../../shared/constants.dart';

class BestSellingChart extends GetWidget<PerformanceController> {
  const BestSellingChart({Key? key}) : super(key: key);
  // final List<BarChartModel> data = [
  //   BarChartModel(
  //     productname: "product1",
  //     soldquantity: 250,
  //     color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
  //   ),
  //   BarChartModel(
  //     productname: "product2",
  //     soldquantity: 300,
  //     color: charts.ColorUtil.fromDartColor(Colors.red),
  //   ),
  //   BarChartModel(
  //     productname: "product3",
  //     soldquantity: 100,
  //     color: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   BarChartModel(
  //     productname: "product4",
  //     soldquantity: 450,
  //     color: charts.ColorUtil.fromDartColor(Colors.yellow),
  //   ),
  //   BarChartModel(
  //     productname: "product5",
  //     soldquantity: 300,
  //     color: charts.ColorUtil.fromDartColor(Colors.blue),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PerformanceController>(
      builder: (controller) {
        return controller.dashboardData == null
            ? Container(
                height: MediaQuery.of(context).size.height - 200,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: kprimaryColor,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height - 200,
                child: charts.BarChart(
                  defaultRenderer: charts.BarRendererConfig(
                    maxBarWidthPx: 30,
                  ),
                  domainAxis: const OrdinalAxisSpec(
                      renderSpec: SmallTickRendererSpec(
                          labelRotation: 60,
                          labelOffsetFromAxisPx: 3,
                          labelAnchor: TickLabelAnchor.centered,
                          labelStyle: TextStyleSpec(
                            lineHeight: 2,
                            fontSize: 10,
                          ))),
                  controller.series,
                  animate: true,
                ),
              );
      },
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
