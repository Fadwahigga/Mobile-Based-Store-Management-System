// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gp/repo/purchases_repo.dart';
import 'package:gp/shared/constants.dart';

import '../../../model/inventroy_model.dart';

class SearchByName extends SearchDelegate {
  SearchByName({required this.apiPath,required this.nameAtapi});
  final String apiPath;
  final String nameAtapi;
// Demo list to show querying
  List<String> searchTerms = [
    "Product Name1",
    "Product Name2",
    "Product Name3",
    "Product Name4",
    "Product Name5",
    "Product Name6",
    "Product Name7",
    "Product Name8",
    "Product Name9",
    "Product Name10",
  ];

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
    return FutureBuilder<List<InventoryModel>>(
        future: PurchasesRepo.getProductList(
            apiPath: apiPath, nameAtapi: nameAtapi, itemName: query.trim()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].productName.toString()),
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
