import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/makeSale.dart';
import 'package:gp/screens/performance.dart';
import 'package:gp/screens/puechases.dart';
import 'package:gp/screens/suppliers.dart';
import 'package:gp/widget/homeWidget.dart';

import 'Inventory .dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ////////////////////////////////////////////////////////////////////////////////////////
                Text(
                  "HOME",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                //////////////////////////////////////////////////////////////////////////////////////////
                const SizedBox(
                  height: 10,
                ),
                ////////////////////////////////////////////////////////////////////////////////////////
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              Get.to(const PuechasesPage());
                            },
                            child: HomeWidget(
                                name: "Puechases", imagepath: "images/1.png")),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const MakeSalePage());
                          },
                          child: HomeWidget(
                              name: "Make Sale", imagepath: "images/2.png"),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ///////////////////////////////////////////////////////////
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const SuppliersPage());
                          },
                          child: HomeWidget(
                              name: "Suppliers", imagepath: "images/3.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const InventoryPage());
                          },
                          child: HomeWidget(
                              name: "Inventory", imagepath: "images/4.png"),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                /////////////////////////////////////////////////////////////
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: HomeWidget(
                              name: "Accounts", imagepath: "images/5.png")),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const PerformancePage());
                          },
                          child: HomeWidget(
                              name: "Performance", imagepath: "images/6.png"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
