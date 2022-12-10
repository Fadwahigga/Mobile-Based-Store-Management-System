import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/appBar.dart';

class AddNewSupplierPage extends StatelessWidget {
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
            const Spacer(),
            // SizedBox(
            //   height: 40,
            // ),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: const TextStyle(fontSize: 20),
                  labelText: "Supplier Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Supplier Phone Number",
                  labelStyle: const TextStyle(fontSize: 20),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const Spacer(
              flex: 3,
            ),
            Container(
              margin: const EdgeInsets.only(left: 120, right: 120),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 39, 62, 82),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text("Save",
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
