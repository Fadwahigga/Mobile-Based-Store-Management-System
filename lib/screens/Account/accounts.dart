// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/account_controller.dart';

import '../Home/Home Widget/appBar.dart';
import 'Account widget/accountWidget.dart';

class AccountsPage extends GetWidget<AccountController> {
  AccountsPage({super.key});
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Accounts".tr)),
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
                      "Balance".tr,
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  GetBuilder<AccountController>(
                    builder: (controller) {
                      return Center(
                        child: Text(
                          controller.balance == null
                              ? "0.0 SD"
                              : "${controller.balance} SD",
                          style: GoogleFonts.ebGaramond(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      );
                    },
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
            GetBuilder<AccountController>(
              builder: (controller) {
                return SizedBox(
                    width: double.infinity,
                    child: AccountWidget(
                        dataName: "Revenue".tr,
                        money: controller.revenue.toString()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<AccountController>(
              builder: (controller) {
                return SizedBox(
                    width: double.infinity,
                    child: AccountWidget(
                        dataName: "Purchases".tr,
                        money: controller.purchase == null
                            ? "0.0"
                            : "${controller.revenue}"));
              },
            ),
            //////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 10,
            ),
            GetBuilder<AccountController>(
              builder: (controller) {
                return SizedBox(
                    width: double.infinity,
                    child: AccountWidget(
                        dataName: "Sales".tr,
                        money: controller.saels == null
                            ? "0"
                            : "${controller.saels}"));
              },
            )
          ],
        ),
      ),
    );
  }
}
