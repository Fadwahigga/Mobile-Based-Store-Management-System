// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controllers/LoginAndSignup.dart';
import 'package:gp/screens/login.dart';
import 'package:gp/widgets/buttonContainer.dart';
import '../widgets/confirmAndcancel.dart';
import 'manegerOrEmployee.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // DatabaseHelper databaseHelper = DatabaseHelper();
  // String msgStatus = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _manegerPasswordController =
      TextEditingController();
  // _onPressed() {
  //   setState(() {
  //     if (_emailController.text.trim().toLowerCase().isNotEmpty &&
  //         _passwordController.text.trim().isNotEmpty) {
  //       databaseHelper
  //           .registerData(
  //               _nameController.text.trim(),
  //               _emailController.text.trim().toLowerCase(),
  //               _passwordController.text.trim(),
  //               _manegerPasswordController.text.trim())
  //           .whenComplete(() {
  //         if (databaseHelper.status) {
  //           _showDialog();
  //           msgStatus = 'Check email or password';
  //         } else {
  //           Get.to(const ManegerOrEmployeePage());
  //         }
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
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
                  controller: _nameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Name",
                      hintStyle: TextStyle(fontSize: 12),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 12),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is to Short';
                    }
                    return null;
                  },
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
                  controller: _manegerPasswordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is to Short';
                    }
                    return null;
                  },
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
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    onTap: () {
                      // _onPressed();
                      Get.to(const ManegerOrEmployeePage());
                    },
                    child: buttonContainer(buttonContainerText: "Sign Up"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _showDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Failed'),
  //           content: const Text('Check your email or password'),
  //           actions: [
  //             GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                 },
  //                 child: ConfirmAndCancel(Opname: "Cancel"))
  //           ],
  //         );
  //       });
  // }
}
