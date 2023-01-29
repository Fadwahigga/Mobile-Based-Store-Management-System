// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gp/screens/make_a_sale/make_sale_search.dart';
import 'package:gp/widgets/paymentMakeSellPopUp.dart';
import 'package:gp/widgets/productMakeSellPopUp.dart';
import 'package:gp/widgets/smallButton.dart';

import '../../controller/sales_controller.dart';
import '../../shared/constants.dart';
import '../../widgets/appBar.dart';
import '../../widgets/barCode.dart';

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
          child: AppBarWidget(appBarTitle: "Make A Sale")),
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
                    "choose bill date",
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
                    Get.to(BarCodeClass());
                  },
                  child: SizedBox(
                    width: 70,
                    child: Image(
                      image: AssetImage("images/barcode.jpg"),
                    ),
                  ),
                ),
                Text(
                  "Search Product Name Or SN",
                  style: _textStyle,
                ),
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: MakeSaleSearch(
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
                  "Price",
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
            child: Obx(() => controller.listOfSalesModel.isEmpty
                ? Center(child: const SizedBox())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listOfSalesModel.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            barrierDismissible: false,
                            title: "",
                            content: ProductMakeSellPopUp(
                              availableQuantity: controller
                                  .listOfSalesModel[index].soldQunatity,
                              index: index,
                              price: controller.listOfSalesModel[index].price,
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
                                    controller.total.toString(),
                                    style: _textStyle,
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                  )),
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
                  child: Text(
                      "TOTAL = ${controller.totalResultselse.toString()}",
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
                content: PaymentMakeSellPopUp(),
              );
            },
            child: SmallButton(buttonName: "Payment"),
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
