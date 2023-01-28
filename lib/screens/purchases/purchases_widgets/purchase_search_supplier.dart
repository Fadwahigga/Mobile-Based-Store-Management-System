// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/repo/search_repo.dart';
import 'package:gp/shared/constants.dart';
import '../../../controller/purchase_controller.dart';

class PurchaseSearchSupplier extends SearchDelegate {
  PurchaseSearchSupplier({required this.apiPath, required this.nameAtapi});
  final String apiPath;
  final String nameAtapi;
// Demo list to show querying
  List<String> searchTerms = [];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: SearchRepo.getData(
            apiPath: apiPath, nameAtapi: nameAtapi, itemName: query.trim()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GetBuilder<PurchaseController>(
                  builder: (controller) {
                    print(snapshot.data![index]);
                    return InkWell(
                      onTap: () {
                        controller.setSupplierData(
                            phone: snapshot.data![index]['phone'].toString(),
                            name: snapshot.data![index]['name'],
                            id: snapshot.data![index]['id']);

                        Get.back();
                      },
                      child: ListTile(
                        title: Text(snapshot.data![index]['name']),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
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
        });
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
