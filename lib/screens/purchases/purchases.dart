// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/inventory_controller.dart';
import 'package:gp/controller/purchase_controller.dart';
import 'package:gp/screens/purchases/purchases_widgets/purchases_shearch.dart';
import 'package:gp/shared/constants.dart';

import 'package:gp/widgets/paymentBillPopUp.dart';
import 'package:gp/widgets/smallButton.dart';
import '../../widgets/Search.dart';
import '../../widgets/appBar.dart';
import '../../widgets/barCode.dart';
import '../../widgets/productInformationPopUp.dart';

class PurchasesPage extends GetWidget<PurchaseController> {
  // DateTime? _dateTime = DateTime.now();

  // Barcode? result;
  // QRViewController? controller;
  List productsList = [
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
  ];
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
  @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

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
                          delegate: PurchaseSearch(
                              apiPath: apiInventory, nameAtapi: "item_name"));
                    },
                    icon: Icon(
                      Icons.search,
                      size: 35,
                    ))
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
                          content: ProductInformationPopUp(),
                        );
                      },
                      child: Container(
                        color: const Color.fromARGB(255, 228, 227, 227),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              controller.listOfPurchaseModel[index].productName,
                              style: _textStyle,
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                controller.listOfPurchaseModel[index].cost,
                                style: _textStyle,
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                controller.listOfPurchaseModel[index].quantity,
                                style: _textStyle,
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(5),
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
                  child: Text("TOTAL = ${controller.total.toString()}",
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
                content: PaymenBillPopUp(),
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
