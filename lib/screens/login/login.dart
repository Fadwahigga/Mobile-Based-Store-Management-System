// ignore_for_file: body_might_complete_normally_nullable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/login_controller.dart';
import 'package:gp/screens/login/signUp.dart';
import 'package:gp/widgets/buttonContainer.dart';

import '../../localization/Local_controller.dart';

class Login extends GetWidget<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    MyLocaleController controllerlan = Get.find();
    return Scaffold(
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
                    controllerlan.ChangeLang("ar");
                  },
                  child: const Image(
                      image: AssetImage("images/Translation.png"),
                      fit: BoxFit.contain),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login".tr,
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
                      key: controller.loginKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "The field is empty".tr;
                              } else if (!EmailValidator.validate(
                                  value.trim())) {
                                return "The e-mail not valid".tr;
                              }
                            },
                            controller: controller.emailLoginController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              hintText: "Email".tr,
                              hintStyle: const TextStyle(fontSize: 12),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "The field is empty".tr;
                              }
                            },
                            controller: controller.passwordLoginController,
                            obscureText: controller.passVisibility,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: controller.passVisibility
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onPressed: (() {
                                    controller.passVisibility;
                                  }),
                                ),
                                prefixIcon: const Icon(Icons.password),
                                hintText: "Password".tr,
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
                        Text("Don't Have An Account?".tr,
                            style: GoogleFonts.ebGaramond(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                        InkWell(
                          onTap: () {
                            Get.to(const SignUp());
                          },
                          child: Text(
                            "Sign Up".tr,
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
                      builder: (_) {
                        return GestureDetector(
                          onTap: () => controller.signIn(
                              key: controller.loginKey,
                              password: controller.passwordLoginController.text,
                              email: controller.emailLoginController.text),
                          // Get.to(const ManegerOrEmployeePage());

                          child:
                              buttonContainer(buttonContainerText: "Login".tr),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
