// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/appBar.dart';

class SuppliersListPage extends StatefulWidget {
  const SuppliersListPage({super.key});

  @override
  State<SuppliersListPage> createState() => _SuppliersListPageState();
}

class _SuppliersListPageState extends State<SuppliersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
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
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 228, 227, 227),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Supplier Name",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                        fontSize: 20,
                      )),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Phone number",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                        fontSize: 20,
                      )),
                    ),
                  ],
                ),
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////////////
              const SizedBox(
                height: 15,
              ),
              //////////////////////////////////////////////////////////////////////////////////////////////////
              Container(
                color: const Color.fromARGB(255, 228, 227, 227),
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.contact_phone,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Supplier Name",
                          style: GoogleFonts.ebGaramond(
                              textStyle: const TextStyle(
                            fontSize: 15,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "0911111111",
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////
            ],
          ),
        ],
      ),
    );
  }
}
