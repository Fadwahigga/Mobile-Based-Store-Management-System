// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  SmallButton({super.key, @required this.buttonName});
  String? buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 120, right: 120),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 39, 62, 82),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          buttonName!,
          style: GoogleFonts.ebGaramond(
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
