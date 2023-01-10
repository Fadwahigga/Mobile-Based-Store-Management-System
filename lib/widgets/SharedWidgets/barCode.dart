// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gp/widgets/SharedWidgets/smallButton.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../SearchWidget/Search.dart';


class BarCodeClass extends StatefulWidget {
  const BarCodeClass({super.key});

  @override
  State<BarCodeClass> createState() => _BarCodeClassState();
}

class _BarCodeClassState extends State<BarCodeClass> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Text('${result!.code} Now click on search')
                    : Text(
                        'Touch the screen and point the camera to Scan a code'),
              ),
            ),
            GestureDetector(
                onTap: () {
                  showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate());
                },
                child: SmallButton(buttonName: "search")),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
