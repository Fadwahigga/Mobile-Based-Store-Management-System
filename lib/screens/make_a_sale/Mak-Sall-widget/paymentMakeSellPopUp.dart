// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/sales_controller.dart';
import 'package:gp/screens/make_a_sale/cashierScreens.dart';

import '../../../widgets/confirmAndcancel.dart';

class PaymentMakeSellPopUp extends GetWidget<SalesController> {
  PaymentMakeSellPopUp({Key? key}) : super(key: key);
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: const Color.fromARGB(255, 228, 227, 227),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 39, 62, 82),
              child: Center(
                child: Text(
                  "Payment Bill".tr,
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Total".tr, style: _textStyle),
                GetBuilder<SalesController>(
                  builder: (controller) {
                    return Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: Center(
                          child: Text(controller.totalResultselse.toString(),
                              style: _textStyle)),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Payed".tr, style: _textStyle),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width - 250,
                  color: Colors.white,
                  child: TextFormField(
                      onEditingComplete: () {
                        controller.change =
                            (double.parse(controller.PayedController.text) -
                                controller.totalResultselse);
                        FocusScope.of(context).unfocus();
                      },
                      controller: controller.PayedController,
                      style: _textStyle,
                      keyboardType: TextInputType.number),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Change".tr, style: _textStyle),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width - 250,
                  color: Colors.white,
                  child: Center(
                      child: Text(controller.change.toString(),
                          style: _textStyle)),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      //////////////////////////////////////////////////////////////////
                      controller.payment(
                          paymentData: controller
                              .listOfSalesModel); //////////////////////

                      Get.back();
                      controller.totalOnsave();
                      Get.snackbar("Done".tr, "Success process".tr,
                          backgroundColor: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 2));
                      Get.to(() => const CashierScreensPage());
                    },
                    child: ConfirmAndCancel(Opname: "Save".tr)),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    controller.change = 0;
                    controller.PayedController.clear();
                  },
                  child: ConfirmAndCancel(Opname: "Cancel".tr),
                ),
              ],
            )
          ],
        ));
  }
}
