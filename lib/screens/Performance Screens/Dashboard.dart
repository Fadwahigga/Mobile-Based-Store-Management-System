// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/PerformanceCharts/ShowStoreMovementChart.dart';

import '../../widgets/appBar.dart';
import '../PerformanceCharts/BestSellingChart.dart';
import '../PerformanceCharts/LeastSellingChart.dart';
import '../PerformanceCharts/LowStockProductsChart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? _dateTimeFrom = DateTime.now();
  DateTime? _dateTimeTo = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
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
            const SizedBox(
              height: 10,
            ),
            Text("Store Movement",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            const ShowStoreMovementChart(),
            Text("Best Selling Chart",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            BestSellingChart(),
            Text("Least Selling Chart",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            LeastSellingChart(),
            Text("Low Stock Products",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            LowStockProductsChart()
          ],
        ),
      ),
    );
  }
}
