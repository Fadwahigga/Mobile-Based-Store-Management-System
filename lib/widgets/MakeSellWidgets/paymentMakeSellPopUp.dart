// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SharedWidgets/confirmAndcancel.dart';


class PaymentMakeSellPopUp extends StatefulWidget {
  const PaymentMakeSellPopUp({super.key});

  @override
  State<PaymentMakeSellPopUp> createState() => _PaymentMakeSellPopUpState();
}

class _PaymentMakeSellPopUpState extends State<PaymentMakeSellPopUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: const Color.fromARGB(255, 228, 227, 227),
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
        ));
  }
}
