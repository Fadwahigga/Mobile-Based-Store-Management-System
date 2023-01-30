// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/login_controller.dart';

import '../../widgets/buttonContainer.dart';

class ResetPassword extends GetWidget<LoginController> {
  const ResetPassword({super.key});

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
              "Reset Password".tr,
              style: GoogleFonts.ebGaramond(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 39, 62, 82))),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: controller.resetPasswordKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.currentPasswodController,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: controller.newPasswordController,
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
                    key: controller.resetPasswordKey,
                    currentPasswod: controller.currentPasswodController.text,
                    newPassword: controller.newPasswordController.text,
                    isManager: false),
                // Get.to(const ManegerOrEmployeePage());

                child: buttonContainer(
                  buttonContainerText: "Save".tr,
                ))
          ],
        ),
      )),
    );
  }
}
