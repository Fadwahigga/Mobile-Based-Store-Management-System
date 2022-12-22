// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountWidget extends StatelessWidget {
  AccountWidget({super.key, @required this.dataName, @required this.money});
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  String? dataName;
  String? money;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 227, 227),
          borderRadius: BorderRadius.circular(10)),
      child: Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.monitor_heart_rounded),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${money!} SD",
            style: _textStyle2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            dataName!,
            style: _textStyle2,
          ),
        ],
      )),
    );
  }
}
