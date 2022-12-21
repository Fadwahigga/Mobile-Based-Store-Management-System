// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/cashierScreens.dart';
import 'package:gp/screens/home.dart';
import '../widgets/buttonContainer.dart';
import '../widgets/confirmAndcancel.dart';

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
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      content: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
                                  Get.off(const Home());
                                },
                                child: ConfirmAndCancel(Opname: "  OK  "),
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