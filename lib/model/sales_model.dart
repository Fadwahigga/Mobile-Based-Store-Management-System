class SalesModel {
  SalesModel(
      {required this.itemName,
      required this.price,
      required this.soldQunatity,
      required this.total,
      required this.id});

  final String itemName;
  final String price;
  late String soldQunatity;
  late double total;
  final int id;

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      itemName: json['item_name'] ?? 'null',
      price: json['price'] ?? 'null',
      soldQunatity: json['stock_quantity'] ?? 'null',
      total: json['total'] ?? '0',
      id: json['id'] ?? "null",
    );
  }
}
