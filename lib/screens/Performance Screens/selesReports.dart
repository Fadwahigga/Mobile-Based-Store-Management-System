// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/performance_controller.dart';
import '../../widgets/confirmAndcancel.dart';
import '../Home/Home Widget/appBar.dart';

// class SelesReportsPage extends StatefulWidget {
//   const SelesReportsPage({super.key});

//   @override
//   State<SelesReportsPage> createState() => _SelesReportsPageState();
// }

class SelesReportsPage extends GetWidget<PerformanceController> {
  SelesReportsPage({Key? key}) : super(key: key);
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
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
                  style: _textStyle2,
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
                        ).then((date) {
                          controller.setDateFrom(date!);
                          controller.getDataByDate(
                            to: controller.dateTimeTo!,
                            from: controller.dateTimeFrom!,
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all()),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "${controller.dateTimeFrom!.day.toString()}/${controller.dateTimeFrom!.month.toString()}/${controller.dateTimeFrom!.year.toString()}",
                          style: _textStyle2,
                        ),
                      ),
                    );
                  },
                ),
                Text(
                  "To",
                  style: _textStyle2,
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
                        ).then((date) {
                          controller.setDateTo(date!);
                          controller.getDataByDate(
                            to: controller.dateTimeTo!,
                            from: controller.dateTimeFrom!,
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all()),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "${controller.dateTimeTo!.day.toString()}/${controller.dateTimeTo!.month.toString()}/${controller.dateTimeTo!.year.toString()}",
                          style: _textStyle2,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: ((context) {
                              Get.defaultDialog(
                                barrierDismissible: false,
                                title: "",
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.warning_sharp,
                                        color: Colors.red,
                                        size: 35,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          "Are You Sure?",
                                          style: _textStyle,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: ConfirmAndCancel(
                                                  Opname: " Cancel ")),
                                          GestureDetector(
                                            onTap: () {
                                              controller.deleteSalesData(
                                                  id: index);
                                              controller.removeFromList(index);
                                              Get.back();
                                            },
                                            child: ConfirmAndCancel(
                                                Opname: "   Yes   "),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            autoClose: true,
                            icon: Icons.delete,
                            label: 'Delete',
                            spacing: 10,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 228, 227, 227),
                          border: Border.fromBorderSide(
                            BorderSide(width: 0.1),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                controller
                                    .listOfPerfomanceModel[index].productName
                                    .toString(),
                                style: _textStyle,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                controller.listOfPerfomanceModel[index].price
                                    .toString(),
                                style: _textStyle,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                controller
                                    .listOfPerfomanceModel[index].soldQuantity
                                    .toString(),
                                style: _textStyle,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                (double.parse(controller
                                            .listOfPerfomanceModel[index]
                                            .soldQuantity) *
                                        double.parse(controller
                                            .listOfPerfomanceModel[index]
                                            .price))
                                    .toString(),
                                style: _textStyle,
                              ),
                            )
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
