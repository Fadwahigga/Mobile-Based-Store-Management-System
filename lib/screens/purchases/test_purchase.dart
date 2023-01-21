// import 'package:flutter/material.dart';

// import '../../model/inventroy_model.dart';
// import '../../repo/purchases_repo.dart';
// import '../../shared/constants.dart';

// class TestPurchase extends StatelessWidget {
//   const TestPurchase({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<InventoryModel>>(
//           future: PurchasesRepo.getProductList(itemName: "5285000395164"),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   // var result = matchQuery[index];
//                   print("has dataaaaaaaaaa ");
//                   return ListTile(
//                     title: Text(snapshot.data![index].cost.toString()),
//                   );
//                 },
//               );
//             } else if (!snapshot.hasData) {
//               return const Text("There is no data");
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: kprimaryColor,
//                 ),
//               );
//             }
//           }),
//     );
//   }
// }
