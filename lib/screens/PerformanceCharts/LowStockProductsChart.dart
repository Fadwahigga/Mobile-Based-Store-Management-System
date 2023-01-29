// ignore_for_file: file_names

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/performance_controller.dart';
import '../../shared/constants.dart';

class LowStockProductsChart extends StatelessWidget {
  const LowStockProductsChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                controller.series3,
                animate: true,
              ),
            );
    });
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
