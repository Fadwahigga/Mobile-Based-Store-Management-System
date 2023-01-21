// ignore_for_file: must_be_immutable, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmAndCancel extends StatelessWidget {
  ConfirmAndCancel({super.key, required this.Opname});
  String? Opname;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 39, 62, 82),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(Opname!,
            style: GoogleFonts.ebGaramond(
                textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ))),
      ),
    );
  }
}
