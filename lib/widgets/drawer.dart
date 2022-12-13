import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/confirmAndcancel.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Maneger Name",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ))),
            accountEmail: Text("maneger@gmail.com",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ))),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://appmaking.co/wp-content/uploads/2021/08/appmaking-logo-colored.png"),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            otherAccountsPictures: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/74.jpg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/47.jpg"),
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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: Text("Inventory",
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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout",
                style: GoogleFonts.ebGaramond(
                    textStyle: const TextStyle(
                  fontSize: 20,
                ))),
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
                        size: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Are You Sure You Want To Logout?",
                          style: GoogleFonts.ebGaramond(
                              textStyle: const TextStyle(
                            fontSize: 18,
                          )),
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
                                Get.back();
                              },
                              child: ConfirmAndCancel(Opname: "   Yes   "))
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
