import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/SharedWidgets/appBar.dart';
import '../../../widgets/SharedWidgets/buttonContainer.dart';
import '../../Suppliers Screens/addnewSupplier.dart';
import '../../Suppliers Screens/suppliersList.dart';


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
