// ignore_for_file: file_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/login_controller.dart';
import 'package:gp/screens/login/login.dart';
import 'package:gp/widgets/buttonContainer.dart';
import '../manegerOrEmployee.dart';

class SignUp extends GetWidget<LoginController> {
  const SignUp({super.key});

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
              "Sign Up",
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
              key: controller.signUpKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "The field is empty";
                      }
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "The field is empty";
                      } else if (!EmailValidator.validate(value.trim())) {
                        return "The e-mail not valid";
                      }
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "The field is empty";
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye_outlined)),
                        prefixIcon: const Icon(Icons.password),
                        hintText: "Password",
                        hintStyle: const TextStyle(fontSize: 12),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller.mangerPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "The field is empty";
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye_outlined)),
                        prefixIcon: const Icon(Icons.password),
                        hintText: "Maneger Password",
                        hintStyle: const TextStyle(fontSize: 12),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text("Already Have A Account?",
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
                InkWell(
                  onTap: () {
                    Get.to(() => const Login());
                  },
                  child: Text(
                    " Login",
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 39, 62, 82))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GetBuilder<LoginController>(
              builder: (controller) {
                return GestureDetector(
                    onTap: () => controller.signUp(
                        key: controller.signUpKey,
                        name: controller.nameController.text,
                        password: controller.passwordController.text,
                        email: controller.emailController.text,
                        mangerPassword:
                            controller.mangerPasswordController.text),
                    // Get.to(const ManegerOrEmployeePage());

                    child: buttonContainer(buttonContainerText: "Sign Up"));
              },
            )
          ],
        ),
      )),
    );
  }
}
