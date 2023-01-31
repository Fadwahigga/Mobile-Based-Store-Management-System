import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/login_controller.dart';
import 'package:gp/screens/login/login.dart';
import 'package:gp/screens/login/resetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/confirmAndcancel.dart';
import '../../Account/accounts.dart';
import '../../Inventory Screens/Inventory .dart';
import '../../Performance Screens/performance.dart';
import '../../Suppliers Screens/suppliers.dart';
import '../../login/ResetManegerPassword.dart';
import '../../make_a_sale/cashierScreens.dart';
import '../../purchases/purchases.dart';

class DrawerWidget extends GetWidget<LoginController> {
  DrawerWidget({super.key});
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 39, 62, 82),
            ),
            accountName: Text("Maneger Name", style: _textStyle),
            accountEmail: Text("ManegerEmail@email.com", style: _textStyle),
            currentAccountPicture:
                const CircleAvatar(backgroundColor: Colors.white),
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Purchases".tr, style: _textStyle),
            onTap: () {
              Get.to(() => PurchasesPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Make Sale".tr, style: _textStyle),
            onTap: () {
              Get.to(() => const CashierScreensPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Suppliers".tr, style: _textStyle),
            onTap: () {
              Get.to(() => const SuppliersPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Inventory".tr, style: _textStyle),
            onTap: () {
              Get.to(() => const InventoryPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Accounts".tr, style: _textStyle),
            onTap: () => Get.to(() => AccountsPage()),
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Performance".tr, style: _textStyle),
            onTap: () {
              Get.to(() => const PerformancePage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Reset Password".tr, style: _textStyle),
            onTap: () {
              Get.to(() => const ResetPassword());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Reset Maneger Password".tr, style: _textStyle),
            onTap: () {
              Get.to(() => const ResetManegerPassword());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout".tr,
                style: GoogleFonts.ebGaramond(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.red))),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('token');
              Get.defaultDialog(
                barrierDismissible: false,
                title: "",
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.warning_sharp,
                        color: Colors.red,
                        size: 35,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Are You Sure?".tr,
                          style: _textStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: ConfirmAndCancel(Opname: "Cancel".tr)),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => const Login());
                            },
                            child: ConfirmAndCancel(Opname: "Yes".tr),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
