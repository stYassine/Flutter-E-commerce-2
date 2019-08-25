import 'package:meta/meta.dart';

class Product{

  String id, name, imageUrl;
  int amount;

  Product({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.amount
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      amount: json['amount']
    );
  }

}