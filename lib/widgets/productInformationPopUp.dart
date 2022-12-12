// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appBar.dart';
import 'confirmAndcancel.dart';

class ProductInformationPopUp extends StatelessWidget {
  const ProductInformationPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 250,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(72.0),
            child: AppBarWidget(appBarTitle: "Product Information")),
        body: Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 228, 227, 227),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Exist Quantity"),
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
                    const Text("New Quantity"),
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
                    const Text("Old cost"),
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
                    const Text("New cost"),
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
            )),
      ),
    );
  }
}
