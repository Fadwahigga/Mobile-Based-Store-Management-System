// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/controller/supplier_controller.dart';
import 'package:gp/widgets/smallButton.dart';

import '../Home/Home Widget/appBar.dart';

class AddNewSupplierPage extends GetWidget<SupplierController> {
  const AddNewSupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBarWidget(appBarTitle: "Add New Supplier")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 40,
            // ),

            Form(
                key: controller.supplierKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.nameController,
                      validator: (name) {
                        if (name!.trim().isEmpty) {
                          return "The field is empty";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelStyle: const TextStyle(fontSize: 15),
                          labelText: "Supplier Name",
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: controller.phoneController,
                      validator: (phone) {
                        if (phone!.trim().length < 10) {
                          return "Your phone number is less than 10";
                        } else if (phone.trim().isEmpty) {
                          return "The field is empty";
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Supplier Phone Number",
                          labelStyle: const TextStyle(fontSize: 15),
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () => controller.addNewSupplier(
                  name: controller.nameController.text,
                  phone: controller.phoneController.text,
                  key: controller.supplierKey),
              child: SmallButton(buttonName: "Save"),
            ),
          ],
        ),
      ),
    );
  }
}
