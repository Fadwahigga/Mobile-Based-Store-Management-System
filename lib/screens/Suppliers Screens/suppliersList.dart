// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/purchases/purchases_widgets/purchase_search_supplier.dart';
import 'package:gp/shared/constants.dart';
import '../../controller/supplier_controller.dart';
import '../../widgets/confirmAndcancel.dart';
import '../Home/Home Widget/appBar.dart';
import 'Supplier Widget/suppliersBillsPopUp.dart';

class SuppliersListPage extends StatefulWidget {
  const SuppliersListPage({super.key});

  @override
  State<SuppliersListPage> createState() => _SuppliersListPageState();
}

class _SuppliersListPageState extends State<SuppliersListPage> {
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Suppliers List".tr)),
      body: Column(
        children: [
          ///////////////////////////////////////////////////////////////////////////////////////////
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 228, 227, 227),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Search By Supplier Name".tr,
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 15,
                  )),
                ),
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: PurchaseSearchSupplier(
                              apiPath: apiSuppliers, nameAtapi: "name"));
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ))
              ],
            ),
          ),
          ////////////////////////////////////////////////////////////////////////////////////////////
          const SizedBox(
            height: 15,
          ),
          ///////////////////////////////////////////////////////////////////////////////////////////
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              color: const Color.fromARGB(255, 228, 227, 227),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.contact_phone,
                  size: 15,
                ),
                Text(
                  "Supplier Name".tr,
                  style: _textStyle2,
                ),
                Text(
                  "Phone number".tr,
                  style: _textStyle2,
                ),
              ],
            ),
          ),
          ///////////////////////////////////////////////////////////////////////////////////////////////////
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GetBuilder<SupplierController>(
              builder: (controller) {
                return controller.supplierList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kprimaryColor,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.supplierList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.getSupplierInvoices(
                                  id: controller.supplierList[index]['id']);
                              Get.defaultDialog(
                                barrierDismissible: false,
                                title: "",
                                content: SuppliersBillsPopUp(),
                              );
                            },
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  // A SlidableAction can have an icon and/or a label.
                                  SlidableAction(
                                    onPressed: ((context) {
                                      Get.defaultDialog(
                                        barrierDismissible: false,
                                        title: "",
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.warning_sharp,
                                                color: Colors.red,
                                                size: 35,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                child: Text(
                                                  "Are You Sure?".tr,
                                                  style: _textStyle,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: ConfirmAndCancel(
                                                          Opname: "Cancel".tr)),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller.deleteSupplier(
                                                          controller
                                                                  .supplierList[
                                                              index]['id']);
                                                      controller.removeFromList(
                                                          index);
                                                      Get.back();
                                                    },
                                                    child: ConfirmAndCancel(
                                                        Opname: "Yes".tr),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    spacing: 5,
                                    label: "Delete".tr,
                                    autoClose: true,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SlidableAction(
                                    onPressed: ((context) {}),
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    autoClose: true,
                                    spacing: 5,
                                    label: "Edit".tr,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ],
                              ),
                              child: Container(
                                color: const Color.fromARGB(255, 228, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // ignore: prefer_const_constructors
                                    const SizedBox(
                                      width: 20,
                                      child: Icon(
                                        Icons.contact_phone,
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        controller.supplierList[index]['name'],
                                        style: _textStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        controller.supplierList[index]['phone']
                                            .toString(),
                                        style: _textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
