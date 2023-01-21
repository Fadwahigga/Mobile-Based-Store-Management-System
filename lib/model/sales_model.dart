class SalesModel {

  SalesModel({required this.itemName,required this.price,required this.soldQunatity });

  final String itemName;
  final String price;
  final String soldQunatity;

  factory SalesModel.fromJson( Map<String,dynamic> json ){
    return SalesModel(
      itemName: json['item_name'],
      price: json['price'],
      soldQunatity:json['stock_quantity']
    );
  }
}