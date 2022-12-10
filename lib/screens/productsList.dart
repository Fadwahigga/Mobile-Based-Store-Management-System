// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appBar.dart';

class ProductsListPage extends StatelessWidget {
  ProductsListPage({super.key});
  List productsList = [
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name",
    "Product Name"
  ];

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
                    onPressed: () {},
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Cost",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Price",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Quantity",
                      style: GoogleFonts.ebGaramond(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
              //////////////////////////////////////////////////////////////////////////////////////////////////
              ListView.builder(
                shrinkWrap: true,
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: const Color.fromARGB(255, 228, 227, 227),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          productsList[index],
                          style: GoogleFonts.ebGaramond(
                              textStyle: const TextStyle(
                            fontSize: 20,
                          )),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "100",
                            style: GoogleFonts.ebGaramond(
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "100",
                            style: GoogleFonts.ebGaramond(
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "500",
                            style: GoogleFonts.ebGaramond(
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
              ///////////////////////////////////////////////////////////////////////////////////////////
            ],
          ),
        ],
      ),
    );
  }
}
