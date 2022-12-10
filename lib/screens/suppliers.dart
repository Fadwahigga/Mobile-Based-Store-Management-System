import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/screens/addnewSupplier.dart';
import 'package:gp/screens/suppliersList.dart';
import 'package:gp/widget/appBar.dart';
import 'package:gp/widget/buttonContainer.dart';

class SuppliersPage extends StatelessWidget {
  const SuppliersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBarWidget(appBarTitle: "Suppliers")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
                onTap: () {
                  Get.to(const AddNewSupplierPage());
                },
                child:
                    buttonContainer(buttonContainerText: "Add New Supplier")),
            //////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {
                Get.to(const SuppliersListPage());
              },
              child: buttonContainer(
                  buttonContainerText: "Show List Of Suppliers"),
            )
            /////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
