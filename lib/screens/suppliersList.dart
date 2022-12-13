// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appBar.dart';

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
                    fontSize: 18,
                  )),
                ),
                IconButton(
                    onPressed: () {},
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
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "Phone number",
                  style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
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
                return Container(
                  color: const Color.fromARGB(255, 228, 227, 227),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.contact_phone,
                        size: 18,
                      ),
                      Text(
                        suppliers[index],
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        suppliersPhone[index],
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                      ),
                    ],
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
