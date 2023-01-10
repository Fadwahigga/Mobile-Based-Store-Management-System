// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../manegerOrEmployee.dart';

class ResetManegerPassword extends StatelessWidget {
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
              "Reset Maneger Password",
              style: GoogleFonts.ebGaramond(
                  textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 39, 62, 82))),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined)),
                  prefixIcon: const Icon(Icons.password),
                  hintText: "Current Password",
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
                  hintText: "New Password",
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1))),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Get.to(const ManegerOrEmployeePage());
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 39, 62, 82),
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                    child: Text(
                  "Save",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
