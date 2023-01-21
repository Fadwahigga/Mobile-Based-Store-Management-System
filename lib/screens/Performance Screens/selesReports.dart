// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/performance_controller.dart';

import '../../widgets/appBar.dart';

// class SelesReportsPage extends StatefulWidget {
//   const SelesReportsPage({super.key});

//   @override
//   State<SelesReportsPage> createState() => _SelesReportsPageState();
// }

class SelesReportsPage extends GetWidget<PerformanceController> {
  SelesReportsPage({Key? key}) : super(key: key);
  // List productsList = [
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  //   "Product Name",
  // ];
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Seles Reports")),
      body: Column(
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
                GetBuilder<PerformanceController>(
                  builder: (controller) {
                    return GestureDetector(
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
                        ).then((date) => controller.setDateFrom(date!));
                      },
                      child: Container(
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
                    );
                  },
                ),
                Text(
                  "To",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                GetBuilder<PerformanceController>(
                  builder: (controller) {
                    return GestureDetector(
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
                        ).then((date) => controller.setDateTo(date!));
                      },
                      child: Container(
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
                    );
                  },
                ),
              ],
            ),
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////////
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(),
              color: const Color.fromARGB(255, 228, 227, 227),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Product Name",
                  style: _textStyle2,
                ),
                Text(
                  "Price",
                  style: _textStyle2,
                ),
                Text(
                  "Sold Quantity",
                  style: _textStyle2,
                ),
                Text(
                  "Total",
                  style: _textStyle2,
                ),
              ],
            ),
          ),
          ///////////////////////////////////////////////////////////////////////////////////////////////////

          //////////////////////////////////////////////////////////////////////////////////////////////////
          Expanded(
            child: GetBuilder<PerformanceController>(
              builder: (controller) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listOfPerfomanceModel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 228, 227, 227),
                          border: Border.fromBorderSide(
                            BorderSide(),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              controller
                                  .listOfPerfomanceModel[index].productName
                                  .toString(),
                              style: _textStyle,
                            ),
                            Text(
                              controller.listOfPerfomanceModel[index].price
                                  .toString(),
                              style: _textStyle,
                            ),
                            Text(
                              controller
                                  .listOfPerfomanceModel[index].soldQuantity
                                  .toString(),
                              style: _textStyle,
                            ),
                            Text(
                              "500"
                                  .toString(),
                              style: _textStyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          //////////////////////////////////////////////////////////////////////////////////////
        ],
      ),
    );
  }
}
