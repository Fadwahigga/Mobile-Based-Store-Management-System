// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomeWidget extends StatelessWidget {
  HomeWidget({super.key, @required this.name, @required this.imagepath});
  String? name;
  String? imagepath;
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 227, 227),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(imagepath!),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name!,
              style: _textStyle,
            ),
          )
        ],
      ),
    );
  }
}
