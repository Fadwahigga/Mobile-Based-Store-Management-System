// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/paymentMakeSellPopUp.dart';
import 'package:gp/widgets/productMakeSellPopUp.dart';
import 'package:gp/widgets/smallButton.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../widgets/Search.dart';
import '../widgets/appBar.dart';
import '../widgets/barCode.dart';

class MakeSalePage extends StatefulWidget {
  const MakeSalePage({super.key});

  @override
  State<MakeSalePage> createState() => _MakeSalePageState();
}

class _MakeSalePageState extends State<MakeSalePage> {
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
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 20,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

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
                    "choose bill date",
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                      fontSize: 25,
                    )),
                  ),
                  Text(
                    "${_dateTime!.day.toString()}/${_dateTime!.month.toString()}/${_dateTime!.year.toString()}",
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
                  style: _textStyle,
                ),
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: CustomSearchDelegate());
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
                SizedBox(
                  width: 30,
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      barrierDismissible: false,
                      title: "",
                      content: ProductMakeSellPopUp(),
                    );
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 228, 227, 227),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          productsList[index],
                          style: _textStyle,
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "100",
                            style: _textStyle,
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "500",
                            style: _textStyle,
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
                            style: _textStyle,
                          ),
                        ),
                      ],
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
