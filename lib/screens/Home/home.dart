import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/localization/Local_controller.dart';
import 'package:gp/screens/Inventory%20Screens/Inventory%20.dart';
import 'package:gp/screens/purchases/purchases.dart';
import 'package:gp/screens/Performance%20Screens/performance.dart';
import 'package:gp/screens/Suppliers%20Screens/suppliers.dart';
import '../../main.dart';
import '../Account/accounts.dart';
import '../make_a_sale/cashierScreens.dart';
import 'Home Widget/drawer.dart';
import 'Home Widget/homeWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerlan = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 50,
            child: InkWell(
              onTap: () {
                shaedpref.getString("curruntLang") == "ar"
                    ? controllerlan.ChangeLang("en")
                    : controllerlan.ChangeLang("ar");
              },
              child: const Image(
                  image: AssetImage("images/Translation.png"),
                  fit: BoxFit.contain),
            ),
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "HOME".tr,
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
                          Get.to(() => PurchasesPage());
                        },
                        child: HomeWidget(
                            name: "Purchases".tr, imagepath: "images/1.png")),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const CashierScreensPage());
                      },
                      child: HomeWidget(
                          name: "Make Sale".tr, imagepath: "images/2.png"),
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
                        Get.to(() => const SuppliersPage());
                      },
                      child: HomeWidget(
                          name: "Suppliers".tr, imagepath: "images/3.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const InventoryPage());
                      },
                      child: HomeWidget(
                          name: "Inventory".tr, imagepath: "images/4.png"),
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
                      Get.to(() => AccountsPage());
                    },
                    child: HomeWidget(
                        name: "Accounts".tr, imagepath: "images/5.png"),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const PerformancePage());
                      },
                      child: HomeWidget(
                          name: "Performance".tr, imagepath: "images/6.png"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 39, 62, 82),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text("Generate Offers".tr,
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
