// ignore_for_file: must_be_immutable, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class buttonContainer extends StatelessWidget {
  buttonContainer({super.key, @required this.buttonContainerText});
  String? buttonContainerText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 39, 62, 82)),
      child: Center(
        child: Text(buttonContainerText!,
            style: GoogleFonts.ebGaramond(
                textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ))),
      ),
    );
  }
}
