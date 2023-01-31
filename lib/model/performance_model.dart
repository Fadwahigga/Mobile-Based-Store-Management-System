// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerformanceModel {
  PerformanceModel(
      {required this.productName,
      required this.price,
      required this.soldQuantity,
      required this.id});

  final String productName;
  final String price;
  final String soldQuantity;
  final int id;

  factory PerformanceModel.formJson(Map<String, dynamic> json) {
    return PerformanceModel(
        productName: json['item_name'] ?? 'null',
        price: json['price'] ?? 'null',
        soldQuantity: json['sold_quantity'] ?? 'null',
        id: json['id'] ?? 'null');
  }
}
