// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/widgets/smallButton.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../controller/inventory_controller.dart';
import '../controller/purchase_controller.dart';
import '../model/inventroy_model.dart';
import '../repo/purchases_repo.dart';
import '../shared/constants.dart';

class BarCodeClass extends StatelessWidget {
  const BarCodeClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<InventoryController>(
          builder: (controller) => controller.result != null
              ? FutureBuilder<List<InventoryModel>>(
                  future: PurchasesRepo.getProductList(
                      apiPath: apiInventory,
                      nameAtapi: 'barcode',
                      itemName: controller.result.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GetBuilder<PurchaseController>(
                            builder: (controller) {
                              return InkWell(
                                onTap: () {
                                  // controller.total += 500;
                                  controller.setData(snapshot.data![index]);
                                  Get.back();
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index].productName
                                      .toString()),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kprimaryColor,
                        ),
                      );
                    } else if (!snapshot.hasData) {
                      return const Text("There is no data");
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kprimaryColor,
                        ),
                      );
                    }
                  })
              : Column(
                  children: [
                    GetBuilder<InventoryController>(
                      builder: (controller) {
                        return Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: QRView(
                              key: controller.qrKey,
                              onQRViewCreated: controller.onQRViewCreated,
                            ),
                          ),
                        );
                      },
                    ),
                    GetBuilder<InventoryController>(
                      builder: (controller) {
                        return Expanded(
                          flex: 1,
                          child: Center(
                            child: (controller.result != null)
                                ? Text(
                                    '${controller.result!.code} Now click on search')
                                : Text(
                                    'Touch the screen and point the camera to Scan a code'),
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                          // showSearch(
                          //     context: context,
                          //     // delegate to customize the search bar
                          //     delegate: CustomSearchDelegate());
                        }, //search
                        child: SmallButton(buttonName: "Done")),
                    Spacer()
                  ],
                ),
        ),
      ),
    );
  }
}
