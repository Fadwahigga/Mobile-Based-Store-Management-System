import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/login.dart';
import '../screens/Authentication/ResetpasswordsScreens/ResetManegerPassword.dart';
import '../screens/Authentication/ResetpasswordsScreens/resetPassword.dart';
import '../screens/Inventory .dart';
import '../screens/cashierScreens.dart';
import '../screens/performance.dart';
import '../screens/purchases.dart';
import '../screens/suppliers.dart';
import 'confirmAndcancel.dart';

class DrawerWidget extends StatelessWidget {
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
            accountEmail: Text("maneger@gmail.com", style: _textStyle),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              // backgroundImage: NetworkImage(
              //     "https://appmaking.co/wp-content/uploads/2021/08/appmaking-logo-colored.png"),
            ),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: NetworkImage(
            //       "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
            //     ),
            //     fit: BoxFit.fill,
            //   ),
            // ),
            otherAccountsPictures: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                // backgroundImage: NetworkImage(
                //     "https://randomuser.me/api/portraits/women/74.jpg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                // backgroundImage: NetworkImage(
                //     "https://randomuser.me/api/portraits/men/47.jpg"),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Puechases", style: _textStyle),
            onTap: () {
              Get.to(const PurchasesPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Make Sale", style: _textStyle),
            onTap: () {
              Get.to(const CashierScreensPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Suppliers", style: _textStyle),
            onTap: () {
              Get.to(const SuppliersPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Inventory", style: _textStyle),
            onTap: () {
              Get.to(const InventoryPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Accounts", style: _textStyle),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Performance", style: _textStyle),
            onTap: () {
              Get.to(const PerformancePage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Reset Password", style: _textStyle),
            onTap: () {
              Get.to(const ResetPassword());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Reset Maneger Password", style: _textStyle),
            onTap: () {
              Get.to(const ResetManegerPassword());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout",
                style: GoogleFonts.ebGaramond(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.red))),
            onTap: () {
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
                          "Are You Sure?",
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
                              child: ConfirmAndCancel(Opname: "Cancel")),
                          GestureDetector(
                            onTap: () {
                              Get.off(const Login());
                            },
                            child: ConfirmAndCancel(Opname: "   Yes   "),
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
