// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/smallButton.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../widgets/appBar.dart';
import '../../widgets/barCode.dart';




class AddNewProductPage extends StatefulWidget {
  const AddNewProductPage({super.key});

  @override
  State<AddNewProductPage> createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends State<AddNewProductPage> {
  DateTime? _dateTime = DateTime.now();
  Barcode? result;

  QRViewController? controller;

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
          preferredSize: Size.fromHeight(70.0),
          child: AppBarWidget(appBarTitle: "Add New Product")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 227, 227),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(BarCodeClass(funBar: onQRViewCreated));
                      },
                      child: SizedBox(
                          width: 70,
                          child:
                              Image(image: AssetImage("images/barcode.jpg"))),
                    ),
                    Text(
                      "Product Serial Number",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                        fontSize: 18,
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: const TextStyle(fontSize: 20),
                    labelText: "Product Name",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Description",
                    labelStyle: const TextStyle(fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                readOnly: true,
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
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText:
                        "${_dateTime!.day.toString()}/${_dateTime!.month.toString()}/${_dateTime!.year.toString()}",
                    labelText: "Expiration Date",
                    labelStyle: const TextStyle(fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: const Color.fromARGB(255, 228, 227, 227),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cost",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        color: Colors.white,
                        child: TextField(keyboardType: TextInputType.number),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Price",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        color: Colors.white,
                        child: TextField(keyboardType: TextInputType.number),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Quantity",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        color: Colors.white,
                        child: TextField(keyboardType: TextInputType.number),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SmallButton(buttonName: "Save")
            ],
          ),
        ),
      ),
    );
  }
}
