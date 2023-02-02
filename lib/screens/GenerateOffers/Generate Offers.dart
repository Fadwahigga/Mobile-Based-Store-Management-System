// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/performance_controller.dart';

import '../Home/Home Widget/appBar.dart';

class GenerateOffersPage extends GetWidget<PerformanceController> {
  GenerateOffersPage({Key? key}) : super(key: key);
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));

  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
  List prodectName = ["Pepsi 300ml"];
  List prodectNameStrategy = [
    "Bundling,wholesale",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58.0),
          child: AppBarWidget(appBarTitle: "Generate Offers".tr)),
      body: Column(
        children: [
          ///////////////////////////////////////////////////////////////////////////////////////////
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
                  "Offer Strategy".tr,
                  style: _textStyle2,
                ),
              ],
            ),
          ),
          ///////////////////////////////////////////////////////////////////////////////////////////////////
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: prodectName.length,
              itemBuilder: (context, index) {
                return Container(
                  color: const Color.fromARGB(255, 228, 227, 227),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 100,
                        child: Text(
                          prodectName[index],
                          style: _textStyle,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: Text(
                          prodectNameStrategy[index],
                          style: _textStyle,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
