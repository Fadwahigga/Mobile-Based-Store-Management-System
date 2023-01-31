// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/inventory_controller.dart';
import '../../shared/constants.dart';
import '../../widgets/confirmAndcancel.dart';
import '../Home/Home Widget/appBar.dart';
import '../make_a_sale/Mak-Sall-widget/make_sale_search.dart';

class ProductsListPage extends GetWidget<InventoryController> {
  ProductsListPage({super.key});
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
          child: AppBarWidget(appBarTitle: "Products List".tr)),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 228, 227, 227),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Search By Product Name".tr,
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 18,
                  )),
                ),
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: MakeSaleSearch(
                              apiPath: apiInventory, nameAtapi: "item_name"));
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              color: const Color.fromARGB(255, 228, 227, 227),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Product Name".tr,
                  style: _textStyle2,
                ),
                Text(
                  "Cost".tr,
                  style: _textStyle2,
                ),
                Text(
                  "Price".tr,
                  style: _textStyle2,
                ),
                Text(
                  "Quantity".tr,
                  style: _textStyle2,
                ),
              ],
            ),
          ),
          ///////////////////////////////////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 10,
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////////
          Expanded(
            child: GetBuilder<InventoryController>(
              builder: (controller) {
                return controller.productsList.isEmpty
                    ? Center(
                        child: const CircularProgressIndicator(
                          color: kprimaryColor,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.productsList.length,
                        itemBuilder: (context, index) {
                          return Slidable(
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: ConfirmAndCancel(
                                                        Opname: "Cancel".tr)),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.deleteProduct(
                                                        id: index);
                                                    // controller
                                                    //     .removeFromList(index);
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
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  spacing: 10,
                                  label: "Delete".tr,
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
                                  label: "Edit".tr,
                                  spacing: 10,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ],
                            ),
                            child: Container(
                              color: const Color.fromARGB(255, 228, 227, 227),
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      controller
                                          .productsList[index].productName,
                                      style: _textStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      controller.productsList[index].cost,
                                      style: _textStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      controller.productsList[index].price,
                                      style: _textStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      controller.productsList[index].quantity,
                                      style: _textStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
