// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowStoreMovementChart extends StatefulWidget {
  const ShowStoreMovementChart({super.key});

  @override
  State<ShowStoreMovementChart> createState() => _ShowStoreMovementChartState();
}

class _ShowStoreMovementChartState extends State<ShowStoreMovementChart> {
  List<SalesData> data = [
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 32),
    SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        legend: Legend(
          isVisible: true,
        ),
        tooltipBehavior: TooltipBehavior(enable: false),
        series: <ChartSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
            dataSource: data,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: 'Sales',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
