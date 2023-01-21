// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, @required this.appBarTitle});
  String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle!,
            style: GoogleFonts.ebGaramond(
                textStyle: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold))),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 39, 62, 82),
      ),
    );
  }
}
