// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/inventory_controller.dart';
import 'package:gp/shared/constants.dart';

import '../../widgets/Search.dart';
import '../../widgets/appBar.dart';

class ProductsListPage extends GetWidget<InventoryController> {
  ProductsListPage({super.key});
  final TextStyle _textStyle = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(
    fontSize: 15,
  ));
  final TextStyle _textStyle2 = GoogleFonts.ebGaramond(
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBarWidget(appBarTitle: "Products List")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 228, 227, 227),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Search By product Name Or number",
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
                          delegate: SearchByName(apiPath: apiInventory,nameAtapi: "item_name"));
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
                  "Product Name",
                  style: _textStyle2,
                ),
                Text(
                  "    Cost",
                  style: _textStyle2,
                ),
                Text(
                  "    Price",
                  style: _textStyle2,
                ),
                Text(
                  "Quantity",
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
          GetBuilder<InventoryController>(
            builder: (_) {
              return Expanded(
                child: controller.productsList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(color: const Color.fromARGB(255, 39, 62, 82),),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.productsList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: const Color.fromARGB(255, 228, 227, 227),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  controller.productsList[index].productName,
                                  style: _textStyle,
                                ),
                                Text(
                                  controller.productsList[index].cost,
                                  style: _textStyle,
                                ),
                                Text(
                                  controller.productsList[index].price,
                                  style: _textStyle,
                                ),
                                Text(
                                  controller.productsList[index].quantity,
                                  style: _textStyle,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
