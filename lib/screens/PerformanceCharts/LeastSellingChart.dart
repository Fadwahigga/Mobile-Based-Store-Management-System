// ignore_for_file: file_names

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
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
              padding: const EdgeInsets.only(
                left: 5,
              ),
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
