// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/login/login.dart';
import 'confirmAndcancel.dart';

class AlertDialog extends StatelessWidget {
  AlertDialog({super.key});
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          barrierDismissible: false,
          title: "",
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Icon(
                  Icons.warning_sharp,
                  color: Colors.red,
                  size: 35,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Are You Sure?",
                    style: _textStyle,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: ConfirmAndCancel(Opname: "Cancel")),
                    GestureDetector(
                      onTap: () {
                        Get.off(const Login());
                      },
                      child: ConfirmAndCancel(Opname: "   Yes   "),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
