class SalesModel {
  SalesModel(
      {required this.itemName,
      required this.price,
      required this.soldQunatity});

  final String itemName;
  final String price;
  late String soldQunatity;

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
        itemName: json['item_name'] ?? 'null',
        price: json['price'] ?? 'null',
        soldQunatity: json['stock_quantity'] ?? 'null');
  }
}
