// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirmAndcancel.dart';

class PaymenBillPopUp extends StatefulWidget {
  const PaymenBillPopUp({super.key});

  @override
  State<PaymenBillPopUp> createState() => _PaymenBillPopUpState();
}

class _PaymenBillPopUpState extends State<PaymenBillPopUp> {
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
                    child: Text("Payment Bill",
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
                    Text("Total",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Payed",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Change",
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
                Text(" Save This Bill To A Supplier Account",
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 39, 62, 82),
                    ))),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Search For A Supplier",
                      hintStyle: const TextStyle(fontSize: 10),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
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
