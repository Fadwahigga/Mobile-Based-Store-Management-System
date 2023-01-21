import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/login_controller.dart';
import 'package:gp/screens/manegerOrEmployee.dart';
import 'package:gp/screens/login/signUp.dart';
import 'package:gp/widgets/buttonContainer.dart';

class Login extends GetWidget<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
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
              key: controller.loginKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "The field is empty";
                      } else if (!EmailValidator.validate(value.trim())) {
                        return "The e-mail not valid";
                      }
                    },
                    controller: controller.emailLoginController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
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
                        return "The field is empty";
                      }
                    },
                    controller: controller.passwordLoginController,
                    obscureText: true,
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
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text("Don't Have An Account?",
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
                InkWell(
                  onTap: () {
                    Get.to(const SignUp());
                  },
                  child: Text(
                    " Sign Up",
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

                  child: buttonContainer(buttonContainerText: "Login"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
