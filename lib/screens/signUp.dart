// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/login.dart';
import 'package:gp/widgets/buttonContainer.dart';
import 'manegerOrEmployee.dart';

class SignUp extends StatelessWidget {
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
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Name",
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
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
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
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
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Already Have A Account?",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                  InkWell(
                    onTap: () {
                      Get.to(const Login());
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
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(const ManegerOrEmployeePage());
                },
                child: buttonContainer(buttonContainerText: "Sign Up"))
          ],
        ),
      )),
    );
  }
}
