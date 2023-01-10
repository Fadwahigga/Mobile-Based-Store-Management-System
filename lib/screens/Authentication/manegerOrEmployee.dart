// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/SharedWidgets/buttonContainer.dart';
import '../../widgets/SharedWidgets/confirmAndcancel.dart';
import '../HomeScreens/cashierScreens/cashierScreens.dart';
import '../home.dart';
class ManegerOrEmployeePage extends StatelessWidget {
  const ManegerOrEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                      title: "Write Password",
                      titleStyle: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      content: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
                                  Get.off(const Home());
                                },
                                child: ConfirmAndCancel(Opname: "   OK   "),
                              ),
                            ],
                          )
                        ],
                      ));
                },
                child: buttonContainer(buttonContainerText: "Maneger")),
            //////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {
                Get.off(const CashierScreensPage());
              },
              child: buttonContainer(buttonContainerText: "Employees"),
            )
            /////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
