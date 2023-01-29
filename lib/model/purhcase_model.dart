class PurchaseModel {
  PurchaseModel(
      {required this.cost,
      required this.price,
      required this.id,
      required this.total,
      required this.productName,
      required this.quantity});

  final String productName;
  late String cost;
  final String price;
  late String quantity;
  final int id;
  late double total;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
        cost: json['cost'] ?? 'null',
        price: json['price'] ?? 'null',
        productName: json['item_name'] ?? 'null',
        quantity: json['stock_quantity'] ?? 'null',
        id: json['id'] ?? "null",
        total: json['total'] ?? '0');
  }
}
