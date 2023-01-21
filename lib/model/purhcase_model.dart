class PurchaseModel {
  PurchaseModel(
      {required this.cost,
      required this.price,
      required this.id,
      required this.total,
      required this.productName,
      required this.quantity});

  final String productName;
  final String cost;
  final String price;
  final String quantity;
  final int id;
  final int total;
  

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
        cost: json['cost'] ?? 'null',
        price: json['price'] ?? 'null',
        productName: json['item_name'] ?? 'null',
        quantity: json['stock_quantity'] ?? 'null',
        id:json['id'] ?? "null",
        total: json['total'] ?? '500'
        );
  }
}
