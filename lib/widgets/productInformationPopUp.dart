// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/purchase_controller.dart';
import 'confirmAndcancel.dart';

class ProductInformationPopUp extends GetWidget<PurchaseController> {
  ProductInformationPopUp(
      {Key? key,
      required this.index,
      required this.existQuantity,
      required this.oldCost})
      : super(key: key);
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  String existQuantity;
  String oldCost;
  final int index;
  TextEditingController newCostController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 228, 227, 227),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 39, 62, 82),
                  child: Center(
                    child: Text(
                      "Product Information",
                      style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Exist Quantity", style: _textStyle),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child:
                          Center(child: Text(existQuantity, style: _textStyle)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New Quantity", style: _textStyle),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width - 250,
                        color: Colors.white,
                        child: TextFormField(
                            style: _textStyle,
                            controller: newQuantityController,
                            keyboardType: TextInputType.number)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Old cost",
                      style: _textStyle,
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: Center(child: Text(oldCost, style: _textStyle)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New cost",
                      style: _textStyle,
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: TextFormField(
                          style: _textStyle,
                          controller: newCostController,
                          keyboardType: TextInputType.number),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<PurchaseController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        controller.removeFromList(index);
                        Get.back();
                      },
                      child: Text(
                        "Delete Product From List ",
                        style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<PurchaseController>(builder: (controller) {
                  return GestureDetector(
                      onTap: () {
                        // oldCost = newCostController as String;
                        // existQuantity = newQuantityController as String;
                        Get.back();
                      },
                      child: ConfirmAndCancel(Opname: "Save"));
                }),
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
