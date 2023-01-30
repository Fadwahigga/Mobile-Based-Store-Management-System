// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/sales_controller.dart';

import '../../../widgets/confirmAndcancel.dart';

class ProductMakeSellPopUp extends GetWidget<SalesController> {
  ProductMakeSellPopUp({Key? key, required this.index}) : super(key: key);

  final int index;
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
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
                    child: Text("Product Information".tr,
                        style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text("Available Quantity".tr, style: _textStyle),
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: Center(
                          child: Text(
                              controller.listOfSalesModel[index].soldQunatity,
                              style: _textStyle)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price".tr, style: _textStyle),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: Center(
                          child: Text(controller.listOfSalesModel[index].price,
                              style: _textStyle)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantity".tr, style: _textStyle),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: TextFormField(
                        style: _textStyle,
                        keyboardType: TextInputType.number,
                        controller: controller.quantitiesController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    controller.totalAfterdeletItem(index);
                    controller.deleteItem(index);
                  },
                  child: Text("Delete Product From List".tr,
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                          controller.newvalu(index);
                          controller.newtotal(index);
                          controller.newtotalreselt(index);
                          controller.quantitiesController.clear();
                        },
                        child: ConfirmAndCancel(Opname: "Save".tr)),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        controller.quantitiesController.clear();
                      },
                      child: ConfirmAndCancel(Opname: "Cancel".tr),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
