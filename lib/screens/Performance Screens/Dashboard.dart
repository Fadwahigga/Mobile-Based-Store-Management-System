// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/performance_controller.dart';
import 'package:gp/screens/PerformanceCharts/ShowStoreMovementChart.dart';

import '../../widgets/appBar.dart';
import '../PerformanceCharts/BestSellingChart.dart';
import '../PerformanceCharts/LeastSellingChart.dart';
import '../PerformanceCharts/LowStockProductsChart.dart';

class Dashboard extends GetWidget<PerformanceController> {
  const Dashboard({Key? key}) : super(key: key);

  // DateTime? _dateTimeFrom = DateTime.now();
  // DateTime? _dateTimeTo = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Dashboard")),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: const Color.fromARGB(255, 228, 227, 227),
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "From",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2005),
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return Theme(
                            data: ThemeData(
                              primarySwatch: Colors.grey,
                            ),
                            child: child!);
                      },
                    ).then((value) {
                      controller.setDateFrom(value!);
                      controller.getDashBoardData(
                        to: controller.dateTimeTo!,
                        from: controller.dateTimeFrom!,
                      );
                    });
                  },
                  child: GetBuilder<PerformanceController>(
                    builder: (controller) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all()),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "${controller.dateTimeFrom!.day.toString()}/${controller.dateTimeFrom!.month.toString()}/${controller.dateTimeFrom!.year.toString()}",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "To",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2005),
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return Theme(
                            data: ThemeData(
                              primarySwatch: Colors.grey,
                            ),
                            child: child!);
                      },
                    ).then((value) {
                      controller.setDateTo(value!);
                      controller.getDashBoardData(
                        to: controller.dateTimeTo!,
                        from: controller.dateTimeFrom!,
                      );
                    });
                  },
                  child: GetBuilder<PerformanceController>(
                    builder: (controller) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all()),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "${controller.dateTimeTo!.day.toString()}/${controller.dateTimeTo!.month.toString()}/${controller.dateTimeTo!.year.toString()}",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Store Movement",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
          ),
          const ShowStoreMovementChart(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Best Selling Chart",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
          ),
          const BestSellingChart(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Least Selling Chart",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
          ),
          const LeastSellingChart(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Low Stock Products",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
          ),
          const LowStockProductsChart()
        ],
      ),
    );
  }
}
