// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirmAndcancel.dart';

class ProductInformationPopUp extends StatefulWidget {
  const ProductInformationPopUp({super.key});

  @override
  State<ProductInformationPopUp> createState() =>
      _ProductInformationPopUpState();
}

class _ProductInformationPopUpState extends State<ProductInformationPopUp> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 228, 227, 227),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 39, 62, 82),
                  child: Center(
                    child: Text("Product Information",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Exist Quantity",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                          fontSize: 15,
                        ))),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: const Center(child: Text("00.0")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New Quantity",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                          fontSize: 15,
                        ))),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width - 250,
                        color: Colors.white,
                        child: const TextField(
                            keyboardType: TextInputType.number)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Old cost",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                          fontSize: 15,
                        ))),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child: const Center(child: Text("00.0")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New cost",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                          fontSize: 15,
                        ))),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 250,
                      color: Colors.white,
                      child:
                          const TextField(keyboardType: TextInputType.number),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text("Delete Product From List ",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ))),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {}, child: ConfirmAndCancel(Opname: "Save")),
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
