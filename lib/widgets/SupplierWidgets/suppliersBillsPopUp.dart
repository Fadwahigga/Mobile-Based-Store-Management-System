// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SharedWidgets/confirmAndcancel.dart';


class SuppliersBillsPopUp extends StatefulWidget {
  const SuppliersBillsPopUp({super.key});

  @override
  State<SuppliersBillsPopUp> createState() => _SuppliersBillsPopUpState();
}

class _SuppliersBillsPopUpState extends State<SuppliersBillsPopUp> {
  DateTime? _dateTimeFrom = DateTime.now();
  DateTime? _dateTimeTo = DateTime.now();
  List productsList = [
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
  ];
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 10,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
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
                    child: Text("Supplier Invoices",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: const Color.fromARGB(255, 228, 227, 227),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "From",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
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
                              _dateTimeFrom = value!;
                            });
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, border: Border.all()),
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "${_dateTimeFrom!.day.toString()}/${_dateTimeFrom!.month.toString()}/${_dateTimeFrom!.year.toString()}",
                            style: GoogleFonts.ebGaramond(
                                textStyle: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Text(
                        "To",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
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
                              _dateTimeTo = value!;
                            });
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, border: Border.all()),
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "${_dateTimeTo!.day.toString()}/${_dateTimeTo!.month.toString()}/${_dateTimeTo!.year.toString()}",
                            style: GoogleFonts.ebGaramond(
                                textStyle: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                /////////////////////////////////////////////////////////////////////////////////////
                Container(
                  padding: const EdgeInsets.all(3),
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
                        " Quantity",
                        style: _textStyle2,
                      ),
                      Text(
                        "Total",
                        style: _textStyle2,
                      ),
                    ],
                  ),
                ),
                //////////////////////////////////////////////////////////////////////////////////////
                SizedBox(
                  width: double.maxFinite,
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 228, 227, 227),
                              border: Border.fromBorderSide(BorderSide())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                productsList[index],
                                style: _textStyle,
                              ),
                              Text(
                                "1000000",
                                style: _textStyle,
                              ),
                              Text(
                                "500",
                                style: _textStyle,
                              ),
                              Text(
                                "500",
                                style: _textStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //////////////////////////////////////////////////////////////////////////////////////////
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
            ),
          )),
    );
  }
}
