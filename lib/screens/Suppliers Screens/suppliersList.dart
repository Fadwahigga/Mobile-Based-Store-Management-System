// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/widgets/suppliersBillsPopUp.dart';

import '../../widgets/Search.dart';
import '../../widgets/appBar.dart';

class SuppliersListPage extends StatefulWidget {
  const SuppliersListPage({super.key});

  @override
  State<SuppliersListPage> createState() => _SuppliersListPageState();
}

class _SuppliersListPageState extends State<SuppliersListPage> {
  List suppliers = [
    "fadwa",
    "rawan",
    "raheel",
    "fadwa",
    "rawan",
    "raheel",
    "fadwa",
    "rawan",
    "raheel",
    "fadwa",
    "rawan",
    "raheel",
    "fadwa",
    "rawan",
    "raheel",
    "fadwa",
    "rawan",
    "raheel",
    "fadwa",
    "rawan",
    "raheel",
    "fadwa",
    "rawan",
    "raheel"
  ];
  List suppliersPhone = [
    "0911111111",
    "0911001111",
    "0911133111",
    "0911133111",
    "0911112211",
    "0911110011",
    "0911111111",
    "0911001111",
    "0911133111",
    "0911133111",
    "0911112211",
    "0911110011",
    "0911111111",
    "0911001111",
    "0911133111",
    "0911133111",
    "0911112211",
    "0911110011",
    "0911111111",
    "0911001111",
    "0911133111",
    "0911133111",
    "0911112211",
    "0911110011"
  ];
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
          child: AppBarWidget(appBarTitle: "Suppliers List")),
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
                  "Search By Supplier Name Or Number",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                    fontSize: 15,
                  )),
                ),
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: CustomSearchDelegate());
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
                  size: 18,
                ),
                Text(
                  "Supplier Name",
                  style: _textStyle2,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "Phone number",
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suppliers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      barrierDismissible: false,
                      title: "",
                      content: const SuppliersBillsPopUp(),
                    );
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 228, 227, 227),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.contact_phone,
                          size: 15,
                        ),
                        Text(
                          suppliers[index],
                          style: _textStyle,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          suppliersPhone[index],
                          style: _textStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
