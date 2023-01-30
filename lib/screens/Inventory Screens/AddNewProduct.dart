// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/smallButton.dart';
import '../../controller/inventory_controller.dart';
import '../../widgets/barCode.dart';
import '../Home/Home Widget/appBar.dart';

class AddNewProductPage extends GetWidget<InventoryController> {
  AddNewProductPage({Key? key}) : super(key: key);

  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBarWidget(appBarTitle: "Add New Product".tr)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 227, 227),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(BarCodeClass());
                      },
                      child: SizedBox(
                          width: 70,
                          child:
                              Image(image: AssetImage("images/barcode.jpg"))),
                    ),
                    Text(
                      "Product Serial Number".tr,
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                        fontSize: 18,
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: controller.productNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: const TextStyle(fontSize: 20),
                    labelText: "Product Name".tr,
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: controller.categoryController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Category".tr,
                    labelStyle: const TextStyle(fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<InventoryController>(
                builder: (controller) {
                  return TextField(
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2005),
                        lastDate: DateTime(2050),
                        builder: (context, child) {
                          return Theme(
                              data: ThemeData(
                                primarySwatch: Colors.grey,
                              ),
                              child: child!);
                        },
                      ).then((value) {
                        controller.setDataTime(date: value!);
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText:
                            "${controller.dateTime!.day.toString()}/${controller.dateTime!.month.toString()}/${controller.dateTime!.year.toString()}",
                        labelText: "Expiration Date".tr,
                        labelStyle: const TextStyle(fontSize: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  );
                },
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: const Color.fromARGB(255, 228, 227, 227),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cost".tr,
                        style: _textStyle,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        color: Colors.white,
                        child: TextFormField(
                            controller: controller.costController,
                            keyboardType: TextInputType.number),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Price".tr,
                        style: _textStyle,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        color: Colors.white,
                        child: TextFormField(
                            controller: controller.priceController,
                            keyboardType: TextInputType.number),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Quantity".tr,
                        style: _textStyle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        color: Colors.white,
                        child: TextFormField(
                            controller: controller.quantityController,
                            keyboardType: TextInputType.number),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                  onTap: () => controller.addNewProduct(
                      barcode: controller.result.toString(),
                      itemName:
                          controller.productNameController.text.toString(),
                      stockQuantity:
                          controller.quantityController.text.toString(),
                      expirationDate: controller.dateTime.toString(),
                      cost: controller.costController.text.toString(),
                      category: controller.categoryController.text.toString(),
                      price: controller.priceController.text.toString()),
                  child: SmallButton(buttonName: "Save".tr))
            ],
          ),
        ),
      ),
    );
  }
}
