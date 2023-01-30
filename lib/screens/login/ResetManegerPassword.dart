// ignore_for_file: file_names, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/login_controller.dart';
import 'package:gp/widgets/buttonContainer.dart';

class ResetManegerPassword extends GetWidget<LoginController> {
  const ResetManegerPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reset Maneger Password".tr,
              style: GoogleFonts.ebGaramond(
                  textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 39, 62, 82))),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: controller.resetManagerPasswordKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.currentManagerPasswodController,
                    validator: (password) {
                      if (password!.trim().isEmpty) {
                        return "The field is empty".tr;
                      } else if (password.trim().length < 7) {
                        return "The password is less than 8 char".tr;
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye_outlined)),
                        prefixIcon: const Icon(Icons.password),
                        hintText: "Current Password".tr,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (password) {
                      if (password!.trim().isEmpty) {
                        return "The field is empty".tr;
                      } else if (password.trim().length < 7) {
                        return "The password is less than 8 char".tr;
                      }
                    },
                    controller: controller.newManagerPasswordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye_outlined)),
                        prefixIcon: const Icon(Icons.password),
                        hintText: "New Password".tr,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () => controller.resetPassword(
                    key: controller.resetManagerPasswordKey,
                    currentPasswod:
                        controller.currentManagerPasswodController.text,
                    newPassword: controller.newManagerPasswordController.text,
                    isManager: true),
                child: buttonContainer(
                  buttonContainerText: "Save".tr,
                ))
          ],
        ),
      )),
    );
  }
}
