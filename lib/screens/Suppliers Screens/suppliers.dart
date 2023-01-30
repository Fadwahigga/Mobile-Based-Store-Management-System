import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/controller/supplier_controller.dart';
import 'package:gp/widgets/buttonContainer.dart';
import '../Home/Home Widget/appBar.dart';
import 'addnewSupplier.dart';
import 'suppliersList.dart';

class SuppliersPage extends GetWidget<SupplierController> {
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
                controller.getSuppliersData();
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
