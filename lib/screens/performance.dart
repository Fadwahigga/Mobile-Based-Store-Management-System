import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  DateTime? _dateTimeFrom = DateTime.now();
  DateTime? _dateTimeTo = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Performance")),
      body: Column(
        children: [
          ///////////////////////////////////////////////////////////////////////////////////////////////
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
                          fontSize: 22, fontWeight: FontWeight.bold)),
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
                      setState(() {
                        _dateTimeFrom = value!;
                      });
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, border: Border.all()),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "${_dateTimeFrom!.day.toString()}/${_dateTimeFrom!.month.toString()}/${_dateTimeFrom!.year.toString()}",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Text(
                  "To",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
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
                      setState(() {
                        _dateTimeTo = value!;
                      });
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, border: Border.all()),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "${_dateTimeTo!.day.toString()}/${_dateTimeTo!.month.toString()}/${_dateTimeTo!.year.toString()}",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ///////////////////////////////////////////////////////////////////////////////////////////////////
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
          const Spacer()
        ],
      ),
    );
  }
}
