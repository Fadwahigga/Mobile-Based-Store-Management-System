// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/sales_controller.dart';
import 'confirmAndcancel.dart';

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
                  "Payment Bill",
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
                Text("Total", style: _textStyle),
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
                Text("Payed", style: _textStyle),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width - 250,
                  color: Colors.white,
                  child: TextFormField(
                    maxLines: 1,
                    style: _textStyle,
                    textAlign: TextAlign.center,
                    onChanged: ((value) {
                      controller.changeresult += double.parse(value);
                    }),
                    keyboardType: TextInputType.number,
                    controller: controller.PayedController,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Change", style: _textStyle),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width - 250,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                          (controller.totalResultselse -
                                  controller.changeresult)
                              .toString(),
                          style: _textStyle)),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<SalesController>(
              builder: (controller) {
                return GestureDetector(
                    onTap: () {
                      controller.payment(paymentData: controller.paymentData);
                      Get.back();

                      Get.snackbar("Done", "Success process",
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 60));
                    },
                    child: ConfirmAndCancel(Opname: "Save"));
              },
            ),
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
        ));
  }
}
