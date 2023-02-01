class InventoryModel {
  InventoryModel(
      {required this.cost,
      required this.price,
      required this.id,
      required this.productName,
      required this.barcode,
      required this.quantity,
      required this.dateTime});

  final String productName;
  final String cost;
  final String price;
  final String quantity;
  final int id;
  final String barcode;
  final String dateTime;

  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
        cost: json['cost'] ?? 'null',
        price: json['price'] ?? 'null',
        productName: json['item_name'] ?? 'null',
        quantity: json['stock_quantity'] ?? 'null',
        id: json['id'] ?? 'null',
        barcode: json['barcode'] ?? 'null',
        dateTime: json['dateTime'] ?? 'null');
  }
}
