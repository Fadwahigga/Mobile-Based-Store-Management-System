// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/performance_controller.dart';
import 'package:gp/shared/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowStoreMovementChart extends GetWidget<PerformanceController> {
  const ShowStoreMovementChart({Key? key}) : super(key: key);

  // List<SalesData> data = [
  //   SalesData('Jan', 35),
  //   SalesData('Feb', 28),
  //   SalesData('Mar', 34),
  //   SalesData('Apr', 32),
  //   SalesData('May', 40)
  // ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PerformanceController>(
      builder: (controller) => controller.dashboardData == null
          ? Container(
              width: double.infinity,
              height: 600,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: kprimaryColor,
              ),
            )
          : Container(
              width: double.infinity,
              height: 600,
              padding: const EdgeInsets.all(5),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                legend: Legend(
                  isVisible: true,
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<dynamic, String>>[
                  LineSeries<dynamic, String>(
                    dataSource: controller.dashboardData!['storeMovement'],
                    xValueMapper: (dynamic sales, _) => sales['date'],
                    yValueMapper: (dynamic sales, _) =>
                        int.parse(sales['views']),
                    name: "Sales".tr,
                    isVisible: true,
                    isVisibleInLegend: true,
                    dataLabelSettings: DataLabelSettings(
                        showCumulativeValues: true,
                        labelAlignment: ChartDataLabelAlignment.outer,
                        labelPosition: ChartDataLabelPosition.outside,
                        isVisible: true,
                        textStyle: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                          fontSize: 15,
                        ))),
                  ),
                ],
              ),
            ),
    );
  }
}

class SalesData {
  final String month;
  final int sales;

  SalesData(this.month, this.sales);
}
