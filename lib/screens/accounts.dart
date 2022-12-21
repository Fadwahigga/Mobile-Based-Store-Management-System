// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/accountWidget.dart';

import '../widgets/appBar.dart';

class AccountsPage extends StatelessWidget {
  AccountsPage({super.key});
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Accounts")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 39, 62, 82),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Balance",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      )),
                    ),
                  ),
                  Center(
                    child: Text(
                      "1000.00 SD",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            const SizedBox(
              height: 40,
            ),
            ////////////////////////////////////////////////////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AccountWidget(dataName: "Revenue", money: "1000"),
                const SizedBox(
                  width: 15,
                ),
                AccountWidget(dataName: "Purchases", money: "1000")
              ],
            ),
            //////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AccountWidget(dataName: "Invoices", money: "100"),
                const SizedBox(
                  width: 15,
                ),
                AccountWidget(dataName: "Sales", money: "1000")
              ],
            )
          ],
        ),
      ),
    );
  }
}
