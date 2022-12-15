import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/screens/Performance%20Screens/bestSelling.dart';
import 'package:gp/screens/Performance%20Screens/leastSelling.dart';
import 'package:gp/screens/Performance%20Screens/lossRate.dart';
import 'package:gp/screens/Performance%20Screens/profitsRate.dart';
import 'package:gp/screens/Performance%20Screens/showProductsQuantities.dart';
import 'package:gp/widgets/buttonContainer.dart';
import '../widgets/appBar.dart';
import 'Performance Screens/showsStoreMovement.dart';

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
                ////////////////////////////////////////////////////////////////////////////////////////////////
                GestureDetector(
                  onTap: () {
                    Get.to(const ShowStoreMovementPage());
                  },
                  child: buttonContainer(
                      buttonContainerText: "Show Store Movement"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ///////////////////////////////////////////////////////////////////////////////////////////////
                GestureDetector(
                  onTap: () {
                    Get.to(const BestSellingPage());
                  },
                  child: buttonContainer(buttonContainerText: "Best Selling"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ////////////////////////////////////////////////////////////////////////////////////////////////////
                GestureDetector(
                  onTap: () {
                    Get.to(const LeastSellingPage());
                  },
                  child: buttonContainer(buttonContainerText: "Least Selling"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ////////////////////////////////////////////////////////////////////////////////////////////////////////
                GestureDetector(
                  onTap: () {
                    Get.to(const ProfitsRatePage());
                  },
                  child: buttonContainer(buttonContainerText: "Profits Rate"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ///////////////////////////////////////////////////////////////////////////////////////////////
                GestureDetector(
                  onTap: () {
                    Get.to(const LossRatePage());
                  },
                  child: buttonContainer(buttonContainerText: "Loss Rate"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ////////////////////////////////////////////////////////////////////////////////////////////////////
                GestureDetector(
                  onTap: () {
                    Get.to(const ShowProductsQuantitiesPage());
                  },
                  child: buttonContainer(
                      buttonContainerText: "Show Products Quantities"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
