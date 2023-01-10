import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/manegerOrEmployee.dart';

import '../../widgets/SharedWidgets/buttonContainer.dart';
import 'signUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
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
                border:
                    const OutlineInputBorder(borderSide: BorderSide(width: 1))),
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
          GestureDetector(
            onTap: () {
              // _onPressed();
              Get.to(const ManegerOrEmployeePage());
            },
            child: buttonContainer(buttonContainerText: "Login"),
          )
        ],
      ),
    ));
  }
}
