// ignore_for_file: file_names, body_might_complete_normally_nullable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/login_controller.dart';
import 'package:gp/screens/login/login.dart';
import 'package:gp/widgets/buttonContainer.dart';

import '../../localization/Local_controller.dart';
import '../../main.dart';

class SignUp extends GetWidget<LoginController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    MyLocaleController controllerlan = Get.find();
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 60,
                  child: InkWell(
                    onTap: () {
                      shaedpref.getString("curruntLang") == "ar"
                          ? controllerlan.ChangeLang("en")
                          : controllerlan.ChangeLang("ar");
                    },
                    child: const Image(
                        image: AssetImage("images/Translation.png"),
                        fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up".tr,
                          style: GoogleFonts.ebGaramond(
                              textStyle: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 39, 62, 82))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: controller.signUpKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.nameController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "The field is empty".tr;
                                  }
                                },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person),
                                    hintText: "Name".tr,
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: const OutlineInputBorder(
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
                                    return "The field is empty".tr;
                                  } else if (!EmailValidator.validate(
                                      value.trim())) {
                                    return "The e-mail not valid".tr;
                                  }
                                },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email),
                                    hintText: "Email".tr,
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: const OutlineInputBorder(
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
                                    return "The field is empty".tr;
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.remove_red_eye_outlined)),
                                    prefixIcon: const Icon(Icons.password),
                                    hintText: "Password".tr,
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
                                    return "The field is empty".tr;
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.remove_red_eye_outlined)),
                                    prefixIcon: const Icon(Icons.password),
                                    hintText: "Maneger Password".tr,
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
                            Text("Already Have A Account?".tr,
                                style: GoogleFonts.ebGaramond(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            InkWell(
                              onTap: () {
                                Get.off(() => const Login());
                              },
                              child: Text(
                                "Login".tr,
                                style: GoogleFonts.ebGaramond(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 39, 62, 82))),
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
                                    password:
                                        controller.passwordController.text,
                                    email: controller.emailController.text,
                                    mangerPassword: controller
                                        .mangerPasswordController.text),
                                // Get.to(const ManegerOrEmployeePage());

                                child: buttonContainer(
                                    buttonContainerText: "Sign Up".tr));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
