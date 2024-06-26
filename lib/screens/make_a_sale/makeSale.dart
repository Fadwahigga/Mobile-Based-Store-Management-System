// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/smallButton.dart';
import '../../controller/sales_controller.dart';
import '../../shared/constants.dart';
import '../../widgets/barCode.dart';
import '../Home/Home Widget/appBar.dart';
import 'Mak-Sall-widget/make_sale_search.dart';
import 'Mak-Sall-widget/paymentMakeSellPopUp.dart';
import 'Mak-Sall-widget/productMakeSellPopUp.dart';

class MakeSalePage extends GetWidget<SalesController> {
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));

  MakeSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Make A Sale".tr)),
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
                controller.setDateTime(value);
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
                    "Choose Bill Date".tr,
                    style: _textStyle,
                  ),
                  Text(
                    "${controller.dateTime!.day.toString()}/${controller.dateTime!.month.toString()}/${controller.dateTime!.year.toString()}",
                    style: _textStyle,
                  ),
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
                        controller.setDateTime(value);
                      });
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      size: 35,
                    ),
                  ),
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
                    Get.to(() => BarCodeClass());
                  },
                  child: SizedBox(
                    width: 70,
                    child: Image(
                      image: AssetImage("images/barcode.jpg"),
                    ),
                  ),
                ),
                Text(
                  "Search Product Name Or SN".tr,
                  style: _textStyle,
                ),
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: MakeSaleSearch(
                              apiPath: apiInventory,
                              nameAtapi: "item_name".tr));
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
                  "Product Name".tr,
                  style: _textStyle2,
                ),
                Text(
                  "Price".tr,
                  style: _textStyle2,
                ),
                Text(
                  "Quantity".tr,
                  style: _textStyle2,
                ),
                Text(
                  "Total".tr,
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
            child: GetBuilder<SalesController>(builder: (controller) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listOfSalesModel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        barrierDismissible: false,
                        title: "",
                        content: ProductMakeSellPopUp(
                          index: index,
                        ),
                      );
                    },
                    child: Container(
                        color: const Color.fromARGB(255, 228, 227, 227),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              color: Colors.white,
                              padding: EdgeInsets.all(3),
                              child: Text(
                                controller.listOfSalesModel[index].itemName
                                    .toString(),
                                style: _textStyle,
                              ),
                            ),
                            Container(
                              width: 70,
                              color: Colors.white,
                              padding: EdgeInsets.all(3),
                              child: Text(
                                controller.listOfSalesModel[index].price
                                    .toString(),
                                style: _textStyle,
                              ),
                            ),
                            Container(
                              width: 70,
                              color: Colors.white,
                              padding: EdgeInsets.all(3),
                              child: Center(
                                child: Text(
                                  controller
                                      .listOfSalesModel[index].soldQunatity,
                                  style: _textStyle,
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              color: Colors.white,
                              padding: EdgeInsets.all(3),
                              child: Text(
                                controller.listOfSalesModel[index].total
                                    .toString(),
                                style: _textStyle,
                              ),
                            ),
                          ],
                        )),
                  );
                },
              );
            }),
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 10,
          ),
          ////////////////////////////////////////////////////////////////////////////////////////////
          GetBuilder<SalesController>(
            builder: (controller) {
              return Container(
                width: double.infinity,
                color: Color.fromARGB(255, 36, 214, 42),
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("TOTAL".tr,
                          style: GoogleFonts.ebGaramond(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      Text("  ${controller.totalResultselse.toString()}",
                          style: GoogleFonts.ebGaramond(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))
                    ],
                  ),
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
                content: PaymentMakeSellPopUp(),
              );
            },
            child: SmallButton(buttonName: "Payment".tr),
          ),
          SizedBox(
            height: 10,
          )
          ///////////////////////////////////////////////////////////////////////////////////////////////
        ],
      ),
      ///////////////////////////////////////////////////////////////////////////////////////////////////
    );
  }
}
