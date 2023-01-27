// ignore_for_file: file_names, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/login_controller.dart';
import 'package:gp/screens/cashierScreens.dart';

import '../widgets/buttonContainer.dart';
import '../widgets/confirmAndcancel.dart';

class ManegerOrEmployeePage extends GetWidget<LoginController> {
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
                              validator: (password) {
                                if (password!.trim().isEmpty) {
                                  return "The field is empty";
                                } else if (password.trim().length < 8) {
                                  return "The password is less than 8 char";
                                }
                              },
                              controller: controller.managerPassController,
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
                                onTap: () => controller.signInManager(password: controller.managerPassController.text),
                                  // Get.off(const Home());
                                
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
