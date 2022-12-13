// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/widgets/buttonContainer.dart';
import '../widgets/appBar.dart';
import 'Inventory Screens/AddNewProduct.dart';
import 'Inventory Screens/productsList.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBarWidget(appBarTitle: "Inventory")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {
                Get.to(AddNewProductPage());
              },
              child: buttonContainer(buttonContainerText: "Add New Product"),
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 30,
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            GestureDetector(
              onTap: () {
                Get.to(ProductsListPage());
              },
              child:
                  buttonContainer(buttonContainerText: "Show List Of Products"),
            ),
            /////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
