import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/drawer.dart';
import 'package:gp/widgets/homeWidget.dart';

import 'HomeScreens/Inventory .dart';
import 'HomeScreens/Performance Screens/performance.dart';
import 'HomeScreens/Suppliers Screens/suppliers.dart';
import 'HomeScreens/accounts.dart';
import 'HomeScreens/cashier Screens/cashierScreens.dart';
import 'HomeScreens/purchases.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "HOME",
            style: GoogleFonts.ebGaramond(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //////////////////////////////////////////////////////////////////////////////////////////////
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Get.to(const PurchasesPage());
                        },
                        child: HomeWidget(
                            name: "Purchases", imagepath: "images/1.png")),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const CashierScreensPage());
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
            ////////////////////////////////////////////////////////////////////////////////////////////////////////
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
            ///////////////////////////////////////////////////////////////////////////////////////////////
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Get.to(AccountsPage());
                    },
                    child:
                        HomeWidget(name: "Accounts", imagepath: "images/5.png"),
                  )),
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
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
