// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/Home/home.dart';
import 'package:gp/screens/purchases/purchases_widgets/purchase_search_supplier.dart';

import '../../../controller/purchase_controller.dart';
import '../../../shared/constants.dart';
import '../../../widgets/confirmAndcancel.dart';

class PaymentBillPopUp extends GetWidget<PurchaseController> {
  PaymentBillPopUp({
    Key? key,
  }) : super(key: key);

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
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 39, 62, 82),
                  child: Center(
                    child: Text("Payment Bill".tr,
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total".tr, style: _textStyle),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: Center(
                          child: Text(controller.totalresute.toString(),
                              style: GoogleFonts.ebGaramond(
                                  textStyle: const TextStyle(
                                fontSize: 15,
                              )))),
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
                      child: Center(
                          child: TextFormField(
                              onEditingComplete: () {
                                controller.change = (double.parse(
                                        controller.payedController.text) -
                                    controller.totalresute);
                                FocusScope.of(context).unfocus();
                              },
                              controller: controller.payedController,
                              autofocus: false,
                              style: _textStyle,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number)),
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
                  children: [
                    Text(
                      "Save This Bill To A Supplier Account".tr,
                      style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 39, 62, 82),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showSearch(
                              context: context,
                              // delegate to customize the search bar
                              delegate: PurchaseSearchSupplier(
                                  apiPath: apiSuppliers, nameAtapi: "name"));
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Supplier Name".tr, style: _textStyle),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: Center(
                        child: GetBuilder<PurchaseController>(
                          builder: (controller) {
                            return controller.purchaseMap.isNotEmpty
                                ? Text(
                                    controller.purchaseMap['name'].toString(),
                                    style: _textStyle)
                                : Text("Search Result".tr, style: _textStyle);
                          },
                        ),
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
                    GestureDetector(
                        onTap: () {
                          controller.payment(
                              paymentData: controller.listOfPurchaseModel,
                              supplier_id: controller.purchaseMap['id']);

                          Get.back();
                          controller.totalOnsave();
                          // ToDo: Here Fadwa add the payment method that i will explain it.
                          Get.snackbar("Done".tr, "Success process".tr,
                              backgroundColor: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2));
                          // Get.off(() => const Home());
                          // controller.listOfPurchaseModel.clear();
                          // controller.purchaseMap.clear();
                        },
                        child: ConfirmAndCancel(Opname: "Save".tr)),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        controller.payedController.clear();
                        controller.change = 0;
                        controller.purchaseMap.clear();
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
