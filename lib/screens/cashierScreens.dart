// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/buttonContainer.dart';

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
              onTap: () {},
              child: buttonContainer(buttonContainerText: "Cashier 1"),
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {},
              child: buttonContainer(buttonContainerText: "Cashier 2"),
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {},
              child: buttonContainer(buttonContainerText: "Cashier 3"),
            ),
            /////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
