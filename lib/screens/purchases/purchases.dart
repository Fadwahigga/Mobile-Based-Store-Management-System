// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, avoid_print, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/purchase_controller.dart';
import 'package:gp/screens/purchases/purchases_widgets/purchases_shearch_inventory.dart';
import 'package:gp/shared/constants.dart';

import 'package:gp/widgets/paymentBillPopUp.dart';
import 'package:gp/widgets/smallButton.dart';
import '../../widgets/appBar.dart';
import '../../widgets/barCode.dart';
import '../../widgets/productInformationPopUp.dart';

class PurchasesPage extends GetWidget<PurchaseController> {
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));

  PurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Buy from a Supplier")),
      body: Column(
        children: [
          ////////////////////////////////////////////////////////////////////////////////////////////////////
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
                // setState(() {
                //   _dateTime = value!;
                // });
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Choose Bill Date",
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                      fontSize: 15,
                    )),
                  ),
                  // Text(
                  //   "${_dateTime!.day.toString()}/${_dateTime!.month.toString()}/${_dateTime!.year.toString()}",
                  //   style: GoogleFonts.ebGaramond(
                  //       textStyle: const TextStyle(
                  //     fontSize: 15,
                  //   )),
                  // ),
                  IconButton(
                      onPressed: () {
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
                          // setState(() {
                          //   _dateTime = value!;
                          // });
                        });
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        size: 35,
                      ))
                ],
              ),
            ),
          ),
          ///////////////////////////////////////////////////////////////////////////////////
          Container(
            color: const Color.fromARGB(255, 228, 227, 227),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(BarCodeClass());
                  },
                  child: SizedBox(
                      width: 70,
                      child: Image(image: AssetImage("images/barcode.jpg"))),
                ),
                Text(
                  "Search Product Name Or SN",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 15,
                  )),
                ),
                IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        // delegate to customize the search bar
                        delegate: PurchasesSearchInventory(
                            apiPath: apiInventory, nameAtapi: "item_name"));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 10,
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////////
          Container(
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
                  "Quantity",
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
          SizedBox(
            height: 10,
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////////
          Expanded(
            child: GetBuilder<PurchaseController>(
              builder: (controller) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listOfPurchaseModel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          barrierDismissible: false,
                          title: "",
                          content: ProductInformationPopUp(
                              existQuantity: controller
                                  .listOfPurchaseModel[index].quantity,
                              oldCost:
                                  controller.listOfPurchaseModel[index].cost,
                              index: index),
                        );
                      },
                      child: Container(
                        color: const Color.fromARGB(255, 228, 227, 227),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              color: Colors.white,
                              padding: EdgeInsets.all(3),
                              child: Text(
                                controller
                                    .listOfPurchaseModel[index].productName,
                                style: _textStyle,
                              ),
                            ),
                            Container(
                              width: 70,
                              color: Colors.white,
                              padding: EdgeInsets.all(3),
                              child: Text(
                                controller.listOfPurchaseModel[index].cost,
                                style: _textStyle,
                              ),
                            ),
                            Container(
                              width: 70,
                              color: Colors.white,
                              padding: EdgeInsets.all(3),
                              child: Text(
                                controller.listOfPurchaseModel[index].quantity,
                                style: _textStyle,
                              ),
                            ),
                            Container(
                              width: 70,
                              color: Colors.white,
                              padding: EdgeInsets.all(3),
                              child: Text(
                                controller.listOfPurchaseModel[index].total
                                    .toString(),
                                style: _textStyle,
                              ),
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
          //////////////////////////////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 10,
          ),
          ////////////////////////////////////////////////////////////////////////////////////////////
          GetBuilder<PurchaseController>(
            builder: (controller) {
              return Container(
                width: double.infinity,
                color: Color.fromARGB(255, 36, 214, 42),
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Text("TOTAL = ${controller.totalresute.toString()}",
                      style: GoogleFonts.ebGaramond(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
              );
            },
          ),
          //////////////////////////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 20,
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                barrierDismissible: false,
                title: "",
                content: PaymentBillPopUp(
                  total: controller.total.toString(),
                ),
              );
            },
            child: SmallButton(buttonName: "BUY"),
          ),
          SizedBox(
            height: 10,
          ),
          ///////////////////////////////////////////////////////////////////////////////////////////////
        ],
      ),
      ///////////////////////////////////////////////////////////////////////////////////////////////////
    );
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///BarCode Function

  // void onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

}
