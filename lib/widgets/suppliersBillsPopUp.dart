// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/supplier_controller.dart';

import 'confirmAndcancel.dart';

// ignore: must_be_immutable
class SuppliersBillsPopUp extends GetWidget<SupplierController> {
  SuppliersBillsPopUp({Key? key}) : super(key: key);

  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 228, 227, 227),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 39, 62, 82),
                  child: Center(
                    child: Text("Supplier Invoices",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: const Color.fromARGB(255, 228, 227, 227),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "From",
                        style: _textStyle,
                      ),
                      GetBuilder<SupplierController>(
                        builder: (controller) => GestureDetector(
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
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white, border: Border.all()),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "${controller.dateTimeFrom.day.toString()}/${controller.dateTimeFrom.month.toString()}/${controller.dateTimeFrom.year.toString()}",
                              style: _textStyle,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "To",
                        style: _textStyle,
                      ),
                      GetBuilder<SupplierController>(
                        builder: (controller) => GestureDetector(
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
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white, border: Border.all()),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "${controller.dateTimeTo.day.toString()}/${controller.dateTimeTo.month.toString()}/${controller.dateTimeTo.year.toString()}",
                              style: _textStyle,
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
                /////////////////////////////////////////////////////////////////////////////////////
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
                        "Cost",
                        style: _textStyle2,
                      ),
                      Text(
                        " Quantity",
                        style: _textStyle2,
                      ),
                      Text(
                        "Total",
                        style: _textStyle2,
                      ),
                    ],
                  ),
                ),
                //////////////////////////////////////////////////////////////////////////////////////
                GetBuilder<SupplierController>(
                  builder: (controller) {
                    return SizedBox(
                      width: double.maxFinite,
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.listOfSupplierModel.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 228, 227, 227),
                                  border: Border.fromBorderSide(BorderSide())),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    controller
                                        .listOfSupplierModel[index].productName,
                                    style: _textStyle,
                                  ),
                                  Text(
                                    controller.listOfSupplierModel[index].cost,
                                    style: _textStyle,
                                  ),
                                  Text(
                                    controller
                                        .listOfSupplierModel[index].quantity,
                                    style: _textStyle,
                                  ),
                                  Text(
                                    controller.listOfSupplierModel[index].price,
                                    style: _textStyle,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                //////////////////////////////////////////////////////////////////////////////////////////
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: ConfirmAndCancel(Opname: "Cancel"),
                ),
              ],
            ),
          )),
    );
  }
}
