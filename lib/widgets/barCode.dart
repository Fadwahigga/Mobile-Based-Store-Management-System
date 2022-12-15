// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/smallButton.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarCodeClass extends StatelessWidget {
  BarCodeClass({
    Key? key,
    required this.funBar,
  }) : super(key: key);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void Function(QRViewController)? funBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 500,
            child: Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: funBar!,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SmallButton(buttonName: "Done"),
          )
          // const SizedBox(
          //   height: 20,
          // ),
          // Center(
          //   child: (result != null)
          //       ? Text(
          //           'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //       : const Text('Scan a code'),
          // )
        ],
      ),
    );
  }
}
