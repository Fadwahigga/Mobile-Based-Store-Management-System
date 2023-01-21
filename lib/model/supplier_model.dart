class SupplierModel {
  SupplierModel(
      {required this.price,required this.quantity, required this.cost, required this.productName});

  final String price;
  final String cost;
  final String productName;
  final String quantity;

  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    return SupplierModel(
        price: json['price'] ?? '',
        cost: json['cost'] ?? '',
        productName: json['item_name'] ?? '',
        quantity: json['product_life_in_days'] ?? ''
        );
  }
}
