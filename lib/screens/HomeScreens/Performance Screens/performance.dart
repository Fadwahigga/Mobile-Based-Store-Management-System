import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/SharedWidgets/appBar.dart';
import '../../../widgets/SharedWidgets/buttonContainer.dart';
import 'Dashboard.dart';
import 'selesReports.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Performance")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///////////////////////////////////////////////////////////////////////////////////////////////

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const SelesReportsPage());
                  },
                  child: buttonContainer(buttonContainerText: "Seles Reports"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ////////////////////////////////////////////////////////////////////////////////////////////////
                GestureDetector(
                  onTap: () {
                    Get.to(const Dashboard());
                  },
                  child: buttonContainer(buttonContainerText: "Dashboard"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}