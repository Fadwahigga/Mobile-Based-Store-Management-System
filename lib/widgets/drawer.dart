import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/login.dart';
import '../screens/Inventory .dart';
import '../screens/cashierScreens.dart';
import '../screens/performance.dart';
import '../screens/puechases.dart';
import '../screens/suppliers.dart';
import 'confirmAndcancel.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 39, 62, 82),
            ),
            accountName: Text("Maneger Name",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ))),
            accountEmail: Text("maneger@gmail.com",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ))),
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
            title: Text("Puechases",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 20,
                ))),
            onTap: () {
              Get.to(const PuechasesPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Make Sale",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 20,
                ))),
            onTap: () {
              Get.to(const CashierScreensPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Suppliers",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 20,
                ))),
            onTap: () {
              Get.to(const SuppliersPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Inventory",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 20,
                ))),
            onTap: () {
              Get.to(const InventoryPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Accounts",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 20,
                ))),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Performance",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 20,
                ))),
            onTap: () {
              Get.to(const PerformancePage());
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
                          style: GoogleFonts.ebGaramond(
                              textStyle: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
