// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:gp/widgets/appBar.dart';
import 'package:gp/widgets/paymentBillPopUp.dart';
import 'package:gp/widgets/smallButton.dart';
import '../widgets/barCode.dart';
import '../widgets/productInformationPopUp.dart';

class PuechasesPage extends StatefulWidget {
  const PuechasesPage({super.key});

  @override
  State<PuechasesPage> createState() => _PuechasesPageState();
}

class _PuechasesPageState extends State<PuechasesPage> {
  DateTime? _dateTime = DateTime.now();
  Barcode? result;
  QRViewController? controller;
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
                setState(() {
                  _dateTime = value!;
                });
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
                      fontSize: 25,
                    )),
                  ),
                  Text(
                    "${_dateTime!.day.toString()}/${_dateTime!.month.toString()}/${_dateTime!.year.toString()}",
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                      fontSize: 22,
                    )),
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
                          setState(() {
                            _dateTime = value!;
                          });
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
                    Get.to(BarCodeClass(funBar: onQRViewCreated));
                  },
                  child: SizedBox(
                      width: 70,
                      child: Image(image: AssetImage("images/barcode.jpg"))),
                ),
                Text(
                  "Search Product Name Or SN",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 18,
                  )),
                ),
                IconButton(
                    onPressed: () {},
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
                  "  Product Name",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 20,
                  )),
                ),
                Text(
                  "Cost",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 20,
                  )),
                ),
                Text(
                  "Quantity",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 20,
                  )),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Total",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 20,
                  )),
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      barrierDismissible: false,
                      title: "",
                      content: ProductInformationPopUp(),
                    );
                  },
                  child: Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 228, 227, 227),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            productsList[index],
                            style: GoogleFonts.ebGaramond(
                                textStyle: const TextStyle(
                              fontSize: 20,
                            )),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "100",
                              style: GoogleFonts.ebGaramond(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "500",
                              style: GoogleFonts.ebGaramond(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "500",
                              style: GoogleFonts.ebGaramond(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 10,
          ),
          ////////////////////////////////////////////////////////////////////////////////////////////
          Container(
            width: double.infinity,
            color: Color.fromARGB(255, 36, 214, 42),
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text("TOTAL = 500",
                  style: GoogleFonts.ebGaramond(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ),
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

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
