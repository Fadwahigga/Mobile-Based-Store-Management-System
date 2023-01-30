// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/buttonContainer.dart';
import '../Home/Home Widget/appBar.dart';
import 'makeSale.dart';

class CashierScreensPage extends StatelessWidget {
  const CashierScreensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBarWidget(appBarTitle: "Cashier Screens")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {
                Get.to( MakeSalePage());
              },
              child: buttonContainer(buttonContainerText: "Cashier 1"),
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {
                Get.to( MakeSalePage());
              },
              child: buttonContainer(buttonContainerText: "Cashier 2"),
            ),
            //////////////////////////////////////////////////////////////////////////////////////

            /////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
